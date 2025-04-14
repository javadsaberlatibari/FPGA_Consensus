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
    //#pragma HLS inline off
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
    hls::stream<pkt512>& m_axis_tx_data
){
    //#pragma HLS dataflow
    //#pragma HLS inline off
    #pragma HLS pipeline II=1
    
    pkt256 tx_meta;
    pkt512 tx_data;

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
    
    m_axis_tx_meta.write(tx_meta);

    //Write data only if laddr is 0
    if (s_axi_laddr == 0) {
        tx_data.data(63, 0) = write_value;
        tx_data.keep(7, 0) = 0xff;
        tx_data.last = 1; 
        m_axis_tx_data.write(tx_data);
    }

    
}

extern "C" {
    void test_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data,
        hls::stream<pkt512>& s_axis_tx_status,
        //hls::stream<pkt512>& s_axis_update,
        int myBoardNum,
        int RDMA_TYPE, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int exec, 
        ap_uint<64> counter, 
        int index, 
        volatile int *network_ptr
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        //ap_uint<64> counter = 1; 
        pkt512 status; 
        pkt512 update; 
        if (!s_axis_tx_status.empty()) {
            s_axis_tx_status.read(status);
        }

        bool writeBit = false; 

        //#pragma HLS DATAFLOW

        if (myBoardNum == 0) {
            if (RDMA_TYPE == 0) {
                RDMA_READ_LOOP : while (counter <= exec) {
                    #pragma HLS PIPELINE off 
                    if (writeBit) {
                        rdma_read(
                            s_axi_lqpn,
                            s_axi_laddr,
                            s_axi_raddr,
                            s_axi_len,
                            m_axis_tx_meta
                        );
                        counter++; 
                        writeBit = false; 
                    } else {
                        writeBit = true; 
                    }
                }
            } else if (RDMA_TYPE == 1) {
                int timer = 0; 
                RDMA_WRITE_LOOP : while (counter <= exec) {
                    #pragma HLS PIPELINE off 
                    if (writeBit) {
                        rdma_write(
                            s_axi_lqpn,
                            s_axi_laddr,
                            s_axi_raddr + (4 * counter),
                            s_axi_len,
                            counter,
                            m_axis_tx_meta, 
                            m_axis_tx_data
                        );
                        counter++; 
                        writeBit = false; 
                    } else if (timer % 1000 == 0){
                        timer = 0;
                        writeBit = true; 
                    }
                    timer++; 
                }
            } 
        } else {
            int temp = 0;
            int timer = 0;  

            READ_HBM_LOOP : while (temp != 0) {
                #pragma HLS PIPELINE off 
                 temp = network_ptr[index];
            }
            

        }

    }
}






