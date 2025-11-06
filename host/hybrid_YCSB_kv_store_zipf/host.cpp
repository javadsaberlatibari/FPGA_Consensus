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
#include <cmath>    // for std::pow



#define DATA_SIZE 62500000
#define IP_ADDR 0x0A01D498
#define BOARD_NUMBER 0
#define ARP 0x0A01D498
//const int expected_value_fpga=99999;
const int expected_value=99999;
const int shared_mem_size= 10000000; //10M
const int hbm_update_period =10;
double zipf_s;


// Allocate shared_data in host memory (CL_MEM_ALLOC_HOST_PTR allows host RAM usage)
static uint64_t* shared_mem_ptr = nullptr;
std::vector<uint64_t, aligned_allocator<uint64_t>> shared_data(shared_mem_size, 0);

struct summarized_key_value {
    uint64_t value;
    int count;
}; 
summarized_key_value summarized_kv_array[shared_mem_size] = {}; 


uint64_t cpu_operations [1000000]={0};
const int summariztion_period=0;

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
class zipf_distribution {
public:
    zipf_distribution(size_t N, double s)
        : N_(N), s_(s), norms_(N) {
        double sum = 0.0;
        for (size_t i = 1; i <= N_; ++i) {
            sum += 1.0 / std::pow((double)i, s_);
            norms_[i-1] = sum;
        }
        for (auto &v : norms_) v /= sum;  // Normalize CDF to [0,1]
    }
    template <typename URNG>
    size_t operator()(URNG &engine) const {
        double p = std::uniform_real_distribution<>(0.0, 1.0)(engine);
        auto it = std::lower_bound(norms_.begin(), norms_.end(), p);
        return (size_t)std::distance(norms_.begin(), it);
    }
private:
    size_t N_;
    double s_;
    std::vector<double> norms_;
};

// Fill a preallocated operations[] with PUT/GETs using Zipf or Uniform keys.
// NOTE: Encodes exactly how your host expects (value in upper 32, key in lower 32).
static inline void init_operations_zipf_or_uniform(
    int total_ops, int write_pct, uint64_t *operations,
    int max_keys, bool use_zipf, double skew_s)
{
    std::random_device rd;
    std::mt19937 gen(rd());

    zipf_distribution zipf_key(max_keys, skew_s);
    std::uniform_int_distribution<uint32_t> uni_key(0, max_keys - 1);
    std::uniform_int_distribution<uint32_t> value_dist(1, 65535);

    const int num_writes = (total_ops * write_pct) / 100;

    // First PUTs
    for (int i = 0; i < num_writes; ++i) {
        uint32_t key   = use_zipf ? (uint32_t)zipf_key(gen) : uni_key(gen);
        uint32_t value = value_dist(gen);
        operations[i] = ( (uint64_t)value << 32 ) | key;  // PUT
    }
    // Then GETs
    for (int i = num_writes; i < total_ops; ++i) {
        uint32_t key = use_zipf ? (uint32_t)zipf_key(gen) : uni_key(gen);
        operations[i] = ( (uint64_t)0 << 32 ) | key;      // GET
    }
    // Shuffle so reads/writes are interleaved randomly
    std::shuffle(operations, operations + total_ops, gen);
}

