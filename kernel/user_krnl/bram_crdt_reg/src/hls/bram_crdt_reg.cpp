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

void crdt_lwwreg(
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
    hls::stream<pkt512>& m_axis_tx_data,
    hls::stream<ap_uint<32> >& axis_mem_request,
    hls::stream<ap_uint<16> >& now_tmie_stamp
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
    static ap_uint<32> tmp_local_reg= 0;
    static ap_uint<16> tmp_time_stamp= 0;

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
                    else {
                        local_reg= ops[op_cnt];
                        state= UPDATE_REG;
                        if(!now_tmie_stamp.empty()){
                            now_tmie_stamp.read(tmp_time_stamp);
                            if(tmp_time_stamp>time_stamp)
                                time_stamp=tmp_time_stamp;
                        }

                    }
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:

                if(!axis_mem_request.full()){
                    tmp_local_reg.range(15,0)=local_reg;
                    tmp_local_reg.range(31,16)=time_stamp;
                    axis_mem_request.write(tmp_local_reg);
                    state= OPERATION_FETCH;

                    op_cnt++;
                }

            break;

            case UPDATE_REG: 
                int j=0; 
                int qpn_tmp=board_num*(node_num-1);
                time_stamp++;
                write_value.range(15,0)=local_reg;
                write_value.range(31,16)=time_stamp;
                while (j<node_num){
                    if(j!=board_num){
                        if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                            rdma_write(
                                qpn_tmp,
                                s_axi_laddr,
                                s_axi_raddr+(board_num*4),
                                s_axi_len,
                                write_value,
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
void bram_mem_maneger_lww(int *network_ptr, int *reg, int node_num, int board_num, int query_num, hls::stream<ap_uint<32> >& axis_mem_request, hls::stream<ap_uint<16> >& now_tmie_stamp){
    static ap_uint<32> bram_reg=0;
    static int update_period=1000;
    static int internal_clock=0;
    
    static int query_cnt=0;

    ap_uint<32> tmp_local_reg;
    static ap_uint<16> local_reg=0;
    static ap_uint<16> local_timestamp=0;

    ap_uint<32> tmp_reg;
    
    while (query_cnt<query_num){
        internal_clock++;
        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_local_reg);
            query_cnt++;
            *reg=bram_reg;
            local_reg=tmp_local_reg.range(15,0);
            local_timestamp=tmp_local_reg.range(31,16);
        }
        if(internal_clock==update_period){
            internal_clock=0;
                    for (int i=0; i<node_num; i++){
                        if(i!=board_num){
                            tmp_reg=network_ptr[i];
                            if(tmp_reg.range(31,16)>local_timestamp){
                                local_timestamp=tmp_reg.range(31,16);
                                local_reg=tmp_reg.range(15,0);
                            }
                            
                            
                        }
                    }
                    if(!now_tmie_stamp.full())
                        now_tmie_stamp.write(local_timestamp);
                    bram_reg.range(15,0) = local_reg;
                    bram_reg.range(31,16) = local_timestamp;
        }
    }
}

extern "C" {

    void bram_crdt_reg(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data, 
        hls::stream<pkt512>& s_axis_tx_status, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int node_num,
        int board_num,
        int op_num,
        int query_num,
        int *ops,
        int *crdt,
        int *network_ptr
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
        #pragma HLS INTERFACE m_axi port=crdt bundle=gmem1

        #pragma HLS dataflow
        static hls::stream<ap_uint<32> > axis_mem_request;
        static hls::stream<ap_uint<16> > now_tmie_stamp;
            crdt_lwwreg(
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
                m_axis_tx_data,
                axis_mem_request,
                now_tmie_stamp
                );
            bram_mem_maneger_lww(network_ptr, crdt, node_num, board_num, query_num, axis_mem_request,now_tmie_stamp);
     
    }

}
