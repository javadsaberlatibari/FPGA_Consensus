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
    hls::stream<pkt64>& m_axis_tx_data
){
    #pragma HLS INLINE
    pkt256 tx_meta;
    pkt64 tx_data;

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

const int BUFFER_SIZE = 16;
void load_buffer(
    int op_num,
    int *ops,
    hls::stream<ap_int<64> >& axis_last_op_response
) {
    #pragma HLS PIPELINE II=1
    //#pragma HLS ARRAY_PARTITION variable=operation_buffer complete dim=1
    static bool loaded = false; 
    static int available_ops_index = 0;
    static int read_bram_index=0;
    static int operation_buffer[BUFFER_SIZE];
    static int op_cnt_write=0;
    static int op_cnt_read=0;
    static bool bram_full= false;
    static bool response= false;
    static int k=0;
    static int debug=0;
    int tmp_read;

    while(op_cnt_read<op_num){
        if(op_cnt_write<op_num && !bram_full){
            for (int i = 0; i < 8; i++) {
                #pragma HLS UNROLL
                operation_buffer[k+i]=ops[op_cnt_write];
                op_cnt_write++;
                available_ops_index++;
            }
            k = (k == 0) ? 8 : 0;
        }
        if(available_ops_index>0){
            response=true;
        } else {
            response=false;
        }

        if (response){
            if(!axis_last_op_response.full()){
                axis_last_op_response.write(operation_buffer[read_bram_index]);
                available_ops_index--;
                op_cnt_read++;
                read_bram_index++;
            }
            if (read_bram_index==BUFFER_SIZE)
                read_bram_index=0;
        }
        if(available_ops_index<=8)
            bram_full=false;
        else 
            bram_full=true;
    }
}

void crdt_twopset(
    int op_num,
    //int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int node_num,
    int board_num,
    //hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_int<64> >& axis_last_op_response,
    hls::stream<ap_int<64> >& axis_mem_request,
    hls::stream<ap_int<64> >& update_set_request
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    #pragma HLS PIPELINE II=1
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_SET, DONE};
    static fsmStateType state = OPERATION_FETCH;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    //static ap_int<64> gset[5000];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    static ap_uint<64> current_set_el=0;
    //static ap_uint<64> write_counter=0;
    static int j, qpn_tmp;
    static ap_int<64> last_operation;

    while(op_cnt<op_num){
        switch(state) {
            /*case IDLE_STATE: 
                s_axis_tx_status.read(tmp_status);
                state = OPERATION_FETCH; 
                break;*/ 
            case OPERATION_FETCH:
                if (!axis_last_op_response.empty()){
                    axis_last_op_response.read(last_operation);
                    if(last_operation == 0) {
                        //tmp_local_counter = local_counter;
                        axis_mem_request.write(last_operation);
                        op_cnt++;
                    } else {
                        update_set_request.write(last_operation);
                        j = 0; 
                        qpn_tmp = board_num * (node_num - 1);
                        while (j < node_num) {
                            if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                if(j != board_num) {
                                    rdma_write(
                                    qpn_tmp,
                                    0,
                                    s_axi_raddr+(((board_num*400000)+write_counter)*8),
                                    0x8,
                                    last_operation,
                                    m_axis_tx_meta, 
                                    m_axis_tx_data
                                    );
                                    j++;
                                    qpn_tmp++;
                                } else {
                                    j++;
                                }
                            }
                        }
                    op_cnt++;
                    write_counter++;
                }
            }
            break;
        }
    }

}
void update_local_twopset(int write_num, hls::stream<ap_int<64> >& update_set_request, hls::stream<ap_int<64> >& local_set_e_addset, hls::stream<ap_int<64> >& local_set_e_removeset, hls::stream<ap_int<64> >& break_signal_twopset, hls::stream<ap_int<64> >& break_signal_addset, hls::stream<ap_int<64> >& break_signal_removeset){

    #pragma HLS PIPELINE II=1
    //static ap_uint<64> tmp_set_size=0;
    //static ap_uint<64> tmp_hbm;
    static int write_cnt=0;
    //static int log_index[8]={0};
    //static int twopset [25000]={0};
    static int local_twopset [350000]={0};
    static int local_twopset_cnt=0;
    static int local_twopset_sent_index=0;
    static ap_int<64> current_set_el=0;
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
            if((!local_set_e_addset.full())&& (!local_set_e_removeset.full())){
                
                if(local_twopset[local_twopset_sent_index]>0){
                    local_set_e_addset.write(local_twopset[local_twopset_sent_index]);
                    local_twopset_sent_index++;
                }
                else{
                    local_set_e_removeset.write(local_twopset[local_twopset_sent_index]);
                    local_twopset_sent_index++;
                }
            }
        }

    }
    break_signal_twopset.write(1111);
    break_signal_addset.write(1111);
    break_signal_removeset.write(1111);

}
void update_twopset(int *network_ptr, int node_num, int board_num, hls::stream<ap_int<64> >& break_signal, hls::stream<ap_int<64> >& remote_set_e_addset, hls::stream<ap_int<64> >& remote_set_e_removeset){

    #pragma HLS PIPELINE II=1
    static ap_int<64> tmp_set_size=0;
    static ap_uint<64> tmp_add_set_size=0;
    static ap_uint<64> tmp_remove_set_size=0;
    static ap_int<64> tmp_read;
    static int log_index[8]={0};
    //static int addgset [100000]={0};
    //static int removegset [100000]={0};
    bool find=false;
    bool break_flag=false;
    static int i=0;

    while(!break_flag){
        if(!break_signal.empty()){
            ap_int<64> tmp;
            break_signal.read(tmp);
            break_flag= true;
            break; // Exit the loop immediately
        }
        //for (int i=0; i<node_num; i++){
            //#pragma HLS UNROLL factor=4
        if(i!=board_num){
            tmp_read=network_ptr[((i*400000)+log_index[i])*2];
            if(tmp_read!=0){
                log_index[i]++;
                find=false;
                if(tmp_read>0){
                    remote_set_e_addset.write(tmp_read);
                }
                else{
                    remote_set_e_removeset.write(tmp_read);
                }
            }
        }
        //}
        i++;
        if(i==node_num)
            i=0;
        /*tmp_set_size=tmp_add_set_size;
        for(int i=0;i<tmp_add_set_size;i++){
            //#pragma HLS UNROLL
            for(int j=0; j<tmp_remove_set_size; j++){
                //#pragma HLS UNROLL
                if(addgset[i]==removegset[j])
                    tmp_set_size--;
            }
        }*/
    }
}
void handle_query(int query_num, hls::stream<ap_int<64> >& axis_mem_request, hls::stream<ap_int<64> >& set_size_request_addset, hls::stream<ap_int<64> >& set_size_request_removeset){

    #pragma HLS PIPELINE II=1
    static int query_cnt=0;

    static ap_int<64> tmp_set_size_add=0;
    static ap_int<64> tmp_set_size_remove=0;
    static ap_int<64> tmp_read=0;
    
    //#pragma HLS dataflow
    while (query_cnt<query_num){
        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_read);
            query_cnt++;
            //*setsize=tmp_set_size;
        }

        if(!set_size_request_addset.empty()){
            set_size_request_addset.read(tmp_set_size_add);
        }
        if(!set_size_request_removeset.empty()){
            set_size_request_removeset.read(tmp_set_size_remove);
        }
    }


}
void update_addset(hls::stream<ap_int<64> >& remote_set_e_addset, hls::stream<ap_int<64> >& local_set_e_addset, hls::stream<ap_int<64> >& break_signal_addset , hls::stream<ap_int<64> >& set_size_request_addset){
    #pragma HLS PIPELINE II=1
    bool break_flag=false;
    static int addgset [60000]={0};
    static ap_int<64> tmp_read;
    static ap_uint<64> tmp_add_set_size=0;
    bool find=false;
    //bool break_flag=false;
    static int i=0;

    while(!break_flag){
        if(!break_signal_addset.empty()){
            ap_int<64> tmp;
            break_signal_addset.read(tmp);
            break_flag= true;
            break; // Exit the loop immediately
        }
        if(!remote_set_e_addset.empty()){
            remote_set_e_addset.read(tmp_read);
            for(int j=0; j<tmp_add_set_size; j++){
                //#pragma HLS UNROLL 
                if(tmp_read== addgset[j]){
                    find= true;
                    break;
                }
            }
            if(!find){
                addgset[tmp_add_set_size]=tmp_read;
                tmp_add_set_size++;
                //tmp_set_size++;
            }
        }
        if(!local_set_e_addset.empty()){
            local_set_e_addset.read(tmp_read);
            for(int j=0; j<tmp_add_set_size; j++){
                //#pragma HLS UNROLL
                if(tmp_read== addgset[j]){
                    find= true;
                    break;
                    }
                }
                if(!find){
                    addgset[tmp_add_set_size]=tmp_read;
                    tmp_add_set_size++;
                    //tmp_set_size++;
                }

        }
        if(!set_size_request_addset.full()){
            set_size_request_addset.write(tmp_add_set_size);
        }

    }


}
void update_removeset(hls::stream<ap_int<64> >& remote_set_e_removeset, hls::stream<ap_int<64> >& local_set_e_removeset, hls::stream<ap_int<64> >& break_signal_removeset , hls::stream<ap_int<64> >& set_size_request_removeset){
    #pragma HLS PIPELINE II=1
    bool break_flag=false;
    static int removegset [60000]={0};
    static ap_int<64> tmp_read;
    static ap_uint<64> tmp_remove_set_size=0;
    bool find=false;
    //bool break_flag=false;
    static int i=0;

    while(!break_flag){
        if(!break_signal_removeset.empty()){
            ap_int<64> tmp;
            break_signal_removeset.read(tmp);
            break_flag= true;
            break; // Exit the loop immediately
        }
        if(!remote_set_e_removeset.empty()){
            remote_set_e_removeset.read(tmp_read);
            for(int j=0; j<tmp_remove_set_size; j++){
                //#pragma HLS UNROLL 
                if(tmp_read== removegset[j]){
                    find= true;
                    break;
                }
            }
            if(!find){
                removegset[tmp_remove_set_size]=tmp_read;
                tmp_remove_set_size++;
                //tmp_set_size++;
            }
        }
        if(!local_set_e_removeset.empty()){
            local_set_e_removeset.read(tmp_read);
            for(int j=0; j<tmp_remove_set_size; j++){
                //#pragma HLS UNROLL
                if(tmp_read== removegset[j]){
                    find= true;
                    break;
                    }
                }
                if(!find){
                    removegset[tmp_remove_set_size]=tmp_read;
                    tmp_remove_set_size++;
                    //tmp_set_size++;
                }

        }
        if(!set_size_request_removeset.full()){
            set_size_request_removeset.write(tmp_remove_set_size);
        }

    }
}
    
