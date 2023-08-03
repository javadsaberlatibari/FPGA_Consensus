#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

static void write_role(
    hls::stream<pkt512>& s_axis_role_tx_data,
    hls::stream<pkt512>& network_kernel_status,
    hls::stream<pkt512>& user_kernel_status
) {

    enum fsmStateType {IDLE_STATE, WRITE_DATA, WAIT_NETWORK};
    static fsmStateType state = WRITE_DATA;

    static pkt256 temp_meta;
    static pkt512 temp_data;
    static pkt512 temp_network;
    static ap_uint<512> data = 0; 
    static pkt512 user_status; 
    static pkt512 network_status; 
    static uint32_t meta_cnt = 0; 
    static ap_uint<48> offset = 0; 

    switch(state) {
        case WRITE_DATA: {

                //temp_data.valid=1;
                temp_data.data=66666; 
                temp_data.last=true; 
                s_axis_role_tx_data.write(temp_data);

                user_status.data=1; 
                user_status.last=true; 
                user_kernel_status.write(user_status);

                state = WAIT_NETWORK;
            }   
            break; 
        
        case WAIT_NETWORK: {
            if (!network_kernel_status.empty()) {
                network_kernel_status.read(temp_network);
            state = WRITE_DATA; 
            }

        } 

        case IDLE_STATE: {
            state = WRITE_DATA; 
        }

        default: {
            state = WRITE_DATA; 
        }
    } 


}

extern "C" {

    void crdt_user_krnl(
        hls::stream<pkt512>& s_axis_role_tx_data,
        hls::stream<pkt512>& network_kernel_status,
        hls::stream<pkt512>& user_kernel_status
    ) {

        #pragma HLS INTERFACE axis port = s_axis_role_tx_data
        #pragma HLS INTERFACE axis port = network_kernel_status
        #pragma HLS INTERFACE axis port = user_kernel_status
        
        static int counter = 0; 
        /*
            Peforms the same operation as the rtl write_role from roce_write_krnl, but increments the data.
        */
        write_role(
                s_axis_role_tx_data,
                network_kernel_status,
                user_kernel_status
        );



    }

}