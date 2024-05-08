#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"


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
    int node_num,
    int board_num,
    hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data
    //,hls::stream<ap_uint<256> >& axis_mem_request
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_COUNTER, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<64> local_counter = 0;
    ap_uint<256> tmp_local_counter;


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
                    else{
                        local_counter= local_counter+ ops[op_cnt];
                        state= UPDATE_COUNTER;
                    }
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:
                //if(!axis_mem_request.full()){
                    tmp_local_counter= local_counter;
                    //axis_mem_request.write(tmp_local_counter);
                    state= OPERATION_FETCH;

                    op_cnt++;
                //}
                

            break;

            case UPDATE_COUNTER:
                int j=0; 
                int qpn_tmp=board_num*(node_num-1);
                while (j<node_num){
                    if(j!=board_num){
                        if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                            rdma_write(
                                qpn_tmp,
                                s_axi_laddr,
                                s_axi_raddr+(board_num*4),
                                s_axi_len,
                                local_counter,
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
                state = OPERATION_FETCH; 
                op_cnt++;
                
          
            break; 
        }
    }

}
void bram_mem_maneger(int *network_ptr, int *delay, int exe_time, int node_num, int board_num, int query_num, int itt_nume,
                    //hls::stream<ap_uint<256> >& axis_mem_request, 
                    hls::stream<pkt128>& permission_switch,hls::stream<pkt128>& permission_switch_ack ){
    static int bram_counter=0;
    static int update_period=400;
    static int internal_clock=0;
    static int exe_clock=0;
    static int delay_counter=0;
    static int query_cnt=0;
    static int remote_counter=0;
    static int tmp_HBM=0;
    static bool one_time=true;
    static bool wait_ack=false;

    static int start_clk=0;
    static int end_clk=0;
    static int itt_count=0;

    ap_uint<256> tmp_local_counter;
    pkt128 new_state;
    pkt128 tmp_read;
    


    while(exe_clock<10001){
        exe_clock++;
        if(exe_clock==10000){
            while(itt_count<itt_nume){
                delay_counter++;
                if(wait_ack){
                    if(!permission_switch_ack.empty()){

                        permission_switch_ack.read(tmp_read);
                        delay[itt_count]=delay_counter-start_clk;  
                        wait_ack=false;
                    }
                }
                else{
                    new_state.data(15, 0) = board_num;//qp_num
                    new_state.data(31, 16) = 0;//new_state init
                    new_state.keep(7, 0) = 0xff;
                    new_state.last = 1; 
                    
                
                    permission_switch.write(new_state);
                    wait_ack=true;
                    start_clk=delay_counter;
                    itt_count++;
                }
            }
        }
    }
            //*counter=remote_counter;

}



extern "C" {

    void permission_switch_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data,
        hls::stream<pkt128>& permission_switch,
        hls::stream<pkt128>& permission_switch_ack,
        hls::stream<pkt512>& s_axis_tx_status, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int exe_time,
        int node_num,
        int board_num,
        int op_num,
        int query_num,
        int itt_nume,
        int *ops,
        int *delay,
        int *network_ptr

    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = permission_switch
        #pragma HLS INTERFACE axis port = permission_switch_ack
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
        #pragma HLS INTERFACE m_axi port=delay bundle=gmem1

        #pragma HLS dataflow

        //static hls::stream<ap_uint<256> > axis_mem_request;
            
            crdt_counter(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                node_num,
                board_num,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data
                //,axis_mem_request
                );
            bram_mem_maneger(network_ptr, delay, exe_time, node_num, board_num, query_num, itt_nume,
            //axis_mem_request, 
            permission_switch, permission_switch_ack);


    
    }

}
