#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

#define Counter 1 //Counter Gset LwwReg

void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int write_value,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data
){
    //#pragma HLS dataflow
    
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
    //Write data only if laddr is 0 and  op is RDMA WRITE

    tx_data.data(63, 0) = write_value;
    tx_data.keep(7, 0) = 0xff;
    tx_data.last = 1; 

    m_axis_tx_data.write(tx_data);
    
}


void crdt_counter(
    int op_num,
    int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data,
    int *counter,
    int *network_ptr
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_COUNTER, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<64> local_counter = 0;


    while(op_cnt<op_num){

        switch(state) {

            case IDLE_STATE: 
                //m_axis_tx_meta.write(tx_meta);
                if (!s_axis_tx_status.empty()) {
                    s_axis_tx_status.read(tmp_status);
                    state = OPERATION_FETCH; 
            }
          
            break; 

            case OPERATION_FETCH:
                if(op_cnt<op_num){

                    if(ops[op_cnt]==0)
                        state= QUERY;
                    else
                        state= UPDATE_COUNTER;
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:
                *counter = network_ptr[0] + local_counter;

                state= OPERATION_FETCH;

                op_cnt++;

            break;

            case UPDATE_COUNTER: 
                
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){

                    local_counter= local_counter+ ops[op_cnt];
                    rdma_write(
                        s_axi_lqpn,
                        s_axi_laddr,
                        s_axi_raddr,
                        s_axi_len,
                        local_counter,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                        );

                    state = OPERATION_FETCH; 
                    op_cnt++;

                }
                
          
            break; 
        }
    }

}

void crdt_gset(
    int op_num,
    int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data,
    int *set,
    int *set_size,
    int *network_ptr
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_SET, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<64> gset[20];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    while(op_cnt<op_num){

        switch(state) {

            case IDLE_STATE: 
                //m_axis_tx_meta.write(tx_meta);
                if (!s_axis_tx_status.empty()) {
                    s_axis_tx_status.read(tmp_status);
                    state = OPERATION_FETCH; 
            }
          
            break; 

            case OPERATION_FETCH:
                if(op_cnt<op_num){

                    if(ops[op_cnt]==0)
                        state= QUERY;
                    else
                        state= UPDATE_SET;
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:

                while(network_ptr[log_index]!=0){ //Checking log
                    find_flag= false;
                    for(ap_uint<64> i=0; i<set_index; i++){ //Union in Set
                        if(network_ptr[log_index]== gset [i]){
                            find_flag=true;
                            break;
                        }
                    }
                    if(!find_flag)
                    {
                        gset[set_index]=network_ptr[log_index];
                        set_index++;
                    }

                    log_index++;
                }
                if(set_index>0){
                    *set = gset[set_index-1];
                    *set_size = set_index;
                }

                state= OPERATION_FETCH;

                op_cnt++;

            break;

            case UPDATE_SET: 
                if(!update_set){

                    find_flag= false;
                    for(ap_uint<64> i=0; i<set_index; i++){ //Union in Set
                        if(ops[op_cnt]== gset [i]){
                            find_flag=true;
                            break;
                        }
                    }
                    if(!find_flag)
                    {
                        gset[set_index]=ops[op_cnt];
                        set_index++;
                    }



                    update_set = true;
                }
                
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){

                    rdma_write(
                        s_axi_lqpn,
                        s_axi_laddr,
                        s_axi_raddr+(write_counter*4),
                        s_axi_len,
                        ops[op_cnt],
                        m_axis_tx_meta, 
                        m_axis_tx_data
                        );

                    state = OPERATION_FETCH; 
                    update_set = false;
                    op_cnt++;
                    write_counter++;
                }
                
          
            break; 
        }
    }

}

void crdt_lwwreg(
    int op_num,
    int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data,
    int *reg,
    int *network_ptr
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_REG, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<16> local_reg = 0;
    static ap_uint<16> time_stamp= 0;
    static ap_uint<64> write_value= 0;
    static ap_uint<64> remote_value= 0;

    while(op_cnt<op_num){

        switch(state) {

            case IDLE_STATE: 
                //m_axis_tx_meta.write(tx_meta);
                if (!s_axis_tx_status.empty()) {
                    s_axis_tx_status.read(tmp_status);
                    state = OPERATION_FETCH; 
            }
          
            break; 

            case OPERATION_FETCH:
                if(op_cnt<op_num){

                    if(ops[op_cnt]==0)
                        state= QUERY;
                    else
                        state= UPDATE_REG;
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:
                remote_value= network_ptr[0];
                if(remote_value.range(31,16) > time_stamp){
                    *reg = remote_value.range(15,0);
                }
                else
                    *reg = local_reg;

                state= OPERATION_FETCH;

                op_cnt++;

            break;

            case UPDATE_REG: 
                remote_value= network_ptr[0];
                if(remote_value.range(31,16) > time_stamp){
                    time_stamp= remote_value.range(31,16);
                }
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    time_stamp++;
                    local_reg = ops[op_cnt];
                    write_value.range(31,16)= time_stamp;
                    write_value.range(15,0)= local_reg;

                    rdma_write(
                        s_axi_lqpn,
                        s_axi_laddr,
                        s_axi_raddr,
                        s_axi_len,
                        write_value,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                        );

                    state = OPERATION_FETCH; 
                    op_cnt++;

                }
                
          
            break; 
        }
    }

}

extern "C" {

    void consensus_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data, 
        hls::stream<pkt512>& s_axis_tx_status, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int op_num,
        int *ops,
        int *crdt,
        #ifdef Gset
        int *set_size,
        #endif
        int *network_ptr
        //int wait_cyc
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        #pragma HLS dataflow

        #ifdef Counter

            crdt_counter(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                crdt,
                network_ptr
                );
        #endif

        #ifdef Gset

            crdt_gset(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                crdt,
                set_size,
                network_ptr
                );
        #endif
        
        #ifdef LwwReg

            crdt_lwwreg(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                crdt,
                network_ptr
                );
        #endif
    }

}
