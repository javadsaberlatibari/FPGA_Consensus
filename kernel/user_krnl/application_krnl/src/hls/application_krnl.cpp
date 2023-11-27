#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"



const int NUM_NODES = 2; 
const int SYNC_GROUPS = 1; 

// Need for QP info
const ap_uint<32> BASE_IP_ADDR = 0xe0d4010b;
const uint32_t UDP = 0x000012b7;

// Written by Leader Switch and read by Log Handler
bool FOLLOWER_LIST[NUM_NODES-1] = {1};

const int NUM_SLOTS = 5; 
const int FIFO_LENGTH = 5;

// Constants for HeartBeat Memory
// Only 1 HB regardless of number of sync groups
const int HB_BASE_PTR = 0;
const int HB_BASE_ADDR = 0;
const int HB_PTR_LEN = 1 + (NUM_NODES-1) * FIFO_LENGTH; 
const int HB_ADDR_LEN = 4 * HB_PTR_LEN; 

// Constants for replication logs
// Scales with numberof sync groups
const int LOG_BASE_PTR = HB_PTR_LEN; 
const int LOG_BASE_ADDR = HB_ADDR_LEN; 
const int LOG_MIN_PROP_PTR_LEN = 1 + (NUM_NODES-1) * FIFO_LENGTH; // local heartbeat and remote heartbeat queue
const int LOG_MIN_PROP_ADDR_LEN = 4 * LOG_MIN_PROP_PTR_LEN; 
const int LOG_LOCAL_LOG_PTR_LEN = 2 * NUM_SLOTS; // local log 
const int LOG_LOCAL_LOG_ADDR_LEN = 4 * LOG_LOCAL_LOG_PTR_LEN; 
const int LOG_REMOTE_LOG_QUEUE_PTR_LEN = 2 * (NUM_NODES-1) * FIFO_LENGTH;
const int LOG_REMOTE_LOG_QUEUE_ADDR_LEN = 4 * LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
const int LOG_PTR_LEN = LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
const int LOG_ADDR_LEN = LOG_PTR_LEN * 4; 



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
    LogEntry(ap_uint<32> p, ap_uint<32> v, ap_uint<32> f) 
        :propVal(p), value(v), fuo(f) {}
    LogEntry(ap_uint<32> p, ap_uint<32> v, bool va) 
        :propVal(p), value(v), valid(va) {}
};

// struct Log
// {
// 	ap_uint<32> minProsal;
// 	ap_uint<32> FUO;
//     LogEntry slots[SLOT_NUM];
// 	Log()
// 		:minProsal(0), FUO(FUO) {}
// };

// struct follower 
// {
// 	ap_uint<32> boardNum;
// 	ap_uint<32> lqpn; 
// 	bool last; 
// 	follower(ap_uint<32> bn, ap_uint<32> q, bool l)
// 	:boardNum(bn), lqpn(q), last(l) {}

// };

// enum heartBeatStates {
//     UPDATE,
//     SCAN, 
//     READ,
//     LEADER_ELECTION
// };

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt256>& m_axis_tx_meta
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    pkt256 tx_meta;

    /*RDMA OP*/
    tx_meta.data.range(2,0) = 0x00000000; 
    /*lQPN*/
    tx_meta.data.range(26,3) = s_axi_lqpn; 
    /*
    lAddr
    */
    tx_meta.data.range(74, 27) = s_axi_laddr; 
    /*rAddr*/
    tx_meta.data.range(122, 75) = s_axi_raddr; 
    //+(itt*4)
    /*len*/
    tx_meta.data.range(154, 123) = s_axi_len;
    m_axis_tx_meta.write(tx_meta);
    
}

void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    ap_uint<64>  write_value,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
){
    //#pragma HLS dataflow
    #pragma HLS inline off
    #pragma HLS pipeline II=1
    
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
    
    if (!m_axis_tx_meta.full()) 
        m_axis_tx_meta.write(tx_meta);

    //Write data only if laddr is 0
    if (s_axi_laddr == 0) {
        tx_data.data(63, 0) = write_value;
        tx_data.keep(7, 0) = 0xff;
        tx_data.last = 1; 
        if (!m_axis_tx_data.full())
            m_axis_tx_data.write(tx_data);
    }

    
}

// void meta_merger(
//     hls::stream<pkt256>& a_tx_meta,
//     hls::stream<pkt256>& b_tx_meta,
//     hls::stream<pkt256>& c_tx_meta
// ) {

//     pkt256 temp_pkt; 
//     if (!a_tx_meta.empty()) {
//         a_tx_meta.read(temp_pkt);
//         c_tx_meta.write(temp_pkt);
//     } else if (!b_tx_meta.empty()) {
//         b_tx_meta.read(temp_pkt);
//         c_tx_meta.write(temp_pkt);        
//     }
// }



// template<int NUM_NODES, int HB_BASE_PTR, int HB_BASE_ADDR, int FIFO_LENGTH>
// void heartBeatScanner(
//     int myBoardNum, 
//     int *network_ptr,
//     hls::stream<ap_uint<32>>& leader_update,
//     hls::stream<pkt256>& m_axis_tx_meta
//     //int *m_axi_reply
// ) {

//     //static ap_uint<32> remoteHeartBeats[NUM_NODES];
//     static ap_uint<32> heartBeatScores[NUM_NODES];
//     static bool replicaAlive[NUM_NODES];
//     static heartBeatStates state = SCAN; 
//     static ap_uint<32> leader = 0; 
//     static ap_uint<32> newleader = 0; 
//     static ap_uint<32> heartBeatFifoIndex = 0; 

