#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

void tx_pkg_sender(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data,
    pkt256 tx_meta,
    pkt512 tx_data
) {
    #pragma inline 
    enum fsmStateType {IDLE_STATE, WRITE_META, WRITE_DATA, WAIT_READY};
    static fsmStateType state = WRITE_META;

    switch(state) {

        case WRITE_META: {
            
            //Don't go to data write state, if laddr is 0 or op is RDMA READ
            if (tx_meta.data.range(74, 27) == 0 || tx_meta.data.range(2,0) == 0)
                state = WAIT_READY; 
            else {
                state = WRITE_DATA;
            }

            m_axis_tx_meta.write(tx_meta);

        }   
        break; 

        case WRITE_DATA: { 
            m_axis_tx_data.write(tx_data);
            state = WAIT_READY;
        }
        break; 

        case WAIT_READY: {
            /* Make sure both streams are not full before returning to write state */
            if (!m_axis_tx_meta.full() && !m_axis_tx_data.full()) {
                state = WRITE_META;
            }

        } 
        break;

        default: {
            state = WRITE_META; 
        }
    } 
    return; 

}

extern "C" {

    void consensus_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data, 
        hls::stream<pkt512>& s_axis_tx_status,
        ap_uint<32> s_axi_op,
        ap_uint<32> s_axi_lqpn,
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        ap_uint<32> s_axi_len
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        //#pragma HLS INTERFACE axis port = s_axis_tx_status

        //#pragma HLS INTERFACE s_axilite port = s_axi_debug
        //#pragma HLS INTERFACE m_axi port = m_axi_status bundle = gmem1

        /*
            Peforms the same operation as the rtl write_role from roce_write_krnl, but increments the data.
        */

        pkt256 tx_meta;
        pkt512 tx_data;
        static ap_uint<512> counter = 1; 

        /*RDMA OP*/
        tx_meta.data.range(2,0) = s_axi_op; 
        /*lQPN*/
        tx_meta.data.range(26,3) = s_axi_lqpn; 
        /*
            lAddr
            if 0 writes from tx_data. 
        */
        tx_meta.data.range(74, 27) = s_axi_laddr; 
        /*rAddr*/
        tx_meta.data.range(122, 75) = s_axi_raddr; 
        /*len*/
        tx_meta.data.range(154, 123) = s_axi_len;

        tx_data.data = counter;
        tx_data.keep = 0x40; 
        //counter++;  

        tx_pkg_sender(
                m_axis_tx_meta,
                m_axis_tx_data,
                tx_meta,
                tx_data
        );

        /*
            Reading from the status stream and writing to the status buffer on the host side
            We can try to use status perform the CRDTs and Consensus
        */
        // if (!s_axis_tx_status.empty()) {
        //     pkt512 temp_status;
        //     s_axis_tx_status >> temp_status; 
        //     *m_axi_status = temp_status.data; 
        // } else {
            
        //     *m_axi_status = counter;
        //     counter++; 
        // }

    }

}