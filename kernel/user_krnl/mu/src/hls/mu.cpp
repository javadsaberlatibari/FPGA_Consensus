#include "mu.h"

void tx_pkg_sender(
    int s_axi_op,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    bool s_axi_last_data, 
    ap_uint<32> s_axi_keep_data, 
    hls::stream<pkt64>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
) {

    enum fsmStateType {IDLE_STATE, WRITE_META, WAIT_READY, DONE};
    static fsmStateType state = IDLE_STATE;
    pkt256 tx_meta;
    pkt64 tx_data;
    pkt64 tmp_status;
    static ap_uint<64> counter = 111; 

    while(state != DONE){

        switch(state) {

            case IDLE_STATE: 
                if (!s_axis_tx_status.empty()) {
                    s_axis_tx_status.read(tmp_status);
                    state = WRITE_META; 
                }
            
            break; 

            case WRITE_META: 

                tx_meta.data.range(2,0) = s_axi_op; 
                tx_meta.data.range(26,3) = s_axi_lqpn; 
                tx_meta.data.range(74, 27) = s_axi_laddr; 
                tx_meta.data.range(122, 75) = s_axi_raddr; 
                tx_meta.data.range(154, 123) = s_axi_len;
                m_axis_tx_meta.write(tx_meta);

                if (s_axi_op == 1 && s_axi_laddr == 0) {
                    tx_data.data = counter;
                    tx_data.last = s_axi_last_data; 
                    tx_data.keep = s_axi_keep_data;    
                    m_axis_tx_data.write(tx_data);
                    counter++; 
                }

                state = WAIT_READY; 
            
            break; 

            case WAIT_READY: 
                state = DONE; 
            break;

        } 
    }

    state = WRITE_META; 

}


extern "C" {

    void consensus_krnl(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt64>& m_axis_tx_data, 
        hls::stream<pkt64>& s_axis_tx_status, 
        int s_axi_op,
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int s_axi_raddr_read,
        bool s_axi_last_data, 
        ap_uint<32> s_axi_keep_data, 
        bool writer,
        int *m_axi_reply,
        int *network_ptr
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status

        #pragma HLS dataflow
        int wait = 0; 

        if (writer) {
            tx_pkg_sender(
                    s_axi_op,
                    s_axi_lqpn,
                    s_axi_laddr,
                    s_axi_raddr,
                    s_axi_len,
                    s_axi_last_data,
                    s_axi_keep_data,
                    s_axis_tx_status,
                    m_axis_tx_meta,
                    m_axis_tx_data
            );

            m_axi_reply[0] = network_ptr[0]; 
            m_axi_reply[1] = wait; 
        } 

        if (!writer) {
            //for (int i = 0; i < 64; i++)
            network_ptr[0] = 111;
            m_axi_reply[0] = 2; 
        }

    }

}




void leader_switch(
    int board_num, 


    hls::stream<bool> leaderStatus
) {

    static ap_uint<32> scores[NUM_NODES];
    static ap_uint<4> leader = 0; 

    static leaderSwitchStates state = INIT;  

    switch (state) {

        case INIT: {
            if (board_num == 0) {
                leaderStatus.write(1);
            } else {
                leaderStatus.write(0);
            }
            state = PERMISSIONS; 
        }

        case PERMISSIONS: {
            
        }

        case HEARTBEAT_READ: {

        }

        case HEARTBEAT_READ: {

        }




    }




}

enum replicationEngineStates {
    LEADER_SELECTION, 
    PREPARE_READ_MIN, 
    PREP, 
    ACCEPT, 
    DONE
}; 