//     switch(state) {

//         case SCAN: {

//             int counter = 0; 
//             for (int i = 0; i < NUM_NODES; i++) {
//                 if (i != myBoardNum) {
//                     rdma_read(
//                         (NUM_NODES - 1) * myBoardNum + counter,
//                         HB_BASE_ADDR + 4 + 4 * (FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)),
//                         0,
//                         0x100,
//                         m_axis_tx_meta 
//                     );
//                     counter++; 
//                 }
//             }
//             heartBeatFifoIndex++; 
//             state = READ; 
//             break; 
//         }

//         case READ: {
//             int counter = 0; 
//             for (int i = 0; i < NUM_NODES; i++) {
//                 if (i != myBoardNum) {
//                     //m_axi_reply[counter] = network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)];
//                     if (network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)] > network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + ((heartBeatFifoIndex-1)%FIFO_LENGTH)]) {
//                         heartBeatScores[counter]++; 
//                     } else {
//                         heartBeatScores[counter]--; 
//                     }
//                     counter++; 
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
//                     qp_info.data.range(2,0) = 2;  
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
//                         qp_info.data.range(2,0) = 0;  
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
//     hls::stream<pkt256>& m_axis_tx_meta
//     //int *m_axi_reply
// ) {

//     static int localHeartBeat = 0; 
//     static int scannerCounter = 0; 

//     localHeartBeat++;
//     network_ptr[HB_BASE_PTR] = localHeartBeat;
//     scannerCounter++;

//     if (scannerCounter == 50) {
//             heartBeatScanner<3, 0, 0, 5>(
//                 myBoardNum,
//                 network_ptr,
//                 leader_update,
//                 m_axis_tx_meta
//                 //m_axi_reply
//             );
//             scannerCounter = 0; 
//     }

// }




/*
    replication_engine 
        takes the leader status (true/false) and a list of followers from the leader switch
        Then performs the Prepare and Accept phase of MU

*/
// template <int NUM_NODES, int SYNC_GROUPS>
// void replication_engine(
//     int myBoardNum, 
//     //hls::stream<ProposedValue>& proposedValue, 
//     //hls::stream<ap_uint<32>>& leaderUpdate,
//     // hls::stream<ap_uint<32>>& minProp_req,
//     // hls::stream<ap_uint<32>>& minProp_rsp, 
//     // hls::stream<ap_uint<32>>& writeNewProp_req,
//     // hls::stream<LogEntry>& readSlots_req,  
//     // hls::stream<LogEntry>& readSlots_rsp, 
//     // hls::stream<LogEntry>& writeSlot_rep,
//     // hls::stream<bool>& writeSlot_rsp,
//     // hls::stream<ap_uint<32>>& acceptedValue_req,
//     // hls::stream<updateLocalValue>& acceptedValue_rsq,
//     // hls::stream<updateLocalValue>& updateLocalValue_req,
//     int * m_axi_reply
// ) {

//     enum replicationEngineStates {
//         INIT, 
//         //LEADER_UPDATE, 
//         LEADER_REPLICA,
//         PROPOSE,
//         //LEADER_CATCH_UP,
//         //REPLICA_CATCH_UP,
//         PREPARE_READ_MIN_PROP, 
//         PREPARE_SELECT_NEW, 
//         PREPARE_WRITE_MIN_PROP_AND_READ_SLOT, 
//         PREPARE_CHECK_SLOTS,
//         ACCEPT_WRITE,
//         ACCEPT_DONE,
//         REPLICA,
//         REPLICA_CHECK
//     }; 
//     static replicationEngineStates repstate = LEADER_REPLICA;  
//     static int leader = 0; 
//     static bool done = true; 
//     static ap_uint<32> highestProposalNum = 0; 
//     static int myValue = 0; 
//     static ap_uint<32> propValue = 0; 
//     static ap_uint<32> sGroup = 0; 
//     static LogEntry slot; 
//     static int myFUO[SYNC_GROUPS]; 
//     static updateLocalValue uVal; 
//     static ProposedValue temp; 

//     //std::cout << "replication engine" << std::endl;

//     //#pragma HLS DATAFLOW 
//     //#pragma HLS PIPELINE off
    
//     switch (repstate) {

//         /* Inital repstate on start-up */
//         case INIT: 
//             leader = 0; 
//             m_axi_reply[0] = 1; 
//             repstate = LEADER_REPLICA;
            
//         break; 
//         // /* Check for a leader update */
//         // case LEADER_UPDATE: {
//         //     std::cout << "LEADER_UPDATE" << std::endl;
//         //     if (!leaderUpdate.empty()) {
//         //         leaderUpdate.read(leader); 
//         //         m_axi_reply[0] = leader; 
//         //     }
//         //     repstate = LEADER_REPLICA;
//         //     m_axi_reply[1] = 1; 
//         //     break; 
//         // }

//         /* If leader go to propose repstate, if replica wait for leader actions*/
//         case LEADER_REPLICA: 
//             m_axi_reply[1] = 2; 
//             if (leader == myBoardNum) {
//                 repstate = PROPOSE;
//             }
//             // } else {
//             //     repstate = REPLICA; 
//             // }
            