void bram_mem_maneger_twopset(int *network_ptr, int node_num, int board_num, int query_num, int write_num, hls::stream<ap_int<64> >& axis_mem_request, hls::stream<ap_int<64> >& update_set_request){
    #pragma HLS DATAFLOW

    static hls::stream<ap_int<64> > set_size_request_addset, set_size_request_removeset,break_signal_twopset, break_signal_addset, break_signal_removeset;
    static hls::stream<ap_int<64> > local_set_e_addset, local_set_e_removeset, remote_set_e_addset, remote_set_e_removeset;
    //#pragma HLS STREAM depth=8 variable=set_size_request_addset
    //#pragma HLS STREAM depth=8 variable=set_size_request_removeset
    //#pragma HLS STREAM depth=8 variable=local_set_e_addset
    //#pragma HLS STREAM depth=8 variable=local_set_e_removeset
    //#pragma HLS STREAM depth=8 variable=remote_set_e_addset
    //#pragma HLS STREAM depth=8 variable=remote_set_e_removeset

    handle_query(query_num, axis_mem_request, set_size_request_addset, set_size_request_removeset);
    update_local_twopset(write_num, update_set_request, local_set_e_addset, local_set_e_removeset, break_signal_twopset, break_signal_addset, break_signal_removeset);
    update_twopset(network_ptr, node_num, board_num, break_signal_twopset, remote_set_e_addset, remote_set_e_removeset);
    update_addset(remote_set_e_addset,local_set_e_addset, break_signal_addset , set_size_request_addset);
    update_removeset(remote_set_e_removeset,local_set_e_removeset, break_signal_removeset , set_size_request_removeset);
    
}


