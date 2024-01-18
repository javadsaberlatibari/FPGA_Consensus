#include "broadcast.h"

void crdt_counter(
    hls::stream<bool>& ncc_finished, 
    hls::stream<int>& broadcast_req, 
    hls::stream<int>& ncc_permissible_req,
    hls::stream<int>& ncc_permissible_rsp, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    int myBoardNum, 
    int num_nodes
) {

    #pragma HLS INTERFACE axis port = ncc_finished
    #pragma HLS INTERFACE axis port = broadcast_req
    #pragma HLS INTERFACE axis port = ncc_permissible_req
    #pragma HLS INTERFACE axis port = ncc_permissible_rsp
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data

    static int pValue; 
    static int perm; 
    static int query; 
    static int deposit = 0; 

    if (!broadcast_req.empty()) {
        broadcast_req.read(pValue);
        deposit += pValue; 
        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
            if(j!=myBoardNum){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()) { 
                    rdma_write(
                        qpn_tmp,
                        0,
                        BROADCAST_BASE_ADDR + 4 * myBoardNum,
                        0x8,
                        deposit,
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
        ncc_finished.write(1);
    }

    if (!ncc_permissible_req.empty()) {
        ncc_permissible_req.read(perm);
        ncc_permissible_rsp.write(deposit);
    }

}