//         break; 
//         /* In Propose repstate read proposed value, and request follower list*/
//         case PROPOSE: 
//             m_axi_reply[2] = 3; 
//             if (done == true) {
//             //if (done == true && !proposedValue.empty()) {
//                 // proposedValue.read(temp);
//                 // myValue = temp.value; 
//                 // sGroup = temp.syncronizationGroup;
//                 //m_axi_reply[1] = myValue;
//                 done = false; 
//                 //repstate = PREPARE_READ_MIN_PROP;
//                 repstate = LEADER_REPLICA; 
//             } else if (done) {
//                 repstate = LEADER_REPLICA; 
//             } else {
//                 //repstate = PREPARE_READ_MIN_PROP;
//                 repstate = LEADER_REPLICA; 
//             }
        
//         break; 

//         // // /* LEADER CATCH UP */
//         // // case LEADER_CATCH_UP: 

//         // // /* REPLICA CATCH UP*/
//         // // case REPLICA_CATCH_UP: 

//         // case PREPARE_READ_MIN_PROP: 
//         //     std::cout << "PREPARE_READ_MIN_PROP" << std::endl;
//         //     minProp_req.write(sGroup);
//         //     repstate = PREPARE_SELECT_NEW; 
//         //     m_axi_reply[3] = 4; 
//         //     break; 
        

//         // case PREPARE_SELECT_NEW: 
//         //     std::cout << "PREPARE_SELECT_NEW" << std::endl;
//         //     if (!minProp_rsp.empty()) {
//         //         minProp_rsp.read(highestProposalNum);
//         //         highestProposalNum++; 
//         //         repstate = PREPARE_WRITE_MIN_PROP_AND_READ_SLOT;
//         //     }
//         //     m_axi_reply[4] = 5; 
//         //     break; 
        

//         // case PREPARE_WRITE_MIN_PROP_AND_READ_SLOT: 
//         //     std::cout << "PREPARE_WRITE_MIN_PROP_AND_READ_SLOT" << std::endl;
//         //     writeNewProp_req.write(highestProposalNum);
//         //     readSlots_req.write(LogEntry(sGroup));
//         //     repstate = PREPARE_CHECK_SLOTS; 
//         //     m_axi_reply[5] = 6; 
//         //     break;
        

//         // case PREPARE_CHECK_SLOTS: 
//         //     std::cout << "PREPARE_WRITE_MIN_PROP_AND_READ_SLOT" << std::endl;
//         //     if (!readSlots_rsp.empty()) {
//         //         readSlots_rsp.read(slot);
//         //         if (slot.valid) {
//         //             propValue = slot.value;
//         //         } else {
//         //             propValue = myValue; 
//         //         }
//         //         repstate = ACCEPT_WRITE; 
//         //     }
//         //     m_axi_reply[6] = 7; 
//         //     break; 
        

//         // case ACCEPT_WRITE: 
//         //     std::cout << "ACCEPT_WRITE" << std::endl;
//         //     writeSlot_rep.write(LogEntry(highestProposalNum, propValue, myFUO[sGroup]));
//         //     repstate = ACCEPT_DONE;
//         //     m_axi_reply[7] = 8; 
//         //     break; 
        

//         // case ACCEPT_DONE: 
//         //     std::cout << "ACCEPT_DONE" << std::endl;
//         //     if (myValue == propValue) {
//         //         done = true; 
//         //     } else {
//         //         updateLocalValue_req.write(updateLocalValue(propValue, sGroup));
//         //     }   
//         //     repstate = LEADER_REPLICA;
//         //     myFUO[sGroup]+=1; 
//         //     m_axi_reply[8] = 9; 
//         //     break; 

//         // case REPLICA: 
//         //     /* Check for new entries in the local log */
//         //     std::cout << "REPLICA" << std::endl;
//         //     acceptedValue_req.write(1);
//         //     repstate = REPLICA_CHECK; 
//         //     m_axi_reply[7] = 10; 
//         //     break; 
        

//         // case REPLICA_CHECK: 
//         //     std::cout << "REPLICA_CHECK" << std::endl;
//         //     if (!acceptedValue_rsq.empty()) {
//         //         acceptedValue_rsq.read(uVal);
//         //         updateLocalValue_req.write(uVal);
//         //         repstate = LEADER_REPLICA;
//         //     }
//         //     m_axi_reply[8] = 11; 
//         //     break; 

//     }

// }






