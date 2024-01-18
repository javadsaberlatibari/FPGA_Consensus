#ifndef BROADCAST_HEADER
#define BROADCAST_HEADER

#include "util.h"
#include "rdma_write.h"

void crdt_counter(
    hls::stream<bool>& ncc_finished, 
    hls::stream<int>& broadcast_req, 
    hls::stream<int>& ncc_permissible_req,
    hls::stream<int>& ncc_permissible_rsp, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    int myBoardNum, 
    int num_nodes
);

#endif