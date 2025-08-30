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
#include <string>
#include <algorithm>
#include <cstring>


#define DATA_SIZE 62500000
#define IP_ADDR 0x0A01D498
#define BOARD_NUMBER 0
#define ARP 0x0A01D498
const int expected_value=100001;
//const std::string ycsb_mode = "Update_Heavy";
void wait_for_enter(const std::string &msg) {
    std::cout << msg << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}
int setMemcachedValue(memcached_st *memc, int ID) {
    std::string key = std::to_string(ID);
    std::string value = std::to_string(ID);

    memcached_return_t rc = memcached_set(memc, key.c_str(), key.length(), value.c_str(), value.length(), (time_t)0, 0);
    if (rc != MEMCACHED_SUCCESS) {
        std::cerr << "Could not set value: " << memcached_strerror(memc, rc) << std::endl;
        return 1;
    }
    return 0;
}

int getMemcachedValue(memcached_st *memc, int nodeID, bool& set, int& ready) {
    memcached_return_t rc;
    size_t return_value_length;
    uint32_t flags;
    char *retrieved_value;

    std::string key = std::to_string(nodeID);
    retrieved_value = memcached_get(memc, key.c_str(), key.length(), &return_value_length, &flags, &rc);

    if (rc == MEMCACHED_SUCCESS) {
        std::cout << "Retrieved value: " << std::string(retrieved_value, return_value_length) << std::endl;
        if (std::string(retrieved_value, return_value_length) == std::to_string(nodeID)) {
            set = true;
            ready++;
        }
    } else {
        //std::cerr << "Could not get value: " << memcached_strerror(memc, rc) << std::endl;
        return 1;
    }

    return 0;
}
int sync(int ID, int NUM_NODES, const char* IP) {
    memcached_st *memc;
    memcached_server_st *servers;
    memcached_return_t rc;
    bool sync = false; 
    bool set[NUM_NODES] = {false}; // Initialize the array
    set[ID] = true; // The current node has set its value

    int ready = 1; // This will count how many nodes are ready

    // Create memcached connection
    memc = memcached_create(NULL);
    servers = memcached_server_list_append(NULL, IP, 11211, &rc);
    rc = memcached_server_push(memc, servers);
    memcached_server_list_free(servers);

    if (rc != MEMCACHED_SUCCESS) {
        std::cerr << "Could not connect to Memcached: " << memcached_strerror(NULL, rc) << std::endl;
        return 1;
    }

    // Set the value for the current node
    if (setMemcachedValue(memc, ID) != 0) {
        return 1;
    }

    int counter = 0; 
    while (!sync) {
        for (int i = 0; i < NUM_NODES; i++) {
            if (!set[i]) {
                if (getMemcachedValue(memc, i, set[i], ready) != 0) {
                    //std::cout << "Must try again" << std::endl;
                }
            }
        }
        
        counter++;
        if (ready == NUM_NODES) {
            sync = true; // All nodes are ready, synchronization complete
        }

        if (counter == 150000) {
            std::cout << "SYNC FAILED" << std::endl;
            return 1;
        }
    }

    // Cleanup
    memcached_free(memc);

    return 0;
}
std::vector<int, aligned_allocator<int>> reply(1);
// Function to run the user kernel
void prepare_operations_and_transfer(bool initilize, cl::Context context, cl::CommandQueue q,
                                    int nOP, uint32_t wP,
                                    cl::Kernel &user_kernel,
                                    cl::Buffer &buffer_r1,
                                    uint32_t node_id, uint32_t node_num) {
    cl_int err;

    // Random generators for keys and values
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> key_dist(0, 99999);
    std::uniform_int_distribution<> value_dist(1, 65535);

    // Fill operations with zeros by default
    std::vector<uint64_t, aligned_allocator<uint64_t>> operations(nOP, 0);  // ✅ this line alone is sufficient


    printf("Generate Random Operations- Begin \n");
    // Calculate how many operations are writes (excluding first and last)
    uint32_t num_writes = 0;
    if (((nOP * wP) / 100) > 2) {
        num_writes = ((nOP * wP) / 100) - 2;
    }

    std::vector<int> all_indices;
    for (int i = 1; i < nOP - 1; ++i) {
        all_indices.push_back(i);
    }
    std::shuffle(all_indices.begin(), all_indices.end(), gen);

    printf("Generate Random Operations- Shuffle \n");
    // Generate and assign key-value pairs for write operations
    int initilize_keys = 0;
    for (int i = 0; i < num_writes; ++i) {
        int idx = all_indices[i];
        uint32_t key = initilize ? initilize_keys++ : key_dist(gen);
        uint32_t value = value_dist(gen);
        operations[idx] = (uint64_t(value) << 32) | key;
    }

    // First and last operations are special
    operations[0] = (uint64_t(1) << 32) | 1;
    operations[nOP - 1] = (uint64_t(expected_value) << 32) | expected_value;

    // Generate and assign keys for get operations (value=0)
    for (int i = num_writes; i < all_indices.size(); ++i) {
        int idx = all_indices[i];
        uint32_t key = key_dist(gen);
        operations[idx] = (uint64_t(0) << 32) | key;
    }

    printf("Generate Random Operations- End \n");
    // Create and transfer buffer_op to FPGA
    cl::Buffer buffer_op(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
                     nOP * sizeof(uint64_t), operations.data(), &err);


    // Set kernel arguments
    int wOP = ((nOP * wP) / 100);
    uint32_t ulQPN = (node_id == 1) ? 0x00000000 : 0x00000001;
    uint64_t ulAddr = 0x0000000000000000;
    uint64_t urAddr = 0x0000000000000000;
    uint32_t ulen = 0x00000008;
    //uint32_t node_num = N_node;
    uint32_t board_num = node_id;
    int check_value = expected_value;

    OCL_CHECK(err, cl::Buffer buffer_r2(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, 
                                        sizeof(int), reply.data(), &err));

    OCL_CHECK(err, err = user_kernel.setArg(3, ulQPN));
    OCL_CHECK(err, err = user_kernel.setArg(4, ulAddr));
    OCL_CHECK(err, err = user_kernel.setArg(5, urAddr));
    OCL_CHECK(err, err = user_kernel.setArg(6, ulen));
    OCL_CHECK(err, err = user_kernel.setArg(7, node_num));
    OCL_CHECK(err, err = user_kernel.setArg(8, board_num));
    OCL_CHECK(err, err = user_kernel.setArg(9, nOP));
    OCL_CHECK(err, err = user_kernel.setArg(10, wOP));
    OCL_CHECK(err, err = user_kernel.setArg(11, check_value));
    OCL_CHECK(err, err = user_kernel.setArg(12, initilize));
    OCL_CHECK(err, err = user_kernel.setArg(13, buffer_op));
    OCL_CHECK(err, err = user_kernel.setArg(14, buffer_r1));

    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_op}, 0));
    OCL_CHECK(err, err = q.finish());

    // No return needed as buffer_op is passed by reference
}

