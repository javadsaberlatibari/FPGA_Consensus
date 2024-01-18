#ifndef SMR_HEADER
#define SMR_HEADER

#include "util.h"
#include "rdma_write.h"
#include "rdma_read.h"

void smr(
    hls::stream<bool>& smr_finished, 
    hls::stream<ProposedValue>& proposedValue,
    hls::stream<int>& permissible_req, 
    hls::stream<int>& permissible_rsp, 
    hls::stream<int>& query_req, 
    hls::stream<int>& query_rsp, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,

    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,

    int myBoardNum, 
    int num_nodes,
    //int *network_ptr 
    int* reply
); 

#endif