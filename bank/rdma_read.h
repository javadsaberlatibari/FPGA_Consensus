#ifndef RDMA_READ_HEADER
#define RDMA_READ_HEADER

#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    //hls::stream<pkt256>& m_axis_tx_meta
    hls::stream<ap_uint<256>>& m_axis_tx_meta
);

#endif