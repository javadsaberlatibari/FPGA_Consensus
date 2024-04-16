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

void crdt_twopset(
    int op_num,
    int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int node_num,
    int board_num,
    int failure_point,
    int failed_node,
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
    //static ap_uint<64> twopset[5000];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    static ap_uint<64> current_set_el=0;
    static bool node_failure[8]={false};

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
                    
                    if(op_cnt==failure_point)
                        node_failure[failed_node]=true;

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
                    update_set_request.write(current_set_el);
                    int j=0; 
                    int qpn_tmp=board_num*(node_num-1);
                    
                    while (j<node_num){
                        if(j!=board_num && node_failure[j]!=true){
                            if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                rdma_write(
                                    qpn_tmp,
                                    s_axi_laddr,
                                    s_axi_raddr+(((board_num*9000)+write_counter)*4),
                                    s_axi_len,
                                    current_set_el,
                                    m_axis_tx_meta, 
                                    m_axis_tx_data
                                    );
                                j++;
                                qpn_tmp++;


                            }
                        }
                        else {
                            if(node_failure[j]==true && j!=board_num)
                            qpn_tmp++;
                            j++;
                        }
                    }
                write_counter++;
                state = OPERATION_FETCH; 
                op_cnt++;
            }    
          
            break; 
        }
    }

}
void update_local_twopset(int write_num, hls::stream<ap_uint<64> >& update_set_request, hls::stream<ap_uint<64> >& local_set_e, hls::stream<ap_uint<64> >& break_signal){

    //static ap_uint<64> tmp_set_size=0;
    //static ap_uint<64> tmp_hbm;
    static int write_cnt=0;
    //static int log_index[8]={0};
    //static int twopset [25000]={0};
    static int local_twopset [10000]={0};
    static int local_twopset_cnt=0;
    static int local_twopset_sent_index=0;
    static ap_uint<64> current_set_el=0;
    //bool find=false;

    while (write_cnt<write_num){
        //internal_clock++;
        if(!update_set_request.empty()){
            update_set_request.read(current_set_el);
            local_twopset[local_twopset_cnt]=current_set_el;
            local_twopset_cnt++;
            write_cnt++;
        }
        if(local_twopset_sent_index<local_twopset_cnt){
            if(!local_set_e.full()){
                
                local_set_e.write(local_twopset[local_twopset_sent_index]);
                local_twopset_sent_index++;
            }
        }

    }
    break_signal.write(1111);

}
void update_twopset(int *network_ptr, int node_num, int board_num, hls::stream<ap_uint<64> >& local_set_e, hls::stream<ap_uint<64> >& break_signal , hls::stream<ap_uint<64> >& set_size_request){

    static ap_uint<64> tmp_set_size=0;
    static ap_uint<64> tmp_add_set_size=0;
    static ap_uint<64> tmp_remove_set_size=0;
    static ap_uint<64> tmp_read;
    static int log_index[8]={0};
    static int addgset [25000]={0};
    static int removegset [25000]={0};
    bool find=false;
    bool break_flag=false;

    while(!break_flag){
        if(!break_signal.empty()){
            ap_uint<64> tmp;
            break_signal.read(tmp);
            break_flag= true;
        }
        for (int i=0; i<node_num; i++){
            if(i!=board_num){
                tmp_read=network_ptr[(i*9000)+log_index[i]];
                if(tmp_read!=0){
                    log_index[i]++;
                    find=false;
                    if(tmp_read>0){
                        for(int j=0; j<tmp_add_set_size; j++){
                            if(tmp_read== addgset[j]){
                                find= true;
                                break;
                            }
                        }
                        if(!find){
                            addgset[tmp_add_set_size]=tmp_read;
                            tmp_add_set_size++;
                        }
                        //addgset[]
                    }
                    else{
                        for(int j=0; j<tmp_remove_set_size; j++){
                            if((tmp_read*-1)== removegset[j]){
                                find= true;
                                break;
                            }
                        }
                        if(!find){
                            removegset[tmp_remove_set_size]=(tmp_read*-1);
                            tmp_remove_set_size++;
                        }
                        //removegset[]
                    }
                }
            }
            else{
                if(!local_set_e.empty()){
                    local_set_e.read(tmp_read);
                    if(tmp_read!=0){
                        log_index[i]++;
                        find=false;
                        if(tmp_read>0){
                            for(int j=0; j<tmp_add_set_size; j++){
                                if(tmp_read== addgset[j]){
                                    find= true;
                                    break;
                                }
                            }
                            if(!find){
                                addgset[tmp_add_set_size]=tmp_read;
                                tmp_add_set_size++;
                            }
                        //addgset[]
                        }
                        else{
                            for(int j=0; j<tmp_remove_set_size; j++){
                                if((tmp_read*-1)== removegset[j]){
                                    find= true;
                                    break;
                                }
                            }
                            if(!find){
                                removegset[tmp_remove_set_size]=(tmp_read*-1);
                                tmp_remove_set_size++;
                            }
                        //removegset[]
                        }
                    }
                }
            }
        }
        tmp_set_size=tmp_add_set_size;
        for(int i=0;i<tmp_add_set_size;i++){
            for(int j=0; j<tmp_remove_set_size; j++){
                if(addgset[i]==removegset[j])
                    tmp_set_size--;
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
void bram_mem_maneger_twopset(int *network_ptr, int *setsize, int node_num, int board_num, int query_num, int write_num, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& update_set_request){

    #pragma HLS dataflow
    static hls::stream<ap_uint<64> > set_size_request, local_set_e, break_signal;

    handle_query(setsize, query_num, axis_mem_request, set_size_request);
    update_local_twopset(write_num, update_set_request, local_set_e, break_signal);
    update_twopset(network_ptr, node_num, board_num, local_set_e, break_signal , set_size_request);
    
}


extern "C" {

    void failure_bram_crdt_twopset(
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
        int failure_point, //operation that failure occurs
        int failed_node,
        int write_num,
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

            crdt_twopset(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                node_num,
                board_num,
                failure_point,
                failed_node,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                axis_mem_request,
                update_set_request
                );
            bram_mem_maneger_twopset(network_ptr, crdt, node_num, board_num, query_num, write_num, axis_mem_request, update_set_request);
    }

}
