#include "util.h"

#define TH 1

void replication_engine_fsm(

    hls::stream<ProposedValue>& propose,
    hls::stream<ap_uint<32>>& prepare_req,
    hls::stream<LogEntry>& prepare_rsp,
    hls::stream<LogEntry>& writeSlot_req,
    hls::stream<ap_uint<32>>& acceptedValue_req,
    hls::stream<updateLocalValue>& acceptedValue_rsq,
    hls::stream<updateLocalValue>& updateLocalValue_req,
    int myBoardNum,
    int num_nodes

) {

#pragma HLS INTERFACE axis port = propose
#pragma HLS INTERFACE axis port = prepare_req
#pragma HLS INTERFACE axis port = prepare_rsp

#pragma HLS INTERFACE axis port = acceptedValue_req
#pragma HLS INTERFACE axis port = acceptedValue_rsq
#pragma HLS INTERFACE axis port = updateLocalValue_req



 enum fsmStateType {INIT, LEADER_REPLICA, PROPOSE, PREPARE_REQUEST, PREPARE_REPLY, ACCEPT, REPLICA, REPLICA_CHECK};
    static fsmStateType state = INIT;
    static int leader = 0;
    static bool done = true;
    static int myValue = 0;
    static ap_uint<32> sGroup = 0;
    static ProposedValue pVal;
    static ap_uint<32> newHiPropNum = 0;
    static LogEntry slot;
    static int propValue = 0;
    static updateLocalValue uVal;

    switch (state)
    {


    case INIT:
        state = PROPOSE;
        break;

    case PROPOSE:
        if (done == true && !propose.empty()) {
            propose.read(pVal);
            myValue = pVal.value;
            sGroup = pVal.syncronizationGroup;
            done = false;
            state = PREPARE_REQUEST;
        } else if (done) {
            state = LEADER_REPLICA;
        } else {
            state = PREPARE_REQUEST;
        }
        break;


    case PREPARE_REQUEST:
        if (!prepare_req.full()) {
            prepare_req.write(sGroup);
            state = PREPARE_REPLY;
        }
        break;

    case PREPARE_REPLY:
        if (!prepare_rsp.empty()) {
            prepare_rsp.read(slot);
            if (slot.valid) {
                propValue = slot.value;
            } else {
                propValue = myValue;
            }
            newHiPropNum = slot.propVal;
            state = ACCEPT;
        }
        break;

    case ACCEPT:
        if (!writeSlot_req.full() && !updateLocalValue_req.full()) {
            writeSlot_req.write(LogEntry(newHiPropNum, propValue, sGroup));
            if (myValue == propValue) {

                done = true;
            }

            updateLocalValue_req.write(updateLocalValue(propValue, sGroup));
            state = PROPOSE;
        }
        break;

    default:
        break;
    }


}


