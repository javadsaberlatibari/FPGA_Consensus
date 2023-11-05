#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

#define WAIT_TIMER 256
#define ITT_NUM 20
#define SLOT_NUM 100


const int NUMBER_OF_NODES = 3; 
//const ap_uint<32> BASE_IP_ADDR = 0x 0b 01 d4 e0;
const ap_uint<32> BASE_IP_ADDR = 0xe0d4010b;
const uint32_t UDP = 0x000012b7;

bool FOLLOWER_LIST[NUMBER_OF_NODES-1] = {1, 1};

struct ProposedValue {
    int value; 
    ap_uint<32> syncronizationGroup;
    ProposedValue()
        :value(0){}
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

enum heartBeatStates {
    UPDATE,
    SCAN, 
    READ,
    LEADER_ELECTION
};

void rdma_read(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    hls::stream<pkt256>& m_axis_tx_meta
){
    //#pragma HLS dataflow
    
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

void meta_merger(
    hls::stream<pkt256>& a_tx_meta,
    hls::stream<pkt256>& b_tx_meta,
    hls::stream<pkt256>& c_tx_meta
) {

    pkt256 temp_pkt; 
    if (!a_tx_meta.empty()) {
        a_tx_meta.read(temp_pkt);
        c_tx_meta.write(temp_pkt);
    } else if (!b_tx_meta.empty()) {
        b_tx_meta.read(temp_pkt);
        c_tx_meta.write(temp_pkt);        
    }
}



template<int NUM_NODES, int HB_BASE_PTR, int HB_BASE_ADDR, int FIFO_LENGTH>
void heartBeatScanner(
    int myBoardNum, 
    int *network_ptr,
    hls::stream<ap_uint<32>>& leader_update,
    hls::stream<pkt256>& m_axis_tx_meta
    //int *m_axi_reply
) {

    //static ap_uint<32> remoteHeartBeats[NUM_NODES];
    static ap_uint<32> heartBeatScores[NUM_NODES];
    static bool replicaAlive[NUM_NODES];
    static heartBeatStates state = SCAN; 
    static ap_uint<32> leader = 0; 
    static ap_uint<32> newleader = 0; 
    static ap_uint<32> heartBeatFifoIndex = 0; 

    switch(state) {

        case SCAN: {

            int counter = 0; 
            for (int i = 0; i < NUM_NODES; i++) {
                if (i != myBoardNum) {
                    rdma_read(
                        (NUM_NODES - 1) * myBoardNum + counter,
                        HB_BASE_ADDR + 4 + 4 * (FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)),
                        0,
                        0x100,
                        m_axis_tx_meta 
                    );
                    counter++; 
                }
            }
            heartBeatFifoIndex++; 
            state = READ; 
            break; 
        }

        case READ: {
            int counter = 0; 
            for (int i = 0; i < NUM_NODES; i++) {
                if (i != myBoardNum) {
                    //m_axi_reply[counter] = network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)];
                    if (network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + (heartBeatFifoIndex%FIFO_LENGTH)] > network_ptr[HB_BASE_PTR + 1 + FIFO_LENGTH * counter + ((heartBeatFifoIndex-1)%FIFO_LENGTH)]) {
                        heartBeatScores[counter]++; 
                    } else {
                        heartBeatScores[counter]--; 
                    }
                    counter++; 
                }
            }
            state = LEADER_ELECTION; 
            break; 
        }

        case LEADER_ELECTION: {

            for (int i = 0; i < NUM_NODES; i++) {
                if (heartBeatScores[i] >= 6) {
                    FOLLOWER_LIST[i] = true; 
                    replicaAlive[i] = true; 
                } else if (heartBeatScores[i] < 2){
                    FOLLOWER_LIST[i] = false; 
                    replicaAlive[i] = false; 
                }
            }
            replicaAlive[myBoardNum] = true; 

            for (int i = 0; i < NUM_NODES; i++) {
                if (replicaAlive[i] == true) {
                    newleader = i;
                    break; 
                }
            }

            if (newleader != leader) {
                leader_update.write(newleader);
            }
            state = SCAN;
            break; 
        }

    }

}


