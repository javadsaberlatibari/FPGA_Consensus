#include "smr.h"

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
    int num_nodes,
    int* reply
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
    //static int counter = 0; 
    static bool done = true; 
    static int myValue = 0; 
    static ap_uint<32> sGroup = 0;  
    static ProposedValue pVal; 
    static ap_uint<32> newHiPropNum = 0; 
    static LogEntry slot; 
    static int myFUO[SYNC_GROUPS]; 
    static int propValue = 0; 
    static updateLocalValue uVal; 

    switch (state)
    {
    case INIT:
        //reply[0] = 11 + counter; 
        state = LEADER_REPLICA;
        break;
    
    case LEADER_REPLICA:
        //reply[1] = 22 + counter; 
        if (myBoardNum == leader)
            state = PROPOSE; 
        else 
            state = REPLICA; 
        break;

    /* In Propose state read proposed value, and request follower list*/
    case PROPOSE: 
        reply[19] = 333; 
        if (done == true && !proposedValue.empty()) {
            proposedValue.read(pVal);
            myValue = pVal.value; 
            sGroup = pVal.syncronizationGroup;
            reply[20] = myValue;
            done = false; 
            state = READ_MIN_PROP_REQ; 
        } else if (done) {
            reply[20] = 333;
            state = LEADER_REPLICA; 
        } else {
            reply[20] = 222;
            state = READ_MIN_PROP_REQ; 
        }
        //counter++;
        break; 

    case READ_MIN_PROP_REQ: 
        //reply[4] = 44 + counter; 
        minProp_req.write(sGroup);
        state = READ_MIN_PROP_RSP; 
        break; 
    

    case READ_MIN_PROP_RSP: 
        //reply[4] = 55 + counter; 
        //counter++; 
        if (!minProp_rsp.empty()) {
            minProp_rsp.read(newHiPropNum);
            newHiPropNum+=1; 
            reply[21] = newHiPropNum;
            state = WRITE_MIN_PROP_AND_READ_SLOT;
        }
        break; 
        
    case WRITE_MIN_PROP_AND_READ_SLOT: 
        //reply[5] = 66 + counter; 
        writeNewProp_req.write(newHiPropNum);
        readSlots_req.write(LogEntry(sGroup));
        state = CHECK_SLOTS; 
        break;
    

    case CHECK_SLOTS: 
        //reply[6] = 77 + counter; 
        if (!readSlots_rsp.empty()) {
            readSlots_rsp.read(slot);
            if (slot.valid) {
                propValue = slot.value;
            } else {
                propValue = myValue; 
            }
            state = ACCEPT_WRITE; 
        }
        break; 
    

    case ACCEPT_WRITE: 
        //reply[7] = 88 + counter; 
        writeSlot_rep.write(LogEntry(newHiPropNum, propValue, sGroup));
        state = ACCEPT_DONE;
        break; 
    

    case ACCEPT_DONE: 
        //reply[8] = 99 + counter; 
        if (myValue == propValue) {
            done = true; 
        } 
        updateLocalValue_req.write(updateLocalValue(propValue, sGroup));  
        //myFUO[sGroup]+=1; 
        state = LEADER_REPLICA;
        break; 

    case REPLICA: 
        /* Check for new entries in the local log */
        //reply[9] = 101 + counter; 
        acceptedValue_req.write(1);
        state = REPLICA_CHECK; 
        break; 
    

    case REPLICA_CHECK: 
        //reply[10] = 202 + counter; 
        if (!acceptedValue_rsq.empty()) {
            acceptedValue_rsq.read(uVal);
            updateLocalValue_req.write(uVal);
            state = LEADER_REPLICA;
        } else {
            state = REPLICA; 
        }
        //counter++; 
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

    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& readSlotsReadBram_req,
    hls::stream<ap_uint<64>>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,

    int myBoardNum,
    int num_nodes,
    //int* network_ptr
    int* reply
) {

    enum fsmStateType {REQUEST, READ_MIN_PROP, READ_MIN_PROP_1_RSP, READ_MIN_PROP_2_RSP, WRITE_READ, WRITE_READ_RSP_1, WRITE_READ_RSP_2, WRITE_SLOT, ACCEPT_VALUE_1, ACCEPT_VALUE_2};
    static fsmStateType state = REQUEST; 
    static int reads = 0; 
    static int call_counter = 0; 
    static ap_uint<32> sGroup = 0; 
    static int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS]; 
    static LogEntry logSlot; 
    static int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp; 
    static ap_uint<64> slot;
    static ap_uint<32> minPropNumber = INT_MIN;

    switch (state)
    {
    case REQUEST: {
        if (!minProp_req.empty()) {
            minProp_req.read(sGroup);
            state = READ_MIN_PROP; 

        } else if (!writeNewProp_req.empty() && !readSlots_req.empty()) {
            readSlots_req.read(logSlot);
            sGroup = logSlot.syncGroup; 
            writeNewProp_req.read(newMinProp);
            state = WRITE_READ; 

        } else if (!writeSlot_rep.empty()) {
            writeSlot_rep.read(logSlot);
            sGroup = logSlot.syncGroup; 
            state = WRITE_SLOT;

        } else if (!acceptedValue_req.empty()) {
            acceptedValue_req.read(sGroup);
            state = ACCEPT_VALUE_1;
        } else {
            state = REQUEST; 
        }
        call_counter+=1;
        break;
    }
    case READ_MIN_PROP: {
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
        state = READ_MIN_PROP_1_RSP; 
        break;
    }

    case READ_MIN_PROP_1_RSP: {
        minPropReadBram_req.write(minPropFifoIndex[sGroup]);
        state = READ_MIN_PROP_2_RSP; 
        break;    
    }

    case READ_MIN_PROP_2_RSP: {
        if (!minPropReadBram_rsp.empty()) {
            minPropReadBram_rsp.read(minPropNumber);
            if (minPropNumber != 0 || minPropFifoIndex[sGroup] == 0) {
                minPropFifoIndex[sGroup]+=1; 
                minProp_rsp.write(minPropNumber);
                state = REQUEST; 
            } else {
                state = READ_MIN_PROP_1_RSP; 
            }
        }
    }
    
    case WRITE_READ: {
        reply[22] = newMinProp; 
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
        state = WRITE_READ_RSP_1;
        break; 
    }

    case WRITE_READ_RSP_1: {
        readSlotsReadBram_req.write(slotReadFifoIndex[sGroup]);
        state = WRITE_READ_RSP_2; 
        break; 
    }

    case WRITE_READ_RSP_2: {
        if (!readSlotsReadBram_rsp.empty()) {
            readSlotsReadBram_rsp.read(slot);
            if (slot.range(31,0) != 0) {
                reply[23] = 4444; 
                readSlots_rsp.write(LogEntry(slot.range(31,0), slot.range(63, 32), true));
            } else {
                reply[23] = 5555; 
                readSlots_rsp.write(LogEntry());
            }
            slotReadFifoIndex[sGroup]+=2; 
            state = REQUEST; 
        }
    }

    case WRITE_SLOT: {
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
        state = REQUEST; 
        break; 
    }

    case ACCEPT_VALUE_1: {
        logReadBram_req.write(slotAcceptFifoIndex[0]);
        state = ACCEPT_VALUE_2; 
        break;
    }    

    case ACCEPT_VALUE_2: {
        if (!logReadBram_rsp.empty()) {
            logReadBram_rsp.read(slot);
            if (slot != 0) {
                acceptedValue_rsq.write(updateLocalValue(slot.range(63, 31), 0));
                slotAcceptFifoIndex[0]+=2;
            }
            state = REQUEST; 
        }
    }   

    default:
        break;
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
    int num_nodes,
    //int *network_ptr 
    int* reply
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
        num_nodes,
        reply
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
        logReadBram_req,
        logReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        minPropReadBram_req,
        minPropReadBram_rsp,
        myBoardNum,
        num_nodes,
        reply
        //network_ptr    
    );

    //Update from Conflicting Method Calls
    if (!updateLocalValue_req.empty()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] += update.value;
        if (myBoardNum == 0) {
            smr_finished.write(1);
        }
    }

    //Update from Non-Conflicting Method Calls
    //Need to check Permissibility
    if (!permissible_req.empty()) {
        permissible_req.read(permissible);
        permissible_rsp.write(localValues[permissible]);
    }

    if (!query_req.empty()) {
        query_req.read(query);
        query_rsp.write(localValues[query]);
    }


}
