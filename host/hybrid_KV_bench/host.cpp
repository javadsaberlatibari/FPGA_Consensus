#include "xcl2.hpp"
#include <vector>
#include <chrono>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstdlib>
#include <iostream>
#include <libmemcached/memcached.h>
#include <random>

#define DATA_SIZE 62500000
#define IP_ADDR 0x0A01D498
#define BOARD_NUMBER 0
#define ARP 0x0A01D498
std::unordered_map<uint32_t, uint32_t> put_map;
std::unordered_map<uint32_t, int> put_counter;
int period = 10;

const int expected_value=9;
const string ycsb_mode= "Update_Heavy";
void wait_for_enter(const std::string &msg) {
    std::cout << msg << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

// Function to run the user kernel
void run_user_kernel(bool initilize, cl::Context context, cl::CommandQueue q, cl::Kernel user_kernel, 
                     cl::Kernel summary_kernel,uint32_t nOP, uint32_t wP, uint32_t node_id, uint32_t N_node, cl::Buffer buffer_r1) {
    cl_int err;
    uint32_t qOP = nOP - ((nOP * wP) / 100);
    size_t size_in_bytes = nOP * sizeof(uint64_t);

    // Node-specific parameters
    uint32_t ulQPN = (node_id == 1) ? 0x00000000 : 0x00000001;
    uint64_t ulAddr = 0x0000000000000000;
    uint64_t urAddr = 0x0000000000000000;
    uint32_t ulen = 0x00000008;
    uint32_t node_num = N_node;
    uint32_t board_num = node_id;
    uint32_t check_value = expected_value;

    // Create buffers
    std::vector<uint64_t, aligned_allocator<uint64_t>> operations_vec(nOP);

    cl::Buffer buffer_op(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,

                     nOP * sizeof(uint64_t), operations_vec.data(), &err);
    OCL_CHECK(err, cl::Buffer buffer_r2(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, 
                                        sizeof(int), reply.data(), &err));

    // Set kernel arguments
    OCL_CHECK(err, err = user_kernel.setArg(3, ulQPN));
    OCL_CHECK(err, err = user_kernel.setArg(4, ulAddr));
    OCL_CHECK(err, err = user_kernel.setArg(5, urAddr));
    OCL_CHECK(err, err = user_kernel.setArg(6, ulen));
    OCL_CHECK(err, err = user_kernel.setArg(7, node_num));
    OCL_CHECK(err, err = user_kernel.setArg(8, board_num));
    OCL_CHECK(err, err = user_kernel.setArg(9, nOP));
    OCL_CHECK(err, err = user_kernel.setArg(10, qOP));
    OCL_CHECK(err, err = user_kernel.setArg(11, check_value));
    OCL_CHECK(err, err = user_kernel.setArg(12, buffer_op));
    OCL_CHECK(err, err = user_kernel.setArg(13, buffer_r1));

    // Map operations buffer
    uint64_t *operations;

    OCL_CHECK(err, operations = (uint64_t*)q.enqueueMapBuffer(buffer_op, CL_TRUE, CL_MAP_WRITE, 

                                                         0, size_in_bytes, NULL, NULL, &err));

    // Initialize random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> index_dist(1, nOP - 2);
    std::uniform_int_distribution<> key_dist(0, 99999);
    std::uniform_int_distribution<> value_dist(0, 65535);

    // Initialize operations array to zero
    std::fill_n(operations, nOP, 0);

    // Calculate number of write operations (excluding first and last)
    uint32_t num_writes = ((nOP * wP) / 100) - 2;
    std::vector<int> write_indices;
    write_indices.reserve(num_writes);
    int initilize_keys=0;
    // Generate unique random indices for write operations
    while (write_indices.size() < num_writes) {
        int rand_index = index_dist(gen);
        if (std::find(write_indices.begin(), write_indices.end(), rand_index) == write_indices.end()) {
            write_indices.push_back(rand_index);
        // Generate 16-bit key (0-99999) and 16-bit value (0-65535)

        uint32_t key;

        if (initilize) {

            key = initilize_keys++;

        } else {

            key = key_dist(gen);

        }

        uint32_t value = value_dist(gen);

        operations[rand_index] = (uint64_t(value) << 32) | key;
        }
    }

    // Set first and last operations
    operations[0] = 1;
    operations[nOP - 1] = expected_value;

    // Unmap the buffer
    OCL_CHECK(err, err = q.enqueueUnmapMemObject(buffer_op, operations));
    OCL_CHECK(err, err = q.finish());

    printf("enqueue user kernel...\n");
    printf("check_value...%d\n", check_value);

    // Execute kernel and measure time
    double durationUs = 0.0;
    auto start = std::chrono::high_resolution_clock::now();
    OCL_CHECK(err, err = q.enqueueTask(user_kernel));
    
    for (auto it = put_map.begin(); it != put_map.end();) {
    uint32_t key = it->first;
    uint32_t val = it->second;
    if (put_counter[key] >= period) {
        uint64_t packed = (val << 32) | key;
        cl::Buffer buffer_summary(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, sizeof(uint64_t), &packed, &err);
        OCL_CHECK(err, summary_kernel.setArg(0, buffer_summary));
        OCL_CHECK(err, err = q.enqueueTask(summary_kernel));
        OCL_CHECK(err, err = q.finish());
        put_counter[key] = 0;
        it = put_map.erase(it);
    } else {
        ++it;
    }
}
    OCL_CHECK(err, err = q.finish());

    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0);
    printf("durationUs:%f\n", durationUs);
    printf("replication_latency:%f\n", durationUs / nOP);

    sleep(5);
    printf("Device->Host user kernel...\n");
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_r1}, CL_MIGRATE_MEM_OBJECT_HOST));
    OCL_CHECK(err, err = q.finish());

    // Calculate and print throughput
    float temp_throughput = (nOP * node_num) / durationUs;
    if(! initilize)
        printf("Throughput in Microseconds: %f\n", temp_throughput);
}

