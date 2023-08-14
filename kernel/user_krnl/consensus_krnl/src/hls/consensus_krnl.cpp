#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"
#define WAIT_TIMER 256
#define ITT_NUM 20

void tx_pkg_sender(
    int s_axi_op,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt64>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
) {
    //#pragma inline 
    enum fsmStateType {IDLE_STATE, WRITE_META, WAIT_READY, DONE};
    static fsmStateType state = IDLE_STATE;
    static ap_uint<64> wait = 0; 
    static ap_uint<64> itt = 0; 
    pkt256 tx_meta;
    pkt64 tx_data;
    pkt64 tmp_status;
    static ap_uint<64> counter = 111; 

    while(ITT_NUM>itt){

    switch(state) {

        case IDLE_STATE: 
            m_axis_tx_meta.write(tx_meta);
            if (!s_axis_tx_status.empty()) {
                s_axis_tx_status.read(tmp_status);
                state = WRITE_META; 
            }
          
        break; 

        case WRITE_META: 

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
            m_axis_tx_meta.write(tx_meta);
            //Write data only if laddr is 0 and  op is RDMA WRITE

            tx_data.data = counter;
            tx_data.last = 1; 
            tx_data.keep = 0xFF; 
            counter++;  
            m_axis_tx_data.write(tx_data);

            state = WAIT_READY; 
          
        break; 

        case WAIT_READY: 
            /* Make sure both streams are not full before returning to write state */
            wait++;
            if (wait==WAIT_TIMER) {
                wait=0;
                itt++;
                if(itt>ITT_NUM)
                    state = DONE;
                else
                    state = WRITE_META;
            }

         
        break;
    } 
    }

}

extern "C" {

    void consensus_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt64>& m_axis_tx_data, 
        hls::stream<pkt64>& s_axis_tx_status, 
        int s_axi_op,
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        bool writer,
        int *m_axi_reply,
        int *network_ptr
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        #pragma HLS dataflow

        if (writer) {
            tx_pkg_sender(
                    s_axi_op,
                    s_axi_lqpn,
                    s_axi_laddr,
                    s_axi_raddr,
                    s_axi_len,
                    s_axis_tx_status,
                    m_axis_tx_meta,
                    m_axis_tx_data
            );
        }

        if (!writer) {
            *m_axi_reply = network_ptr[0];
        }

    }

}