std::vector<int, aligned_allocator<int>> reply(1);
// Function to run the user kernel
void prepare_operations_and_transfer(bool initilize, bool local, cl::Context context, cl::CommandQueue q,
                                    int nOP, uint32_t wP,
                                    cl::Kernel &user_kernel,
                                    cl::Buffer &buffer_r1,
                                    uint32_t node_id, uint32_t node_num, int assigtofpgaP, int key_num_bits) {
    cl_int err;

    std::cout << "kernel args seen by runtime = "
        << user_kernel.getInfo<CL_KERNEL_NUM_ARGS>() << "\n";
    // ---- HOST[0] buffer for shared_data (zero-copy) ----
    // Allocate a BO pinned in HOST[0]; CPU gets a mapped pointer.
    cl_mem_ext_ptr_t ext_shared{};
    ext_shared.flags = XCL_MEM_EXT_HOST_ONLY;  // HOST[0]
    ext_shared.obj   = nullptr;
    ext_shared.param = 0;

    printf("Define buffer_shared_data \n");
    cl::Buffer buffer_shared_data(
        context,
        CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX,   // ← remove CL_MEM_ALLOC_HOST_PTR
        shared_mem_size * sizeof(uint64_t),
        &ext_shared,
        &err
    );




    printf("Generate Random FPGA Operations- Begin \n");
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> key_dist(0, 99998);
    std::uniform_int_distribution<> value_dist(1, 65535);

    int FPGAnOP;
    int CPUnOP;
    int allnop;

    if(initilize){
        FPGAnOP = nOP;
        CPUnOP=shared_mem_size;
    }
    else
        FPGAnOP = (nOP *assigtofpgaP)/100;
    // Fill fpgaoperations with zeros by default
    std::vector<uint64_t, aligned_allocator<uint64_t>> fpgaoperations(FPGAnOP, 0);  // ✅ this line alone is sufficient

    if (err != CL_SUCCESS) printf("fpgaoperations map failed: %d\n", err);

    uint32_t num_writes = 0;
    if (((FPGAnOP * wP) / 100) > 2) {
        num_writes = ((FPGAnOP * wP) / 100);
    }

    std::vector<int> all_indices;
    for (int i = 0; i < FPGAnOP; ++i) {
        all_indices.push_back(i);
    }
    std::shuffle(all_indices.begin(), all_indices.end(), gen);

    printf("Generate put operations \n");

    int initilize_keys = 0;
    for (int i = 0; i < num_writes; ++i) {
        int idx = all_indices[i];
        uint32_t key = initilize ? initilize_keys++ : key_dist(gen);
        uint32_t value = value_dist(gen);
        fpgaoperations[idx] = (uint64_t(value) << 32) | key;
    }
    
    
    printf("Generate get operations \n");
    for (int i = num_writes; i < (int)all_indices.size(); ++i) {
        int idx = all_indices[i];
        uint32_t key = key_dist(gen);
        fpgaoperations[idx] = (uint64_t(0) << 32) | key;
    }

    printf("Generate Random FPGA Operations- End \n");

    // CPU side ops
    if(!initilize){
        // ===== NEW CPU OP GENERATION WITH OPTIONAL ZIPF =====
        printf("Generate CPU Operations (Zipf/uniform) - Begin \n");

        CPUnOP = (nOP * (100 - assigtofpgaP)) / 100;

    // Safety: don't overflow the fixed cpu_operations[] buffer
    if (CPUnOP > (int)(sizeof(cpu_operations) / sizeof(cpu_operations[0]))) {
        CPUnOP = (int)(sizeof(cpu_operations) / sizeof(cpu_operations[0]));
        printf("CPUnOP truncated to %d to fit cpu_operations[]\n", CPUnOP);
    }

    // Choose distribution here:
    bool use_zipf = true;         // <-- set to false to revert to uniform
    //double zipf_s = 1.0;          // <-- increase for more skew: 0.0 (uniform) → 1.2+ (hotter)

    // Keys range: match your shared_mem_ptr range.
    int max_keys = shared_mem_size;   // if you want to avoid early region, set a min offset below

    init_operations_zipf_or_uniform(
        CPUnOP, (int)wP, cpu_operations,
        max_keys, use_zipf, zipf_s
    );

    printf("Generate CPU Operations (Zipf/uniform) - End \n");

    }
    cl::Buffer buffer_fpgaoperations =
        (FPGAnOP > 0)
      ? cl::Buffer(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
                   FPGAnOP * sizeof(uint64_t), fpgaoperations.data(), &err)
      : cl::Buffer(context, CL_MEM_READ_ONLY,
                   sizeof(uint64_t), nullptr, &err);

    int wOP;
    if(initilize || (node_num==1)){
        allnop = FPGAnOP;
        wOP =((FPGAnOP * wP) / 100);
        }
    else{
        allnop = FPGAnOP + ((CPUnOP * wP) / 100);
        wOP = ((CPUnOP * wP) / 100) + ((FPGAnOP * wP) / 100);
    }

    printf("FPGAnOP %d\n", FPGAnOP);
    printf("CPUnOP %d\n", CPUnOP);
    printf("allnop %d\n", allnop);

    uint32_t ulQPN = (node_id == 1) ? 0x00000000 : 0x00000001;
    uint64_t ulAddr = 0x0000000000000000;
    uint64_t urAddr = 0x0000000000000000;
    uint32_t ulen = 0x00000008;
    uint32_t board_num = node_id;
    
    int expected_recieve = wOP*(node_num-1);
    
    //int check_value_cpu = expected_value;

    printf("key_num_bits %d\n", key_num_bits);
    printf("expected_recieve %d\n", expected_recieve);

    OCL_CHECK(err, cl::Buffer buffer_r2(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, 
                                        sizeof(int), reply.data(), &err));

    OCL_CHECK(err, err = user_kernel.setArg(4, ulQPN));
    OCL_CHECK(err, err = user_kernel.setArg(5, ulAddr));
    OCL_CHECK(err, err = user_kernel.setArg(6, urAddr));
    OCL_CHECK(err, err = user_kernel.setArg(7, ulen));
    OCL_CHECK(err, err = user_kernel.setArg(8, node_num));
    OCL_CHECK(err, err = user_kernel.setArg(9, board_num));
    OCL_CHECK(err, err = user_kernel.setArg(10, allnop));
    OCL_CHECK(err, err = user_kernel.setArg(11, FPGAnOP));
    OCL_CHECK(err, err = user_kernel.setArg(12, wOP));
    OCL_CHECK(err, err = user_kernel.setArg(13, key_num_bits));
    OCL_CHECK(err, err = user_kernel.setArg(14, expected_recieve));
    //OCL_CHECK(err, err = user_kernel.setArg(13, check_value_cpu));
    OCL_CHECK(err, err = user_kernel.setArg(15, local));
    OCL_CHECK(err, err = user_kernel.setArg(16, hbm_update_period));
    OCL_CHECK(err, err = user_kernel.setArg(17, buffer_fpgaoperations)); // ✅ host-pinned
    OCL_CHECK(err, err = user_kernel.setArg(18, buffer_r1));
    OCL_CHECK(err, err = user_kernel.setArg(19, buffer_shared_data));

    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_fpgaoperations}, 0));
    OCL_CHECK(err, err = q.finish());

    printf("Define shared_mem_ptr \n");
    shared_mem_ptr = (uint64_t*) q.enqueueMapBuffer(
        buffer_shared_data, CL_TRUE, CL_MAP_READ | CL_MAP_WRITE,
        0, shared_mem_size * sizeof(uint64_t), nullptr, nullptr, &err
    );

    if (err != CL_SUCCESS || !shared_mem_ptr) { printf("buffer_shared_data map failed: %d\n", err); exit(1); }

    // Initialize the shared region (in host RAM)
    if (initilize) {
        for (int i = 0; i < shared_mem_size; ++i) {
            uint32_t top_32 = rand();
            shared_mem_ptr[i] = (uint64_t(top_32) << 32);
        }
    }
}


