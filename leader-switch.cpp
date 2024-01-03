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