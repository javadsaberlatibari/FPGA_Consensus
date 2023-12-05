#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"



const int NUM_NODES = 12; 
const int SYNC_GROUPS = 1; 

// Need for QP info
const ap_uint<32> BASE_IP_ADDR = 0xe0d4010b;
const uint32_t UDP = 0x000012b7;

// Written by Leader Switch and read by Log Handler
bool FOLLOWER_LIST[NUM_NODES-1] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

//25% write log size (smaller % can use this as well)
const int NUM_SLOTS = 25000 * 2; 
const int FIFO_LENGTH = 5;

// Constants for HeartBeat Memory
// Only 1 HB regardless of number of sync groups
const int HB_BASE_PTR = 0;
const int HB_BASE_ADDR = 0;
const int HB_PTR_LEN = NUM_NODES; 
const int HB_ADDR_LEN = 4 * HB_PTR_LEN; 

// Constants for replication logs
// Scales with numberof sync groups
const int LOG_BASE_PTR = HB_PTR_LEN; 
const int LOG_BASE_ADDR = HB_ADDR_LEN; 
const int LOG_MIN_PROP_PTR_LEN = 2 + (NUM_NODES-1) * FIFO_LENGTH; // local heartbeat and remote heartbeat queue
const int LOG_MIN_PROP_ADDR_LEN = 4 * LOG_MIN_PROP_PTR_LEN; 
const int LOG_LOCAL_LOG_PTR_LEN = NUM_SLOTS; // local log 
const int LOG_LOCAL_LOG_ADDR_LEN = 4 * LOG_LOCAL_LOG_PTR_LEN; 
const int LOG_REMOTE_LOG_QUEUE_PTR_LEN = 2 * (NUM_NODES-1) * FIFO_LENGTH;
const int LOG_REMOTE_LOG_QUEUE_ADDR_LEN = 4 * LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
const int LOG_PTR_LEN = LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
const int LOG_ADDR_LEN = LOG_PTR_LEN * 4; 

const int BROADCAST_BASE_PTR = HB_PTR_LEN + LOG_PTR_LEN;
const int BROADCAST_BASE_ADDR = HB_ADDR_LEN + LOG_ADDR_LEN;
/* # of Nonconflicting calls*/
const int BROADCAST_SG_LEN = 1000; 

struct ProposedValue {
    int value; 
    ap_uint<32> syncronizationGroup;
    ProposedValue()
        :value(0), syncronizationGroup(0){}
    ProposedValue(int v, ap_uint<32> s)
        : value(v), syncronizationGroup(s) {}
};

struct updateLocalValue {
    ap_uint<32> value; 
    ap_uint<32> syncGroup;
    updateLocalValue()
        :value(0), syncGroup(0) {}
    updateLocalValue(ap_uint<32> v, ap_uint<32> s)
        :value(v), syncGroup(s) {} 
};

struct LogEntry
{
    ap_uint<32> propVal;
    ap_uint<32> value;
	ap_uint<32> fuo;
	ap_uint<32> syncGroup; 
	bool valid; 
    LogEntry()
        :valid(false) {}
    LogEntry(ap_uint<32> s)
        :valid(false), syncGroup(s) {}
    LogEntry(ap_uint<32> p, ap_uint<32> v, ap_uint<32> s) 
        :propVal(p), value(v), syncGroup(s) {}
    LogEntry(ap_uint<32> p, ap_uint<32> v, bool va) 
        :propVal(p), value(v), valid(va) {}
};

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    //hls::stream<pkt256>& m_axis_tx_meta
    hls::stream<ap_uint<256>>& m_axis_tx_meta
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    ap_uint<256> tx_meta;

    /*RDMA OP*/
    tx_meta.range(2,0) = 0x00000000; 
    /*lQPN*/
    tx_meta.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    */
    tx_meta.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.range(154, 123) = s_axi_len;
    m_axis_tx_meta.write(tx_meta);
    
}

void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    ap_uint<64>  write_value,
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    
    ap_uint<256> tx_meta;
    ap_uint<64> tx_data;

    /*RDMA OP*/
    tx_meta.range(2,0) = 0x00000001; 
    /*lQPN*/
    tx_meta.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    if 0 writes from tx_data. 
    */
    tx_meta.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.range(154, 123) = s_axi_len;
    
    if (!m_axis_tx_meta.full()) 
        m_axis_tx_meta.write(tx_meta);

    //Write data only if laddr is 0
    if (s_axi_laddr == 0) {
        tx_data.range(63, 0) = write_value;
        //tx_data.keep(7, 0) = 0xff;
        //tx_data.last = 1; 
        if (!m_axis_tx_data.full())
            m_axis_tx_data.write(tx_data);
    }

    
}

