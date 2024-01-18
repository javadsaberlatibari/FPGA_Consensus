#ifndef BANK_HEADER
#define BANK_HEADER

#include "util.h"
#include "smr.h"
#include "broadcast.h"

void bank(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    int myBoardNum,
    int* ops, 
    int* amount, 
    int num_ops, 
    int* m_axi_reply,
    int num_nodes,
    int debug_exe
);

#endif