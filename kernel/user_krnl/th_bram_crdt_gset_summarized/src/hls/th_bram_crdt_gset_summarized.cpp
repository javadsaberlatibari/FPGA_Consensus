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

void crdt_gset(
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
    //static ap_uint<64> gset[5000];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    static ap_uint<64> current_set_el=0;
    static ap_uint<64> write_value=0;
    static int summarizing_depth=2;
    static int summarizing_counter=0;

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
                
                if(!update_set_request.full()){
                    
                    if(summarizing_counter==(summarizing_depth-1)){
                        write_value.range(31,16)=current_set_el.range(15,0);
                        update_set_request.write(write_value);
                        int j=0; 
                        int qpn_tmp=board_num*(node_num-1);
                    
                        while (j<node_num){
                            if(j!=board_num){
                                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                    rdma_write(
                                        qpn_tmp,
                                        s_axi_laddr,
                                        s_axi_raddr+(((board_num*9000)+write_counter)*4),
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
                    summarizing_counter=0;
                }
                else{
                    write_value.range(15,0)= current_set_el.range(15,0);
                    summarizing_counter++;
                }
                op_cnt++;
                state = OPERATION_FETCH; 
                
            }    
          
            break; 
        }
    }

}
void update_local_gset(int write_num, hls::stream<ap_uint<64> >& update_set_request, hls::stream<ap_uint<64> >& local_set_e, hls::stream<ap_uint<64> >& break_signal){

    //static ap_uint<64> tmp_set_size=0;
    //static ap_uint<64> tmp_hbm;
    static int write_cnt=0;
    //static int log_index[8]={0};
    //static int gset [25000]={0};
    static int local_gset [10000]={0};
    static int local_gset_cnt=0;
    static int local_gset_sent_index=0;
    static ap_uint<64> current_set_el=0;
    //bool find=false;

    while (write_cnt<write_num){
        //internal_clock++;
        if(!update_set_request.empty()){
            update_set_request.read(current_set_el);
            local_gset[local_gset_cnt]=current_set_el.range(15,0);
            local_gset_cnt++;
            local_gset[local_gset_cnt]=current_set_el.range(31,16);
            local_gset_cnt++;
            write_cnt=write_cnt+2;
        }
        if(local_gset_sent_index<local_gset_cnt){
            if(!local_set_e.full()){
                
                local_set_e.write(local_gset[local_gset_sent_index]);
                local_gset_sent_index++;
            }
        }

    }
    break_signal.write(1111);

}
void update_gset(int *network_ptr, int node_num, int board_num, int check_value, int execution_time, hls::stream<ap_uint<64> >& local_set_e, hls::stream<ap_uint<64> >& break_signal , hls::stream<ap_uint<64> >& set_size_request){

    static ap_uint<64> tmp_set_size=0;
    static ap_uint<64> tmp_read;
    static int log_index[8]={0};
    static int gset [25000]={0};
    bool find=false;
    bool break_flag=false;

    
    static bool  check_statrt [8]= {false};
    static bool  check_finish [8]= {false};
    static int check_throughput_count=0; 

    while((!break_flag) || (check_throughput_count!=(node_num-1))){

        if(!break_signal.empty()){
            ap_uint<64> tmp;
            break_signal.read(tmp);
            break_flag= true;
        }
        for (int i=0; i<node_num; i++){
            if(i!=board_num){
                tmp_read=network_ptr[(i*9000)+log_index[i]];
                if(tmp_read!=0){
                    if(!check_finish[i]){
                        if((tmp_read.range(15,0)==check_value)||(tmp_read.range(31,16)==check_value)){
                            check_finish[i]= true;
                            check_throughput_count++;
                        }
                    }
                    log_index[i]++;
                    find=false;
                    for(int j=0; j<tmp_set_size; j++){
                        if(tmp_read.range(15,0)== gset[j]){
                            find= true;
                            break;
                        }
                    }
                    if(!find){
                        gset[tmp_set_size]=tmp_read.range(15,0);
                        tmp_set_size++;
                    }

                    find=false;
                    for(int j=0; j<tmp_set_size; j++){
                        if(tmp_read.range(31,16)== gset[j]){
                            find= true;
                            break;
                        }
                    }
                    if(!find){
                        gset[tmp_set_size]=tmp_read.range(31,16);
                        tmp_set_size++;
                    }
                }
            }
            else{
                if(!local_set_e.empty()){
                    local_set_e.read(tmp_read);
                    if(tmp_read!=0){
                        log_index[i]++;
                        find=false;
                        for(int j=0; j<tmp_set_size; j++){
                            if(tmp_read.range(15,0)== gset[j]){
                                find= true;
                                break;
                            }
                        }
                        if(!find){
                            gset[tmp_set_size]=tmp_read.range(15,0);
                            tmp_set_size++;
                        }

                        find=false;
                        for(int j=0; j<tmp_set_size; j++){
                            if(tmp_read.range(31,16)== gset[j]){
                                find= true;
                                break;
                            }
                        }
                        if(!find){
                            gset[tmp_set_size]=tmp_read.range(31,16);
                            tmp_set_size++;
                        }
                    }
                }
            }
        }
        if(!set_size_request.full()){
            set_size_request.write(tmp_set_size);
        }
    }
}
void handle_query(int *setsize, int query_num, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& set_size_request){

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
void bram_mem_maneger_gset(int *network_ptr, int *setsize, int node_num, int board_num, int query_num, int write_num, int check_value, int execution_time, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& update_set_request){

    #pragma HLS dataflow
    static hls::stream<ap_uint<64> > set_size_request, local_set_e, break_signal;

    handle_query(setsize, query_num, axis_mem_request, set_size_request);
    update_local_gset(write_num, update_set_request, local_set_e, break_signal);
    update_gset(network_ptr, node_num, board_num, check_value, execution_time, local_set_e, break_signal , set_size_request);
    
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
        int execution_time, 
        //ap_uint<512> *cyc_th,
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

        //#pragma HLS STREAM depth=8 variable=update_set_request

            crdt_gset(
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
            bram_mem_maneger_gset(network_ptr, crdt, node_num, board_num, query_num, write_num, check_value, execution_time, axis_mem_request, update_set_request);
    }

}
