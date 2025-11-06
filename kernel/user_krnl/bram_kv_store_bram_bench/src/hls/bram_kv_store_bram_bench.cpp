#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

// RDMA_WRITE (unchanged)
void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    ap_uint<64> write_value,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
) {
    #pragma HLS INLINE
    pkt256 tx_meta;
    pkt64 tx_data;

    tx_meta.data.range(2,0) = 0x00000001; 
    tx_meta.data.range(26,3) = s_axi_lqpn; 
    tx_meta.data.range(74, 27) = s_axi_laddr; 
    tx_meta.data.range(122, 75) = s_axi_raddr; 
    tx_meta.data.range(154, 123) = s_axi_len;
    m_axis_tx_meta.write(tx_meta);

    tx_data.data(63, 0) = write_value;
    tx_data.keep(7, 0) = 0xff;
    tx_data.last = 1; 
    m_axis_tx_data.write(tx_data);
}

// LOAD_BUFFER (unchanged)
const int BUFFER_SIZE = 16;
void load_buffer(
    int op_num,
    ap_uint<64>* ops,
    hls::stream<ap_uint<64> >& axis_last_op_response
) {
    #pragma HLS PIPELINE II=1
    bool loaded = false; 
    int available_ops_index = 0;
    int read_bram_index = 0;
    ap_uint<64> operation_buffer[BUFFER_SIZE];
    int op_cnt_write = 0;
    int op_cnt_read = 0;
    bool bram_full = false;
    bool response = false;
    int k = 0;
    int debug = 0;
    int tmp_read;

    while (op_cnt_read < op_num) {
        if (op_cnt_write < op_num && !bram_full) {
            for (int i = 0; i < 8; i++) {
                #pragma HLS UNROLL
                operation_buffer[k + i] = ops[op_cnt_write];
                op_cnt_write++;
                available_ops_index++;
            }
            k = (k == 0) ? 8 : 0;
        }
        if (available_ops_index > 0) {
            response = true;
        } else {
            response = false;
        }

        if (response) {
            if (!axis_last_op_response.full()) {
                axis_last_op_response.write(operation_buffer[read_bram_index]);
                available_ops_index--;
                op_cnt_read++;
                read_bram_index++;
            }
            if (read_bram_index == BUFFER_SIZE)
                read_bram_index = 0;
        }
        if (available_ops_index <= 8)
            bram_full = false;
        else 
            bram_full = true;
    }
}

// Key-Value Store Definition
const int NUM_KEYS = 100000;
struct KVEntry {
    ap_uint<32> value;
    ap_uint<16> timestamp;
};
static KVEntry kv_store_array[NUM_KEYS];