/*

    The Log is held in HBM memory at network_ptr

    If N = 500,000 then Log size is 4MB + 64 bits (minProp, FUO)

    minProposalNum      network_ptr[0]  0x0 (0)
    FUO                 network_ptr[1]  0x20 (32)
    SLOTS 1 (propNum)   network_ptr[2]  0x40 (64)
    SLOTS 1 (value)     network_ptr[3]  0x60 (96) 
    ...
    SLOTS N (propNum)   network_ptr[2 + (2 * N)]  0xF42440 (64 + (32 * N))
    SLOTS N (value)     network_ptr[3 + (2 * N)]  0xF42460 (96 + (32 * N)) 

    NUM_NODES = 6
    replicaPropNum      network_ptr[1000004:1000009]  0xF42480 -> 0xF42520
    (Locations for the read replies to write the values)

*/
// template<   int NUM_NODES, 
//             int SYNC_GROUPS, 
//             int NUM_SLOTS, 
//             int FIFO_LENGTH,
//             int LOG_BASE_PTR, 
//             int LOG_BASE_ADDR,     
//             int LOG_MIN_PROP_PTR_LEN,
//             int LOG_MIN_PROP_ADDR_LEN,
//             int LOG_LOCAL_LOG_PTR_LEN,
//             int LOG_LOCAL_LOG_ADDR_LEN,
//             int LOG_REMOTE_LOG_QUEUE_PTR_LEN,
//             int LOG_REMOTE_LOG_QUEUE_ADDR_LEN,
//             int LOG_PTR_LEN,
//             int LOG_ADDR_LEN >
// void log_handler(
//     ap_uint<32> myBoardNum, 
//     int* network_ptr, 
//     hls::stream<ap_uint<32>>& minProp_req,
//     hls::stream<ap_uint<32>>& minProp_rsp, 
//     hls::stream<ap_uint<32>>& writeNewProp_req,
//     hls::stream<LogEntry>& readSlots_req,  
//     hls::stream<LogEntry>& readSlots_rsp, 
//     hls::stream<LogEntry>& writeSlot_rep,
//     hls::stream<bool>& writeSlot_rsp,
//     hls::stream<ap_uint<32>>& acceptedValue_req,
//     hls::stream<updateLocalValue>& acceptedValue_rsq,
//     hls::stream<pkt256>& m_axis_tx_meta, 
//     hls::stream<pkt64>& m_axis_tx_data,
//     int * m_axi_reply
// ) {
//     #pragma HLS inline off
//     #pragma HLS pipeline II=1
//     enum logHandlerStates {
//         REQUEST,
//         READ_MIN_PROP,
//         READ_MIN_PROP_RSP, 
//         WRITE_READ,
//         WRITE_READ_RSP,
//         WRITE_SLOT, 
//         ACCEPT_VALUE
//     };
//     static logHandlerStates logstate = REQUEST; 
//     static ap_uint<32> fuo[SYNC_GROUPS];
//     static ap_uint<32> minPropFifoIndex = 0;
//     static ap_uint<32> slotReadFifoIndex = 0; 
//     static ap_uint<32> newMinProp = 0; 
//     static ap_uint<32> syncGroup; 
//     static LogEntry logSlot; 

//     switch(logstate) {
//         case REQUEST: {
//             if (!minProp_req.empty()) {
//                 minProp_req.read(syncGroup);
//                 logstate = READ_MIN_PROP; 

//             } else if (!writeNewProp_req.empty() && !readSlots_req.empty()) {
//                 readSlots_req.read(logSlot);
//                 syncGroup = logSlot.syncGroup; 
//                 writeNewProp_req.read(newMinProp);
//                 logstate = WRITE_READ; 

//             } else if (!writeSlot_rep.empty()) {
//                 writeSlot_rep.read(logSlot);
//                 fuo[syncGroup] = logSlot.fuo; 
//                 logstate = WRITE_SLOT;

//             } else if (!acceptedValue_req.empty()) {
//                 acceptedValue_req.read(syncGroup);
//                 logstate = ACCEPT_VALUE;
//             } else {
//                 logstate = REQUEST; 
//             }
//             m_axi_reply[9] = 10;     
//         break; 
//         }

//         case READ_MIN_PROP: {
//             int j=0; 
//             int qpn_tmp=myBoardNum*(NUM_NODES-1);
//             while (j<NUM_NODES){
//                 if(j!=myBoardNum && FOLLOWER_LIST[j]){
//                     if(!m_axis_tx_meta.full()){
//                         rdma_read(
//                             qpn_tmp,
//                             LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN + 4 + 4 * (FIFO_LENGTH * j + (minPropFifoIndex%FIFO_LENGTH)),
//                             LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN,
//                             0x100,
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
//             m_axi_reply[10] = 11; 
//             logstate = READ_MIN_PROP_RSP; 
//             break; 
//         }

//         case READ_MIN_PROP_RSP: {
//             int minPropNumber = INT_MAX, temp; 
//             for (int i = 0; i < NUM_NODES-1; i++) {
//                 temp = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * i + (minPropFifoIndex%FIFO_LENGTH)]; 
//                 if (temp > minPropNumber) {
//                     minPropNumber = temp;
//                 }
//             }
//             minPropFifoIndex++; 
//             minProp_rsp.write(minPropNumber);
//             logstate = REQUEST; 
//             m_axi_reply[11] = 12; 
//             break; 
//         }

//         case WRITE_READ: {
//             int j=0; 
//             int qpn_tmp=myBoardNum*(NUM_NODES-1);
//             while (j<NUM_NODES){
//                 if(j!=myBoardNum && FOLLOWER_LIST[j]){
//                     if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
//                         rdma_write(
//                             qpn_tmp,
//                             0,
//                             LOG_BASE_ADDR,
//                             0x8,
//                             newMinProp,
//                             m_axis_tx_meta, 
//                             m_axis_tx_data
//                             );
//                         j++;
//                         qpn_tmp++;
//                     }
//                 }
//                 else {
//                     j++;
//                 }
//             }
//             j=0; 
//             qpn_tmp=myBoardNum*(NUM_NODES-1);
//             while (j<NUM_NODES){
//                 if(j!=myBoardNum && FOLLOWER_LIST[j]){
//                     if(!m_axis_tx_meta.full()){
//                         rdma_read(
//                             qpn_tmp,
//                             LOG_BASE_ADDR + syncGroup * LOG_PTR_LEN + 4 + 4 * (FIFO_LENGTH * NUM_NODES) + 4 * 2 * NUM_SLOTS + 4 * (2 * FIFO_LENGTH * j + (slotReadFifoIndex%NUM_SLOTS)),
//                             LOG_BASE_ADDR + syncGroup * LOG_PTR_LEN + 4 + 4 * (FIFO_LENGTH * NUM_NODES),
//                             0x200,
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