// This function enqueues and runs the user kernel on the FPGA,
// then migrates the result back to the host memory.
void run_user_kernel(bool initilize, cl::Context context, cl::CommandQueue q, cl::Kernel user_kernel, cl::Kernel hybrid_kernel,
                     int nOP, cl::Buffer buffer_r1, uint32_t node_num, int assigtofpgaP, int key_bit_start) {
    cl_int err;

    //printf("enqueue user kernel...\n");
    //printf("check_value...%d\n", check_value);
    int debug_count=0;
    int CPUnOP = (nOP *(100- assigtofpgaP))/100;
    printf("CPUnOP %d\n", CPUnOP);
    int summarization_count=0; 
    // Execute kernel and measure time
    double durationUs = 0.0;
    auto start = std::chrono::high_resolution_clock::now();

    if(initilize){
        summarization_count=0;
        OCL_CHECK(err, err = q.enqueueTask(user_kernel));// start running OPs on FPGA
    }
    else{
        OCL_CHECK(err, err = q.enqueueTask(user_kernel));// start running OPs on FPGA
        for(int i=0; i<CPUnOP; i++) {  //start running OPs on CPU
            //printf("debug i index:%d\n", i);
            // Lower 32 bits
            uint32_t key = static_cast<uint32_t>(cpu_operations [i] & 0xFFFFFFFF);

            // Upper 32 bits
            uint32_t value = static_cast<uint32_t>(cpu_operations [i] >> 32);

            if(value==0){
                int query_val = (int)shared_mem_ptr[key];
            }
            else {
                if(summarization_count< summariztion_period){
                    summarization_count++;
                
                    summarized_kv_array[key].value= value;

                }
                else{   //1) periodically snapshot to FPGA
                    summarization_count=0;
                    summarized_kv_array[key].value =value;
                    if(1<node_num){
                        uint32_t shared_data_time_stamp = (uint32_t)(shared_mem_ptr[key] & 0xFFFFFFFF);
                        OCL_CHECK(err, hybrid_kernel.setArg(0,
                        ((uint64_t)(summarized_kv_array[key].value & 0xFFFFFFFFu) << 32) |
                        (((uint64_t)(key                  & 0xFFFFFFu))           << 8 ) |
                        ((uint64_t)(shared_data_time_stamp & 0xFFu))
                        ));


                        OCL_CHECK(err, q.enqueueTask(hybrid_kernel));

                        
                    }
                    else{
                        uint32_t shared_data_time_stamp = (uint32_t)(shared_mem_ptr[key] & 0xFFFFFFFF);
                        shared_data_time_stamp++;
                        shared_mem_ptr[key]= (uint64_t(value) << 32) | shared_data_time_stamp;


                    }
                    debug_count++;
                }
            }

        }
    }

    OCL_CHECK(err, err = q.finish());
    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0);
    if(! initilize)
        printf("durationUs:%f\n", durationUs);
    if(! initilize)
        printf("replication_latency:%f\n", durationUs / nOP);

    sleep(5);
    printf("debug_count %d\n", debug_count);
    printf("Device->Host user kernel...\n");
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_r1}, CL_MIGRATE_MEM_OBJECT_HOST));
    OCL_CHECK(err, err = q.finish());

    // Calculate and print throughput
    float temp_throughput = (nOP * node_num) / durationUs;
    if(! initilize)
        printf("Throughput in Microseconds: %f\n", temp_throughput);
}

