#include "util.h"

void replication_engine_fsm(
    hls::stream<ProposedValue>& proposedValue,
    hls::stream<ap_uint<32>>& minProp_req,
    hls::stream<ap_uint<32>>& minProp_rsp,
    hls::stream<ap_uint<32>>& writeNewProp_req,
    hls::stream<LogEntry>& readSlots_req,  
    hls::stream<LogEntry>& readSlots_rsp, 
    hls::stream<LogEntry>& writeSlot_rep,
    hls::stream<bool>& writeSlot_rsp,
    hls::stream<ap_uint<32>>& acceptedValue_req,
    hls::stream<updateLocalValue>& acceptedValue_rsq,
    hls::stream<updateLocalValue>& updateLocalValue_req,
    int myBoardNum, 
    int num_nodes
    //int* reply
) {

    #pragma HLS INTERFACE axis port = proposedValue
    #pragma HLS INTERFACE axis port = minProp_req
    #pragma HLS INTERFACE axis port = minProp_rsp
    #pragma HLS INTERFACE axis port = writeNewProp_req
    #pragma HLS INTERFACE axis port = readSlots_req
    #pragma HLS INTERFACE axis port = readSlots_rsp
    #pragma HLS INTERFACE axis port = writeSlot_rep
    #pragma HLS INTERFACE axis port = writeSlot_rsp
    #pragma HLS INTERFACE axis port = acceptedValue_req
    #pragma HLS INTERFACE axis port = acceptedValue_rsq
    #pragma HLS INTERFACE axis port = updateLocalValue_req


    enum fsmStateType {INIT, LEADER_REPLICA, PROPOSE, READ_MIN_PROP_REQ, READ_MIN_PROP_RSP, WRITE_MIN_PROP_AND_READ_SLOT, CHECK_SLOTS, ACCEPT_WRITE, ACCEPT_DONE, REPLICA, REPLICA_CHECK};
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

    /* Initial state for finite state machine*/
    case INIT:
        state = LEADER_REPLICA;
        break;
    
    /* Seperates leader and replica operations */
    case LEADER_REPLICA:
        if (myBoardNum == leader)
            state = PROPOSE; 
        else 
            state = REPLICA; 
        break;

    /* Checks if a new value has been proposed, if so service it.
        if not, check if previous value are finished. if not service them. 
        If they are done, go back to check if we are still leader and wait. 
     */
    case PROPOSE: 
        if (done == true && !proposedValue.empty()) {
            proposedValue.read(pVal);
            // reply[19] = 9999;
            // reply[20] = pVal.value;
            myValue = pVal.value; 
            sGroup = pVal.syncronizationGroup;
            done = false; 
            state = READ_MIN_PROP_REQ; 
        } else if (done) {
            // reply[19] = 8888;
            // reply[20] = pVal.value;
            state = LEADER_REPLICA; 
        } else {
            state = READ_MIN_PROP_REQ; 
        }
        break;  
    
    /* Request the largest minimum proposal number from the replicas */
    case READ_MIN_PROP_REQ: 
        minProp_req.write(sGroup);
        state = READ_MIN_PROP_RSP; 
        break; 
    
    /* After reading all the minimum proposal numbers, offer +1 */
    case READ_MIN_PROP_RSP: 
        if (!minProp_rsp.empty()) {
            minProp_rsp.read(newHiPropNum);
            newHiPropNum+=1; 
            state = WRITE_MIN_PROP_AND_READ_SLOT;
        }
        break; 
    
    /* Write the new minimum proposal number, then read the slots at the current FUO of all replicas */
    case WRITE_MIN_PROP_AND_READ_SLOT:  
        writeNewProp_req.write(newHiPropNum);
        readSlots_req.write(LogEntry(sGroup));
        state = CHECK_SLOTS; 
        break;
    
    /* If the slots are empty, propose your new value. If not accept the non-zero replica value. */
    case CHECK_SLOTS: 
        if (!readSlots_rsp.empty()) {
            readSlots_rsp.read(slot);
            if (slot.valid) {
                // reply[22] = 9999;
                // reply[23] = slot.value;
                propValue = slot.value;
            } else {
                // reply[22] = 1010101; 
                // reply[23] = myValue; 
                propValue = myValue; 
            }
            state = ACCEPT_WRITE; 
        }
        break; 
    
    /* Write the accepted value to all replicas slots */
    case ACCEPT_WRITE: 
        writeSlot_rep.write(LogEntry(newHiPropNum, propValue, sGroup));
        state = ACCEPT_DONE;
        break; 
    
    /* Update locally, and set done to true if your own proposal was serviced. */
    case ACCEPT_DONE: 
        if (myValue == propValue) {
            // reply[25] = 212121;
            done = true; 
        } 
        // reply[26] = myValue;
        updateLocalValue_req.write(updateLocalValue(propValue, sGroup));  
        state = LEADER_REPLICA;
        break; 


    /* Replica queries log */
    case REPLICA: 
        if (!acceptedValue_req.full()) {
            acceptedValue_req.write(1);
            state = REPLICA_CHECK; 
        }
        break; 
    
    /* If log is non-zero update locally. */
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
    hls::stream<ap_uint<32>>& minProp_req,
    hls::stream<ap_uint<32>>& minProp_rsp,
    hls::stream<ap_uint<32>>& writeNewProp_req,
    hls::stream<LogEntry>& readSlots_req,
    hls::stream<LogEntry>& readSlots_rsp, 
    hls::stream<LogEntry>& writeSlot_rep,
    hls::stream<bool>& writeSlot_rsp,
    hls::stream<ap_uint<32>>& acceptedValue_req,
    hls::stream<updateLocalValue>& acceptedValue_rsq,
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    int myBoardNum,
    int num_nodes
    //int* reply
) {

    enum fsmStateType {REQUEST, READ_MIN_PROP, READ_MIN_PROP_1_RSP, READ_MIN_PROP_2_RSP, WRITE_READ, WRITE_READ_RSP_1, WRITE_READ_RSP_2, WRITE_SLOT, ACCEPT_VALUE_1, ACCEPT_VALUE_2};
    static fsmStateType state = REQUEST; 
    static int reads = 0; 
    static ap_uint<32> sGroup = 0; 
    static int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS]; 
    static LogEntry logSlot; 
    static int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp; 
    static ap_uint<64> slot;
    static ap_uint<32> minPropNumber = 0;
    static ap_uint<32> oldMinPropNumber = 0;

    if (!minProp_req.empty()) {
        minProp_req.read(sGroup);

        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
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

    } else if (!minPropReadBram_rsp.empty()) {
        minPropReadBram_rsp.read(minPropNumber);
        if (minPropNumber != oldMinPropNumber || minPropFifoIndex[sGroup] == 0) {
            minPropFifoIndex[sGroup]+=1; 
            oldMinPropNumber = minPropNumber;
            minProp_rsp.write(minPropNumber);
        } else {
            minPropReadBram_req.write(minPropFifoIndex[sGroup]);
        }
    } else if (!writeNewProp_req.empty() && !readSlots_req.empty()) {
        readSlots_req.read(logSlot);
        sGroup = logSlot.syncGroup; 
        writeNewProp_req.read(newMinProp);
        
        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        LOG_BASE_ADDR,
                        0x8,
                        newMinProp,
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
        while (j<num_nodes){
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
        readSlotsReadBram_req.write(slotReadFifoIndex[sGroup]);    
    } else if (!readSlotsReadBram_rsp.empty()) {
        readSlotsReadBram_rsp.read(slot);
        if (slot.range(31,0) != 0) {
            // reply[11] = 4444; 
            readSlots_rsp.write(LogEntry(slot.range(31,0), slot.range(63, 32), true));
        } else {
            // reply[12] = 5555; 
            readSlots_rsp.write(LogEntry());
        }
        slotReadFifoIndex[sGroup]+=2; 

    } else if (!writeSlot_rep.empty()) {
        writeSlot_rep.read(logSlot);
        sGroup = logSlot.syncGroup; 

        ap_uint<64> sendLog; 
        sendLog.range(31, 0) = logSlot.propVal;
        sendLog.range(63, 32) = logSlot.value;
        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
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

    } else if (!acceptedValue_req.empty() && !logReadBram_req.full()) {
        acceptedValue_req.read(sGroup);
        logReadBram_req.write(slotAcceptFifoIndex[0]);
    } else if (!logReadBram_rsp.empty() && !acceptedValue_rsq.full()) {
        logReadBram_rsp.read(slot);
        if (slot.range(31, 0) != 0) {
            acceptedValue_rsq.write(updateLocalValue(slot.range(63, 32), 0));
            slotAcceptFifoIndex[0]+=2;
        }
    }
}

