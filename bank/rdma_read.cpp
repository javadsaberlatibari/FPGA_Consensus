#include "rdma_read.h"

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    //hls::stream<pkt256>& m_axis_tx_meta
    hls::stream<ap_uint<256>>& m_axis_tx_meta
){
    //#pragma HLS dataflow
    //#pragma HLS inline off
    //#pragma HLS pipeline II=1
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    
    ap_uint<256> tx_meta;

    /*RDMA OP*/
    tx_meta.range(2,0) = 0x00000000; 
    /*lQPN*/
    tx_meta.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    */
    tx_meta.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.range(154, 123) = s_axi_len;
    m_axis_tx_meta.write(tx_meta);
    
}