int main(int argc, char **argv) {
    if (argc < 8) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File> <N_node> <node_id> <nOP> <wP>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];
    uint32_t N_node = std::stoi(argv[2]);
    uint32_t node_id = std::stoi(argv[3]);
    int nOP = std::stoi(argv[4]);
    uint32_t wP = std::stoi(argv[5]);

    int assigtofpgaP= std::stoi(argv[7]);
    const char* MEM_IP = argv[8];
    zipf_s= std::stod(argv[9]);


    cl_int err;
    cl::CommandQueue q;
    cl::Context context;
    cl::Kernel user_kernel;
    cl::Kernel network_kernel;
    cl::Kernel hybrid_kernel;

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
            OCL_CHECK(err, user_kernel = cl::Kernel(program, "hybrid_kv_store_bram_bench", &err));
            OCL_CHECK(err, hybrid_kernel = cl::Kernel(program, "hybrid_kv_summary_krnl", &err));
            
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
    printf("ٔAssign to FPGA = %d\n\n", assigtofpgaP);
    printf("ٔZipf Skew = %f\n\n", zipf_s);

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
    int key_num_bits= 24;  //if  you want to increase size of keys need to adjust this.
    prepare_operations_and_transfer(true, true, context, q, 100000, 100, user_kernel, buffer_r1, node_id, N_node, assigtofpgaP, key_num_bits);
    run_user_kernel(true, context, q, user_kernel, hybrid_kernel, nOP, buffer_r1, N_node, assigtofpgaP, key_num_bits);

    printf("initializing phase end\n");

    printf("Prepare operations for final run\n");
    if(wP==0){
        bool local=true;
        prepare_operations_and_transfer(false, local, context, q, nOP, wP, user_kernel, buffer_r1, node_id, N_node, assigtofpgaP, key_num_bits);
    }
    else {
        bool local=true; //To measure response time this one should be true, so don't wait for remote latencies.
        if(std::strcmp(argv[6], "th") == 0){
            local=false;
            printf("checkkkkkkkkkkk\n");
        }
        prepare_operations_and_transfer(false, local, context, q, nOP, wP, user_kernel, buffer_r1, node_id, N_node, assigtofpgaP, key_num_bits);
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
    run_user_kernel(false, context, q, user_kernel, hybrid_kernel, nOP, buffer_r1, N_node, assigtofpgaP, key_num_bits);

    std::cout << "EXIT recorded" << std::endl;
    return 0;
}