void smr(
    hls::stream<bool>& smr_finished, 
    hls::stream<ProposedValue>& proposedValue,
    hls::stream<int>& permissible_req, 
    hls::stream<int>& permissible_rsp, 
    hls::stream<int>& query_req, 
    hls::stream<int>& query_rsp, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    int myBoardNum, 
    int num_nodes
    //int *network_ptr 
    //int* reply
) {

    static int localValues[SYNC_GROUPS];

    static hls::stream<ap_uint<32>> minProp_req("minimum_prop_request");
    static hls::stream<ap_uint<32>> minProp_rsp("minimum_prop_response");
    static hls::stream<ap_uint<32>> writeNewProp_req("write_new_prop_request");
    static hls::stream<LogEntry> readSlots_req("read_slot_request");  
    static hls::stream<LogEntry> readSlots_rsp("read_slot_response"); 
    static hls::stream<LogEntry> writeSlot_req("write_slot_request");
    static hls::stream<bool> writeSlot_rsp("write_slot_response");
    static hls::stream<ap_uint<32>> acceptedValue_req("accepted_value_request");
    static hls::stream<updateLocalValue> acceptedValue_rsq("accepted_value_response"); 
    static hls::stream<updateLocalValue> updateLocalValue_req;  
    static updateLocalValue update; 
    static int permissible; 
    static int query; 
    static int counter = 0; 

    replication_engine_fsm(
        proposedValue,
        minProp_req,
        minProp_rsp,
        writeNewProp_req,
        readSlots_req,
        readSlots_rsp,
        writeSlot_req,
        writeSlot_rsp,
        acceptedValue_req,
        acceptedValue_rsq,
        updateLocalValue_req,
        myBoardNum,
        num_nodes
        //reply
    );

    log_handler_fsm(
        minProp_req,
        minProp_rsp,
        writeNewProp_req,
        readSlots_req,
        readSlots_rsp,
        writeSlot_req,
        writeSlot_rsp,
        acceptedValue_req,
        acceptedValue_rsq,
        m_axis_tx_meta,
        m_axis_tx_data,
        minPropReadBram_req,
        minPropReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        myBoardNum,
        num_nodes
        //reply
        //network_ptr    
    );

    //Update from Conflicting Method Calls
    if (!updateLocalValue_req.empty()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] += update.value;
        counter++; 
        
        if (myBoardNum == 0) {
            //reply[29] = counter; 
            smr_finished.write(1);
        }
    }

    //Update from Non-Conflicting Method Calls
    //Need to check Permissibility
    if (!permissible_req.empty() && !permissible_rsp.full()) {
        permissible_req.read(permissible);
        permissible_rsp.write(localValues[permissible]);
    }

    if (!query_req.empty() && !query_rsp.full()) {
        query_req.read(query);
        query_rsp.write(localValues[query]);
    }


}


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
                        BROADCAST_BASE_ADDR + (4 * 2 * myBoardNum),
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
    static hls::stream<bool> ncc_finished; 
    #pragma HLS STREAM depth=8 variable=smr_finished
    #pragma HLS STREAM depth=8 variable=ncc_finished
    static hls::stream<ProposedValue> proposed; 
    #pragma HLS STREAM depth=8 variable=proposed
    static hls::stream<int> broadcast_req; 
    static hls::stream<int> smr_permissble_req; 
    #pragma HLS STREAM depth=8 variable=smr_permissble_req
    static hls::stream<int> smr_permissible_rsp; 
    #pragma HLS STREAM depth=8 variable=smr_permissible_rsp
    static hls::stream<int> ncc_permissible_req; 
    #pragma HLS STREAM depth=8 variable=ncc_permissible_req
    static hls::stream<int> ncc_permissible_rsp; 
    #pragma HLS STREAM depth=8 variable=ncc_permissible_rsp
    static hls::stream<int> smr_query_req; 
    static hls::stream<int> smr_query_rsp; 
    #pragma HLS STREAM depth=8 variable=smr_query_req
    #pragma HLS STREAM depth=8 variable=smr_query_rsp

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
    static bool read_op = true; 
    static int inital_value = 100000; 

    while (debug_counter < debug_exe && counter < num_ops) {
    //while(counter < num_ops && RTS) {
        reply_bank[0] = debug_counter; 
        reply_bank[1] = counter; 
        if (read_op) {
            switch(ops[counter]) {

                case 0: {
                    if (!smr_permissble_req.full() && !ncc_permissible_req.full()) {
                        smr_permissble_req.write(0);
                        ncc_permissible_req.write(0);
                        read_op = false; 
                    }
                    break; 
                }

                case 1: {
                    if (!broadcast_req.full()) {
                        broadcast_req.write(amount[counter]);
                        read_op = false; 
                    }
                    break;
                }

                case 2: {
                    if (!smr_query_req.full()){ 
                        smr_query_req.write(0);
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
            num_nodes
            //m_axi_reply
            );

        crdt_counter(
            ncc_finished,
            broadcast_req, 
            ncc_permissible_req,
            ncc_permissible_rsp, 
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

        if (!smr_permissible_rsp.empty() && !ncc_permissible_rsp.empty()) {
            int smr_value, ncc_value; 
            smr_permissible_rsp.read(smr_value);
            ncc_permissible_rsp.read(ncc_value);
            if (inital_value + smr_value + ncc_value - amount[counter] >= 0) {
                proposed.write(ProposedValue(-amount[counter], 0));
            } else {
                read_op = true; 
                counter++; 
            }
        } 
        if (!smr_query_rsp.empty() && !query_mem_req.full()) { 
            int smr_query, ncc_query;
            smr_query_rsp.read(smr_query); 
            query_mem_req.write(inital_value + smr_query);
            read_op = true;
            counter++; 
        } 
        if (!smr_finished.empty()) {
            bool temp; 
            smr_finished.read(temp);
            read_op = true;
            counter++; 
        } 
        if (!ncc_finished.empty()) {
            bool temp; 
            ncc_finished.read(temp);
            read_op = true;
            counter++; 
        }

        debug_counter++; 
    }

}

void mem_manager(  int *network_ptr, 
                        int *reply, 
                        int node_num, 
                        int board_num, 
                        int query_num, 
                        int exe, 
                        hls::stream<ap_uint<32>>& axis_mem_request,
                        hls::stream<ap_uint<32>>& minPropReadBram_req,
                        hls::stream<ap_uint<32>>& minPropReadBram_rsp,
                        hls::stream<ap_uint<32>>& readSlotsReadBram_req,
                        hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
                        hls::stream<ap_uint<32>>& logReadBram_req,
                        hls::stream<ap_uint<64>>& logReadBram_rsp
                    ){


    #pragma HLS INTERFACE axis port = axis_mem_request
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_req
    #pragma HLS INTERFACE axis port = logReadBram_rsp


    static int bram_counter=0;
    static int update_period=1000;
    static ap_uint<512> internal_clock=0;
    static int local_counter=0;
    static int query_cnt=0;
    static int exe_cnt = 0; 
    static int remote_counter=0;
    static int hbm_tmp=0;

    static ap_uint<32> minPropIndex; 
    static ap_uint<32> slotIndex; 

    ap_uint<32> tmp_local_counter;
    static int minProp = 0; 
    static ap_uint<64> maxPropNumber = 0; 
    static int propNum, propValue;  
    // static int bram_minPropFifos[64];
    // //#pragma HLS array_partition variable=bram_minPropFifos complete dim=1
    // static int bram_slotFifos[128];
    // //#pragma HLS array_partition variable=bram_slotFifos complete dim=1
    // static int bram_Log[25000];
    //#pragma HLS array_partition variable=bram_Log complete dim=1

    while (query_cnt<query_num && exe_cnt < exe){

        // reply[0] = internal_clock; 
        // reply[1] = query_cnt;
        exe_cnt++; 

        internal_clock++;
        if(!axis_mem_request.empty()){

            axis_mem_request.read(tmp_local_counter);
            query_cnt++;
            
            // reply[2] = 111;
            reply[29] = bram_counter;
            // reply[4] = internal_clock; 
            // reply[5] = query_cnt;
            local_counter=tmp_local_counter;

        } 
        
        if (!minPropReadBram_req.empty()) {

            minPropReadBram_req.read(minPropIndex);
            //minProp = 0; 
            for (int i = 0; i < node_num-1; i++) {
                int temp = network_ptr[LOG_BASE_PTR + 2 + FIFO_LENGTH * i + (minPropIndex%FIFO_LENGTH)];
                if (temp > minProp) {
                    minProp = temp; 
                } 
            }

            // reply[6] = 222;
            // reply[7] = minProp + 1; 
            // reply[8] = internal_clock; 
            // reply[9] = query_cnt;

            minPropReadBram_rsp.write(minProp);

        } 
        
        if (!readSlotsReadBram_req.empty()) {

            readSlotsReadBram_req.read(slotIndex);
            maxPropNumber = 0; 
            for (int i = 0; i < node_num-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS)];
                    propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotIndex%NUM_SLOTS) + 1];

                    if (propNum != 0) {
                        maxPropNumber.range(31, 0) = propNum; 
                        maxPropNumber.range(64, 32) = propValue; 
                    }
                }
            }
            // reply[10] = 333;
            // reply[11] = 0; 
            // reply[12] = internal_clock; 
            // reply[13] = query_cnt;
            readSlotsReadBram_rsp.write(maxPropNumber);

        } 
        
        if (!logReadBram_req.empty() && !logReadBram_rsp.full()) {

            logReadBram_req.read(slotIndex);
            ap_uint<64> slot = 0;
            propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotIndex%NUM_SLOTS];
            propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotIndex%NUM_SLOTS + 1];
            slot.range(63, 32) = propValue; 
            slot.range(31, 0) = propNum;
            // reply[14] = 444;
            // reply[15] = 0; 
            // reply[16] = internal_clock; 
            // reply[17] = query_cnt;
            logReadBram_rsp.write(slot);

        }
        
        if(internal_clock==update_period){
            internal_clock=0;
            remote_counter=0;

            // reply[6] = 555;

            for (int i=0; i<node_num; i++){
                if(i!=board_num){
                    hbm_tmp=network_ptr[BROADCAST_BASE_PTR + 2*i];
                    remote_counter = hbm_tmp + remote_counter;
                }
            }

            bram_counter = remote_counter + local_counter;
        }


        // if (internal_clock % 5 == 0) {
        //     if (leader == board_num) {
        //         for (int i = 0; i < 64; i++) {
        //             //#pragma HLS UNROLL factor=32
        //             bram_minPropFifos[i] = network_ptr[LOG_BASE_PTR + i];
        //         }
        //         for (int i = 0; i < 128; i++) {
        //             //#pragma HLS UNROLL factor=32
        //             bram_slotFifos[i] = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + i];
        //         }
        //     }  else  {
        //         for (int i = 0; i < 25000; i++) {
        //             //#pragma HLS UNROLL factor = 32
        //             bram_Log[i] =  network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + i];
        //         }
        //     }
        // }

    }
}

