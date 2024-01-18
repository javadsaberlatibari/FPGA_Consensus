#include "mem_manager.h"

void mem_manager(  int *network_ptr, 
                        int *reply, 
                        int node_num, 
                        int board_num, 
                        int query_num, 
                        int exe, 
                        hls::stream<ap_uint<32>>& axis_mem_request,
                        hls::stream<ap_uint<32>>& minPropReadBram_req,
                        hls::stream<ap_uint<32>>& minPropReadBram_rsp,
                        hls::stream<ap_uint<32>>& readSlotsReadBram_req,
                        hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
                        hls::stream<ap_uint<32>>& logReadBram_req,
                        hls::stream<ap_uint<64>>& logReadBram_rsp
                    ){


    #pragma HLS INTERFACE axis port = axis_mem_request
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_req
    #pragma HLS INTERFACE axis port = logReadBram_rsp


    static int bram_counter=0;
    static int update_period=1000;
    static int finish_check_period=1000;
    static ap_uint<512> internal_clock=0;
    static int local_counter=0;
    static int query_cnt=0;
    static int exe_cnt = 0; 
    static int leader = 0; 
    static int check_throughput_count=0;
    static int i=0;
    //static int temp=0;
    static int remote_counter=0;
    static int hbm_tmp=0;

    static ap_uint<32> minPropIndex; 
    static ap_uint<32> slotIndex; 

    ap_uint<32> tmp_local_counter;

    // static int bram_minPropFifos[64];
    // //#pragma HLS array_partition variable=bram_minPropFifos complete dim=1
    // static int bram_slotFifos[128];
    // //#pragma HLS array_partition variable=bram_slotFifos complete dim=1
    // static int bram_Log[25000];
    //#pragma HLS array_partition variable=bram_Log complete dim=1

    while (query_cnt<query_num && exe_cnt < exe){
    #pragma HLS loop_flatten off

        reply[0] = internal_clock; 
        reply[1] = query_cnt;
        exe_cnt++; 

        internal_clock++;
        if(!axis_mem_request.empty()){

            axis_mem_request.read(tmp_local_counter);
            query_cnt++;
            reply[29]=bram_counter;
            reply[2] = 111;
            local_counter=tmp_local_counter;

        } else if (!minPropReadBram_req.empty()) {

            minPropReadBram_req.read(minPropIndex);
            int minProp = 0; 
            for (int i = 0; i < node_num-1; i++) {
                //int temp = bram_minPropFifos[2 + FIFO_LENGTH * i + (minPropIndex%FIFO_LENGTH)];
                int temp = network_ptr[LOG_BASE_PTR + 2 + FIFO_LENGTH * i + (minPropIndex%FIFO_LENGTH)];
                if (temp > minProp) {
                    minProp = temp; 
                } 
            }
            reply[3] = 222;
            minPropReadBram_rsp.write(minProp);

        } else if (!readSlotsReadBram_req.empty()) {

            readSlotsReadBram_req.read(slotIndex);
            ap_uint<64> maxPropNumber = 0; 
            for (int i = 0; i < node_num-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    //int propNum = bram_slotFifos[(2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS)];
                    int propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS)];
                    //int propValue = bram_slotFifos[(2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS) + 1];
                    int propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS) + 1];

                    if (propNum != 0) {
                        //temp_log = LogEntry(propNum, propValue, true);
                        maxPropNumber.range(31, 0) = propNum; 
                        maxPropNumber.range(64, 32) = propValue; 
                    }
                }
            }
            reply[4] = 333;
            readSlotsReadBram_rsp.write(maxPropNumber);

        } else if (!logReadBram_req.empty()) {

            logReadBram_req.read(slotIndex);
            ap_uint<64> slot = 0;
            //int propNum = bram_Log[slotIndex%NUM_SLOTS];
            int propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotIndex%NUM_SLOTS];
            //int propValue = bram_Log[slotIndex%NUM_SLOTS + 1];
            int propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotIndex%NUM_SLOTS + 1];
            slot.range(63, 32) = propValue; 
            slot.range(31, 0) = propNum;
            reply[5] = 444;
            logReadBram_rsp.write(slot);

        }
        
        if(internal_clock==update_period){
            internal_clock=0;
            remote_counter=0;

            reply[6] = 555;

            for (int i=0; i<node_num; i++){
                if(i!=board_num){
                    hbm_tmp=network_ptr[BROADCAST_BASE_PTR + i];
                    remote_counter = hbm_tmp + remote_counter;
                }
            }

            bram_counter = remote_counter + local_counter;
        }


        // if (internal_clock % 5 == 0) {
        //     if (leader == board_num) {
        //         for (int i = 0; i < 64; i++) {
        //             //#pragma HLS UNROLL factor=32
        //             bram_minPropFifos[i] = network_ptr[LOG_BASE_PTR + i];
        //         }
        //         for (int i = 0; i < 128; i++) {
        //             //#pragma HLS UNROLL factor=32
        //             bram_slotFifos[i] = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + i];
        //         }
        //     }  else  {
        //         for (int i = 0; i < 25000; i++) {
        //             //#pragma HLS UNROLL factor = 32
        //             bram_Log[i] =  network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + i];
        //         }
        //     }
        // }

    }
}