//             logstate = WRITE_READ_RSP;
//             m_axi_reply[12] = 13; 
//             break; 
//         }

//         case WRITE_READ_RSP: {
//             LogEntry temp_log;
//             int maxPropNumber = INT_MIN; 
//             for (int i = 0; i < NUM_NODES-1; i++) {
//                 if (FOLLOWER_LIST[i]) {
//                     int propNum = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * i + (slotReadFifoIndex%NUM_SLOTS)];
//                     int propValue = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * i + (slotReadFifoIndex%NUM_SLOTS) + 1];

//                     if (propNum != 0 && propNum > maxPropNumber) {
//                         temp_log = LogEntry(propNum, propValue, true);
//                     }
//                 }
//             }

//             readSlots_rsp.write(temp_log);
//             slotReadFifoIndex++; 
//             logstate = REQUEST; 
//             m_axi_reply[13] = 14; 
//             break; 
//         }
    
//         case WRITE_SLOT: {
//             ap_uint<64> sendLog; 
//             sendLog.range(31, 0) = logSlot.propVal;
//             sendLog.range(63, 32) = logSlot.value;
//             int j=0; 
//             int qpn_tmp=myBoardNum*(NUM_NODES-1);
//             while (j<NUM_NODES){
//                 if(j!=myBoardNum && FOLLOWER_LIST[j]){
//                     if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
//                         rdma_write(
//                             qpn_tmp,
//                             0,
//                             LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN + LOG_MIN_PROP_ADDR_LEN + logSlot.fuo * 2,
//                             0xc,
//                             sendLog,
//                             m_axis_tx_meta, 
//                             m_axis_tx_data
//                             );
//                         j++;
//                         qpn_tmp++;
//                     }
//                 }
//                 else {
//                     j++;
//                 }
//             }
//             m_axi_reply[14] = 15; 
//             logstate = REQUEST; 
//             break; 
//         }

//         case ACCEPT_VALUE: {
//             for (int i = 0; i < SYNC_GROUPS; i++) {
//                 int propNum = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * NUM_NODES  + (slotReadFifoIndex%NUM_SLOTS) + fuo[syncGroup]];
//                 int propValue = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * NUM_NODES + (slotReadFifoIndex%NUM_SLOTS) + fuo[syncGroup] + 1];

//                 if (propNum != 0) {
//                         acceptedValue_rsq.write(updateLocalValue(propValue, syncGroup));
//                 }
//             }
//             m_axi_reply[15] = 16; 
//             logstate = REQUEST; 
//             break;
//         }
        

//     }

// }

// void stream_spliter(
//     hls::stream<ap_uint<32>>& a,
//     hls::stream<ap_uint<32>>& b,
//     hls::stream<ap_uint<32>>& c
// ) {
//     ap_uint<32> temp; 

//     if (!a.empty()) {
//         a.read(temp);
//         b.write(temp);
//         c.write(temp);
//     }
// }


// void test_input(
//     hls::stream<ap_uint<32>>& a
// ) {
//     static bool send = true;
//     if (send) {
//         a.write(0);
//         send = false; 
//     }
// }

/*

    MU contains the replications engine for conflicting method calls, as well as the leader switch. As input it takes the board number and network_ptr (same as network kernel) 
    and the amount of syncronization groups. After initalizing the leader switch will select Node 0 as the first leader, and setup the logs for all the syncronization groups. 

    We then should be able to issue updates to the 

*/

// template<int NUM_NODES, int SYNC_GROUPS>
// void mu(
//     //hls::stream<ProposedValue>& proposedValue, 
//     //hls::stream<bool>& proposedFinished, 
//     /* Connection to network kernel */
//     //hls::stream<pkt256>& m_axis_qp_interface, 
//     hls::stream<pkt256>& m_axis_tx_meta, 
//     hls::stream<pkt64>& m_axis_tx_data,
//     /* Global constants */
//     ap_uint<32> myBoardNum, 
//     int *network_ptr,
//     int * m_axi_reply
//     //int * m_axi_reply_2 
// ) {

//     // int NUM_SLOTS = 5; 
//     // int FIFO_LENGTH = 5;

//     // // Constants for HeartBeat Memory
//     // // Only 1 HB regardless of number of sync groups
//     // int HB_BASE_PTR = 0;
//     // int HB_BASE_ADDR = 0;
//     // int HB_PTR_LEN = 1 + (NUM_NODES-1) * FIFO_LENGTH; 
//     // int HB_ADDR_LEN = 4 * HB_PTR_LEN; 

//     // // Constants for replication logs
//     // // Scales with numberof sync groups
//     // int LOG_BASE_PTR = HB_PTR_LEN; 
//     // int LOG_BASE_ADDR = HB_ADDR_LEN; 
//     // int LOG_MIN_PROP_PTR_LEN = 1 + FIFO_LENGTH * NUM_NODES-1; // local heartbeat and remote heartbeat queue
//     // int LOG_MIN_PROP_ADDR_LEN = 4 * LOG_MIN_PROP_PTR_LEN; 
//     // int LOG_LOCAL_LOG_PTR_LEN = 2 * NUM_SLOTS; // local log 
//     // int LOG_LOCAL_LOG_ADDR_LEN = 4 * LOG_LOCAL_LOG_PTR_LEN; 
//     // int LOG_REMOTE_LOG_QUEUE_PTR_LEN = 2 * FIFO_LENGTH * NUM_NODES-1;
//     // int LOG_REMOTE_LOG_QUEUE_ADDR_LEN = 4 * LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
//     // int LOG_PTR_LEN = LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
//     // int LOG_ADDR_LEN = LOG_PTR_LEN * 4; 


