#include "util.h"

#define TH 0

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
    static ap_uint<32> prepare_sGroup = 0, prepare2_sGroup = 0, prepare3_sGroup = 0, accept_sGroup = 0;
    static volatile int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS];
    static LogEntry logSlot;
    static volatile int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp;
    static LogEntry slot;
    static ap_uint<64> value;
    static ap_uint<32> minPropNumber = 0;
    static ap_uint<32> oldMinPropNumber = 0;

    if (!prepare_req.empty() && !minPropReadBram_req.full()) {
        prepare_req.read(prepare_sGroup);

        int j=0;
        int qpn_tmp=myBoardNum*(num_nodes-1);
        VITIS_LOOP_183_1: while (j<num_nodes){
            if(j!=myBoardNum && FOLLOWER_LIST[j]) {
                if(!m_axis_tx_meta.full()){
                    int slot = (j < myBoardNum) ? j : j-1;
                    rdma_read(
                        qpn_tmp,
                        LOG_BASE_ADDR + (LOG_ADDR_LEN * prepare_sGroup) + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[prepare_sGroup]%FIFO_LENGTH)),
                        LOG_BASE_ADDR + (LOG_ADDR_LEN * prepare_sGroup),
                        0x4,
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
        minPropReadBram_req.write(LogEntry(0, minPropFifoIndex[prepare_sGroup], prepare_sGroup));

    }

    if (!minPropReadBram_rsp.empty() && !readSlotsReadBram_req.full() && !minPropReadBram_req.full()) {
        minPropReadBram_rsp.read(minPropNumber);
       if (minPropNumber != oldMinPropNumber || minPropFifoIndex[prepare_sGroup] == 0) {

            minPropFifoIndex[prepare_sGroup]+=1;
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
                            LOG_BASE_ADDR + (LOG_ADDR_LEN * prepare_sGroup),
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
            // j=0;
            // qpn_tmp=myBoardNum*(num_nodes-1);
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
            readSlotsReadBram_req.write(LogEntry(minPropNumber, slotReadFifoIndex[prepare_sGroup], prepare_sGroup));
        }
        else {
            minPropReadBram_req.write(LogEntry(0, minPropFifoIndex[prepare_sGroup], prepare_sGroup));
        }
    }

    if (!readSlotsReadBram_rsp.empty() && !prepare_rsp.full()) {
        readSlotsReadBram_rsp.read(slot);
        prepare_rsp.write(slot);
        slotReadFifoIndex[prepare_sGroup]+=2;

    }

    if (!writeSlot_req.empty()) {
        writeSlot_req.read(logSlot);
        accept_sGroup = logSlot.syncGroup;

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
                        LOG_BASE_ADDR + LOG_ADDR_LEN * accept_sGroup + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[accept_sGroup]%NUM_SLOTS),
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
        fuo[accept_sGroup]+=2;

    }

}