void merger(
    hls::stream<ap_uint<256>>& a_tx_meta,
    hls::stream<ap_uint<256>>& b_tx_meta,
    hls::stream<ap_uint<64>>& a_tx_data,
    hls::stream<ap_uint<64>>& b_tx_data,
    hls::stream<pkt256>& c_tx_meta,
    hls::stream<pkt64>& c_tx_data
) {

    ap_uint<256> temp_val_256; 
    pkt256 temp_pkt_256; 
    ap_uint<64> temp_val_64; 
    pkt64 temp_pkt_64; 

    if (!a_tx_meta.empty()) {
        a_tx_meta.read(temp_val_256);
        temp_pkt_256.data(255, 0) = temp_val_256.range(255, 0); 
        c_tx_meta.write(temp_pkt_256);
    }
    if (!a_tx_data.empty()) {
        a_tx_data.read(temp_val_64);
        temp_pkt_64.data(63, 0) = temp_val_64.range(63, 0); 
        temp_pkt_64.keep(7, 0) = 0xff;
        temp_pkt_64.last = 1; 
        c_tx_data.write(temp_pkt_64);
    }
    if (!b_tx_meta.empty()) {
        b_tx_meta.read(temp_val_256);
        temp_pkt_256.data(255, 0) = temp_val_256.range(255, 0); 
        c_tx_meta.write(temp_pkt_256);        
    }
    if (!b_tx_data.empty()) {
        b_tx_data.read(temp_val_64);
        temp_pkt_64.data(63, 0) = temp_val_64.range(63, 0); 
        temp_pkt_64.keep(7, 0) = 0xff;
        temp_pkt_64.last = 1; 
        c_tx_data.write(temp_pkt_64);        
    }
}

// enum heartBeatStates {
//     UPDATE,
//     SCAN, 
//     READ,
//     LEADER_ELECTION
// };

// void heartBeatScanner(
//     int myBoardNum, 
//     int *network_ptr,
//     hls::stream<ap_uint<32>>& leader_update,
//     hls::stream<ap_uint<256>>& m_axis_tx_meta
// ) {

//     static ap_uint<32> remoteHeartBeats[NUM_NODES];
//     static ap_uint<32> heartBeatScores[NUM_NODES];
//     static bool replicaAlive[NUM_NODES];
//     static heartBeatStates state = SCAN; 
//     static ap_uint<32> leader = 0; 
//     static ap_uint<32> newleader = 0; 

//     switch(state) {

//         case SCAN: {

//             int j=0; 
//             int qpn_tmp=myBoardNum*(NUM_NODES-1);
//             while (j<NUM_NODES){
//                 if(j!=myBoardNum) {
//                     if(!m_axis_tx_meta.full()){
//                         rdma_read(
//                             qpn_tmp,
//                             HB_BASE_ADDR + 4 + 4 * j,
//                             HB_BASE_ADDR,
//                             0x4,
//                             m_axis_tx_meta 
//                             );
//                         j++;
//                         qpn_tmp++;
//                     }
//                 }
//                 else {
//                     j++;
//                 }
//             }
//             state = READ; 
//             break; 
//         }

//         case READ: {
//             for (int i = 0; i < NUM_NODES; i++) {
//                 if (i != myBoardNum) {
//                     int temp_hb = network_ptr[HB_BASE_PTR + 1 + i];
//                     if (temp_hb > remoteHeartBeats[i]) {
//                         heartBeatScores[i]++; 
//                     } else {
//                         heartBeatScores[i]--; 
//                     }
//                     remoteHeartBeats[i] = temp_hb;
//                 }
//             }
//             state = LEADER_ELECTION; 
//             break; 
//         }

//         case LEADER_ELECTION: {

//             for (int i = 0; i < NUM_NODES; i++) {
//                 if (heartBeatScores[i] >= 6) {
//                     FOLLOWER_LIST[i] = true; 
//                     replicaAlive[i] = true; 
//                 } else if (heartBeatScores[i] < 2){
//                     FOLLOWER_LIST[i] = false; 
//                     replicaAlive[i] = false; 
//                 }
//             }
//             replicaAlive[myBoardNum] = true; 

//             for (int i = 0; i < NUM_NODES; i++) {
//                 if (replicaAlive[i] == true) {
//                     newleader = i;
//                     break; 
//                 }
//             }

//             if (newleader != leader) {
//                 leader_update.write(newleader);
//             }
//             state = SCAN;
//             break; 
//         }

//     }

// }