template<int NUM_NODES>
void permision_handler(
    int myBoardNum, 
    hls::stream<ap_uint<32>>& leader_update,
    hls::stream<pkt256>& m_axis_qp_interface
) {

    static ap_uint<32> leader = 0;
    static ap_uint<32> newleader; 
    static pkt256 qp_info;

    if (!leader_update.empty()) {

        leader_update.read(newleader);

        if (newleader != leader && myBoardNum == newleader) {
            leader = newleader;

            /* Change permission */
            int counter = 0; 

            for (int i = 0; i < NUM_NODES; i++) {

                if (i != myBoardNum) {
                    //Enable QP
                    qp_info.data.range(2,0) = 2;  
                    if (counter < myBoardNum)
                        qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum - 1;
                    else 
                        qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum;

                    qp_info.data.range(50, 27) = 0;
                    qp_info.data.range(74, 51) = 0; 
                    qp_info.data.range(90, 75) = 0x00000000; 
                    qp_info.data.range(128, 91) = 0x0000000000000001;
                    m_axis_qp_interface.write(qp_info);
                }

            }


        } else if (newleader != leader) {

            if (leader == myBoardNum) {
                for (int i = 0; i < NUM_NODES; i++) {

                    if (i != myBoardNum) {
                        //Disable QP
                        qp_info.data.range(2,0) = 0;  
                        if (i < myBoardNum)
                            qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum - 1;
                        else 
                            qp_info.data.range(26, 3) = i * (NUM_NODES-1) + myBoardNum;

                        qp_info.data.range(50, 27) = 0;
                        qp_info.data.range(74, 51) = 0; 
                        qp_info.data.range(90, 75) = 0x00000000; 
                        qp_info.data.range(128, 91) = 0x0000000000000001;
                        m_axis_qp_interface.write(qp_info);
                    }

                }
            }

            qp_info.data.range(2,0) = 0;  
            if (leader < myBoardNum)
                qp_info.data.range(26, 3) = leader * (NUM_NODES-1) + myBoardNum - 1;
            else 
                qp_info.data.range(26, 3) = leader * (NUM_NODES-1) + myBoardNum;

            qp_info.data.range(50, 27) = 0;
            qp_info.data.range(74, 51) = 0; 
            qp_info.data.range(90, 75) = 0x00000000; 
            qp_info.data.range(128, 91) = 0x0000000000000001;
            leader = newleader;
        }

    }
}


template<int NUM_NODES, int HB_BASE_PTR, int HB_BASE_ADDR, int FIFO_LENGTH>
void leaderSwitch(
    int myBoardNum, 
    int *network_ptr,
    hls::stream<ap_uint<32>>& leader_update,
    hls::stream<pkt256>& m_axis_tx_meta
    //int *m_axi_reply
) {

    static int localHeartBeat = 0; 
    static int scannerCounter = 0; 

    localHeartBeat++;
    network_ptr[HB_BASE_PTR] = localHeartBeat;
    scannerCounter++;

    if (scannerCounter == 50) {
            heartBeatScanner<3, 0, 0, 5>(
                myBoardNum,
                network_ptr,
                leader_update,
                m_axis_tx_meta
                //m_axi_reply
            );
            scannerCounter = 0; 
    }

}

enum replicationEngineStates {
    INIT, 
    LEADER_UPDATE, 
    LEADER_REPLICA,
    PROPOSE,
    LEADER_CATCH_UP,
    REPLICA_CATCH_UP,
    PREPARE_READ_MIN_PROP, 
    PREPARE_SELECT_NEW, 
    PREPARE_WRITE_MIN_PROP_AND_READ_SLOT, 
    PREPARE_CHECK_SLOTS,
    ACCEPT_WRITE,
    ACCEPT_DONE,
    REPLICA,
    REPLICA_CHECK
}; 