//     static hls::stream<ap_uint<32>> leaderSwitch2StreamSplit; 

//     /* Streams between replication engine and leader switch */
//     static hls::stream<ap_uint<32>> leaderSwitch2RepEngine;

//     /* Streams between leader switch and permision handler */
//     static hls::stream<ap_uint<32>> leaderSwitch2PermHandler;

//     #pragma HLS STREAM depth=4 variable=leaderSwitch2StreamSplit
//     #pragma HLS STREAM depth=8 variable=leaderSwitch2RepEngine
//     #pragma HLS STREAM depth=8 variable=leaderSwitch2PermHandler

//     /* Streams between replication engine and log handler */
//     static hls::stream<ap_uint<32>> minProp_req("minimum_prop_request");
//     static hls::stream<ap_uint<32>> minProp_rsp("minimum_prop_response");
//     static hls::stream<ap_uint<32>> writeNewProp_req("write_new_prop_request");
//     static hls::stream<LogEntry> readSlots_req("read_slot_request");  
//     static hls::stream<LogEntry> readSlots_rsp("read_slot_response"); 
//     static hls::stream<LogEntry> writeSlot_req("write_slot_request");
//     static hls::stream<bool> writeSlot_rsp("write_slot_response");
//     static hls::stream<ap_uint<32>> acceptedValue_req("accepted_value_request");
//     static hls::stream<updateLocalValue> acceptedValue_rsq("accepted_value_response"); 

//     #pragma HLS STREAM depth=4 variable=minProp_req
//     #pragma HLS STREAM depth=4 variable=minProp_rsp
//     #pragma HLS STREAM depth=4 variable=writeNewProp_req
//     #pragma HLS STREAM depth=4 variable=readSlots_req
//     #pragma HLS STREAM depth=4 variable=readSlots_rsp
//     #pragma HLS STREAM depth=4 variable=writeSlot_req
//     #pragma HLS STREAM depth=4 variable=writeSlot_rsp
//     #pragma HLS STREAM depth=4 variable=acceptedValue_req    
//     #pragma HLS STREAM depth=4 variable=acceptedValue_rsq

//     /* Streams between replication engine to mu */
//     static hls::stream<updateLocalValue> updateLocalValue_req;  
//     static updateLocalValue update; 
//     #pragma HLS STREAM depth=8 variable=updateLocalValue_req
    
//     /* Storing local values */
//     static int localValues[SYNC_GROUPS];

//     /* Meta pkg streams */
//     static hls::stream<pkt256> m_leader_switch_tx_meta; 
//     static hls::stream<pkt256> m_log_handler_tx_meta; 

//     ap_uint<32> syncGroup; 
//     ap_uint<32> temp_min; 
//     LogEntry logSlot; 

//     //#pragma HLS DATAFLOW
//     //#pragma HLS PIPELINE off

//     replication_engine<NUM_NODES, SYNC_GROUPS>(
//         myBoardNum,
//         //proposedValue,
//         //leaderSwitch2RepEngine,
//         minProp_req,
//         minProp_rsp,
//         writeNewProp_req,
//         readSlots_req,
//         readSlots_rsp,
//         writeSlot_req,
//         writeSlot_rsp,
//         acceptedValue_req,
//         acceptedValue_rsq,
//         updateLocalValue_req,
//         m_axi_reply
//     );

// /*
//     leaderSwitch<NUM_NODES, HB_BASE_PTR, HB_BASE_ADDR, FIFO_LENGTH>(
//         myBoardNum,
//         network_ptr,
//         leaderSwitch2StreamSplit,
//         m_leader_switch_tx_meta
//         //m_axis_qp_conn_interface,
//         //m_axi_reply
//     );

//     permision_handler<NUM_NODES>(
//         myBoardNum, 
//         leaderSwitch2PermHandler,
//         m_axis_qp_interface
//     );

//     stream_spliter(
//         leaderSwitch2StreamSplit,
//         leaderSwitch2RepEngine,
//         leaderSwitch2PermHandler
//     );
// */

//     // log_handler<NUM_NODES, SYNC_GROUPS, NUM_SLOTS, FIFO_LENGTH,LOG_BASE_PTR, LOG_BASE_ADDR, LOG_MIN_PROP_PTR_LEN, LOG_MIN_PROP_ADDR_LEN, LOG_LOCAL_LOG_PTR_LEN, LOG_LOCAL_LOG_ADDR_LEN, LOG_REMOTE_LOG_QUEUE_PTR_LEN, LOG_REMOTE_LOG_QUEUE_ADDR_LEN, LOG_PTR_LEN, LOG_ADDR_LEN >(
//     //     myBoardNum,
//     //     network_ptr,
//     //     minProp_req,
//     //     minProp_rsp,
//     //     writeNewProp_req,
//     //     readSlots_req,
//     //     readSlots_rsp,
//     //     writeSlot_req,
//     //     writeSlot_rsp,
//     //     acceptedValue_req,
//     //     acceptedValue_rsq,
//     //     m_axis_tx_meta,
//     //     m_axis_tx_data,
//     //     m_axi_reply_2
//     // );

//     // if (!minProp_req.empty()) {
//     //     minProp_req.read(temp_min); 
//     //     minProp_rsp.write(1);
//     // }

//     // if (!writeNewProp_req.empty() && !readSlots_req.empty()) {
//     //     readSlots_req.read(logSlot);
//     //     writeNewProp_req.read(temp_min);
//     //     readSlots_rsp.write(LogEntry(temp_min, 1, false));