void smr(
    hls::stream<bool>& smr_finished,
    hls::stream<ap_uint<256>>& smr_update,
    hls::stream<ProposedValue>& proposedValue,
    // hls::stream<int>& permissible_req,
    // hls::stream<int>& permissible_rsp,
    // hls::stream<int>& query_req,
    // hls::stream<int>& query_rsp,
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

void stock_counter(
    int myBoardNum, 
    int num_nodes,
    hls::stream<ap_uint<32>>& broadcast_req, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
) {
    #pragma HLS inline off

    #pragma HLS INTERFACE axis port = broadcast_req
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    static ap_uint<32> pValue; 

    if (!broadcast_req.empty()) {
        broadcast_req.read(pValue);
        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
            if(j!=myBoardNum){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()) { 
                    rdma_write(
                        qpn_tmp,
                        0,
                        BROADCAST_STOCK_ADDR + (4 * 2 * BROADCAST_STOCK_LEN * myBoardNum +  pValue.range(31, 16)),
                        0x8,
                        (ap_uint<64>) pValue.range(15, 0),
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
    }

}

void bid_counter(
    int myBoardNum, 
    int num_nodes,
    hls::stream<ap_uint<32>>& broadcast_req, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
) {
    #pragma HLS inline off

    #pragma HLS INTERFACE axis port = broadcast_req
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    static ap_uint<32> pValue; 
    static int queue_slot = 0; 

    if (!broadcast_req.empty()) {
        broadcast_req.read(pValue);
        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
            if(j!=myBoardNum){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()) { 
                    rdma_write(
                        qpn_tmp,
                        0,
                        BROADCAST_BID_ADDR + (4 * 2 * BROADCAST_BID_LEN * myBoardNum + queue_slot),
                        0x8,
                        (ap_uint<64>) pValue.range(15, 0),
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
    }
    queue_slot++; 

}

void rubis(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& permissibility_req,
    hls::stream<ap_uint<32>>& permissibility_rsp,
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

    #pragma HLS STREAM depth=8 variable=smr_finished
    #pragma HLS STREAM depth=8 variable=smr_updated
    static hls::stream<ProposedValue> proposed;
    #pragma HLS STREAM depth=8 variable=proposed

    static hls::stream<ap_uint<32>> stock_req;
    static hls::stream<ap_uint<32>> bid_req;

    // static hls::stream<int> smr_permissble_req;
    // #pragma HLS STREAM depth=8 variable=smr_permissble_req
    // static hls::stream<int> smr_permissible_rsp;
    // #pragma HLS STREAM depth=8 variable=smr_permissible_rsp
    // static hls::stream<int> smr_query_req;
    // static hls::stream<int> smr_query_rsp;
    // #pragma HLS STREAM depth=8 variable=smr_query_req
    // #pragma HLS STREAM depth=8 variable=smr_query_rsp

    static hls::stream<ap_uint<256>> smr_tx_meta;
    static hls::stream<ap_uint<64>> smr_tx_data;
    static hls::stream<ap_uint<256>> stock_tx_meta;
    static hls::stream<ap_uint<64>> stock_tx_data;
    static hls::stream<ap_uint<256>> bid_tx_meta;
    static hls::stream<ap_uint<64>> bid_tx_data;
    #pragma HLS STREAM depth=48 variable=smr_tx_meta
    #pragma HLS STREAM depth=48 variable=smr_tx_data
    #pragma HLS STREAM depth=64 variable=stock_tx_meta
    #pragma HLS STREAM depth=64 variable=stock_tx_data
    #pragma HLS STREAM depth=64 variable=bid_tx_meta
    #pragma HLS STREAM depth=64 variable=bid_tx_data

    static int counter = 0;
    static int debug_counter = 0;
    static bool read_op = true;

    static int auctions[200][4];
    static int directbuysell[200];
    //Unique user IDS
    static int users_size = 10; 
    static bool users[200]; 
    for (int i = 0; i < 100; i++) {
        users[i] = true; 
        auctions[i][0] = 1; 
        directbuysell[i] = 1000; 
    }
    //

    ap_uint<32> proposed_value, temp_amount, permiss_rsp;

    //VITIS_LOOP_477_1: while (debug_counter < debug_exe && counter < num_ops) {
    while (counter < num_ops) {
        debug_counter++;
        
        if (read_op) {

            switch (ops[counter])
            {
                case 0: {
                    //SellItem
                    if (!stock_req.full() && !update_set_request.full()) {
                        ap_uint<32> temp = amount[counter];
                        directbuysell[temp.range(32, 16)] +=  temp.range(15, 0);
                        stock_req.write(amount[counter]);
                        update_set_request.write(1);
                        counter++; 
                    }
                    break;
                }
                case 1: {
                    //StoreBuyNow
                    if (!permissibility_req.full()) {
                        temp_amount = amount[counter];
                        proposed_value.range(31, 30) = 0; 
                        proposed_value.range(29, 0) = temp_amount.range(31, 16);
                        permissibility_req.write(proposed_value);
                    }
                    break;
                }
                case 2: {
                    //Register user
                    if (!proposed.full() && !update_set_request.full()) {
                        proposed_value.range(31, 30) = 1;
                        proposed_value.range(29, 0) = amount[counter];
                        if (!users[proposed_value.range(29, 0)]) {
                            proposed.write(ProposedValue(proposed_value, 0));
                            read_op = false;
                        } else {
                            counter++; 
                            update_set_request.write(1);
                        }
                    }
                    break;
                }
                case 3: {
                    //Place bid
                    if (!permissibility_req.full()) {
                        temp_amount = amount[counter];
                        proposed_value.range(31, 30) = 1; 
                        proposed_value.range(29, 0) = temp_amount.range(31, 25);
                        permissibility_req.write(proposed_value);
                    }
                    break;
                }
                case 4: {
                    //Open Auctions
                    if (!bid_req.full() && !update_set_request.full()) {
                        temp_amount = amount[counter];
                        auctions[temp_amount.range(31, 16)][0] = 1; 
                        bid_req.write(temp_amount);
                        update_set_request.write(1);
                        counter++; 
                    }
                    break;  
                }
                case 5: {
                    //Close Auction
                    if (!permissibility_req.full()) {
                        temp_amount = amount[counter];
                        proposed_value.range(31, 30) = 1; 
                        proposed_value.range(29, 0) = temp_amount.range(31, 0);
                        permissibility_req.write(proposed_value);
                    }
                    break;
                }
            }

        }

        if (!permissibility_rsp.empty() && !proposed.full() && !update_set_request.full()) {

            permissibility_rsp.read(permiss_rsp);

            switch(permiss_rsp.range(31, 30)) {

                case 0: {
                    temp_amount = amount[counter];
                    if (directbuysell[temp_amount.range(31, 16)] + permiss_rsp.range(29, 0) - temp_amount.range(15, 0) >= 0) {
                        proposed_value.range(31, 30) = 0;
                        proposed_value.range(29, 15) = temp_amount.range(31, 16);
                        proposed_value.range(14, 0) = temp_amount.range(15, 0);
                        proposed.write(ProposedValue(proposed_value, 0));
                        read_op = false;
                    } else {
                        counter++; 
                        update_set_request.write(1);
                    }
                    break;
                }

                case 1: {
                    temp_amount = amount[counter];
                    if ((auctions[temp_amount.range(31, 25)][0] == 1 || permiss_rsp.range(29, 0) == 1) && users[temp_amount.range(24, 16)]) {
                        proposed_value.range(31, 30) = 2;
                        proposed_value.range(29, 15) = temp_amount.range(24, 16);
                        proposed_value.range(14, 0) = temp_amount.range(15, 0);
                        proposed.write(ProposedValue(proposed_value, 1));
                        read_op = false;
                    } else {
                        counter++; 
                        update_set_request.write(1);
                    }
                    break;
                }

                case 2: {
                    temp_amount = amount[counter];
                    if (auctions[temp_amount.range(31, 0)][0] == 1) {
                        temp_amount.range(31, 30) = 3;
                        temp_amount.range(29, 0) = temp_amount.range(31, 0);
                        proposed.write(ProposedValue(temp_amount, 1));
                        read_op = false;
                    } else {
                        counter++; 
                        update_set_request.write(1);
                    }
                    break; 
                }

            }

        }



        smr(smr_finished,
            smr_updated,
            proposed,
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

        stock_counter(
            myBoardNum, 
            num_nodes,
            stock_req, 
            stock_tx_meta, 
            stock_tx_data
        );

        bid_counter(
            myBoardNum, 
            num_nodes,
            bid_req, 
            bid_tx_meta, 
            bid_tx_data
        );

        meta_merger(
            smr_tx_meta,
            stock_tx_meta,
            bid_tx_meta,
            m_axis_tx_meta
        );

        data_merger(
            smr_tx_data,
            stock_tx_data,
            bid_tx_data,
            m_axis_tx_data
        );

        if (!smr_updated.empty()) {

            ap_uint<256> temp;
            smr_updated.read(temp);
            read_op = true;
            counter++;

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
                        hls::stream<ap_uint<32>>& permissibility_req,
                        hls::stream<ap_uint<32>>& permissibility_rsp,
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

    static int auctions[200][4];
    static int directbuysell[200];
    static int queue_slots[NUM_NODES];
    static ap_uint<32> hbm_bit=0;

    static LogEntry slotIndex, minPropIndex;
    static ap_uint<32> slotRead, psig, ptemp;
    static int log_index[NUM_NODES];

    static ap_uint<64> sig = 0; 
    static int minProp = 0;
    static ap_uint<64> maxPropNumber = 0;
    static int propNum, propValue;
    static bool check_throughput_counter = false;

    //VITIS_LOOP_614_1: while (query_cnt<query_num && exe_cnt < exe){
    while (query_cnt<query_num) {
        exe_cnt++;
        internal_clock++;

        if (!update_set_request.empty()) {
            update_set_request.read(sig);
            query_cnt++;
        }

        if (!permissibility_req.empty() && !permissibility_rsp.full()) {
            permissibility_req.read(psig);

            switch (psig.range(31, 30))
            {
            case 0: {
                ptemp.range(31, 30) = 0;
                ptemp.range(29, 0) = directbuysell[psig.range(29, 0)];
                permissibility_rsp.write(ptemp);
                break; 
            }

            case 1: {
                ptemp.range(31, 30) = 1;
                ptemp.range(29, 0) = auctions[psig.range(29, 0)][0];
                permissibility_rsp.write(ptemp);
                break; 
            }
            case 2: {
                ptemp.range(31, 30) = 2;
                ptemp.range(29, 0) = auctions[psig.range(29, 0)][0];
                permissibility_rsp.write(ptemp);
                break; 
            }
            
            default:
                break;
            }


        }

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


        if(internal_clock==update_period){
            internal_clock=0;
            
            //sellItem
            for (int j = 0; j < 200; j++) {
                hbm_tmp = 0;
                for (int i=0; i<node_num; i++){
                    if(i!=board_num){
                        hbm_tmp+=network_ptr[BROADCAST_STOCK_PTR + 2 * BROADCAST_STOCK_LEN * i + j];
                    }
                }
                directbuysell[j] = hbm_tmp;
            }
                        //openAuction
            for (int i = 0; i < node_num; i++) {
                hbm_tmp = network_ptr[BROADCAST_BID_PTR + BROADCAST_BID_LEN * i + queue_slots[i]];
                if (hbm_tmp != 0) {
                    hbm_bit = hbm_tmp;
                    auctions[hbm_bit.range(31, 16)][0] = 1;
                    queue_slots[i]++;
                }

            }

        }



    }

    #if TH
    static bool fin_sig_found = false;
    // VITIS_LOOP_862_6: while (board_num != 0 && !fin_sig_found) {
    //     if (network_ptr[LOG_BASE_PTR] >= exe) {
    //         fin_sig_found = true;
    //     }
    // }

    fin_sig_found = false;
    while (board_num != 1 && !fin_sig_found) {
        if (network_ptr[LOG_BASE_PTR + 2 * LOG_PTR_LEN] >= exe) {
            fin_sig_found = true;
        }
    }
    #endif


}

void rubis_krnl(
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
    static hls::stream<ap_uint<32>> permissibility_req;
    static hls::stream<ap_uint<32>> permissibility_rsp;

#pragma HLS STREAM depth=8 variable=minPropReadBram_req
#pragma HLS STREAM depth=8 variable=minPropReadBram_rsp
#pragma HLS STREAM depth=8 variable=readSlotsReadBram_req
#pragma HLS STREAM depth=8 variable=readSlotsReadBram_rsp
#pragma HLS STREAM depth=8 variable=logReadBram_req
#pragma HLS STREAM depth=8 variable=logReadBram_rsp
#pragma HLS STREAM depth=8 variable=update_set_request
#pragma HLS STREAM depth=8 variable=permissibility_req
#pragma HLS STREAM depth=8 variable=permissibility_rsp

 static int bram_debug_exe, bank_debug_exe;
    bram_debug_exe = debug_exe;
    bank_debug_exe = debug_exe;
    if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
    }

#pragma HLS dataflow


 rubis(
        m_axis_tx_meta,
        m_axis_tx_data,
        query_mem_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        permissibility_req,
        permissibility_rsp,
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
        permissibility_req,
        permissibility_rsp,
        update_set_request
    );

}
