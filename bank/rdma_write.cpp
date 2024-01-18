#include "rdma_write.h"

void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    ap_uint<64>  write_value,
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
){
    //#pragma HLS dataflow
    //#pragma HLS inline off
    //#pragma HLS pipeline II=1
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    
    ap_uint<256> tx_meta;
    ap_uint<64> tx_data;

    /*RDMA OP*/
    tx_meta.range(2,0) = 0x00000001; 
    /*lQPN*/
    tx_meta.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    if 0 writes from tx_data. 
    */
    tx_meta.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.range(154, 123) = s_axi_len;
    
    if (!m_axis_tx_meta.full()) 
        m_axis_tx_meta.write(tx_meta);

    //Write data only if laddr is 0
    if (s_axi_laddr == 0) {
        tx_data.range(63, 0) = write_value;
        //tx_data.keep(7, 0) = 0xff;
        //tx_data.last = 1; 
        if (!m_axis_tx_data.full())
            m_axis_tx_data.write(tx_data);
    }

    
}