//     // } 

//     // if (!writeSlot_req.empty()) {
//     //     writeSlot_req.read(logSlot);
//     // }

//     // if (!acceptedValue_req.empty()) {
//     //     acceptedValue_req.read(syncGroup);
//     //     acceptedValue_rsq.write(updateLocalValue(1, syncGroup));
//     // }

//     // meta_merger(
//     //     m_log_handler_tx_meta,
//     //     m_leader_switch_tx_meta,
//     //     m_axis_tx_meta
//     // );

//     // if (!updateLocalValue_req.empty()) {
//     //     updateLocalValue_req.read(update);
//     //     localValues[update.syncGroup] += update.value; 
//     //     proposedFinished.write(1);

//     // }

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
            //reply[3] = myValue;
            done = false; 
            state = READ_MIN_PROP_REQ; 
        } else if (done) {
            //reply[3] = 111;
            state = LEADER_REPLICA; 
        } else {
            //reply[3] = 222;
            state = READ_MIN_PROP_REQ; 
        }
        break; 

    case READ_MIN_PROP_REQ: 
        //reply[4] = 44 + counter; 
        minProp_req.write(sGroup);
        state = READ_MIN_PROP_RSP; 
        break; 
    

    case READ_MIN_PROP_RSP: 
        //reply[4] = 55 + counter; 
        counter++; 
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
        writeSlot_rep.write(LogEntry(newHiPropNum, propValue, myFUO[sGroup]));
        state = ACCEPT_DONE;
        break; 
    

    case ACCEPT_DONE: 
        //reply[8] = 99 + counter; 
        if (myValue == propValue) {
            done = true; 
        } 
        updateLocalValue_req.write(updateLocalValue(propValue, sGroup));  
        myFUO[sGroup]+=1; 
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
        counter++; 
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
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    int myBoardNum,
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

    switch (state)
    {
    case REQUEST: {
        reply[21] = call_counter; 
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
            fuo[sGroup] = logSlot.fuo; 
            state = WRITE_SLOT;

        } else if (!acceptedValue_req.empty()) {
            acceptedValue_req.read(sGroup);
            state = ACCEPT_VALUE;
        } else {
            state = REQUEST; 
        }
        break;
    }
    case READ_MIN_PROP: {
        reply[0] = 11 + counter; 
        int j=0; 
        int qpn_tmp=myBoardNum*(NUM_NODES-1);
        while (j<NUM_NODES){
            if(j!=myBoardNum && FOLLOWER_LIST[j]) {
                if(!m_axis_tx_meta.full()){

                    int slot = (j < myBoardNum) ? j : j-1; 
                    rdma_read(
                        qpn_tmp,
                        LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN + 4 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[sGroup]%FIFO_LENGTH)),
                        LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN,
                        0x100,
                        m_axis_tx_meta 
                        );
                    reply[1] = LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN + 4 + (4 * FIFO_LENGTH * (slot)) + 4 * (minPropFifoIndex[sGroup]%FIFO_LENGTH); 
                    reply[2] = LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN; 
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
        reply[3] = 22 + counter; 
        int minPropNumber = INT_MIN, temp; 
        for (int i = 0; i < NUM_NODES-1; i++) {
            temp = network_ptr[LOG_BASE_PTR + sGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * i + (minPropFifoIndex[sGroup]%FIFO_LENGTH)]; 
            reply[4] = LOG_BASE_PTR + sGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * i + (minPropFifoIndex[sGroup]%FIFO_LENGTH); 
            if (temp > minPropNumber && temp != 0) {
                minPropNumber = temp;
                value_found = true; 
            } else if (counter == 0) {
                minPropNumber = 0; 
                value_found = true; 
            }
        }

        if (value_found) {
            reply[26] = minPropNumber;
            minPropFifoIndex[sGroup]++; 
            minProp_rsp.write(minPropNumber);
            //counter++; 
            state = REQUEST; 
        }

        break;    
    }
    
    case WRITE_READ: {
        network_ptr[LOG_BASE_PTR] = newMinProp; 
        reply[5] = 33 + counter; 
        int j=0; 
        int qpn_tmp=myBoardNum*(NUM_NODES-1);
        while (j<NUM_NODES){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN,
                        0x8,
                        newMinProp,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                        );
                    j++;
                    qpn_tmp++;
                    reply[6] = LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN; 
                }
            }
            else {
                j++;
            }
        }
        j=0; 
        qpn_tmp=myBoardNum*(NUM_NODES-1);
        while (j<NUM_NODES){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full()){
                    int slot = (j < myBoardNum) ? j : j-1; 
                    rdma_read(
                        qpn_tmp,
                        LOG_BASE_ADDR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[sGroup]%NUM_SLOTS)),
                        LOG_BASE_ADDR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
                        0x200,
                        m_axis_tx_meta 
                        );
                    j++;
                    qpn_tmp++;
                    reply[7] = LOG_BASE_ADDR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[sGroup]%NUM_SLOTS));
                    reply[8] = LOG_BASE_ADDR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS);
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
        reply[9] = 44 + counter; 
        LogEntry temp_log;
        int maxPropNumber = 0; 
        for (int i = 0; i < NUM_NODES-1; i++) {
            if (FOLLOWER_LIST[i]) {
                int propNum = network_ptr[LOG_BASE_PTR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + 2 * i + (slotReadFifoIndex[sGroup]%NUM_SLOTS)];
                int propValue = network_ptr[LOG_BASE_PTR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + 2 * i + (slotReadFifoIndex[sGroup]%NUM_SLOTS) + 1];
                reply[10] = LOG_BASE_PTR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + 2 * i + (slotReadFifoIndex[sGroup]%NUM_SLOTS);
                reply[11] = LOG_BASE_PTR + sGroup * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + 2 * i + (slotReadFifoIndex[sGroup]%NUM_SLOTS) + 1;
                reply[27] = propNum; 
                reply[28] = propValue; 
                
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
        reply[12] = 55 + counter; 
        ap_uint<64> sendLog; 
        sendLog.range(31, 0) = logSlot.propVal;
        sendLog.range(63, 32) = logSlot.value;
        int j=0; 
        int qpn_tmp=myBoardNum*(NUM_NODES-1);
        while (j<NUM_NODES){
            if(j!=myBoardNum && FOLLOWER_LIST[j]){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                    rdma_write(
                        qpn_tmp,
                        0,
                        LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN + LOG_MIN_PROP_ADDR_LEN + fuo[sGroup]%NUM_SLOTS,
                        0xc,
                        sendLog,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                        );
                    j++;
                    qpn_tmp++;
                    reply[13] = LOG_BASE_ADDR + sGroup * LOG_ADDR_LEN + LOG_MIN_PROP_ADDR_LEN + fuo[sGroup]%NUM_SLOTS;
                }
            }
            else {
                j++;
            }
        }
        fuo[sGroup]+=2; 
        counter++; 
        state = REQUEST; 
        break; 
    }

    case ACCEPT_VALUE: {
        reply[13] = 66 + counter; 
        for (int i = 0; i < SYNC_GROUPS; i++) {
            reply[14] = LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS);
            reply[15] = LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_ADDR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS) + 1; 
            int propNum = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS)];
            int propValue = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN  + (slotAcceptFifoIndex[i]%NUM_SLOTS) + 1];

            if (propNum != 0) {
                reply[16] = 77 + counter;
                acceptedValue_rsq.write(updateLocalValue(propValue, i));
                slotAcceptFifoIndex[i]+=2;
            }
        }
        counter++; 
        state = REQUEST; 
        break;
    }    

    default:
        break;
    }

}