extern "C" {

    void bram_crdt_twopset_bram_bench(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt64>& m_axis_tx_data, 
        hls::stream<pkt64>& s_axis_tx_status, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int node_num,
        int board_num,
        int op_num,
        int query_num,
        int write_num,
        int *ops,
        //int *crdt,
        int *network_ptr
        //int wait_cyc
        //ap_uint<512>* m_axi_status
    ) {
        static pkt64 status;
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
        //#pragma HLS INTERFACE m_axi port=crdt bundle=gmem1


        static hls::stream<ap_int<64> > axis_last_op_response;
        static hls::stream<ap_int<64> > axis_mem_request;
        static hls::stream<ap_int<64> > update_set_request;
        #pragma HLS STREAM depth=8 variable=axis_last_op_response
        //#pragma HLS STREAM depth=8 variable=axis_mem_request
        //#pragma HLS STREAM depth=8 variable=update_set_request
        if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
        }
        #pragma HLS DATAFLOW

            load_buffer(
                op_num,
                ops,
                axis_last_op_response
            );

            crdt_twopset(
                op_num,
                //ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                node_num,
                board_num,
                //s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                axis_last_op_response,
                axis_mem_request,
                update_set_request
                );
            bram_mem_maneger_twopset(network_ptr, node_num, board_num, query_num, write_num, axis_mem_request, update_set_request);
    }

}