// template<int NUM_NODES>
// void permision_handler(
//     int myBoardNum, 
//     hls::stream<ap_uint<32>>& leader_update,
//     hls::stream<pkt256>& m_axis_qp_interface
// ) {

//     static ap_uint<32> leader = 0;
//     static ap_uint<32> newleader; 
//     static pkt256 qp_info;

//     if (!leader_update.empty()) {

//         leader_update.read(newleader);

//         if (newleader != leader && myBoardNum == newleader) {
//             leader = newleader;

//             /* Change permission */
//             int counter = 0; 

//             for (int i = 0; i < NUM_NODES; i++) {

//                 if (i != myBoardNum) {
//                     //Enable QP
//                     qp_info.data.range(2,0) = 2; //READY TO RECEIVE
//                     if (counter < myBoardNum)
//                         qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum - 1;
//                     else 
//                         qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum;

//                     qp_info.data.range(50, 27) = 0;
//                     qp_info.data.range(74, 51) = 0; 
//                     qp_info.data.range(90, 75) = 0x00000000; 
//                     qp_info.data.range(128, 91) = 0x0000000000000001;
//                     m_axis_qp_interface.write(qp_info);
//                 }

//             }


//         } else if (newleader != leader) {

//             if (leader == myBoardNum) {
//                 for (int i = 0; i < NUM_NODES; i++) {

//                     if (i != myBoardNum) {
//                         //Disable QP
//                         qp_info.data.range(2,0) = 0;  //INIT
//                         if (i < myBoardNum)
//                             qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum - 1;
//                         else 
//                             qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum;

//                         qp_info.data.range(50, 27) = 0;
//                         qp_info.data.range(74, 51) = 0; 
//                         qp_info.data.range(90, 75) = 0x00000000; 
//                         qp_info.data.range(128, 91) = 0x0000000000000001;
//                         m_axis_qp_interface.write(qp_info);
//                     }

//                 }
//             }

//             qp_info.data.range(2,0) = 0;  
//             if (leader < myBoardNum)
//                 qp_info.data.range(26, 3) = leader * (NUM_NODES-1) + myBoardNum - 1;
//             else 
//                 qp_info.data.range(26, 3) = leader * (NUM_NODES-1) + myBoardNum;

//             qp_info.data.range(50, 27) = 0;
//             qp_info.data.range(74, 51) = 0; 
//             qp_info.data.range(90, 75) = 0x00000000; 
//             qp_info.data.range(128, 91) = 0x0000000000000001;
//             leader = newleader;
//         }

//     }
// }


// template<int NUM_NODES, int HB_BASE_PTR, int HB_BASE_ADDR, int FIFO_LENGTH>
// void leaderSwitch(
//     int myBoardNum, 
//     int *network_ptr,
//     hls::stream<ap_uint<32>>& leader_update,
//     hls::stream<ap_uint<256>>& m_axis_tx_meta
//     //int *m_axi_reply
// ) {

//     static int localHeartBeat = 0; 
//     static int scannerCounter = 0; 

//     localHeartBeat++;
//     network_ptr[HB_BASE_PTR] = localHeartBeat;
//     scannerCounter++;

//     if (scannerCounter == 50) {
//             heartBeatScanner(
//                 myBoardNum,
//                 network_ptr,
//                 leader_update,
//                 m_axis_tx_meta
//                 //m_axi_reply
//             );
//             scannerCounter = 0; 
//     }

