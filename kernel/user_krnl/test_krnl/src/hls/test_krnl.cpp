#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

const int NUM_NODES = 2; 

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt256>& m_axis_tx_meta
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    pkt256 tx_meta;

    /*RDMA OP*/
    tx_meta.data.range(2,0) = 0x00000000; 
    /*lQPN*/
    tx_meta.data.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    */
    tx_meta.data.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.data.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.data.range(154, 123) = s_axi_len;
    m_axis_tx_meta.write(tx_meta);
    
}

void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    ap_uint<64>  write_value,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    
    pkt256 tx_meta;
    pkt64 tx_data;

    /*RDMA OP*/
    tx_meta.data.range(2,0) = 0x00000001; 
    /*lQPN*/
    tx_meta.data.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    if 0 writes from tx_data. 
    */
    tx_meta.data.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.data.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.data.range(154, 123) = s_axi_len;
    
    if (!m_axis_tx_meta.full()) 
        m_axis_tx_meta.write(tx_meta);

    //Write data only if laddr is 0
    if (s_axi_laddr == 0) {
        tx_data.data(63, 0) = write_value;
        tx_data.keep(7, 0) = 0xff;
        tx_data.last = 1; 
        if (!m_axis_tx_data.full())
            m_axis_tx_data.write(tx_data);
    }

    
}

extern "C" {
    void application_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt64>& m_axis_tx_data,
        hls::stream<pkt64>& s_axis_tx_status,
        //hls::stream<pkt256>& m_axis_qp_conn_interface, 
        int myBoardNum
        int *m_axi_reply,
        int *ops, 
        int *mem_lloc, 
        int *mem_rloc, 
        int *mem_len, 
        int *mem_val, 
        int ops_num,
        int *network_ptr
    ) {

        //#pragma HLS INTERFACE ap_ctrl_chain port=return 
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        static int counter = 0; 


        while (counter < ops_num) {

            if (ops[counter]==1) {
                int j=0; 
                int qpn_tmp=myBoardNum*(NUM_NODES-1);
                while (j<NUM_NODES){
                    if(j!=myBoardNum){
                        if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                            rdma_write(
                                qpn_tmp,
                                0,
                                mem_rloc[counter],
                                mem_len[counter],
                                mem_val[counter],
                                m_axis_tx_meta, 
                                m_axis_tx_data
                                );
                            j++;
                            qpn_tmp++;
                        }
                    }
                    else {
                        j++;
                    }
                }
            } else if (ops[counter]==0) {
                int j=0; 
                int qpn_tmp=myBoardNum*(NUM_NODES-1);
                while (j<NUM_NODES){
                    if(j!=myBoardNum) {
                        if(!m_axis_tx_meta.full()){
                            rdma_read(
                                qpn_tmp,
                                mem_lloc[counter],
                                mem_rloc[counter],
                                mem_len[counter],
                                m_axis_tx_meta 
                                );
                            j++;
                            qpn_tmp++;

                        }
                    }
                    else {
                        j++;
                    }
                }
            }
        }
    }
}