/*
    replication_engine 
        takes the leader status (true/false) and a list of followers from the leader switch
        Then performs the Prepare and Accept phase of MU

*/
template <int NUM_NODES, int SYNC_GROUPS>
void replication_engine(
    ap_uint<32> myBoardNum, 
    hls::stream<ProposedValue>& proposedValue, 
    hls::stream<ap_uint<32>>& leaderUpdate,
    hls::stream<ap_uint<32>>& minProp_req,
    hls::stream<ap_uint<32>>& minProp_rsp, 
    hls::stream<ap_uint<32>>& writeNewProp_req,
    hls::stream<LogEntry>& readSlots_req,  
    hls::stream<LogEntry>& readSlots_rsp, 
    hls::stream<LogEntry>& writeSlot_rep,
    hls::stream<bool>& writeSlot_rsp,
    hls::stream<ap_uint<32>>& acceptedValue_req,
    hls::stream<updateLocalValue>& acceptedValue_rsq,
    hls::stream<updateLocalValue>& updateLocalValue_req
    //int * m_axi_reply
) {
    
    //#pragma DATAFLOW
    
    static replicationEngineStates state = INIT;  
    static ap_uint<32> leader = 0; 
    //static bool isLeader = false; 
    static bool done = true; 

    static ap_uint<32> highestProposalNum = 0; 
    static int myValue = 0; 
    static ap_uint<32> propValue = 0; 

    static ap_uint<32> syncronizationGroup; 

    // static follower follower_rsp; 
    // static int follower_counter = 0; 
    // static follower followList[NUM_NODES]; 

    static LogEntry slot; 
    static int myFUO[SYNC_GROUPS]; 
    updateLocalValue uVal; 

    std::cout << "replication engine" << std::endl;

    switch (state) {

        /* Inital state on start-up */
        case INIT: {
            std::cout << "INIT" << std::endl;
            leader = 0; 
            state = LEADER_REPLICA;
            break; 
        }

        /* Check for a leader update */
        case LEADER_UPDATE: {
            std::cout << "LEADER_UPDATE" << std::endl;
            if (!leaderUpdate.empty()) {
                leaderUpdate.read(leader); 
                //m_axi_reply[0] = leader; 
            }
            state = LEADER_REPLICA;
            break; 
        }

        /* If leader go to propose state, if replica wait for leader actions*/
        case LEADER_REPLICA: {
            std::cout << "LEADER_REPLICA" << std::endl;
            if (leader == myBoardNum) {
                state = PROPOSE;
            } else {
                state = REPLICA; 
            }
            break; 
        }

        /* In Propose state read proposed value, and request follower list*/
        case PROPOSE: {
            std::cout << "PROPOSE" << std::endl;
            ProposedValue temp; 
            if (done == true && !proposedValue.empty()) {
                std::cout << "new proposed value!" << std::endl;
                done = false; 
                proposedValue.read(temp);
                myValue = temp.value; 
                syncronizationGroup = temp.syncronizationGroup;
                //m_axi_reply[1] = myValue;
                state = PREPARE_READ_MIN_PROP;
            } else if (done) {
                state = LEADER_UPDATE; 
            } else {
                state = PREPARE_READ_MIN_PROP;
            }
            break; 
        }

        /* LEADER CATCH UP */
        case LEADER_CATCH_UP: 

        /* REPLICA CATCH UP*/
        case REPLICA_CATCH_UP: 

        case PREPARE_READ_MIN_PROP: {
            std::cout << "PREPARE_READ_MIN_PROP" << std::endl;
            minProp_req.write(syncronizationGroup);
            state = PREPARE_SELECT_NEW; 
            break; 
        }

        case PREPARE_SELECT_NEW: {
            std::cout << "PREPARE_SELECT_NEW" << std::endl;
            if (!minProp_rsp.empty()) {
                minProp_rsp.read(highestProposalNum);
                highestProposalNum++; 
                state = PREPARE_WRITE_MIN_PROP_AND_READ_SLOT;
            }
            break; 
        }

        case PREPARE_WRITE_MIN_PROP_AND_READ_SLOT: {
            std::cout << "PREPARE_WRITE_MIN_PROP_AND_READ_SLOT" << std::endl;
            writeNewProp_req.write(highestProposalNum);
            readSlots_req.write(LogEntry(syncronizationGroup));
            state = PREPARE_CHECK_SLOTS; 
            break; 
        }

        case PREPARE_CHECK_SLOTS: {
            std::cout << "PREPARE_WRITE_MIN_PROP_AND_READ_SLOT" << std::endl;
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
        }

        case ACCEPT_WRITE: {
            std::cout << "ACCEPT_WRITE" << std::endl;
            writeSlot_rep.write(LogEntry(highestProposalNum, propValue, myFUO));
            state = ACCEPT_DONE;
            break; 
        }

        case ACCEPT_DONE: {
            std::cout << "ACCEPT_DONE" << std::endl;
            if (myValue == propValue) {
                done = true; 
            } else {
                updateLocalValue_req.write(updateLocalValue(propValue, syncronizationGroup));
            }   
            state = LEADER_UPDATE;
            myFUO[syncronizationGroup]+=1; 
            break; 
        }


        case REPLICA: {
            /* Check for new entries in the local log */
            std::cout << "REPLICA" << std::endl;
            acceptedValue_req.write(1);
            state = REPLICA_CHECK; 
            break; 
        }

        case REPLICA_CHECK: {
            std::cout << "REPLICA_CHECK" << std::endl;
            if (!acceptedValue_rsq.empty()) {
                acceptedValue_rsq.read(uVal);
                updateLocalValue_req.write(uVal);
                state = LEADER_UPDATE;
            }
            break; 
        }


    }



}