void log_handler_fsm(






    hls::stream<ap_uint<32>>& prepare_req,
    hls::stream<LogEntry>& prepare_rsp,
    hls::stream<LogEntry>& writeSlot_req,

    hls::stream<ap_uint<32>>& acceptedValue_req,
    hls::stream<updateLocalValue>& acceptedValue_rsq,

    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,

    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,

    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,

    hls::stream<ap_uint<256>>& m_axis_tx_meta,
    hls::stream<ap_uint<64>>& m_axis_tx_data,

    int myBoardNum,
    int num_nodes

) {

    enum fsmStateType {REQUEST, READ_MIN_PROP, READ_MIN_PROP_1_RSP, READ_MIN_PROP_2_RSP, WRITE_READ, WRITE_READ_RSP_1, WRITE_READ_RSP_2, WRITE_SLOT, ACCEPT_VALUE_1, ACCEPT_VALUE_2};
    static fsmStateType state = REQUEST;
    static int reads = 0;
    static ap_uint<32> sGroup = 0;
    static volatile int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS];
    static LogEntry logSlot;
    static volatile int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp;
    static LogEntry slot;
    static ap_uint<64> value;
    static ap_uint<32> minPropNumber = 0;
    static ap_uint<32> oldMinPropNumber = 0;

    if (!prepare_req.empty() && !minPropReadBram_req.full()) {
        prepare_req.read(sGroup);

        int j=0;
        int qpn_tmp=myBoardNum*(num_nodes-1);
        VITIS_LOOP_183_1: while (j<num_nodes){
            if(j!=myBoardNum && FOLLOWER_LIST[j]) {
                if(!m_axis_tx_meta.full()){
                    int slot = (j < myBoardNum) ? j : j-1;
                    rdma_read(
                        qpn_tmp,
                        LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup) + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[sGroup]%FIFO_LENGTH)),
                        LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup),
                        0x4,
                        m_axis_tx_meta
                        );
                    j++;
                    qpn_tmp++;
                }
            }
            else {
                j++;
            }
        }
        minPropReadBram_req.write(LogEntry(0, minPropFifoIndex[sGroup], sGroup));

    }

    if (!minPropReadBram_rsp.empty() && !readSlotsReadBram_req.full() && !minPropReadBram_req.full()) {
        minPropReadBram_rsp.read(minPropNumber);
       if (minPropNumber != oldMinPropNumber || minPropFifoIndex[sGroup] == 0) {

            minPropFifoIndex[sGroup]+=1;
            oldMinPropNumber = minPropNumber;
            minPropNumber+=1;
            int j=0;
            int qpn_tmp=myBoardNum*(num_nodes-1);
            VITIS_LOOP_215_2: while (j<num_nodes){
                if(j!=myBoardNum && FOLLOWER_LIST[j]){
                    if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                        rdma_write(
                            qpn_tmp,
                            0,
                            LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup),
                            0x8,
                            minPropNumber,
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
            j=0;
            qpn_tmp=myBoardNum*(num_nodes-1);
            // VITIS_LOOP_237_3: while (j<num_nodes){
            //     if(j!=myBoardNum && FOLLOWER_LIST[j]){
            //         if(!m_axis_tx_meta.full()){
            //             int slot = (j < myBoardNum) ? j : j-1;
            //             rdma_read(
            //                 qpn_tmp,
            //                 LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[sGroup]%NUM_SLOTS)),
            //                 LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
            //                 0x8,
            //                 m_axis_tx_meta
            //                 );
            //             j++;
            //             qpn_tmp++;
            //         }
            //     }
            //     else {
            //         j++;
            //     }
            // }
            readSlotsReadBram_req.write(LogEntry(minPropNumber, slotReadFifoIndex[sGroup], sGroup));
        }
        else {
            minPropReadBram_req.write(LogEntry(0, minPropFifoIndex[sGroup], sGroup));
        }
    }

    if (!readSlotsReadBram_rsp.empty() && !prepare_rsp.full()) {
        readSlotsReadBram_rsp.read(slot);
        prepare_rsp.write(slot);
        slotReadFifoIndex[sGroup]+=2;

    }

    if (!writeSlot_req.empty()) {
        writeSlot_req.read(logSlot);
        sGroup = logSlot.syncGroup;

        ap_uint<64> sendLog;
        sendLog.range(31, 0) = logSlot.propVal;
        sendLog.range(63, 32) = logSlot.value;
        int j=0;
        int qpn_tmp=myBoardNum*(num_nodes-1);
        VITIS_LOOP_279_4: while (j<num_nodes){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
                        0x8,
                        sendLog,
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
        fuo[sGroup]+=2;

    }

}

void smr(
    hls::stream<bool>& smr_finished,
    hls::stream<ap_uint<256>>& smr_update,
    hls::stream<ProposedValue>& proposedValue,
    hls::stream<int>& permissible_req,
    hls::stream<int>& permissible_rsp,
    hls::stream<int>& query_req,
    hls::stream<int>& query_rsp,
    hls::stream<ap_uint<256>>& m_axis_tx_meta,
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    int myBoardNum,
    int num_nodes


) {
    static ap_uint<64> localValues[SYNC_GROUPS];

    static hls::stream<ap_uint<32>> minProp_req("minimum_prop_request");
    static hls::stream<ap_uint<32>> minProp_rsp("minimum_prop_response");
    static hls::stream<ap_uint<32>> writeNewProp_req("write_new_prop_request");
    static hls::stream<LogEntry> readSlots_req("read_slot_request");
    static hls::stream<LogEntry> readSlots_rsp("read_slot_response");

    static hls::stream<ap_uint<32>> prepare_req;
    static hls::stream<LogEntry> prepare_rsp;

    static hls::stream<LogEntry> writeSlot_req("write_slot_request");

    static hls::stream<ap_uint<32>> acceptedValue_req("accepted_value_request");
    static hls::stream<updateLocalValue> acceptedValue_rsq("accepted_value_response");

    static hls::stream<updateLocalValue> updateLocalValue_req;
    static updateLocalValue update;
    static int permissible;
    static int query;
    static int counter = 0;

    replication_engine_fsm(
        proposedValue,
        prepare_req,
        prepare_rsp,
        writeSlot_req,
        acceptedValue_req,
        acceptedValue_rsq,
        updateLocalValue_req,
        myBoardNum,
        num_nodes

    );

    log_handler_fsm(
        prepare_req,
        prepare_rsp,
        writeSlot_req,
        acceptedValue_req,
        acceptedValue_rsq,

        minPropReadBram_req,
        minPropReadBram_rsp,

        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,


        m_axis_tx_meta,
        m_axis_tx_data,

        myBoardNum,
        num_nodes


    );


    if (!updateLocalValue_req.empty() && !smr_update.full()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] = update.value;
        smr_update.write(update.value);
    }


}

void movie(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<64>>& update_set_request,
    int myBoardNum,
    int* ops,
    ap_uint<32>* amount,
    int num_ops,
    int* reply_bank,
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
    static hls::stream<ap_uint<256>> smr_updated;
    static hls::stream<bool> ncc_finished;
#pragma HLS STREAM depth=8 variable=smr_finished
#pragma HLS STREAM depth=8 variable=smr_updated
#pragma HLS STREAM depth=8 variable=ncc_finished
 static hls::stream<ProposedValue> proposed;
#pragma HLS STREAM depth=8 variable=proposed
 static hls::stream<ap_uint<32>> broadcast_req;
    static hls::stream<int> smr_permissble_req;
#pragma HLS STREAM depth=8 variable=smr_permissble_req
 static hls::stream<int> smr_permissible_rsp;
#pragma HLS STREAM depth=8 variable=smr_permissible_rsp
 static hls::stream<int> smr_query_req;
    static hls::stream<int> smr_query_rsp;
#pragma HLS STREAM depth=8 variable=smr_query_req
#pragma HLS STREAM depth=8 variable=smr_query_rsp

 static hls::stream<ap_uint<256>> smr_tx_meta;
    static hls::stream<ap_uint<64>> smr_tx_data;
    // static hls::stream<ap_uint<256>> ncc_tx_meta;
    // static hls::stream<ap_uint<64>> ncc_tx_data;
#pragma HLS STREAM depth=48 variable=smr_tx_meta
#pragma HLS STREAM depth=48 variable=smr_tx_data
// #pragma HLS STREAM depth=64 variable=ncc_tx_meta
// #pragma HLS STREAM depth=64 variable=ncc_tx_data

    static int counter = 0;
    static int debug_counter = 0;
    static bool read_op = true;


    static int movie_size = 0;
    static int customer_size = 0;

    static bool movies[2000];
    static bool customers[2000];


    //VITIS_LOOP_477_1: while (debug_counter < debug_exe && counter < num_ops) {
    while (counter < num_ops) {
        debug_counter++;
        if (read_op) {

            if (!proposed.full()) {
                ap_uint<32> val;
                val.range(31, 30) = ops[counter];
                val.range(29, 0) = amount[counter];
                int synGroup = (ops[counter] < 2) ? 0 : 1;
                proposed.write(ProposedValue(val, synGroup));
                read_op = false;
            }

        }

        smr(smr_finished,
            smr_updated,
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
            num_nodes
        );

        meta_merger(
            smr_tx_meta,
            m_axis_tx_meta,
            smr_tx_data,
            m_axis_tx_data
        );


        if (!smr_updated.empty()) {

            ap_uint<256> temp;
            smr_updated.read(temp);
            read_op = true;
            counter++;
            switch(temp.range(31, 30)) {
                case 0: {
                    movies[(int) temp.range(29, 0)] = true;
                    movie_size += 1;
                    break;
                }

                case 1: {
                    movies[(int) temp.range(29, 0)] = false;
                    movie_size -= 1;
                    break;
                }

                case 2: {
                    customers[(int) temp.range(29, 0)] = true;
                    customer_size += 1;
                    break;
                }

                case 3: {
                    customers[(int) temp.range(29, 0)] = false;
                    customer_size -= 1;
                    break;
                }
            }

        }

    }

}

void mem_manager( volatile int *network_ptr,
                        int *reply,
                        int node_num,
                        int board_num,
                        int query_num,
                        int exe,
                        hls::stream<ap_uint<32>>& axis_mem_request,
                        hls::stream<LogEntry>& minPropReadBram_req,
                        hls::stream<ap_uint<32>>& minPropReadBram_rsp,
                        hls::stream<LogEntry>& readSlotsReadBram_req,
                        hls::stream<LogEntry>& readSlotsReadBram_rsp,
                        hls::stream<ap_uint<32>>& logReadBram_req,
                        hls::stream<ap_uint<64>>& logReadBram_rsp,
                        hls::stream<ap_uint<64>>& update_set_request
                    ){


#pragma HLS INTERFACE axis port = axis_mem_request
#pragma HLS INTERFACE axis port = minPropReadBram_req
#pragma HLS INTERFACE axis port = minPropReadBram_rsp
#pragma HLS INTERFACE axis port = readSlotsReadBram_req
#pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
#pragma HLS INTERFACE axis port = logReadBram_req
#pragma HLS INTERFACE axis port = logReadBram_rsp
#pragma HLS INTERFACE axis port = update_set_request

 static int bram_counter=0;
    static int update_period=1000;
    static ap_uint<512> internal_clock=0;
    static int local_counter=0;
    static int query_cnt=0;
    static int exe_cnt = 0;
    static int remote_counter=0;
    static int tmp_hbm = 0;
    static int hbm_tmp=0;
    static int tmp_set_size = 0;


    static LogEntry slotIndex, minPropIndex;
    static ap_uint<32> slotRead;
    static int log_index[NUM_NODES];



    static int minProp = 0;
    static ap_uint<64> maxPropNumber = 0;
    static int propNum, propValue;
    static bool check_throughput_counter = false;

    //VITIS_LOOP_614_1: while (query_cnt<query_num && exe_cnt < exe){
    while (query_cnt<query_num) {
        exe_cnt++;

        if (!minPropReadBram_req.empty() && !minPropReadBram_rsp.full()) {

            minPropReadBram_req.read(minPropIndex);

            VITIS_LOOP_622_2: for (int i = 0; i < node_num-1; i++) {
                int temp = network_ptr[LOG_BASE_PTR + (LOG_PTR_LEN * minPropIndex.syncGroup) + 2 + FIFO_LENGTH * i + (minPropIndex.value%FIFO_LENGTH)];
                if (temp > minProp) {
                    minProp = temp;
                }
            }
            minPropReadBram_rsp.write(minProp);

        }

        if (!readSlotsReadBram_req.empty() && !readSlotsReadBram_rsp.full()) {

            readSlotsReadBram_req.read(slotIndex);
            maxPropNumber = 0;
            VITIS_LOOP_636_3: for (int i = 0; i < node_num-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    propNum = network_ptr[LOG_BASE_PTR + (LOG_PTR_LEN * slotIndex.syncGroup) + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex.value%NUM_SLOTS)];
                    propValue = network_ptr[LOG_BASE_PTR + (LOG_PTR_LEN * slotIndex.syncGroup) + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex.value%NUM_SLOTS) + 1];
                    if (propNum != 0) {
                        maxPropNumber.range(31, 0) = propNum;
                        maxPropNumber.range(64, 32) = propValue;
                    }
                }
            }

            if (maxPropNumber.range(31,0) != 0) {
                readSlotsReadBram_rsp.write(LogEntry(maxPropNumber.range(31,0), maxPropNumber.range(63, 32), true));
            } else {
                readSlotsReadBram_rsp.write(LogEntry(slotIndex.propVal, 0));
            }
            query_cnt++;
        }

    }

    #if TH
    static int fin_sig_found = false;
    VITIS_LOOP_862_6: while (board_num != 0 && !fin_sig_found) {
        if (network_ptr[LOG_BASE_PTR] >= exe) {
            fin_sig_found = true;
        }
    }

    fin_sig_found = false;
    while (board_num != 1 && !fin_sig_found) {
        if (network_ptr[LOG_BASE_PTR + LOG_PTR_LEN] >= exe) {
            fin_sig_found = true;
        }
    }
    #endif


}