// Updated process_kv function (removed now_time_stamp)
void process_kv(
    int op_num,
    int write_num,
    bool init,
    hls::stream<ap_uint<64>>& finish_signal_process_kv,
    hls::stream<ap_uint<64>>& update_requests_bram_mem_remote,
    hls::stream<ap_uint<64>>& axis_last_op_response,
    int node_num,
    int board_num,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data
) {
    #pragma HLS PIPELINE II=1
    #pragma HLS ARRAY_PARTITION variable=kv_store_array type=cyclic factor=8 dim=1
    int op_cnt = 0;
    int internal_clock = 0;
    int update_period = 1000;
    ap_uint<64> write_value = 0;
    ap_uint<64> last_operation;
    ap_uint<32> key, value;
    ap_uint<32> get_value;
    int j=0;
    int qpn_tmp;
    int check_value_met=0;
    int write_counter=0;
    int log_index[8] = {0};
    int read_address=0;

    int log_size= write_num+10;
    int received_packet_count=0;
    ap_uint<64> tmp;

    // Dummy loop to force BRAM allocation for kv_store_array
    /*ap_uint<16> checksum = 0;
    for (int i = 0; i < NUM_KEYS; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=NUM_KEYS max=NUM_KEYS
        #pragma HLS PIPELINE II=1
        kv_store_array[i].value = i % 65536;
        checksum ^= kv_store_array[i].value;
    }
    if (checksum == 12345) { // Prevent compiler from optimizing away
        kv_store_array[0].timestamp = checksum;
    }*/

    enum fsmStateType { FETCH_OP, PROCESS_OP, REPLICATE_OP };
    fsmStateType state = FETCH_OP;

    while (op_cnt < op_num || (finish_signal_process_kv.empty())) {
        switch(state) {
            case FETCH_OP:
                if (!axis_last_op_response.empty()) {
                    axis_last_op_response.read(last_operation);
                    key = last_operation.range(31, 0);
                    value = last_operation.range(63, 32);
                    state = PROCESS_OP;
                }
                break;

            case PROCESS_OP:
                if (value == 0) {
                    get_value = kv_store_array[key].value; // simulate use
                    op_cnt++;
                    state = FETCH_OP;
                } else {
                    kv_store_array[key].value = value;
                    kv_store_array[key].timestamp++;
                    write_value.range(14, 0) = kv_store_array[key].timestamp;
                    write_value.range(31, 15) = key;
                    write_value.range(63, 32) = value;
                    if(init){
                        op_cnt++;
                        state = FETCH_OP;
                    }
                    else{
                        j = 0; 
                        qpn_tmp = board_num * (node_num - 1);
                        state = REPLICATE_OP;
                        }
                }
                break;

            case REPLICATE_OP:
                if (j < node_num) {
                    if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                        if(j != board_num) {
                            rdma_write(
                                qpn_tmp,
                                0,
                                s_axi_raddr+(((board_num* log_size)+write_counter)*8),
                                0x8,
                                write_value,
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
                else {
                    op_cnt++;
                    write_counter++;
                    state = FETCH_OP;
                }
                break;
        }
        if(!update_requests_bram_mem_remote.empty()){
            ap_uint<64> update_data;
            update_requests_bram_mem_remote.read(update_data);
            ap_uint<16> timestamp = update_data.range(14, 0);
            ap_uint<32> key = update_data.range(31, 15);
            ap_uint<32> value = update_data.range(63, 32);
            if(timestamp > kv_store_array[key].timestamp){
                                
                kv_store_array[key].timestamp = timestamp;
                kv_store_array[key].value = value;
            }
        }
    }
    finish_signal_process_kv.read(tmp);
}
void hbm_remote_handler(int write_num, int init, int update_period, int expected_packets, int node_num, int board_num, int *network_ptr, hls::stream<ap_uint<64>>& update_requests_bram_mem, hls::stream<ap_uint<64>>& finish_signal_process_kv){
    #pragma HLS PIPELINE II=1
    int internal_clock = 0;
    int received_packet_count=0;
    int log_size= write_num +10;
    int log_index[8] = {0};

    while(((received_packet_count!=expected_packets)&& !init)){
        // Periodic updates from network_ptr
        if (internal_clock == update_period) {
            internal_clock = 0;
            for (int i = 0; i < node_num; i++) {
                if (i != board_num) {
                    ap_uint<64> update_data;
                    int read_add= ((i * log_size) + log_index[i])*2;
                    update_data.range(31, 0) = network_ptr[read_add];
                    update_data.range(63, 32) = network_ptr[read_add +1];
                    if(update_data!=0){
                        received_packet_count++;
                        log_index[i]++;
                        update_requests_bram_mem.write(update_data);
                    }
                }
            }
            // Note: Removed the write to now_time_stamp here
        }
        internal_clock++;
    }
    finish_signal_process_kv.write(1111);
}

extern "C" {
    void bram_kv_store_bram_bench(
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
        int write_num,
        int expected_packets,
        bool init,
        int hbm_update_period,
        ap_uint<64>* ops,
        int *network_ptr
    ) {
        pkt64 status;
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1

        hls::stream<ap_uint<64>> axis_last_op_response;
        hls::stream<ap_uint<64>> update_requests_bram_mem_remote; 
        hls::stream<ap_uint<64>> finish_signal_process_kv;
        hls::stream<ap_uint<32>> now_time_stamp;
        #pragma HLS STREAM depth=8 variable=axis_last_op_response
        #pragma HLS STREAM depth=8 variable=update_requests_bram_mem_remote
        //#pragma HLS STREAM depth=8 variable=now_time_stamp

        if (!s_axis_tx_status.empty()) {
            s_axis_tx_status.read(status);
        }

        #pragma HLS dataflow
        load_buffer(
            op_num,
            ops,
            axis_last_op_response
        );
        process_kv(
            op_num,
            write_num,
            init,
            finish_signal_process_kv,
            update_requests_bram_mem_remote,
            axis_last_op_response,
            node_num,
            board_num,
            s_axi_lqpn,
            s_axi_laddr,
            s_axi_raddr,
            s_axi_len,
            m_axis_tx_meta,
            m_axis_tx_data
        );
        hbm_remote_handler(write_num, 
            init, 
            hbm_update_period, 
            expected_packets, 
            node_num, 
            board_num, 
            network_ptr, 
            update_requests_bram_mem_remote, 
            finish_signal_process_kv);
    }
}