// }

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

    enum fsmStateType {INIT, LEADER_REPLICA, PROPOSE, READ_MIN_PROP_REQ, READ_MIN_PROP_RSP, WRITE_MIN_PROP_AND_READ_SLOT, CHECK_SLOTS, ACCEPT_WRITE, ACCEPT_DONE, REPLICA, REPLICA_CHECK};
    static fsmStateType state = INIT; 
    static int leader = 0; 
    static int counter = 0; 
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
        //reply[2] = 33 + counter; 
        if (done == true && !proposedValue.empty()) {
            proposedValue.read(pVal);
            myValue = pVal.value; 
            sGroup = pVal.syncronizationGroup;
            reply[28] = myValue;
            done = false; 
            state = READ_MIN_PROP_REQ; 
        } else if (done) {
            //reply[3] = 111;
            state = LEADER_REPLICA; 
        } else {
            //reply[3] = 222;
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
    int myBoardNum,
    int num_nodes, 
    int* network_ptr,
    int* reply
) {

    enum fsmStateType {REQUEST, READ_MIN_PROP, READ_MIN_PROP_RSP, WRITE_READ, WRITE_READ_RSP, WRITE_SLOT, ACCEPT_VALUE};
    static fsmStateType state = REQUEST; 
    static int counter = 0; 
    static int call_counter = 0; 
    static ap_uint<32> sGroup = 0; 
    static int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS]; 
    static LogEntry logSlot; 
    static int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp; 
    static int minPropNumber = INT_MIN;

    switch (state)
    {
    case REQUEST: {
        //reply[21] = call_counter; 
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
            state = ACCEPT_VALUE;
        } else {
            state = REQUEST; 
        }
        call_counter+=1;
        break;
    }
    case READ_MIN_PROP: {
        //reply[0] = 111 + counter; 
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
                    reply[4] = LOG_BASE_ADDR + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[sGroup]%FIFO_LENGTH)); 
                    reply[5] = LOG_BASE_ADDR; 
                    j++;
                    qpn_tmp++;

                }
            }
            else {
                j++;
            }
        }
        state = READ_MIN_PROP_RSP; 
        break;
    }

    case READ_MIN_PROP_RSP: {
        bool value_found = false; 
        //reply[3] = 222 + counter; 
        int temp; 
        for (int i = 0; i < num_nodes-1; i++) {
            temp = network_ptr[LOG_BASE_PTR + 2 + FIFO_LENGTH * i + (minPropFifoIndex[sGroup]%FIFO_LENGTH)]; 
            reply[6] = LOG_BASE_PTR + 2 + FIFO_LENGTH * i + (minPropFifoIndex[sGroup]%FIFO_LENGTH); 
            if (temp > minPropNumber && temp != 0) {
                minPropNumber = temp;
                value_found = true; 
            } else if (counter == 0) {
                minPropNumber = 0; 
                value_found = true; 
            }
        }

        if (value_found) {
            //reply[26] = minPropNumber;
            minPropFifoIndex[sGroup]+=1; 
            minProp_rsp.write(minPropNumber);
            counter++; 
            state = REQUEST; 
        }

        break;    
    }
    
    case WRITE_READ: {
        network_ptr[LOG_BASE_PTR] = newMinProp; 
        //reply[5] = 333 + counter; 
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
                    //reply[6] = LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN; 
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
                    reply[7] = LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[sGroup]%NUM_SLOTS));
                    reply[8] = LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS);
                }
            }
            else {
                j++;
            }
        }
        state = WRITE_READ_RSP;
        break; 
    }

    case WRITE_READ_RSP: {
        //reply[9] = 444 + counter; 
        LogEntry temp_log;
        int maxPropNumber = 0; 
        for (int i = 0; i < num_nodes-1; i++) {
            if (FOLLOWER_LIST[i]) {
                int propNum = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotReadFifoIndex[sGroup]%NUM_SLOTS)];
                int propValue = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotReadFifoIndex[sGroup]%NUM_SLOTS) + 1];
                reply[10] = LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotReadFifoIndex[sGroup]%NUM_SLOTS);
                reply[11] = LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + (2 * i * FIFO_LENGTH) + (slotReadFifoIndex[sGroup]%NUM_SLOTS) + 1;
                //reply[27] = propNum; 
                //reply[28] = propValue; 
                
                if (propNum != 0 && propNum > maxPropNumber) {
                    temp_log = LogEntry(propNum, propValue, true);
                }
            }
        }

        readSlots_rsp.write(temp_log);
        slotReadFifoIndex[sGroup]+=2; 
        //counter++; 
        state = REQUEST; 
        break; 
    }

    case WRITE_SLOT: {
        //reply[12] = 55 + counter; 
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
                    reply[13] = LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS);
                }
            }
            else {
                j++;
            }
        }
        fuo[sGroup]+=2; 
        //counter++; 
        state = REQUEST; 
        break; 
    }

    case ACCEPT_VALUE: {
        //reply[13] = 66 + counter; 
        for (int i = 0; i < SYNC_GROUPS; i++) {
            reply[14] = LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS);
            reply[15] = LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS) + 1; 
            int propNum = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS)];
            int propValue = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS) + 1];

            if (propNum != 0) {
                //reply[16] = 77 + counter;
                acceptedValue_rsq.write(updateLocalValue(propValue, i));
                slotAcceptFifoIndex[i]+=2;
            }
        }
        //counter++; 
        state = REQUEST; 
        break;
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
    int myBoardNum, 
    int num_nodes, 
    int *network_ptr, 
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
        myBoardNum,
        num_nodes,
        network_ptr,
        reply        
    );

    //Update from Conflicting Method Calls
    if (!updateLocalValue_req.empty()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] += update.value;
        smr_finished.write(1);
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