enum logHandlerStates {
    REQUEST,
    READ_MIN_PROP,
    READ_MIN_PROP_RSP, 
    WRITE_READ,
    WRITE_READ_RSP,
    WRITE_SLOT, 
    ACCEPT_VALUE,
};

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
template<   int NUM_NODES, 
            int SYNC_GROUPS, 
            int NUM_SLOTS, 
            int FIFO_LENGTH,
            int LOG_BASE_PTR, 
            int LOG_BASE_ADDR,     
            int LOG_MIN_PROP_PTR_LEN,
            int LOG_MIN_PROP_ADDR_LEN,
            int LOG_LOCAL_LOG_PTR_LEN,
            int LOG_LOCAL_LOG_ADDR_LEN,
            int LOG_REMOTE_LOG_QUEUE_PTR_LEN,
            int LOG_REMOTE_LOG_QUEUE_ADDR_LEN,
            int LOG_PTR_LEN,
            int LOG_ADDR_LEN >
void log_handler(
    ap_uint<32> myBoardNum, 
    int* network_ptr, 
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
    hls::stream<pkt64>& m_axis_tx_data
) {
    

    static logHandlerStates state = REQUEST; 
    //static Log myLog[SYNC_GROUPS];
    static ap_uint<32> fuo[SYNC_GROUPS];
    static ap_uint<32> minPropFifoIndex = 0, slotReadFifoIndex = 0; 
    static ap_uint<32> newMinProp = 0; 
    static ap_uint<32> syncGroup; 

    static LogEntry logSlot; 


    switch(state) {

        case REQUEST: {

            if (!minProp_req.empty()) {
                minProp_req.read(syncGroup);
                state = READ_MIN_PROP; 

            } else if (!writeNewProp_req.empty() && !readSlots_req.empty()) {
                readSlots_req.read(logSlot);
                syncGroup = logSlot.syncGroup; 
                writeNewProp_req.read(newMinProp);
                state = WRITE_READ; 

            } else if (!writeSlot_rep.empty()) {
                writeSlot_rep.read(logSlot);
                fuo[syncGroup] = logSlot.fuo; 
                state = WRITE_SLOT;

            } else if (!acceptedValue_req.empty()) {
                acceptedValue_req.read(syncGroup);
                state = ACCEPT_VALUE;
            }

            break; 

        }

        case READ_MIN_PROP: {
            for (int i = 0; i < NUM_NODES-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    rdma_read(
                        (NUM_NODES - 1) * myBoardNum + i,
                        LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN + 4 + 4 * (FIFO_LENGTH * i + (minPropFifoIndex%FIFO_LENGTH)),
                        LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN,
                        0x100,
                        m_axis_tx_meta 
                    );
                }
            }

            state = READ_MIN_PROP_RSP; 
            break; 
        }

        case READ_MIN_PROP_RSP: {
            int minPropNumber = INT_MAX, temp; 
            for (int i = 0; i < NUM_NODES-1; i++) {
                temp = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * i + (minPropFifoIndex%FIFO_LENGTH)]; 
                if (temp > minPropNumber) {
                    minPropNumber = temp;
                }
            }
            minPropFifoIndex++; 
            minProp_rsp.write(minPropNumber);
            state = REQUEST; 
            break; 
        }

        case WRITE_READ: {

            for (int i = 0; i < NUM_NODES-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    rdma_write(
                        (NUM_NODES - 1) * myBoardNum + i,
                        0,
                        LOG_BASE_ADDR,
                        0x8,
                        newMinProp,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                    );
                }
            }

            for (int i = 0; i < NUM_NODES-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    rdma_read(
                        (NUM_NODES - 1) * myBoardNum + i,
                        LOG_BASE_ADDR + syncGroup * LOG_PTR_LEN + 4 + 4 * (FIFO_LENGTH * NUM_NODES) + 4 * 2 * NUM_SLOTS + 4 * (2 * FIFO_LENGTH * i + (slotReadFifoIndex%NUM_SLOTS)),
                        LOG_BASE_ADDR + syncGroup * LOG_PTR_LEN + 4 + 4 * (FIFO_LENGTH * NUM_NODES),
                        0x200,
                        m_axis_tx_meta 
                    );
                }
            }
            state = WRITE_READ_RSP;
            break; 
        }

        case WRITE_READ_RSP: {
            LogEntry temp;
            int maxPropNumber = INT_MIN; 
            for (int i = 0; i < NUM_NODES-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    int propNum = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * i + (slotReadFifoIndex%NUM_SLOTS)];
                    int propValue = network_ptr[LOG_BASE_PTR + syncGroup * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * i + (slotReadFifoIndex%NUM_SLOTS) + 1];

                    if (propNum != 0 && propNum > maxPropNumber) {
                        temp = LogEntry(propNum, propValue, true);
                    }
                }
            }

            readSlots_rsp.write(temp);
            slotReadFifoIndex++; 
            state = REQUEST; 
            break; 
        }

        case WRITE_SLOT: {

            ap_uint<64> sendLog; 

            sendLog.range(31, 0) = logSlot.propVal;
            sendLog.range(63, 32) = logSlot.value;

            for (int i = 0; i < NUM_NODES-1; i++) {
                if (FOLLOWER_LIST[i]) {
                    rdma_write(
                        (NUM_NODES - 1) * myBoardNum + i,
                        0,
                        LOG_BASE_ADDR + syncGroup * LOG_ADDR_LEN + LOG_MIN_PROP_ADDR_LEN + logSlot.fuo * 2,
                        0xc,
                        sendLog,
                        m_axis_tx_meta, 
                        m_axis_tx_data
                    );
                }
            }

            state = REQUEST; 
            break; 
        }

        case ACCEPT_VALUE: {
            
            /* Read value from FUO of our own slot, increment FUO if replica 
                Check all Sync_groups as well. 
            */
            for (int i = 0; i < SYNC_GROUPS; i++) {
                int propNum = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * NUM_NODES  + (slotReadFifoIndex%NUM_SLOTS) + fuo[syncGroup]];
                int propValue = network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + 1 + FIFO_LENGTH * NUM_NODES + 2 * NUM_SLOTS + 2 * NUM_NODES + (slotReadFifoIndex%NUM_SLOTS) + fuo[syncGroup] + 1];

                if (propNum != 0) {
                        acceptedValue_rsq.write(updateLocalValue(propValue, syncGroup));
                }
            }
            state = REQUEST; 
            break; 
            
        }

    }


}

