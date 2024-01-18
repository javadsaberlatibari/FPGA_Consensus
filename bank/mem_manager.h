#ifndef MEM_MANAGER_HEADER
#define MEM_MANAGER_HEADER

#include "util.h"

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
                    );

#endif