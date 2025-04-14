/**********
Copyright (c) 2019, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/
#include "xcl2.hpp"
#include <vector>
#include <chrono>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 
#include <cstdlib> 
#include <iostream> 
#include <fstream>

#define DATA_SIZE 62500000

//Set IP address of FPGA
#define IP_ADDR 0x0A01D498
#define BOARD_NUMBER 0
#define ARP 0x0A01D498

void wait_for_enter(const std::string &msg) {
    std::cout << msg << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

int main(int argc, char **argv) {

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File> <NUM_NODES> <NUM_OPS> <WRITE_%>" << std::endl;
        return EXIT_FAILURE;
    }
    /*===============================================================Handle INPUT ARGs===============================================================*/
    std::string binaryFile = argv[1];
    int NUM_NODES = std::atoi(argv[2]);
    int NUM_OPS = std::atoi(argv[3]);
    double WRITE_PERCENTAGE = std::atoi(argv[4]);
    int ID = std::atoi(argv[5]);
    int exe = atoi(argv[6]);
    /*===============================================================Program FPGA with input bitstream===============================================================*/

    cl_int err;
    cl::CommandQueue q;
    cl::Context context;
    cl::Kernel user_kernel;
    cl::Kernel network_kernel;
    cl::Kernel load_kernel;

    //OPENCL HOST CODE AREA START
    //Create Program and Kernel
    auto devices = xcl::get_xil_devices();

    // read_binary_file() is a utility API which will load the binaryFile
    // and will return the pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    int valid_device = 0;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        OCL_CHECK(err, context = cl::Context({device}, NULL, NULL, NULL, &err));
        OCL_CHECK(err,
                  q = cl::CommandQueue(
                      context, {device}, CL_QUEUE_PROFILING_ENABLE, &err));

        std::cout << "Trying to program device[" << i
                  << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
                  cl::Program program(context, {device}, bins, NULL, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i
                      << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            OCL_CHECK(err,
                      network_kernel = cl::Kernel(program, "rocetest_krnl", &err));
            OCL_CHECK(err,
                      user_kernel = cl::Kernel(program, "rubis_stream_krnl", &err));
            // OCL_CHECK(err,
            //           load_kernel = cl::Kernel(program, "load_krnl", &err));
            valid_device++;
            break; // we break because we found a valid device
        }
    }
    if (valid_device == 0) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }
    
    wait_for_enter("\nPress ENTER to continue after setting up ILA trigger...");

    /*===============================================================Init and start Network Kernel===============================================================*/    

    auto size = DATA_SIZE;
    auto vector_size_bytes = sizeof(int) * size;
    std::vector<int, aligned_allocator<int>> network_ptr0(size);

    uint32_t rPSN = 0x00000000;
    uint32_t lPSN = 0x00000000;
    uint32_t rQPN = 0x00000001;
    uint32_t lQPN = 0x00000001;
    uint32_t rIP  = 0x0b01d4e0;
    uint32_t lIP  = 0x0b01d4e0 + ID;
    uint32_t rUDP = 0x000012b7;
    uint64_t vAddr= 0x0000000000000001;
    uint32_t rKey = 0x00000000;
    uint32_t OP   = NUM_NODES-1;
    uint64_t rAddr= 0x0000000000000000;
    uint64_t lAddr= 0x0000000000000000;
    uint32_t len  = 0x00000008;
    // [15:4] time interval in cycle       0x100   256cycle
    // [3:2]  board number                 0
    // [1:0]  mode 0-nothing 1-test 2-op   0
    uint32_t debug= 0x00001000 + 4 * ID;

    // Set network kernel arguments
    OCL_CHECK(err, err = network_kernel.setArg(0, rPSN)); // Default IP address
    OCL_CHECK(err, err = network_kernel.setArg(1, lPSN)); // Board number
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
    OCL_CHECK(err,
              cl::Buffer buffer_network(context,
                                   CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
                                   vector_size_bytes,
                                   network_ptr0.data(),
                                   &err));
    OCL_CHECK(err, err = network_kernel.setArg(14, buffer_network));

    
    printf("enqueue network kernel...\n");
    OCL_CHECK(err, err = q.enqueueTask(network_kernel));
    OCL_CHECK(err, err = q.finish());

    //sleep(5);
    wait_for_enter("\nPausing for network kernel setup...");
    /*===============================================================Init and Start User kernel===============================================================*/

    uint32_t boardNum = ID;
    int num_ops = NUM_OPS/NUM_NODES; 
    printf("NUMOPS = %d\n", num_ops);
    // std::vector<int, aligned_allocator<int>> reply_bank(64 * sizeof(int));
    // OCL_CHECK(err,
    //           cl::Buffer buffer_reply_bank(context,
    //                                CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
    //                                sizeof(int) * 100,
    //                                reply_bank.data(),
    //                                &err));

    // std::vector<int, aligned_allocator<int>> reply_bram(64 * sizeof(int));
    // OCL_CHECK(err,
    //           cl::Buffer buffer_reply_bram(context,
    //                                CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
    //                                sizeof(int) * 100,
    //                                reply_bram.data(),
    //                                &err));

    std::vector<uint64_t, aligned_allocator<uint64_t>> ops(num_ops);
    OCL_CHECK(err,
              cl::Buffer buffer_ops(context,
                                   CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
                                   sizeof(uint64_t) * num_ops,
                                   ops.data(),
                                   &err));

    // std::vector<int, aligned_allocator<int>> amount(num_ops * sizeof(int));
    // OCL_CHECK(err,
    //           cl::Buffer buffer_amount(context,
    //                                CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
    //                                sizeof(int) * num_ops,
    //                                amount.data(),
    //                                &err));    

    int expected_calls; 
    int expected_query = 0; 
    std::ifstream myfile;
    myfile.open((std::to_string(ID+1) + ".txt").c_str());
    std::string line; 
    int calls = 0; 

    //printf("TEST\n");
    uint64_t full_op, op, amount; 
    while(getline(myfile, line)) {
        if (line.at(0) == '#') {
            expected_calls = std::stoi(line.substr(1, line.size()));
            continue;
        }
        
        op = line.at(0) - 48;

        int a_id, s_id, u_id, b_id, value, i, j; 

        switch (line.at(0) - 48)
        {
        //sellItem
        case 0:
            i = line.find('-');
            s_id = std::stoi(line.substr(1, i));
            value = std::stoi(line.substr(i + 1, line.size()));
            amount = s_id; 
            amount <<= 16; 
            amount += value; 
            break;
        
        //storeBuyNow
        case 1:
            i = line.find('-');
            b_id = std::stoi(line.substr(1, i));
            value = std::stoi(line.substr(i + 1, line.size()));
            amount = b_id; 
            amount <<= 16; 
            amount += value; 
            break;

        //Add user
        case 2:
            amount = std::stoi(line.substr(1, line.size()));
            break; 

        //Place Big
        //013456789
        //3 61-13-825
        case 3: 
            i = line.find('-');
            a_id = std::stoi(line.substr(1, i));
            line = line.substr(i + 1, line.size());
            j = line.find('-');
            u_id = std::stoi(line.substr(0, j));
            value = std::stoi(line.substr(j+1, line.size()));

            amount = a_id;
            amount <<= 21;
            u_id <<= 12;
            amount += u_id; 
            amount += value;
            break; 

        //Open Auction
        case 4:
            i = line.find('-');
            s_id = std::stoi(line.substr(1, i));
            value = std::stoi(line.substr(i + 1, line.size()));
            amount = s_id; 
            amount <<= 16; 
            amount += value; 
            break;

        case 5:
            amount = std::stoi(line.substr(1, line.size()));
            break; 


        default:
            break;
        }

        full_op = amount;
        // printf("%x \n", amount);
        full_op = (full_op << 32) + op; 
        ops[calls] = full_op; 
        //printf("%x \n", ops[calls]);
        calls++;
    }
    printf("dataset size: %d\n", calls);
    printf("expected calls: %d\n", expected_calls);

    // for (int i = 0; i < calls; i++) {
    //     printf("Operations: %d and num: %d\n", ops[i], amount[i]);
    // }


    if (ID == 0) {
        expected_query = num_ops - (((float) WRITE_PERCENTAGE/100) * NUM_OPS) * 0.5;
    } else {
        expected_query = num_ops - ((((float) WRITE_PERCENTAGE/100) * NUM_OPS) * 0.5)/(NUM_NODES-1);
    }

    printf("QUERY = %d\n", expected_query);
    //expected_query = 4; 

    // if (calls != num_ops) {
    //     std::cout << "Expected : " << num_ops << std::endl;
    //     std::cout << "Actual : " << calls << std::endl; 
    //     exit(1);
    // }

    // OCL_CHECK(err, err = load_kernel.setArg(0, buffer_ops));
    // 
    // OCL_CHECK(err, err = load_kernel.setArg(2, num_ops));

    OCL_CHECK(err, err = user_kernel.setArg(3, buffer_ops));
    OCL_CHECK(err, err = user_kernel.setArg(4, buffer_network));
    OCL_CHECK(err, err = user_kernel.setArg(5, boardNum));
    OCL_CHECK(err, err = user_kernel.setArg(6, num_ops));
    OCL_CHECK(err, err = user_kernel.setArg(7, NUM_NODES)); 
    OCL_CHECK(err, err = user_kernel.setArg(8, exe)); 

    printf("Host->Device load kernel... \n");
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_ops}, 0 /* 0 means from host*/));
    //OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_amount}, 0 /* 0 means from host*/));
    OCL_CHECK(err, err = q.finish());
    printf("Starting loading... \n");
    //for (int i = 0; i < num_ops; i++)
    // OCL_CHECK(err, err = q.enqueueTask(load_kernel));
    // sleep(1);

    double durationUs = 0.0;
    printf("enqueue user kernel... \n");
    auto start = std::chrono::high_resolution_clock::now();
    OCL_CHECK(err, err = q.enqueueTask(user_kernel));
    OCL_CHECK(err, err = q.finish());
    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count() / 1000.0);
    sleep(10);

    /*===============================================================OUTPUT===============================================================*/

    // printf("Device->Host user kernel...\n");
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_network}, CL_MIGRATE_MEM_OBJECT_HOST));
    OCL_CHECK(err, err = q.finish());

    printf("durationUs:%f\n",durationUs);
    printf("replication_latency:%f\n",durationUs/num_ops);
    printf("throughput:%f OPs/us\n", NUM_OPS/durationUs);


    const int LOG_SIZE = 2 + 55 + 2 * 187500 + 110; 
    const int HB_START = 0; 
    const int HB_END = 12; 
    const int SYNC_GROUPS = 1; 

    const int PROP_START = HB_END;
    const int PROP_END = PROP_START + 2 + 55; 

    const int LOCAL_LOG_START = PROP_END; 
    const int LOCAL_LOG_END = LOCAL_LOG_START + 2 * 187500; 

    const int LOG_FIFO_START = LOCAL_LOG_END; 
    const int LOG_FIFO_END = LOG_FIFO_START + 110; 

    const int CRDT_START = HB_END + LOG_SIZE * SYNC_GROUPS;
    const int CRDT_END = CRDT_START + 24; 

    // printf("HB: ");
    // for (int i = HB_START; i < HB_END; i++) {
    //     printf("%d ", network_ptr0[i]);
    // }
    // printf("\n");

    printf("PROP: ");
    for (int i = PROP_START; i < PROP_END; i++) {
        printf("%d ", network_ptr0[i]);
    }
    printf("\n");
    
    printf("LOCAL LOG: ");
    for (int i = LOCAL_LOG_START; i < LOCAL_LOG_START + 100; i++) {
        printf("%x ", network_ptr0[i]);
    }
    printf("\n");

    printf("LOG FIFOs: ");
    for (int i = LOG_FIFO_START; i < LOG_FIFO_END; i++) {
        printf("%d ", network_ptr0[i]);
    }
    printf("\n");

    /*****************/

    // printf("PROP: ");
    // for (int i = PROP_START + LOG_SIZE; i < PROP_END + LOG_SIZE; i++) {
    //     printf("%d ", network_ptr0[i]);
    // }
    // printf("\n");
    
    // printf("LOCAL LOG: ");
    // for (int i = LOCAL_LOG_START + LOG_SIZE; i < LOCAL_LOG_START + 100 + LOG_SIZE; i++) {
    //     printf("%x ", network_ptr0[i]);
    // }
    // printf("\n");

    // printf("LOG FIFOs: ");
    // for (int i = LOG_FIFO_START + LOG_SIZE; i < LOG_FIFO_END + LOG_SIZE; i++) {
    //     printf("%d ", network_ptr0[i]);
    // }
    // printf("\n");

    /*****************/

    // printf("PROP: ");
    // for (int i = PROP_START + 2 * LOG_SIZE; i < PROP_END +  2 * LOG_SIZE; i++) {
    //     printf("%d ", network_ptr0[i]);
    // }
    // printf("\n");
    
    // printf("LOCAL LOG: ");
    // for (int i = LOCAL_LOG_START +  2 * LOG_SIZE; i < LOCAL_LOG_START + 100 +  2 * LOG_SIZE; i++) {
    //     printf("%x ", network_ptr0[i]);
    // }
    // printf("\n");

    // printf("LOG FIFOs: ");
    // for (int i = LOG_FIFO_START +  2 * LOG_SIZE; i < LOG_FIFO_END +  2 * LOG_SIZE; i++) {
    //     printf("%d ", network_ptr0[i]);
    // }
    // printf("\n");

    // /**********/
    printf("Stock increments: ");
    for (int i = CRDT_START; i < CRDT_END; i++) {
        printf("%d ", network_ptr0[i]);
    }

    std::cout << "EXIT recorded" << std::endl;
}