void stream_spliter(
    hls::stream<ap_uint<32>>& a,
    hls::stream<ap_uint<32>>& b,
    hls::stream<ap_uint<32>>& c
) {
    ap_uint<32> temp; 

    if (!a.empty()) {
        a.read(temp);
        b.write(temp);
        c.write(temp);
    }
}


void test_input(
    hls::stream<ap_uint<32>>& a
) {
    static bool send = true;
    if (send) {
        a.write(0);
        send = false; 
    }
}

/*

    MU contains the replications engine for conflicting method calls, as well as the leader switch. As input it takes the board number and network_ptr (same as network kernel) 
    and the amount of syncronization groups. After initalizing the leader switch will select Node 0 as the first leader, and setup the logs for all the syncronization groups. 

    We then should be able to issue updates to the 

*/

template<int NUM_NODES, int SYNC_GROUPS>
void mu(
    /* Functionality */
    // ap_uint<32> proposed_value, 
    // int proposed_syn_group,

    hls::stream<ProposedValue>& proposedValue, 

    /* Global constants */
    ap_uint<32> myBoardNum, 
    int *network_ptr,
    int * m_axi_reply,
    /* Connection to network kernel */
    //hls::stream<pkt256>& m_axis_qp_interface, 
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
) {

    //#pragma HLS DATAFLOW 

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
    const int LOG_MIN_PROP_PTR_LEN = 1 + FIFO_LENGTH * NUM_NODES-1; // local heartbeat and remote heartbeat queue
    const int LOG_MIN_PROP_ADDR_LEN = 4 * LOG_MIN_PROP_PTR_LEN; 
    const int LOG_LOCAL_LOG_PTR_LEN = 2 * NUM_SLOTS; // local log 
    const int LOG_LOCAL_LOG_ADDR_LEN = 4 * LOG_LOCAL_LOG_PTR_LEN; 
    const int LOG_REMOTE_LOG_QUEUE_PTR_LEN = 2 * FIFO_LENGTH * NUM_NODES-1;
    const int LOG_REMOTE_LOG_QUEUE_ADDR_LEN = 4 * LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
    const int LOG_PTR_LEN = LOG_MIN_PROP_PTR_LEN + LOG_LOCAL_LOG_PTR_LEN + LOG_REMOTE_LOG_QUEUE_PTR_LEN; 
    const int LOG_ADDR_LEN = LOG_PTR_LEN * 4; 


    static hls::stream<ap_uint<32>> leaderSwitch2StreamSplit; 

    /* Streams between replication engine and leader switch */
    static hls::stream<ap_uint<32>> leaderSwitch2RepEngine;

    /* Streams between leader switch and permision handler */
    static hls::stream<ap_uint<32>> leaderSwitch2PermHandler;

    /* Streams between replication engine and log handler */
    static hls::stream<ap_uint<32>> minProp_req("minimum_prop_request");
    static hls::stream<ap_uint<32>> minProp_rsp("minimum_prop_response");
    static hls::stream<ap_uint<32>> writeNewProp_req("write_new_prop_request");
    static hls::stream<LogEntry> readSlots_req("read_slot_request");  
    static hls::stream<LogEntry> readSlots_rsp("read_slot_response"); 
    static hls::stream<LogEntry> writeSlot_req("write_slot_request");
    static hls::stream<bool> writeSlot_rsp("write_slot_response");
    static hls::stream<ap_uint<32>> acceptedValue_req("accepted_value_request");
    static hls::stream<updateLocalValue> acceptedValue_rsq("accepted_value_response"); 

    #pragma HLS STREAM depth=4 variable=minProp_req;
    #pragma HLS STREAM depth=4 variable=minProp_rsp;
    #pragma HLS STREAM depth=4 variable=writeNewProp_req;
    #pragma HLS STREAM depth=4 variable=readSlots_req;
    #pragma HLS STREAM depth=4 variable=readSlots_rsp;
    #pragma HLS STREAM depth=4 variable=writeSlot_req;
    #pragma HLS STREAM depth=4 variable=writeSlot_rsp;
    #pragma HLS STREAM depth=4 variable=acceptedValue_req;
    #pragma HLS STREAM depth=4 variable=acceptedValue_rsq;

    /* Streams between replication engine to mu */
    static hls::stream<updateLocalValue> updateLocalValue_req;  
    static updateLocalValue update; 

    /* Storing local values */
    static int localValues[SYNC_GROUPS];

    /* Meta pkg streams */
    static hls::stream<pkt256> m_leader_switch_tx_meta; 
    static hls::stream<pkt256> m_log_handler_tx_meta; 

    //static ProposedValue readPV; 

    // if (send) {
    //     valueStream.write(proposed_value);
    //     leaderSwitch2RepEngine.write(0);
    //     send = false; 
    // }

    test_input(leaderSwitch2RepEngine);

    replication_engine<NUM_NODES, SYNC_GROUPS>(
        myBoardNum,
        proposedValue,
        leaderSwitch2RepEngine
        // minProp_req,
        // minProp_rsp,
        // writeNewProp_req,
        // readSlots_req,
        // readSlots_rsp,
        // writeSlot_req,
        // writeSlot_rsp,
        // acceptedValue_req,
        // acceptedValue_rsq,
        // updateLocalValue_req
    );

/*
    leaderSwitch<NUM_NODES, HB_BASE_PTR, HB_BASE_ADDR, FIFO_LENGTH>(
        myBoardNum,
        network_ptr,
        leaderSwitch2StreamSplit,
        m_leader_switch_tx_meta
        //m_axis_qp_conn_interface,
        //m_axi_reply
    );

    permision_handler<NUM_NODES>(
        myBoardNum, 
        leaderSwitch2PermHandler,
        m_axis_qp_interface
    );

    stream_spliter(
        leaderSwitch2StreamSplit,
        leaderSwitch2RepEngine,
        leaderSwitch2PermHandler
    );
*/

    // log_handler<NUM_NODES, SYNC_GROUPS, NUM_SLOTS, FIFO_LENGTH,LOG_BASE_PTR, LOG_BASE_ADDR, LOG_MIN_PROP_PTR_LEN, LOG_MIN_PROP_ADDR_LEN, LOG_LOCAL_LOG_PTR_LEN, LOG_LOCAL_LOG_ADDR_LEN, LOG_REMOTE_LOG_QUEUE_PTR_LEN, LOG_REMOTE_LOG_QUEUE_ADDR_LEN, LOG_PTR_LEN, LOG_ADDR_LEN >(
    //     myBoardNum,
    //     network_ptr,
    //     minProp_req,
    //     minProp_rsp,
    //     writeNewProp_req,
    //     readSlots_req,
    //     readSlots_rsp,
    //     writeSlot_req,
    //     writeSlot_rsp,
    //     acceptedValue_req,
    //     acceptedValue_rsq,
    //     m_axis_tx_meta,
    //     m_axis_tx_data
    // );

    // meta_merger(
    //     m_log_handler_tx_meta,
    //     m_leader_switch_tx_meta,
    //     m_axis_tx_meta
    // );

    if (!updateLocalValue_req.empty()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] += update.value; 
    }

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
        int *network_ptr
    ) {

        #pragma HLS INTERFACE ap_ctrl_chain port=return 
        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        //#pragma HLS DATAFLOW

        static hls::stream<ProposedValue> proposedValue; 
        static bool RTS = false; 
        static pkt64 status; 
        static int counter = 0; 


        if (!s_axis_tx_status.empty()) {
            s_axis_tx_status.read(status);
            proposedValue.write(ProposedValue(1, 0));
            RTS = true; 
        }

        if (RTS) {
            mu<2, 1>(
                proposedValue,
                myBoardNum, 
                network_ptr,
                m_axi_reply,
                m_axis_tx_meta,
                m_axis_tx_data
            );
        }

    }
}