void movie_krnl(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<pkt64>& s_axis_tx_status,
    int myBoardNum,
    int* ops,
    ap_uint<32>* amount,
    int num_ops,
    int* reply_bank,
    int* reply_bram,
    volatile int* network_ptr,
    int num_nodes,
    int debug_exe,
    int query_num
) {


#pragma HLS INTERFACE m_axi port=ops bundle=gmem0
#pragma HLS INTERFACE m_axi port=amount bundle=gmem0
#pragma HLS INTERFACE m_axi port=reply_bank bundle=gmem0
#pragma HLS INTERFACE m_axi port=reply_bram bundle=gmem1
#pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
#pragma HLS INTERFACE axis port = m_axis_tx_meta
#pragma HLS INTERFACE axis port = m_axis_tx_data
#pragma HLS INTERFACE axis port = s_axis_tx_status

 static pkt64 status;
    static hls::stream<ap_uint<32>> query_mem_req;
#pragma HLS STREAM depth=16 variable=query_mem_req
 static hls::stream<LogEntry> minPropReadBram_req;
    static hls::stream<ap_uint<32>> minPropReadBram_rsp;
    static hls::stream<LogEntry> readSlotsReadBram_req;
    static hls::stream<LogEntry> readSlotsReadBram_rsp;
    static hls::stream<ap_uint<32>> logReadBram_req;
    static hls::stream<ap_uint<64>> logReadBram_rsp;
    static hls::stream<ap_uint<64>> update_set_request;
#pragma HLS STREAM depth=8 variable=minPropReadBram_req
#pragma HLS STREAM depth=8 variable=minPropReadBram_rsp
#pragma HLS STREAM depth=8 variable=readSlotsReadBram_req
#pragma HLS STREAM depth=8 variable=readSlotsReadBram_rsp
#pragma HLS STREAM depth=8 variable=logReadBram_req
#pragma HLS STREAM depth=8 variable=logReadBram_rsp
#pragma HLS STREAM depth=8 variable=update_set_request

 static int bram_debug_exe, bank_debug_exe;
    bram_debug_exe = debug_exe;
    bank_debug_exe = debug_exe;
    if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
    }

#pragma HLS dataflow

 movie(
        m_axis_tx_meta,
        m_axis_tx_data,
        query_mem_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        update_set_request,
        myBoardNum,
        ops,
        amount,
        num_ops,
        reply_bank,
        num_nodes,
        bank_debug_exe
    );

    mem_manager(
        network_ptr,
        reply_bram,
        num_nodes,
        myBoardNum,
        query_num,
        bram_debug_exe,
        query_mem_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        update_set_request
    );

}