/* Check for Bank Account (not sure for other applications) */
bool isPermissible(int update, int value) {
    if (value + update < 0) {
        return false; 
    }
    return true; 
}

void mu(
    hls::stream<ProposedValue>& proposedValue,
    // hls::stream<ProposedValue>& nonConflictingPropsedValue, 
    // hls::stream<bool>& permissible_rsp, 
    // hls::stream<int>& query_req, 
    // hls::stream<int>& query_rsp, 
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    int myBoardNum, 
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
    static ProposedValue nonConflictingUpdate; 
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
        network_ptr,
        reply        
    );

    //Update from Conflicting Method Calls
    if (!updateLocalValue_req.empty()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] += update.value;
        reply[29] = localValues[update.syncGroup]; 
    }

    //Update from Non-Conflicting Method Calls
    //Need to check Permissibility
    // if (!nonConflictingPropsedValue.empy()) {
    //     nonConflictingPropsedValue.read(nonConflictingUpdate);

    //     if (isPermissible(nonConflictingUpdate.value, localValues[nonConflictingUpdate.syncronizationGroup])) {
    //         localValues[nonConflictingUpdate.syncronizationGroup] += nonConflictingUpdate.value; 
    //         permissible_rsp.write(true);
    //     } else {
    //         permissible_rsp.write(true);
    //     }

    // }

    // if (!query_req.empty()) {
    //     query_req.read(query);
    //     query_rsp.write(localValues[query]);
    // }


}


/*

    Connected to Host
    Performs some application that has confliting use cases. 

*/
extern "C" {
    void application_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt64>& m_axis_tx_data,
        hls::stream<pkt64>& s_axis_tx_status,
        //hls::stream<pkt256>& m_axis_qp_conn_interface, 
        int myBoardNum, 
        int *m_axi_reply,
        int count,
        int *network_ptr
    ) {

        //#pragma HLS INTERFACE ap_ctrl_chain port=return 
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        //#pragma HLS DATAFLOW

        static hls::stream<ProposedValue> proposedValue; 
        static hls::stream<bool> proposedFinished; 
        #pragma HLS STREAM depth=8 variable=proposedValue
        #pragma HLS STREAM depth=8 variable=proposedFinished
        static bool RTS = false; 
        static pkt64 status; 
        static int counter = 0; 
        static bool done_with_proposed = false; 


        if (!s_axis_tx_status.empty()) {
            s_axis_tx_status.read(status);
            proposedValue.write(ProposedValue(1, 0));
            proposedValue.write(ProposedValue(1, 0));
            RTS = true; 
        }


        if (RTS) {
            //while (!done_with_proposed) {
                // mu<2, 1>(
                //     //proposedValue,
                //     //proposedFinished,
                //     m_axis_tx_meta,
                //     m_axis_tx_data,
                //     myBoardNum, 
                //     network_ptr,
                //     m_axi_reply_1,
                //     //m_axi_reply_2
                // );

            while (counter < count) {
                mu(
                    proposedValue,
                    m_axis_tx_meta,
                    m_axis_tx_data,
                    myBoardNum,
                    network_ptr,
                    m_axi_reply
                );
                counter++; 
            }

            
                // if (!proposedFinished.empty()) {
                //     proposedFinished.read(done_with_proposed); 
                // }

            //}

        }



    }
}