void broadcast(
    hls::stream<bool>& ncc_finished, 
    hls::stream<int>& broadcast_req, 
    hls::stream<int>& ncc_permissible_req,
    hls::stream<int>& ncc_permissible_rsp, 
    hls::stream<int>& query_req, 
    hls::stream<int>& query_rsp, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    int myBoardNum, 
    int num_nodes,
    int *network_ptr, 
    int* reply
) {

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

    if (!query_req.empty()) {
        query_req.read(query);
        int sum_remote = 0; 
        for (int i = 0; i < num_nodes; i++) {
            if (i != myBoardNum) {
                sum_remote += network_ptr[BROADCAST_BASE_PTR + i];
            }
        }
        query_rsp.write(deposit + sum_remote);
    }

    if (!ncc_permissible_req.empty()) {
        ncc_permissible_req.read(perm);
        ncc_permissible_rsp.write(deposit);
    }


}


extern "C" void bank_account_krnl(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<pkt64>& s_axis_tx_status,
    int myBoardNum,
    int* ops, 
    int* amount, 
    int num_ops, 
    int* m_axi_reply,
    int* network_ptr,
    int num_nodes
) {

    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    #pragma HLS INTERFACE axis port = s_axis_tx_status

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
    static hls::stream<int> ncc_query_req; 
    static hls::stream<int> ncc_query_rsp; 

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
    static bool RTS = false; 
    static pkt64 status; 
    static bool read_op = true; 
    static int inital_value = 100000; 

    if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
        RTS = true; 
    }


    //while (debug_counter < debug_exe && RTS && counter < num_ops) {
    while(counter < num_ops && RTS) {
        m_axi_reply[0] = debug_counter; 
        if (read_op) {
            switch(ops[counter]) {

                case 0: {
                    if (!smr_permissble_req.full() && !ncc_permissible_req.full()) {
                        smr_permissble_req.write(0);
                        ncc_permissible_req.write(0);
                        m_axi_reply[1] = 111 + debug_counter; 
                        read_op = false; 
                    }
                    break; 
                }

                case 1: {
                    if (!broadcast_req.full()) {
                        broadcast_req.write(amount[counter]);
                        m_axi_reply[1] = 222 + debug_counter; 
                        read_op = false; 
                    }
                    break;
                }

                case 2: {
                    if (!smr_query_req.full() && !ncc_query_req.full()) {
                        smr_query_req.write(0);
                        ncc_query_req.write(0);
                        m_axi_reply[1] = 333 + debug_counter; 
                        read_op = false; 
                    }
                    break; 
                }
            }
            
        }

        smr(
            smr_finished,
            proposed,
            smr_permissble_req,
            smr_permissible_rsp, 
            smr_query_req,
            smr_query_rsp, 
            smr_tx_meta,
            smr_tx_data,
            myBoardNum,
            num_nodes,
            network_ptr,
            m_axi_reply
        );

        broadcast(
            ncc_finished,
            broadcast_req, 
            ncc_permissible_req,
            ncc_permissible_rsp, 
            ncc_query_req,
            ncc_query_rsp, 
            ncc_tx_meta,
            ncc_tx_data,
            myBoardNum,
            num_nodes,
            network_ptr,
            m_axi_reply
        );

        merger( smr_tx_meta, 
                ncc_tx_meta, 
                smr_tx_data, 
                ncc_tx_data,
                m_axis_tx_meta,
                m_axis_tx_data);

        if (!smr_permissible_rsp.empty() && !ncc_permissible_rsp.empty()) {
            m_axi_reply[2] = 444 + debug_counter; 
            smr_permissible_rsp.read(smr_value);
            ncc_permissible_rsp.read(ncc_value);
            if (inital_value + smr_value + ncc_value - amount[counter] >= 0) {
                proposed.write(ProposedValue(-amount[counter], 0));
            } else {
                read_op = true; 
                counter++; 
            }
        }

        if (!smr_query_rsp.empty() && !ncc_query_rsp.empty()) {
            m_axi_reply[3] = 555 + debug_counter; 
            int smr_query, ncc_query;
            smr_query_rsp.read(smr_query); 
            ncc_query_rsp.read(ncc_query);
            m_axi_reply[29] = inital_value + smr_query + ncc_query; 
            read_op = true;
            counter++; 
        }

        if (!smr_finished.empty()) {
            m_axi_reply[3] = 666 + debug_counter; 
            bool temp; 
            smr_finished.read(temp);
            read_op = true;
            counter++; 
        }

        if (!ncc_finished.empty()) {
            m_axi_reply[3] = 777 + debug_counter; 
            bool temp; 
            ncc_finished.read(temp);
            read_op = true;
            counter++; 
        }

        debug_counter++; 
    }

}


