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
    static ap_uint<32> myValue = 0;
    static ap_uint<32> sGroup = 0;
    static ProposedValue pVal;
    static ap_uint<32> newHiPropNum = 0;
    static LogEntry slot;
    static int propValue = 0;
    static updateLocalValue uVal;

    switch (state)
    {


    case INIT:
        state = LEADER_REPLICA;
        break;


    case LEADER_REPLICA:
        if (myBoardNum == leader)
            state = PROPOSE;
        else if (myBoardNum > 12)
            state = REPLICA;
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
            state = LEADER_REPLICA;
        }
        break;


    case REPLICA:
        if (!acceptedValue_req.full()) {
            acceptedValue_req.write(1);
            state = REPLICA_CHECK;
        }
        break;


    case REPLICA_CHECK:
        if (!acceptedValue_rsq.empty() && !updateLocalValue_req.full()) {
            acceptedValue_rsq.read(uVal);
            updateLocalValue_req.write(uVal);
        }
        state = LEADER_REPLICA;
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

    hls::stream<ap_uint<32>>& minPropReadBram_req,
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
    static int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS];
    static LogEntry logSlot;
    static int fuo[SYNC_GROUPS];
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
                        LOG_BASE_ADDR + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[sGroup]%FIFO_LENGTH)),
                        LOG_BASE_ADDR,
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
        minPropReadBram_req.write(minPropFifoIndex[sGroup]);

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
                            LOG_BASE_ADDR,
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
            VITIS_LOOP_237_3: while (j<num_nodes){
                if(j!=myBoardNum && FOLLOWER_LIST[j]){
                    if(!m_axis_tx_meta.full()){
                        int slot = (j < myBoardNum) ? j : j-1;
                        rdma_read(
                            qpn_tmp,
                            LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[sGroup]%NUM_SLOTS)),
                            LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
                            0x8,
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
            readSlotsReadBram_req.write(LogEntry(minPropNumber, slotReadFifoIndex[sGroup]));
        } else {
            minPropReadBram_req.write(minPropFifoIndex[sGroup]);
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
        VITIS_LOOP_278_4: while (j<num_nodes){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
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

    if (!acceptedValue_req.empty() && !logReadBram_req.full()) {
        acceptedValue_req.read(sGroup);
        logReadBram_req.write(slotAcceptFifoIndex[0]);
    }

    if (!logReadBram_rsp.empty() && !acceptedValue_rsq.full()) {
        logReadBram_rsp.read(value);
        if (value.range(31, 0) != 0) {
            acceptedValue_rsq.write(updateLocalValue(value.range(63, 32), 0));
            slotAcceptFifoIndex[0]+=2;
        }
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
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    int myBoardNum,
    int num_nodes


) {
    static int localValues[SYNC_GROUPS];

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


    if (!updateLocalValue_req.empty() && !smr_finished.full() && !smr_update.full()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] = update.value;
        smr_update.write(update.value);


        if (myBoardNum == 0) {

            smr_finished.write(1);
        }
    }

}


void crdt_gset(
    hls::stream<ap_uint<32>>& broadcast_req,
    hls::stream<ap_uint<256>>& m_axis_tx_meta,
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    int myBoardNum,
    int num_nodes
) {
#pragma HLS inline off

#pragma HLS INTERFACE axis port = broadcast_req
#pragma HLS INTERFACE axis port = m_axis_tx_meta
#pragma HLS INTERFACE axis port = m_axis_tx_data

 static ap_uint<64> write_counter=0;
    static ap_uint<32> current_set_el=0;


    if (!broadcast_req.empty()) {
        broadcast_req.read(current_set_el);
        int j=0;
        int qpn_tmp=myBoardNum*(num_nodes-1);

        VITIS_LOOP_448_1: while (j<num_nodes){
            if(j!=myBoardNum){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        BROADCAST_BASE_ADDR + ((myBoardNum * 9000) + write_counter) * 4,
                        0x8,
                        (ap_uint<64>) current_set_el,
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
    }

}

void course(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
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
#pragma HLS STREAM depth=32 variable=smr_updated
 static hls::stream<bool> ncc_finished;
#pragma HLS STREAM depth=32 variable=smr_finished
#pragma HLS STREAM depth=8 variable=ncc_finished
 static hls::stream<ProposedValue> proposed;
#pragma HLS STREAM depth=32 variable=proposed
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
    static hls::stream<ap_uint<256>> ncc_tx_meta;
    static hls::stream<ap_uint<64>> ncc_tx_data;
#pragma HLS STREAM depth=128 variable=smr_tx_meta
#pragma HLS STREAM depth=128 variable=smr_tx_data
#pragma HLS STREAM depth=64 variable=ncc_tx_meta
#pragma HLS STREAM depth=64 variable=ncc_tx_data

 static int counter = 0;
    static int debug_counter = 0;
    static bool read_op = true;


    static int student_size = 1000;
    static int course_size = 1000;
    static int enroll_size = 0;

    static bool student[2000];
    static bool courses[2000];
    VITIS_LOOP_543_1: for (int i = 0; i < 1000; i++) {
        student[i] = true;
        courses[i] = true;
    }

    static ap_uint<32> enroll[250000];
    static int enroll_counter = 0;


    //VITIS_LOOP_552_2: while (debug_counter < debug_exe && counter < num_ops) {
    while(counter < num_ops) {
        debug_counter++;
        if (read_op) {
            switch(ops[counter]) {


                case 0: {
                    if (!proposed.full()) {
                        ap_uint<32> val;
                        val.range(31, 30) = 0;
                        val.range(29, 0) = amount[counter];
                        proposed.write(ProposedValue(val, 0));
                        read_op = false;
                    }
                    break;
                }


                case 1: {
                    if (!proposed.full()) {
                        ap_uint<32> val;
                        val.range(31, 30) = 1;
                        val.range(29, 0) = amount[counter];
                        proposed.write(ProposedValue(val, 0));
                        read_op = false;
                    }
                    break;
                }


                case 2: {

                    ap_uint<32> temp = amount[counter];
                    ap_uint<32> val;

                    if (!proposed.full()){
                        if (student[(int) temp.range(31, 16)] && courses[(int) temp.range(15, 0)]) {
                            val.range(31, 30) = 2;
                            val.range(29, 15) = temp.range(31, 16);
                            val.range(14, 0) = temp.range(15, 0);
                            proposed.write(ProposedValue(val, 0));
                            read_op = false;
                        } else {
                            counter++;
                        }
                    }
                    break;
                }


                case 3: {
                    if (!broadcast_req.full() && !update_set_request.full()) {

                        if (!student[(int) amount[counter]]) {
                            broadcast_req.write(amount[counter]);
                            student[amount[counter]] = true;
                            student_size++;
                            update_set_request.write(amount[counter]);
                        }

                        counter++;
                    }
                    break;
                }


                case 4: {
                    if (!query_mem_req.full()) {
                        query_mem_req.write(course_size + enroll_size);
                        counter++;
                    }
                    break;
                }

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

        crdt_gset(
            broadcast_req,
            ncc_tx_meta,
            ncc_tx_data,
            myBoardNum,
            num_nodes
        );

        meta_merger( smr_tx_meta,
                ncc_tx_meta,
                m_axis_tx_meta
                );

        data_merger(
            smr_tx_data,
            ncc_tx_data,
            m_axis_tx_data
        );

        if (!smr_finished.empty()) {
            bool temp;
            smr_finished.read(temp);

            read_op = true;
            counter++;
        }

        if (!smr_updated.empty()) {

            ap_uint<256> temp;
            smr_updated.read(temp);
            switch(temp.range(31, 30)) {
                case 0: {
                    courses[(int) temp.range(29, 0)] = true;
                    course_size += 1;
                    break;
                }

                case 1: {
                    courses[(int) temp.range(29, 0)] = false;
                    course_size -= 1;
                    break;
                }

                case 2: {
                    enroll[enroll_counter] = temp;
                    enroll_size+=1;
                    enroll_counter++;
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
                        hls::stream<ap_uint<32>>& minPropReadBram_req,
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
    static ap_uint<32> tmp_set_size = 0;

    static ap_uint<32> minPropIndex;
    static LogEntry slotIndex;
    static ap_uint<32> slotRead;
    static int log_index[NUM_NODES];

    ap_uint<32> tmp_local_counter = 1000;
    static bool student[2000];
    VITIS_LOOP_753_1: for (int i = 0; i < 1000; i++) {
        student[i] = true;
    }

    static int minProp = 0;
    static ap_uint<64> maxPropNumber = 0;
    static int propNum, propValue;
    static bool check_throughput_counter = false;

    //VITIS_LOOP_762_2: while (query_cnt<query_num && exe_cnt < exe) {
    while(query_cnt < query_num) {
        exe_cnt++;
        internal_clock++;

        if(!axis_mem_request.empty()){

            axis_mem_request.read(tmp_set_size);
            query_cnt++;
            reply[28] = tmp_set_size;
            reply[29] = tmp_local_counter;


        }

        if (!update_set_request.empty()) {
            ap_uint<64> temp;
            update_set_request.read(temp);
            if (!student[(int) temp]) {
                student[(int) temp] = true;
                tmp_local_counter++;
            }
        }

        if (!minPropReadBram_req.empty() && !minPropReadBram_rsp.full()) {

            minPropReadBram_req.read(minPropIndex);

            VITIS_LOOP_790_3: for (int i = 0; i < node_num-1; i++) {
                int temp = network_ptr[LOG_BASE_PTR + 2 + FIFO_LENGTH * i + (minPropIndex%FIFO_LENGTH)];
                if (temp > minProp) {
                    minProp = temp;
                }
            }
            minPropReadBram_rsp.write(minProp);

        }

        if (!readSlotsReadBram_req.empty() && !readSlotsReadBram_rsp.full()) {

            readSlotsReadBram_req.read(slotIndex);
            maxPropNumber = 0;
            VITIS_LOOP_804_4: for (int i = 0; i < node_num-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex.fuo%NUM_SLOTS)];
                    propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex.fuo%NUM_SLOTS) + 1];
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

        }

        if (!logReadBram_req.empty() && !logReadBram_rsp.full()) {

            logReadBram_req.read(slotRead);
            ap_uint<64> slot = 0;
            propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotRead%NUM_SLOTS];
            propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotRead%NUM_SLOTS + 1];
            slot.range(63, 32) = propValue;
            slot.range(31, 0) = propNum;
            logReadBram_rsp.write(slot);

        }

        if(internal_clock==update_period){
            internal_clock=0;
            remote_counter=0;

            VITIS_LOOP_839_5: for (int i=0; i<node_num; i++){
                if(i!=board_num){

                    tmp_hbm=network_ptr[BROADCAST_BASE_PTR + (i*9000)+log_index[i]];
                    if(tmp_hbm!=0){
                        log_index[i]++;
                        if (!student[tmp_hbm]) {
                            student[tmp_hbm] = true;
                            tmp_local_counter++;
                        }


                        remote_counter = hbm_tmp + remote_counter;
                    }
                }


            }
        }
    }

    #if TH
    static int fin_sig_found = false;
    VITIS_LOOP_862_6: while (query_cnt == query_num && board_num != 0 && !fin_sig_found) {
        if (network_ptr[LOG_BASE_PTR] >= exe) {
            fin_sig_found = true;
        }
    }
    #endif

}

void courseware_krnl(
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
 static hls::stream<ap_uint<32>> minPropReadBram_req;
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

 course(
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
