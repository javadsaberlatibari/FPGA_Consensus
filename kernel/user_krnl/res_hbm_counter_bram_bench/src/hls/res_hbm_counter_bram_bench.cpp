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
    hls::stream<ap_uint<64> >& axis_last_op_response
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

void crdt_counter(
    int op_num,
    hls::stream<ap_uint<64> >& axis_last_op_response,
    hls::stream<ap_uint<64> >& axis_mem_request,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int node_num,
    int board_num,
    //hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data
) {
    #pragma HLS PIPELINE II=1
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_COUNTER, DONE};
    static fsmStateType state = OPERATION_FETCH;
    static int op_cnt = 0; 
    int j;
    int qpn_tmp;

    pkt512 tmp_status;
    static ap_uint<64> local_counter = 0;
    ap_uint<256> tmp_local_counter;
    static bool request_bram = false;
    static ap_uint<64> last_operation;
    while(op_cnt<op_num){
        switch(state) {
            /*case IDLE_STATE: 
                s_axis_tx_status.read(tmp_status);
                state = OPERATION_FETCH; 
                break; */
            case OPERATION_FETCH:
                if (!axis_last_op_response.empty()){
                    axis_last_op_response.read(last_operation);
                    if(last_operation == 0) {
                        //tmp_local_counter = local_counter;
                        axis_mem_request.write(local_counter);
                        op_cnt++;
                    } else {
                        local_counter = local_counter + last_operation;
                        j = 0; 
                        qpn_tmp = board_num * (node_num - 1);
                        while (j < node_num) {
                            if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                if(j != board_num) {
                                    rdma_write(
                                    qpn_tmp,
                                    0,
                                    s_axi_raddr + (board_num * 8),
                                    0x8,
                                    local_counter,
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
                }
            }
            break;
        }
    }
}

void hbm_mem_maneger(int *network_ptr, int node_num, int board_num, int query_num, hls::stream<ap_uint<64> >& axis_mem_request){
    #pragma HLS PIPELINE II=1
    static int bram_counter=0;
    static int update_period=1;
    static int internal_clock=0;
    static int local_counter=0;
    static int query_cnt=0;
    static int remote_counter=0;
    static int tmp_HBM=0;

    ap_uint<64> tmp_local_counter;
    
    while (query_cnt<query_num){
        internal_clock++;
        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_local_counter);
            query_cnt++;
            local_counter=tmp_local_counter;
        }
        if(internal_clock==update_period){
            internal_clock=0;
            remote_counter=0;
                    for (int i=0; i<node_num; i++){
                        #pragma HLS UNROLL
                        if(i!=board_num){
                            tmp_HBM=network_ptr[i*2];
                            remote_counter = tmp_HBM + remote_counter;
                        }
                    }
                    bram_counter = remote_counter + local_counter;
        }
    }
}


extern "C" {
    void res_hbm_counter_bram_bench(
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
        int *ops,
        int *network_ptr
    ) {
        static pkt64 status;
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        

        static hls::stream<ap_uint<64> > axis_last_op_response;
        static hls::stream<ap_uint<64> > axis_mem_request;
        #pragma HLS STREAM depth=8 variable=axis_last_op_response
        #pragma HLS STREAM depth=8 variable=axis_mem_request

        if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
        }
        #pragma HLS DATAFLOW
        load_buffer(
            op_num,
            ops,
            axis_last_op_response
        );
        crdt_counter(
            op_num,
            axis_last_op_response,
            axis_mem_request,
            s_axi_lqpn,
            s_axi_laddr,
            s_axi_raddr,
            s_axi_len,
            node_num,
            board_num,
            //s_axis_tx_status,
            m_axis_tx_meta, 
            m_axis_tx_data
        );
        hbm_mem_maneger(network_ptr, node_num, board_num, query_num, axis_mem_request);
    }
}