void bank_account_krnl(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<pkt64>& s_axis_tx_status,
    int myBoardNum,
    int* ops, 
    int* amount, 
    int num_ops, 
    int* reply_bank,
    int* reply_bram, 
    int* network_ptr,
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
    static hls::stream<ap_uint<32>> readSlotsReadBram_req;
    static hls::stream<ap_uint<64>> readSlotsReadBram_rsp;
    static hls::stream<ap_uint<32>> logReadBram_req;
    static hls::stream<ap_uint<64>> logReadBram_rsp;
    #pragma HLS STREAM depth=8 variable=minPropReadBram_req
    #pragma HLS STREAM depth=8 variable=minPropReadBram_rsp
    #pragma HLS STREAM depth=8 variable=readSlotsReadBram_req
    #pragma HLS STREAM depth=8 variable=readSlotsReadBram_rsp
    #pragma HLS STREAM depth=8 variable=logReadBram_req
    #pragma HLS STREAM depth=8 variable=logReadBram_rsp

    static int bram_debug_exe, bank_debug_exe;
    bram_debug_exe = debug_exe; 
    bank_debug_exe = debug_exe; 
    if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
    }

    #pragma HLS dataflow



    bank(
        m_axis_tx_meta,
        m_axis_tx_data,
        query_mem_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
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
        logReadBram_rsp
    );

}

