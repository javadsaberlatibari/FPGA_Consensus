#include "util.h"

void replication_engine_fsm(
    int myBoardNum, 
    int num_nodes,
    hls::stream<LogEntry>& propose,
    hls::stream<LogEntry>& prepare_req,
    hls::stream<LogEntry>& prepare_rsp, 
    hls::stream<LogEntry>& writeSlot_req, 
    hls::stream<updateLocalValue>& updateLocalValue_req
) {

    #pragma HLS INTERFACE axis port = propose
    #pragma HLS INTERFACE axis port = prepare_req
    #pragma HLS INTERFACE axis port = prepare_rsp
    #pragma HLS INTERFACE axis port = updateLocalValue_req

    enum fsmStateType {WAIT, PROPOSE, PREPARE_REQUEST, PREPARE_REPLY, ACCEPT};
    static fsmStateType state = WAIT; 

    static bool done = true;
    static int myValue = 0; 
    static ap_uint<32> sGroup = 0;  
    static LogEntry pTemp; 
    static ap_uint<32> newHiPropNum = 0; 
    static ap_uint<32> currentFUO = 0, currentMinProp = 0;
    static LogEntry slot; 
    static int propValue = 0; 

    switch (state)
    {

    case WAIT: 
        state = PROPOSE; 
        break; 

    /* 
        Checks if a new value has been proposed, if so service it.
        if not, check if previous value are finished. if not service them. 
        If they are done, wait 
     */
    case PROPOSE: 
        if (done == true && !propose.empty()) {
            propose.read(pTemp);
            myValue = pTemp.value; 
            sGroup = pTemp.syncGroup;
            currentFUO = pTemp.fuo; 
            done = false; 
            state = PREPARE_REQUEST; 
        } else if (!done) {
            state = PREPARE_REQUEST; 
        } else {
            state = WAIT; 
        }
        break;  
    

    /*
    
        Start Prepare Phase: Sending RDMA read for minimum prosposal number and reading replica slots at FUO.
    
    */
    case PREPARE_REQUEST:
        if (!prepare_req.full()) {
            prepare_req.write(pTemp);
            state = PREPARE_REPLY;
        }
        break; 


    /*

        End Prepare: Select value to accept. Either proposed, or value read from replica. 

    */
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

    /*
    
        Localy apply the accepted value, and then write into replica logs. 

    */
    case ACCEPT: 
        if (!writeSlot_req.full() && !updateLocalValue_req.full()) {
            writeSlot_req.write(LogEntry(newHiPropNum, propValue, sGroup, currentFUO));
            if (myValue == propValue) {
                done = true; 
            } 
            updateLocalValue_req.write(updateLocalValue(propValue, sGroup));  
            state = WAIT;
        }
        break; 

    default:
        break;
    }
    

}