/*
    replication_engine 
        takes the leader status (true/false) and a list of followers from the leader switch
        Then performs the Prepare and Accept phase of MU

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
void replication_engine(
    hls::stream<ap_uint<32>>& valueStream, 
    hls::stream<bool>& leaderStatus, 
    hls::stream<ap_uint<32>> followers, 
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data, 
    int *network_ptr
) {
    
    /*Possible all this is just done in memory*/
    static Log myLog; 
    
    
    static replicationEngineStates state = INIT;  
    static bool isLeader = false; 

    static ap_uint<32> highestProposalNum = 0; 
    static ap_uint<32> myValue = 0; 
    static ap_uint<32> propValue = 0; 

    /* Assuming NUM_NODES is 6, static inits to all zeros*/
    static bool followList[NUM_NODES]; 
    static int followListIndex = 0; 
    

    switch (state) {

        case INIT: {
            if (!valueStream.empty()) {
                valueStream.read(myValue);
                state = LEADER_SELECTION;
            }
        }

        case LEADER_SELECTION: {
            /* Get the status from leader_switch, if nothing has changed the current replicas state doesn't change */
            if (!leaderStatus.empty()) {
                leaderStatus.read(isLeader)
            }

            if (isLeader) {
                state = GET_FOLLOWERS;
            } else { 
                state = WAIT_REPLICA;
            }
        } 

        case GET_FOLLOWERS: {
            if (!followers.empty()) {
                followers.read(followersList[followListIndex++]);
            } else {
                followListIndex = 0; 
                state = PREPARE_READ_MIN_PROP;
            }
        }

        /* LEADER CATCH UP */
        case LEADER_CATCH_UP: 

        /* REPLICA CATCH UP*/
        case REPLICA_CATCH_UP: 

        case PREPARE_READ_MIN_PROP: {
            /* Send out RDMA reads to all followers and retrieve the minProposal Numbers*/
            for (int i = 0; i < NUM_NODES; i++) {
                if (followers[i]) {
                    rdmaRead(/* Fix rdma reads, and create function to read corresponding minPropValues then writes to network_ptr */);
                }
            }
            state = PREPARE_SELECT_NEW; 
        }

        case PREPARE_READ_MIN_PROP_2: {
            /* Create a mechanism to wait for all the reads to returns*/

        }

        case PREPARE_SELECT_NEW_MIN_PROP: {
            /* Read all the minProposal Numbers and select the highest one (not seen yet)*/
            for (int i = 0; i < NUM_NODES; i++) {
                if (followList[i]) {
                    ap_uint<32> replicasMinPropNum = network_ptr[/* some scalling of i */];
                    highestProposalNum = (highestProposalNum < replicasMinPropNum) ? replicasMinPropNum : highestProposalNum;
                }
            }
            state = PREPARE_WRITE_MIN_PROP_AND_READ_SLOT
        }

        case PREPARE_WRITE_MIN_PROP_AND_READ_SLOT: {

            for (int i = 0; i < NUM_NODES; i++) {
                if (followList[i]) {
                    rdmaWrite(/* write highestProposalNum into all followers  */);
                    rdmaRead(/* read 2 integers from the myFUO slot in the replicas */); //Organize log in memory like | minProp | FUO | SLOT1 prop num | SLOT1 value | ...| SLOT N prop num | SLOT N value |
                }
            }
            state = PREPARE_CHECK_SLOTS; 
        }

        case PREPARE_CHECK_SLOTS: {
            for (int i = 0; i < NUM_NODES; i++) {
                if (followList[i]) {
                    /* Check for non-zero prop values from slots*/
                }
            }
            state = ACCEPT; 
        }

        case ACCEPT_WRITE: {
            for (int i = 0; i < NUM_NODES; i++) {
                if (followList[i]) {
                    /* Check for non-zero prop values from slots*/
                    rdmaWrite(/* write 2 integers into myFUO into replica slot (propVal, value) */)
                }
            }
            state = ACCEPT_DONE

        }

        case ACCEPT_DONE: {

            if (myValue == propValue) {
                state = INIT
            } else {
                state = PREPARE_READ_MIN_PROP;
            }
            /*increment FUO*/
        }


        case WAIT_REPLICA: {
            /* Check for new entries in the local log */

        }


    }



}

/*

    MU contains the replications engine for conflicting method calls, as well as the leader switch. As input it takes the board number and network_ptr (same as network kernel) 
    and the amount of syncronization groups. After initalizing the leader switch will select Node 0 as the first leader, and setup the logs for all the syncronization groups. 

    We then should be able to issue updates to the 



*/

void mu(
    /* Init values */
    int number_of_syn_groups,

    /* Functionality */
    int proposed_value, 
    int proposed_syn_group,


    /* Global constants */
    int board_num, 
    int *network_ptr
) {

    #pragma HLS DATAFLOW 
    static hls::stream<ap_uint<32>>& valueStrea("leaderStatus");
    static hls::stream<bool>& leaderStatus("leaderStatus");
    static hls::stream<ap_uint<32>> followers("followers"); 

    static bool isLeader = 0; 
    static bool followersList[NUM_NODES]; 

    leader_switch(
        board_num,

        leaderStatus,
        followers
    );

    replication_engine(
        valueStream, 
        leaderStatus, 
        followers, 


        network_ptr
    );

}

/*

    Connected to Host

    Performs some application that has confliting use cases. 



*/
void application_layer(

) {





}