int main(int argc, char **argv) {
    if (argc < 6) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File> <N_node> <node_id> <nOP> <wP>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];
    uint32_t N_node = std::stoi(argv[2]);
    uint32_t node_id = std::stoi(argv[3]);
    uint32_t nOP = std::stoi(argv[4]);
    uint32_t wP = std::stoi(argv[5]);

    cl_int err;
    cl::CommandQueue q;
    cl::Context context;
    cl::Kernel user_kernel;
    cl::Kernel network_kernel;
    cl::Kernel summary_kernel;


    auto size = DATA_SIZE;
    auto vector_size_bytes = sizeof(int) * size;
    std::vector<int, aligned_allocator<int>> network_ptr0(size);

    // OpenCL setup
    auto devices = xcl::get_xil_devices();
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    int valid_device = 0;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        OCL_CHECK(err, context = cl::Context({device}, NULL, NULL, NULL, &err));
        OCL_CHECK(err, q = cl::CommandQueue(context, {device}, 
            CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err));
        std::cout << "Trying to program device[" << i << "]: " 
                  << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, NULL, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            OCL_CHECK(err, network_kernel = cl::Kernel(program, "rocetest_krnl", &err));
            OCL_CHECK(err, user_kernel = cl::Kernel(program, "bram_kv_store_bram_bench", &err));
            OCL_CHECK(err, summary_kernel = cl::Kernel(program, "hybrid_kv_summary_krnl", &err));

            valid_device++;
            break;
        }
    }
    if (valid_device == 0) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }

    // Network kernel setup
    uint32_t rPSN = 0x00000000;
    uint32_t lPSN = 0x00000000;
    uint32_t rQPN = (node_id == 1) ? 0x00000000 : 0x00000001;
    uint32_t lQPN = (node_id == 1) ? 0x00000000 : 0x00000001;
    uint32_t rIP  = 0x0b01d4e0;
    uint32_t lIP  = 0x0b01d4e0 + node_id;
    uint32_t rUDP = 0x000012b7;
    uint64_t vAddr= 0x0000000000000001;
    uint32_t rKey = 0x00000000;
    uint32_t OP   = N_node - 1;
    uint64_t rAddr= 0x0000000000000000;
    uint64_t lAddr= 0x0000000000000000;
    uint32_t len  = 0x00000008;
    uint32_t debug= 0x00001000 + (node_id * 4);

    printf("Total Number of Nodes: %d\n", N_node);

    uint32_t debug1 = 0xd0000000;
    if (argc >= 7) {
        debug1 = (debug1 & 0x00FFFFFF) | ((uint32_t)strtoul(argv[2], NULL, 0) << 24);
    }
    uint32_t meta = 1 << (debug1 >> 29);
    uint32_t length = 1 << ((debug1 >> 24) & 0x1F);
    printf("meta count      = %d\n", meta);
    printf("length in bytes = %d\n", length);
    printf("total data read = %d\n\n", meta * length);

    OCL_CHECK(err, cl::Buffer buffer_r1(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, 
                                        vector_size_bytes, network_ptr0.data(), &err));
    OCL_CHECK(err, err = network_kernel.setArg(0, rPSN));
    OCL_CHECK(err, err = network_kernel.setArg(1, lPSN));
    OCL_CHECK(err, err = network_kernel.setArg(2, rQPN));
    OCL_CHECK(err, err = network_kernel.setArg(3, lQPN));
    OCL_CHECK(err, err = network_kernel.setArg(4, rIP));
    OCL_CHECK(err, err = network_kernel.setArg(5, lIP));
    OCL_CHECK(err, err = network_kernel.setArg(6, rUDP));
    OCL_CHECK(err, err = network_kernel.setArg(7, vAddr));
    OCL_CHECK(err, err = network_kernel.setArg(8, rKey));
    OCL_CHECK(err, err = network_kernel.setArg(9, OP));
    OCL_CHECK(err, err = network_kernel.setArg(10, rAddr));
    OCL_CHECK(err, err = network_kernel.setArg(11, lAddr));
    OCL_CHECK(err, err = network_kernel.setArg(12, len));
    OCL_CHECK(err, err = network_kernel.setArg(13, debug));
    OCL_CHECK(err, err = network_kernel.setArg(14, buffer_r1));

    double durationUs = 0.0;
    auto start = std::chrono::high_resolution_clock::now();
    printf("enqueue network kernel...\n");
    OCL_CHECK(err, err = q.enqueueTask(network_kernel));
    OCL_CHECK(err, err = q.finish());
    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0);
    printf("durationUs:%f\n", durationUs);

    // Call the user kernel function
    //initilize the hashmap.
    /*=================MEMCACHE SYNC START===============================*/
    memcached_st *memc;
    memcached_server_st *servers;
    memcached_return_t rc;
    size_t return_value_length;
    uint32_t flags;
    char *retrieved_value;
    bool sync = false; 
    bool set[node_num * 2] = {false};
    set[board_num] = true;
    // set[node_num + board_num] = true; 

    int ready = 1, ready2 = 1; 

    memc = memcached_create(NULL);
    servers = memcached_server_list_append(NULL, "198.22.255.165", 11211, &rc);
    rc = memcached_server_push(memc, servers);
    memcached_server_list_free(servers);

    if (rc != MEMCACHED_SUCCESS) {
        std::cerr << "Could not connect to Memcached: " << memcached_strerror(NULL, rc) << std::endl;
        return 1;
    }
    // Set a value
    //const char *key = "0";
    std::string key = std::to_string(board_num);
    //const char *value = "0";
    std::string value = std::to_string(board_num);

    rc = memcached_set(memc, key.c_str(), key.length(), value.c_str(), value.length(), (time_t)0, 0);

    if (rc != MEMCACHED_SUCCESS) {
        std::cerr << "Could not set value: " << memcached_strerror(memc, rc) << std::endl;
    }

    // Get the value
    int counter = 0; 
    while (!sync) {
        //sleep(1);
        for (int i = 0; i < node_num; i++) {
            if (!set[i]) {
                key = std::to_string(i);
                retrieved_value = memcached_get(memc, key.c_str(), key.length(), &return_value_length, &flags, &rc);
                if (rc == MEMCACHED_SUCCESS) {
                    std::cout << "Retrieved value: " << std::string(retrieved_value, return_value_length) << std::endl;
                    if (std::string(retrieved_value, return_value_length) == std::to_string(i)) {
                        set[i] = true; 
                        ready++;
                    }
                } else {
                    std::cerr << "Could not get value: " << memcached_strerror(memc, rc) << std::endl;
                }
            }
        }
        counter++;
        if (ready == node_num) {
            sync = true; 
        }

        if (counter == 4000000) {
            std::cout << "SYNC FAILED" << std::endl;
            return 1; 
        }

    }
    /*=================MEMCACHE SYNC END===============================*/
    run_user_kernel(true, context, q, user_kernel, summary_kernel, 99999, 100, node_id, N_node, buffer_r1);
    if(ycsb_mode=="Update_Heavy"){
        bool initilize=false;
        run_user_kernel(initilize, context, q, user_kernel, summary_kernel, nOP, 50, node_id, N_node, buffer_r1);
    }
    else if(ycsb_mode=="Read_Mostly"){
        bool initilize=false;
        run_user_kernel(initilize, context, q, user_kernel, summary_kernel, nOP, 5, node_id, N_node, buffer_r1);
    }
    else if(ycsb_mode=="Read_Only"){
        bool initilize=false;
        run_user_kernel(initilize, context, q, user_kernel, summary_kernel, nOP, 0, node_id, N_node, buffer_r1);
    }

    std::cout << "EXIT recorded" << std::endl;
    return 0;
}