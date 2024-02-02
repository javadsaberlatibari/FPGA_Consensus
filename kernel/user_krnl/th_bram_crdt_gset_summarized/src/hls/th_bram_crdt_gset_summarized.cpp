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

void crdt_gset_summarized(
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
    hls::stream<ap_uint<256> >& axis_mem_request,
    hls::stream<ap_uint<64> >& update_set_request
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_SET, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<64> gset[5000];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    static ap_uint<64> current_set_el=0;
    static ap_uint<64> write_value=0;
    static int summarizition_depth=3;
    static int summarizition_counter=0;
    int uprange, downrange;

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
                        state= UPDATE_SET;
                        current_set_el=ops[op_cnt];
                    }
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:

                if(!axis_mem_request.full()){
                    axis_mem_request.write(ops[op_cnt]);
                    state= OPERATION_FETCH;

                    op_cnt++;
                }

            break;

            case UPDATE_SET: 
                if(summarizition_counter==summarizition_depth){
                    if(!update_set_request.full()){
                        update_set_request.write(current_set_el);
                        int j=0; 
                        int qpn_tmp=board_num*(node_num-1);
                        while (j<node_num){
                            if(j!=board_num){
                                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                    rdma_write(
                                        qpn_tmp,
                                        s_axi_laddr,
                                        s_axi_raddr+(((board_num*3000)+write_counter)*4),
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
                    write_counter++;
                    state = OPERATION_FETCH; 
                    op_cnt++;
                    summarizition_counter=0;
                } 
            } 
            else{
                if(!update_set_request.full()){
                    update_set_request.write(current_set_el);
                    
                    downrange=summarizition_counter*20;
                    uprange=downrange+19;
                    write_value.range(uprange,downrange)=current_set_el;
                    state = OPERATION_FETCH; 
                    op_cnt++;
                    summarizition_counter++;
                }
            } 
          
            break; 
        }
    }

}
void update_gset_summarized(int *network_ptr, int node_num, int board_num, int query_num, int write_num, int check_value, hls::stream<ap_uint<64> >& update_set_request, hls::stream<ap_uint<64> >& set_size_request){

    static ap_uint<64> tmp_set_size=0;
    static ap_uint<64> tmp_hbm;
    static int write_cnt=0;
    static int log_index[8]={0};
    static int gset [25000]={0};
    static ap_uint<64> current_set_el=0;
    bool find=false;
    static int update_period=1000;
    static ap_uint<512> internal_clock=0;
    int uprange, downrange;
    static int check_throughput_count=0;
    static bool  check_finish [8]= {false};

    while ((write_cnt<write_num)||(check_throughput_count!=(node_num-1))){
        internal_clock++;
        if(!update_set_request.empty()){
            update_set_request.read(current_set_el);
            find=false;
            for(int i=0; i<tmp_set_size; i++){
                if(current_set_el== gset[i]){
                    find= true;
                    break;
                }
            }
            if(!find){
                gset[tmp_set_size]=current_set_el;
                tmp_set_size++;
            }
            write_cnt++;
        }
        if(internal_clock==update_period){
            internal_clock=0;
                    for (int i=0; i<node_num; i++){
                        if(i!=board_num){
                            tmp_hbm=network_ptr[(i*3000)+log_index[i]];
                            if(tmp_hbm!=0){
                                log_index[i]++;
                                for (int k=0; k<3; k++){
                                    downrange=k*20;
                                    uprange=downrange+19;
                                    tmp_hbm=tmp_hbm.range(uprange,downrange);
                                    if(tmp_hbm==check_value){
                                        if(!check_finish[i]){
                                            check_finish[i]=true;
                                            check_throughput_count++;
                                        }
                                    }
                                    find=false;
                                    for(int j=0; j<tmp_set_size; j++){
                                        if(tmp_hbm== gset[j]){
                                            find= true;
                                            break;
                                        }
                                    }
                                    if(!find){
                                        gset[tmp_set_size]=tmp_hbm;
                                        tmp_set_size++;
                                    }
                                }
                            }
                        }
                            //remote_counter = network_ptr[i] + remote_counter;
                    }
        }

        if(!set_size_request.full()){
            set_size_request.write(tmp_set_size);
        }

    }

}
void handle_query_summarized(int *setsize, int query_num, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& set_size_request){

    static int query_cnt=0;

    static ap_uint<64> tmp_set_size=0;
    static ap_uint<256> tmp_read=0;
    
    //#pragma HLS dataflow
    while (query_cnt<query_num){
        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_read);
            query_cnt++;
            *setsize=tmp_set_size;
        }

        if(!set_size_request.empty()){
            set_size_request.read(tmp_set_size);
        }
    }


}
void bram_mem_maneger_gset_summarized(int *network_ptr, int *setsize, int node_num, int board_num, int query_num, int write_num, int check_value, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& update_set_request){

    #pragma HLS dataflow
    static hls::stream<ap_uint<64> > set_size_request;

    handle_query_summarized(setsize, query_num, axis_mem_request, set_size_request);
    update_gset_summarized(network_ptr, node_num, board_num, query_num, write_num, check_value, update_set_request, set_size_request);
    
}

extern "C" {

    void th_bram_crdt_gset_summarized(
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
        int write_num,
        int check_value,
        int *ops,
        int *crdt,
        int *network_ptr
        //int wait_cyc
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
        #pragma HLS INTERFACE m_axi port=crdt bundle=gmem1

        #pragma HLS dataflow

        static hls::stream<ap_uint<256> > axis_mem_request;

            
            static hls::stream<ap_uint<64> > update_set_request;

            crdt_gset_summarized(
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
                update_set_request
                );
            bram_mem_maneger_gset_summarized(network_ptr, crdt, node_num, board_num, query_num, write_num, check_value, axis_mem_request, update_set_request);

       
    }

}