// This function enqueues and runs the user kernel on the FPGA,
// then migrates the result back to the host memory.
void run_user_kernel(bool initilize, cl::Context context, cl::CommandQueue q, cl::Kernel user_kernel,
                     int nOP, cl::Buffer buffer_r1, uint32_t node_num) {
    cl_int err;

    //printf("enqueue user kernel...\n");
    //printf("check_value...%d\n", check_value);
    
    // Execute kernel and measure time
    double durationUs = 0.0;
    auto start = std::chrono::high_resolution_clock::now();
    OCL_CHECK(err, err = q.enqueueTask(user_kernel));
    OCL_CHECK(err, err = q.finish());
    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0);
    if(! initilize)
        printf("durationUs:%f\n", durationUs);
    if(! initilize)
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
    if (argc < 7) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File> <N_node> <node_id> <nOP> <wP>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];
    uint32_t N_node = std::stoi(argv[2]);
    uint32_t node_id = std::stoi(argv[3]);
    int nOP = std::stoi(argv[4]);
    uint32_t wP = std::stoi(argv[5]);

    std::string ycsb_mode;
    if(std::stoi(argv[5])==50)
        ycsb_mode = "Update_Heavy";
    else if (std::stoi(argv[5])==5)
        ycsb_mode = "Read_Mostly";
    else
        ycsb_mode = "Read_Only";

    const char* MEM_IP = argv[7];

    cl_int err;
    cl::CommandQueue q;
    cl::Context context;
    cl::Kernel user_kernel;
    cl::Kernel network_kernel;

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
            valid_device++;
            break;
        }
    }
    if (valid_device == 0) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }
    //wait_for_enter("printenter");
    //wait_for_enter("\nPress ENTER to continue after setting up ILA trigger...");

    /*===============================================================Init and start Network Kernel===============================================================*/    
    uint32_t node_num = N_node;
    uint32_t board_num = node_id;

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
    printf("ٔTotal Number of OPs: = %d\n\n", nOP);
    printf("ٔWrite P = %d\n\n", wP);
    printf("ٔnode id = %d\n\n", node_id);

    uint32_t debug1 = 0xd0000000;
    if (argc >= 8) {
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
    if(N_node>1){
        if (sync(node_id, N_node, MEM_IP) != 0) {
            return 1; 
        }
    }

    OCL_CHECK(err, err = q.enqueueTask(network_kernel));
    OCL_CHECK(err, err = q.finish());



    //wait_for_enter("\nPausing for network kernel setup...");
    /*===============================================================Init and Start User kernel===============================================================*/

    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0);
    printf("durationUs:%f\n", durationUs);

    printf("initializing phase begin\n");
    prepare_operations_and_transfer(true, context, q, 100000, 100, user_kernel, buffer_r1, node_id, N_node);
    run_user_kernel(true, context, q, user_kernel, nOP, buffer_r1, N_node);

    printf("initializing phase end\n");

    printf("Prepare operations for final run\n");
    if(ycsb_mode=="Update_Heavy"){
        bool local=true; //To measure response time this one should be true, so don't wait for remote latencies.
        if(std::strcmp(argv[6], "th") == 0){
            local=false;
            printf("checkkkkkkkkkkk\n");
        }
        prepare_operations_and_transfer(local, context, q, nOP, 50, user_kernel, buffer_r1, node_id, N_node);
    }
    else if(ycsb_mode=="Read_Mostly"){
        bool local=true; //To measure response time this one should be true, so don't wait for remote latencies.
        if(std::strcmp(argv[6], "th") == 0)
            local=false;
        prepare_operations_and_transfer(local, context, q, nOP, 5, user_kernel, buffer_r1, node_id, N_node);
    }
    else if(ycsb_mode=="Read_Only"){
        bool local=true;
        prepare_operations_and_transfer(local, context, q, nOP, 0, user_kernel, buffer_r1, node_id, N_node);
    }
    // Call the user kernel function
    //initilize the hashmap.

    // Call the user kernel function
    //initilize the hashmap.
    /*=================MEMCACHE SYNC START===============================*/
    printf("MEMCACHE SYNC Begin\n");
    if(N_node>1){
        if (sync(node_id, N_node, MEM_IP) != 0) {
            return 1; 
        }
    }
/*=================MEMCACHE SYNC END===============================*/

    printf("MEMCACHE SYNC END\n");
    //sleep(15);
    run_user_kernel(false, context, q, user_kernel, nOP, buffer_r1, N_node);

    std::cout << "EXIT recorded" << std::endl;
    return 0;
}