void log_handler_fsm(
    int myBoardNum,
    int num_nodes,
    hls::stream<LogEntry>& prepare_req,
    hls::stream<LogEntry>& prepare_rsp, 
    hls::stream<LogEntry>& writeSlot_req,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
) {

    static int reads = 0; 
    static ap_uint<32> sGroup = 0; 
    static int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS]; 
    static LogEntry logSlot; 
    static int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp; 
    static LogEntry slot, pTemp;
    static ap_uint<64> value; 
    static ap_uint<32> minPropNumber = 0;
    static ap_uint<32> oldMinPropNumber = 0;

    if (!prepare_req.empty() && !minPropReadBram_req.full()) {
        prepare_req.read(pTemp);

        int j=0; 
        int qpn_tmp=myBoardNum*(num_nodes-1);
        while (j<num_nodes){
            if(j!=myBoardNum) {
                if(!m_axis_tx_meta.full()){
                    int slot = (j < myBoardNum) ? j : j-1; 
                    rdma_read(
                        qpn_tmp,
                        LOG_BASE_ADDR + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[pTemp.syncGroup]%FIFO_LENGTH)),
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
        minPropReadBram_req.write(minPropFifoIndex[pTemp.syncGroup]);

    } 
    
    if (!minPropReadBram_rsp.empty() && !readSlotsReadBram_req.full() && !minPropReadBram_req.full()) {
        minPropReadBram_rsp.read(minPropNumber);
        if (minPropNumber < pTemp.propVal) {
            
            minPropFifoIndex[pTemp.syncGroup]+=1; 
            // oldMinPropNumber = minPropNumber;
            // minPropNumber+=1; 
            minPropNumber = pTemp.propVal; 

            int j=0; 
            int qpn_tmp=myBoardNum*(num_nodes-1);
            while (j<num_nodes){
                if(j!=myBoardNum){
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
            while (j<num_nodes){
                if(j!=myBoardNum){
                    if(!m_axis_tx_meta.full()){
                        int slot = (j < myBoardNum) ? j : j-1; 
                        rdma_read(
                            qpn_tmp,
                            LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[pTemp.syncGroup]%NUM_SLOTS)),
                            LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (pTemp.fuo%NUM_SLOTS),
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
            readSlotsReadBram_req.write(LogEntry(minPropNumber, slotReadFifoIndex[pTemp.syncGroup]));   
        } else {
            minPropReadBram_req.write(minPropFifoIndex[pTemp.syncGroup]);
        }
    }

    if (!readSlotsReadBram_rsp.empty() && !prepare_rsp.full()) {
        readSlotsReadBram_rsp.read(slot);
        prepare_rsp.write(slot);
        slotReadFifoIndex[pTemp.syncGroup]+=2; 

    }
    
    if (!writeSlot_req.empty()) {
        writeSlot_req.read(logSlot);
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
                        LOG_BASE_ADDR + LOG_MIN_PROP_ADDR_LEN + 4 * (logSlot.fuo%NUM_SLOTS),
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

    } 
}

void smr(
    int myBoardNum, 
    int num_nodes,
    hls::stream<LogEntry>& client,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<LogEntry>& logReadBram_rsp,
    hls::stream<bool>& smr_finished, 
    hls::stream<ap_uint<32>>& smr_update, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
) {

    static hls::stream<LogEntry> proposed; 
    #pragma HLS STREAM depth=8 variable=proposed
    static hls::stream<ap_uint<32>> minProp_req;
    static hls::stream<ap_uint<32>> minProp_rsp;
    static hls::stream<ap_uint<32>> writeNewProp_req;
    static hls::stream<LogEntry> readSlots_req;  
    static hls::stream<LogEntry> readSlots_rsp; 
    static hls::stream<LogEntry> prepare_req;
    static hls::stream<LogEntry> prepare_rsp;
    static hls::stream<LogEntry> writeSlot_req;
    static hls::stream<ap_uint<32>> acceptedValue_req;
    static hls::stream<updateLocalValue> acceptedValue_rsq; 
    static hls::stream<updateLocalValue> updateLocalValue_req;  

    static int minProp[SYNC_GROUPS], FUO[SYNC_GROUPS], localValues[SYNC_GROUPS];;
    static LogEntry pTemp; 

    static updateLocalValue update; 
    static LogEntry slot; 

    if (!client.empty() && !proposed.full()) {
        client.read(pTemp);
        minProp[pTemp.syncGroup] +=1; 
        pTemp.fuo = FUO[pTemp.syncGroup];
        pTemp.propVal = minProp[pTemp.syncGroup];
        FUO[pTemp.syncGroup]+=2;
        proposed.write(pTemp);
    }

    replication_engine_fsm(
        myBoardNum,
        num_nodes,
        proposed,
        prepare_req,
        prepare_rsp,
        writeSlot_req,
        updateLocalValue_req
    );

    log_handler_fsm(
        myBoardNum,
        num_nodes,  
        prepare_req,
        prepare_rsp,
        writeSlot_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        m_axis_tx_meta,
        m_axis_tx_data
    );

    //Update from Conflicting Method Calls
    if (!updateLocalValue_req.empty() && !smr_finished.full() && !smr_update.full()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] = update.value;
        smr_update.write(update.value);
        smr_finished.write(1);
    }

    //Replica Update
    if (!logReadBram_rsp.empty() && !smr_update.full()) {
        
        logReadBram_rsp.read(slot);
        minProp[slot.syncGroup] = slot.propVal;
        FUO[slot.syncGroup] = slot.fuo;
        localValues[slot.syncGroup] = slot.value; 
        smr_update.write(slot.value);
    }

}


void crdt_counter(
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
                        BROADCAST_BASE_ADDR + (4 * 2 * myBoardNum),
                        0x8,
                        (ap_uint<64>) pValue,
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

void bank(
    int myBoardNum,
    int* ops, 
    ap_uint<32>* amount, 
    int num_ops, 
    int* reply_bank,
    int num_nodes,
    int debug_exe,
    hls::stream<ap_uint<32>>& query_mem_req,
    hls::stream<ap_uint<32>>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<LogEntry>& logReadBram_rsp,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data
) {
    

    #pragma HLS INTERFACE axis port = query_mem_req
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_rsp
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data

    static hls::stream<bool> smr_finished;
    static hls::stream<ap_uint<32>> smr_update;
    static hls::stream<bool> ncc_finished; 
    #pragma HLS STREAM depth=8 variable=smr_finished
    #pragma HLS STREAM depth=8 variable=ncc_finished
    static hls::stream<LogEntry> client; 
    #pragma HLS STREAM depth=8 variable=client
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
    static int intial_value = 100000, withrdraw = 0, deposits = 0; 

    while (debug_counter < debug_exe && counter < num_ops) {
    //while(counter < num_ops) {
        if (read_op) {
            switch(ops[counter]) {
                

                //Only leader will issue conflicting method calls.
                case 0: {
                    if (intial_value + withrdraw + deposits - amount[counter] >= 0 && !client.full()) {
                        client.write(LogEntry(0, amount[counter], 0, 0));
                        read_op = false; 
                    } else {
                        counter++; 
                    }
                    break; 
                }

                case 1: {
                    if (!broadcast_req.full()) {
                        deposits += (int) amount[counter];
                        broadcast_req.write((ap_uint<32>) deposits);
                        counter++;  
                    }
                    break;
                }

                case 2: {
                    if (!query_mem_req.full()){ 
                        query_mem_req.write(intial_value + withrdraw + deposits);
                        counter++;  
                    }
                    break; 
                }
            }
            
        }

        smr(
            myBoardNum,
            num_nodes,
            client,
            minPropReadBram_req,
            minPropReadBram_rsp,
            readSlotsReadBram_req,
            readSlotsReadBram_rsp,
            logReadBram_rsp,
            smr_finished,
            smr_update,
            smr_tx_meta,
            smr_tx_data
        );

        crdt_counter(
            myBoardNum,
            num_nodes,
            broadcast_req, 
            ncc_tx_meta,
            ncc_tx_data
        );

        meta_merger( 
            smr_tx_meta, 
            ncc_tx_meta, 
            smr_tx_data,
            ncc_tx_data,
            m_axis_tx_meta,
            m_axis_tx_data
        );

        // data_merger(

            
        // );

        //Perform totally ordered operation from the SMR (not always proposed value or leader)
        if (!smr_update.empty()) {
            ap_uint<32> temp; 
            smr_update.read(temp);
            withrdraw -= (int) temp; 
        }

        //See if proposed value is finshed move on to next operation. 
        if (!smr_finished.empty()) {
            bool temp; 
            smr_finished.read(temp);
            read_op = true;
            counter++; 
        } 

        debug_counter++; 
    }

}

void mem_manager(  
                volatile int *network_ptr, 
                volatile int *reply, 
                int node_num, 
                int board_num, 
                int query_num, 
                int exe, 
                hls::stream<ap_uint<32>>& axis_mem_request,
                hls::stream<ap_uint<32>>& minPropReadBram_req,
                hls::stream<ap_uint<32>>& minPropReadBram_rsp,
                hls::stream<LogEntry>& readSlotsReadBram_req,
                hls::stream<LogEntry>& readSlotsReadBram_rsp,
                hls::stream<LogEntry>& logReadBram_rsp
                ) {


    #pragma HLS INTERFACE axis port = axis_mem_request
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_rsp


    static int bram_counter=0;
    static int update_period=1000;
    static ap_uint<512> internal_clock=0;
    static int query_cnt=0;
    static int exe_cnt = 0; 
    static int remote_counter=0;

    static ap_uint<32> minPropIndex; 
    static LogEntry slotIndex; 
    static ap_uint<32> slotRead; 

    ap_uint<32> tmp_local_counter; 
    static int minProp = 0; 
    static ap_uint<64> maxPropNumber = 0; 
    static int propNum, propValue;  
    static bool check_throughput_counter = false; 

    static int FUO[SYNC_GROUPS];

    while (query_cnt<query_num && exe_cnt < exe){
    //while (query_cnt<query_num) {   
        exe_cnt++; 
        internal_clock++;

        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_local_counter);
            query_cnt++;
            reply[0] = tmp_local_counter + bram_counter;
        } 
        
        if (!minPropReadBram_req.empty() && !minPropReadBram_rsp.full()) {

            minPropReadBram_req.read(minPropIndex);
            //minProp = 0; 
            for (int i = 0; i < node_num-1; i++) {
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
            for (int i = 0; i < node_num-1; i++) {
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
        
        if (board_num != 0) {
            for (int i = 0; i < SYNC_GROUPS; i++) {
                if (network_ptr[LOG_BASE_PTR + i * LOG_PTR_LEN + LOG_MIN_PROP_PTR_LEN + FUO[i]%NUM_SLOTS] && !logReadBram_rsp.full()) {
                    
                    LogEntry slot; 
                    
                    slot.propVal = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotRead%NUM_SLOTS];
                    slot.value = network_ptr[LOG_BASE_PTR + LOG_MIN_PROP_PTR_LEN + slotRead%NUM_SLOTS + 1];
                    slot.fuo = FUO[i];
                    slot.syncGroup = i; 

                    FUO[i] += 2; 
                    
                    logReadBram_rsp.write(slot);

                }
            }
        }

        if(internal_clock==update_period){
            internal_clock=0;
            remote_counter=0;

            for (int i=0; i<node_num; i++){
                if(i!=board_num){
                    remote_counter += network_ptr[BROADCAST_BASE_PTR + 2*i];
                }
            }

            bram_counter = remote_counter;
        }
    }
    
}

void bank_account_op_krnl(
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<pkt64>& s_axis_tx_status,
    int myBoardNum,
    int* ops, 
    ap_uint<32>* amount, 
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
    static hls::stream<LogEntry> readSlotsReadBram_req;
    static hls::stream<LogEntry> readSlotsReadBram_rsp;
    static hls::stream<LogEntry> logReadBram_req;
    static hls::stream<LogEntry> logReadBram_rsp;
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
        myBoardNum,
        ops,
        amount,
        num_ops,
        reply_bank,
        num_nodes,
        bank_debug_exe,
        query_mem_req,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_rsp,
        m_axis_tx_meta,
        m_axis_tx_data
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
        logReadBram_rsp
    );

}

