#include "bank.h"

void bank(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    int myBoardNum,
    int* ops, 
    int* amount, 
    int num_ops, 
    int* m_axi_reply,
    int num_nodes,
    int debug_exe
) {
    
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    #pragma HLS INTERFACE axis port = query_mem_req
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_req
    #pragma HLS INTERFACE axis port = logReadBram_rsp

    static hls::stream<bool> smr_finished;
    static hls::stream<bool> ncc_finished; 
    static hls::stream<ProposedValue> proposed; 
    #pragma HLS STREAM depth=8 variable=proposed
    static hls::stream<int> broadcast_req; 
    static hls::stream<int> smr_permissble_req; 
    #pragma HLS STREAM depth=8 variable=smr_permissble_req
    static hls::stream<int> smr_permissible_rsp; 
    static hls::stream<int> ncc_permissible_req; 
    #pragma HLS STREAM depth=8 variable=ncc_permissible_req
    static hls::stream<int> ncc_permissible_rsp; 
    static hls::stream<int> smr_query_req; 
    static hls::stream<int> smr_query_rsp; 
    //static hls::stream<int> ncc_query_req; 
    //static hls::stream<int> ncc_query_rsp; 

    static hls::stream<ap_uint<256>> smr_tx_meta; 
    static hls::stream<ap_uint<64>> smr_tx_data;
    static hls::stream<ap_uint<256>> ncc_tx_meta; 
    static hls::stream<ap_uint<64>> ncc_tx_data;
    #pragma HLS STREAM depth=8 variable=smr_tx_meta
    #pragma HLS STREAM depth=8 variable=smr_tx_data
    #pragma HLS STREAM depth=8 variable=ncc_tx_meta
    #pragma HLS STREAM depth=8 variable=ncc_tx_data

    static int counter = 0; 
    static int debug_counter = 0; 
    static int smr_value, ncc_value; 
    static bool read_op = true; 
    static int inital_value = 100000; 

    while (debug_counter < debug_exe && counter < num_ops) {
    //while(counter < num_ops && RTS) {
    #pragma HLS loop_flatten off
        m_axi_reply[0] = debug_counter; 
        m_axi_reply[1] = counter; 
        if (read_op) {
            switch(ops[counter]) {

                case 0: {
                    if (!smr_permissble_req.full() && !ncc_permissible_req.full()) {
                        smr_permissble_req.write(0);
                        ncc_permissible_req.write(0);
                        m_axi_reply[2] = 111;
                        m_axi_reply[3] = ops[counter];
                        m_axi_reply[4] = amount[counter]; 
                        read_op = false; 
                    }
                    break; 
                }

                case 1: {
                    if (!broadcast_req.full()) {
                        broadcast_req.write(amount[counter]);
                        m_axi_reply[2] = 222;
                        m_axi_reply[3] = ops[counter];
                        m_axi_reply[4] = amount[counter]; 
                        read_op = false; 
                    }
                    break;
                }

                case 2: {
                    if (!smr_query_req.full()){ 
                    //&& !ncc_query_req.full()) {
                        smr_query_req.write(0);
                        // ncc_query_req.write(0);
                        m_axi_reply[2] = 333;
                        m_axi_reply[3] = ops[counter];
                        read_op = false; 
                    }
                    break; 
                }
            }
            
        }

        smr(smr_finished,
            proposed,
            smr_permissble_req,
            smr_permissible_rsp, 
            smr_query_req,
            smr_query_rsp, 
            smr_tx_meta,
            smr_tx_data,
            logReadBram_req,
            logReadBram_rsp,
            readSlotsReadBram_req,
            readSlotsReadBram_rsp,
            minPropReadBram_req,
            minPropReadBram_rsp,
            myBoardNum,
            num_nodes,
            m_axi_reply);

        crdt_counter(
            ncc_finished,
            broadcast_req, 
            ncc_permissible_req,
            ncc_permissible_rsp, 
            // ncc_query_req,
            // ncc_query_rsp, 
            ncc_tx_meta,
            ncc_tx_data,
            myBoardNum,
            num_nodes
            //network_ptr
        );

        merger( smr_tx_meta, 
                ncc_tx_meta, 
                smr_tx_data, 
                ncc_tx_data,
                m_axis_tx_meta,
                m_axis_tx_data);

        if (!smr_permissible_rsp.empty() && !ncc_permissible_rsp.empty()) {
            m_axi_reply[5] = 444; 
            smr_permissible_rsp.read(smr_value);
            ncc_permissible_rsp.read(ncc_value);
            if (inital_value + smr_value + ncc_value - amount[counter] >= 0) {
                proposed.write(ProposedValue(-amount[counter], 0));
            } else {
                read_op = true; 
                counter++; 
            }
        }

        if (!smr_query_rsp.empty()) { 
        //&& !ncc_query_rsp.empty()) {
            m_axi_reply[6] = 555; 
            int smr_query, ncc_query;
            smr_query_rsp.read(smr_query); 
            //ncc_query_rsp.read(ncc_query);
            m_axi_reply[28] = inital_value + smr_query; 
            query_mem_req.write(inital_value + smr_query);
            read_op = true;
            counter++; 
        }

        if (!smr_finished.empty()) {
            m_axi_reply[6] = 666; 
            bool temp; 
            smr_finished.read(temp);
            read_op = true;
            counter++; 
        }

        if (!ncc_finished.empty()) {
            m_axi_reply[6] = 777; 
            bool temp; 
            ncc_finished.read(temp);
            read_op = true;
            counter++; 
        }

        debug_counter++; 
    }

}