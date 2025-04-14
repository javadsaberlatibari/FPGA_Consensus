#include "movie_stream_krnl.h"

#define TH 0

const int BUFFER_SIZE = 16;
const int SWAP_SIZE = BUFFER_SIZE/2;

void load_buffer(
    int op_num,
    ap_uint<64>* operations_list, 
    hls::stream<ap_uint<64>>& operation_stream
) {
    //#pragma HLS PIPELINE II=1
    //#pragma HLS ARRAY_PARTITION variable=operation_buffer complete dim=1
    static bool loaded = false; 
    static int available_ops_index = 0;
    static int read_bram_index=0;
    const int BUFFER_SIZE = 16;
    static ap_uint<64> operation_buffer[BUFFER_SIZE];
    static int op_cnt_write=0;
    static int op_cnt_read=0;
    static bool bram_full= false;
    static bool response= false;
    static int k=0;
    static int debug=0;
    int tmp_read;

    while(op_cnt_read<op_num){
        if(op_cnt_write<op_num && !bram_full){
            for (int i = 0; i < 8; i++) {
                #pragma HLS UNROLL
                operation_buffer[k+i]=operations_list[op_cnt_write];
                op_cnt_write++;
                available_ops_index++;
            }
            k = (k == 0) ? 8 : 0;
        }
        if(available_ops_index>0){
            response=true;
        } else {
            response=false;
        }

        if (response){
            if(!operation_stream.full()){
                operation_stream.write(operation_buffer[read_bram_index]);
                available_ops_index--;
                op_cnt_read++;
                read_bram_index++;
            }
            if (read_bram_index==BUFFER_SIZE)
                read_bram_index=0;
        }
        if(available_ops_index<=8)
            bram_full=false;
        else 
            bram_full=true;
    }
}


void replication_engine_fsm(
    hls::stream<ProposedValue>& propose,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<updateLocalValue>& updateLocalValue_req,
    hls::stream<ap_uint<256>>& m_axis_tx_meta,
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    int board_number,
    int number_of_nodes
) {

    #pragma HLS INTERFACE axis port = propose
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_req
    #pragma HLS INTERFACE axis port = logReadBram_rsp
    #pragma HLS INTERFACE axis port = updateLocalValue_req

    enum fsmStateType {
            INIT, 
            PROPOSE, 
            PREPARE_READ_PROP_REQ, 
            PREPARE_READ_PROP_MEM, 
            PREPARE_READ_PROP_RESP, 
            PREPARE_WRITE_READ_REQ, 
            PREPARE_SLOT_READ_MEM,
            PREPARE_SLOT_READ_RESP,
            ACCEPT
    };
    static fsmStateType state = INIT;
    static bool done = true;

    static ProposedValue pVal;
    static ap_uint<32> newHiPropNum = 0;
    static LogEntry slot;
    static int propValue = 0;
    static int reads = 0;
    static ap_uint<32> prepare_sGroup = 0, prepare2_sGroup = 0, prepare3_sGroup = 0, accept_sGroup = 0;
    static volatile int minPropFifoIndex[SYNC_GROUPS], slotReadFifoIndex[SYNC_GROUPS], slotAcceptFifoIndex[SYNC_GROUPS];
    static LogEntry logSlot;
    static volatile int fuo[SYNC_GROUPS];
    static ap_uint<32> newMinProp;
    static ap_uint<64> value;
    static ap_uint<32> minPropNumber = 0;
    static ap_uint<32> oldMinPropNumber = 0;
    static bool read_slot = true; 


    static ProposedValue proposed_value; 
    static int operation = 0;
    static ap_uint<32> sGroup = 0;
    static bool slowpath = true; 
    static bool slot_read = false; 


    //State of Replication
    switch (state) {
        case INIT:
            state = PROPOSE;
            break;

        case PROPOSE:
            if (!done) {
                if (slowpath) 
                    state = PREPARE_READ_PROP_REQ;
                else 
                    state = PREPARE_WRITE_READ_REQ;
            } else {
                state = PROPOSE; 
            }
            break;

        case PREPARE_READ_PROP_REQ:
            if (slowpath)
                state = PREPARE_READ_PROP_MEM; 
            else 
                state = ACCEPT; 
            break;

        case PREPARE_READ_PROP_MEM: 
            state = PREPARE_READ_PROP_RESP;
            break; 


        case PREPARE_READ_PROP_RESP: 
            if (minPropNumber != oldMinPropNumber || minPropFifoIndex[prepare_sGroup] == 0) {
                state = PREPARE_WRITE_READ_REQ; 
            } else {
                state = PREPARE_READ_PROP_MEM;
            }
            break; 


        case PREPARE_WRITE_READ_REQ:
            state = PREPARE_SLOT_READ_MEM; 
            break;


        case PREPARE_SLOT_READ_MEM:
            state = PREPARE_SLOT_READ_RESP;
            break; 


        case PREPARE_SLOT_READ_RESP:
            if (slot_read) {
                state = ACCEPT; 
            } else {
                state = PREPARE_SLOT_READ_MEM; 
            }
            break; 

        case ACCEPT:
            if (operation == propValue) {
                done = true;
            }
            state = PROPOSE; 
            break;

        default:
            break;
    }


    //Replication Actions
    switch(state) {
        case PROPOSE: {
            if (done == true && !propose.empty()) {
                propose.read(proposed_value);
                operation = proposed_value.value;
                sGroup = proposed_value.syncronizationGroup;
                done = false;
                std::cout << "Value: " << operation << std::endl; 
                //state = PREPARE_REQUEST;
            } 
            break; 
        }
         
        case PREPARE_READ_PROP_REQ: {
            int j=0;
            int qpn_tmp=board_number*(number_of_nodes-1);
            PREPARE_READ_PROPOSAL_NUMBER_LOOP : while (j<number_of_nodes){
                if(j!=board_number && FOLLOWER_LIST[j]) {
                    if(!m_axis_tx_meta.full()){
                        int slot = (j < board_number) ? j : j-1;
                        rdma_read(
                            qpn_tmp,
                            LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup) + 8 + 4 * (FIFO_LENGTH * (slot) + (minPropFifoIndex[sGroup]%FIFO_LENGTH)),
                            LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup),
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
            break; 
        }

        case PREPARE_READ_PROP_MEM: {
            if (!minPropReadBram_req.full()) {
                minPropReadBram_req.write(LogEntry(0, minPropFifoIndex[sGroup], sGroup));
            }
            break; 
        }

        case PREPARE_READ_PROP_RESP: {
            if (!minPropReadBram_rsp.empty() && !readSlotsReadBram_req.full()) {
                minPropReadBram_rsp.read(minPropNumber);
            }
            break; 
        }

        case PREPARE_WRITE_READ_REQ: {
            minPropFifoIndex[sGroup]+=1;
            oldMinPropNumber = minPropNumber;
            minPropNumber+=1;
            int j=0;
            int qpn_tmp=board_number*(number_of_nodes-1);
            VITIS_LOOP_215_2: while (j<number_of_nodes){
                if(j!=board_number && FOLLOWER_LIST[j]){
                    if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                        rdma_write(
                            qpn_tmp,
                            0,
                            LOG_BASE_ADDR + (LOG_ADDR_LEN * sGroup),
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
            if (slowpath) {
                j=0;
                qpn_tmp=board_number*(number_of_nodes-1);
                VITIS_LOOP_237_3: while (j<number_of_nodes){
                    if(j!=board_number && FOLLOWER_LIST[j]){
                        if(!m_axis_tx_meta.full()){
                            int slot = (j < board_number) ? j : j-1;
                            rdma_read(
                                qpn_tmp,
                                LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + LOG_LOCAL_LOG_ADDR_LEN + 4 * (2 * FIFO_LENGTH * slot + (slotReadFifoIndex[prepare_sGroup]%NUM_SLOTS)),
                                LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
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
            }
            break; 
        }

        case PREPARE_SLOT_READ_MEM: {
            readSlotsReadBram_req.write(LogEntry(minPropNumber, slotReadFifoIndex[sGroup], sGroup));
            break; 
        }

        case PREPARE_SLOT_READ_RESP: {
            if (!readSlotsReadBram_rsp.empty()) {
                readSlotsReadBram_rsp.read(slot);
                if(!slot.valid) {
                    slowpath =false; 
                } else {
                    slowpath = true; 
                }

                std::cout << "Value: " << operation << std::endl; 
                if (slot.valid) {
                    propValue = slot.value;
                } else {
                    propValue = operation;
                }
                std::cout << "Value: " << propValue << std::endl; 
                newHiPropNum = slot.propVal;

                slot_read = true;
                slotReadFifoIndex[sGroup]+=2;
            }
            break; 
        }

        case ACCEPT: {
            if (!updateLocalValue_req.full()) {
                ap_uint<64> sendLog;
                sendLog.range(31, 0) = newHiPropNum;
                sendLog.range(63, 32) = propValue;
                int j=0;
                int qpn_tmp=board_number*(number_of_nodes-1);
                VITIS_LOOP_279_4: while (j<number_of_nodes){
                    if(j!=board_number && FOLLOWER_LIST[j]){
                        if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                            rdma_write(
                                qpn_tmp,
                                0,
                                LOG_BASE_ADDR + LOG_ADDR_LEN * sGroup + LOG_MIN_PROP_ADDR_LEN + 4 * (fuo[sGroup]%NUM_SLOTS),
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
                updateLocalValue_req.write(updateLocalValue(propValue, sGroup));
            }
            break; 
        }
    }
}

void smr(
    hls::stream<ap_uint<256>>& smr_update,
    hls::stream<ProposedValue>& proposedValue,
    hls::stream<ap_uint<256>>& m_axis_tx_meta,
    hls::stream<ap_uint<64>>& m_axis_tx_data,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    int board_number,
    int number_of_nodes


) {
    static ap_uint<64> localValues[SYNC_GROUPS];
    static updateLocalValue update;
    static int permissible;
    static int query;
    static int counter = 0;

    static hls::stream<updateLocalValue> updateLocalValue_req;

    replication_engine_fsm(
        proposedValue,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        updateLocalValue_req,
        m_axis_tx_meta,
        m_axis_tx_data,
        board_number,
        number_of_nodes
    );

    if (!updateLocalValue_req.empty() && !smr_update.full()) {
        updateLocalValue_req.read(update);
        localValues[update.syncGroup] = update.value;
        smr_update.write(update.value);
    }


}

void addStudent(
    int board_number, 
    int number_of_nodes,
    hls::stream<ap_uint<32>>& broadcast_req, 
    hls::stream<ap_uint<256>>& m_axis_tx_meta, 
    hls::stream<ap_uint<64>>& m_axis_tx_data
) {
    #pragma HLS inline off

    #pragma HLS INTERFACE axis port = broadcast_req
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    static ap_uint<32> pValue; 
    static int queue_slots = 0;
    if (!broadcast_req.empty()) {
        broadcast_req.read(pValue);
        int j=0; 
        int qpn_tmp=board_number*(number_of_nodes-1);

        //std::cout << "Stock Increment: Item " << pValue.range(31, 16) << " by " << pValue.range(15, 0) << std::endl; 
        while (j<number_of_nodes){
            if(j!=board_number){
                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()) { 
                    rdma_write(
                        qpn_tmp,
                        0,
                        BROADCAST_BASE_ADDR + 4 * (BROADCAST_SG_LEN * board_number + queue_slots),
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
        queue_slots++; 
    }

}

void mem_manager( 
    volatile int *network_ptr,
    int number_of_nodes,
    int board_number,
    int exe,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& permissibility_req,
    hls::stream<ap_uint<32>>& permissibility_rsp,
    hls::stream<ap_uint<64>>& update_rsp,
    hls::stream<ap_uint<64>>& update_noncon_rsp,
    hls::stream<bool>& throughput_check
){
    #pragma HLS PIPELINE
    #pragma HLS INTERFACE axis port = minPropReadBram_req
    #pragma HLS INTERFACE axis port = minPropReadBram_rsp
    #pragma HLS INTERFACE axis port = readSlotsReadBram_req
    #pragma HLS INTERFACE axis port = readSlotsReadBram_rsp
    #pragma HLS INTERFACE axis port = logReadBram_req
    #pragma HLS INTERFACE axis port = logReadBram_rsp
    #pragma HLS INTERFACE axis port = update_rsp
    #pragma HLS INTERFACE axis port = update_noncon_rsp

    static ap_uint<512> internal_clock=0;
    static int hbm_tmp=0;
    static int remote_bank_accounts = 0;
    static LogEntry slotIndex, minPropIndex;
    static ap_uint<32> slotRead, psig, ptemp;
    static int log_index[NUM_NODES];
    volatile bool sig = false;
    static ap_uint<64>  s_sig = 0; 
    static int minProp = 0;
    static ap_uint<64> maxPropNumber = 0, update;
    static int propNum, propValue;
    static bool check_throughput_counter = false;
    static bool read_slot = true; 

    static int FUO[SYNC_GROUPS];
    static int queue_slots[NUM_NODES];
    static bool running = true; 

    while (running) {

        //internal_clock++;

        if (!throughput_check.empty()) {
            throughput_check.read(running);
            running = false; 
        }

        if (!minPropReadBram_req.empty() && !minPropReadBram_rsp.full()) {

            minPropReadBram_req.read(minPropIndex);

            VITIS_LOOP_622_2: for (int i = 0; i < number_of_nodes-1; i++) {
                int temp = network_ptr[LOG_BASE_PTR + (LOG_PTR_LEN * minPropIndex.syncGroup) + 2 + FIFO_LENGTH * i + (minPropIndex.value%FIFO_LENGTH)];
                if (temp > minProp) {
                    minProp = temp;
                }
            }
            minPropReadBram_rsp.write(minProp);

        }

        if (!readSlotsReadBram_req.empty() && !readSlotsReadBram_rsp.full()) {

            readSlotsReadBram_req.read(slotIndex);
            if (read_slot) {
                maxPropNumber = 0;
                VITIS_LOOP_636_3: for (int i = 0; i < number_of_nodes-1; i++) {
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
                    read_slot = false; 
                    readSlotsReadBram_rsp.write(LogEntry(slotIndex.propVal, 0));
                }
            } else {
                std::cout << "Value in MEM MNGER: " << slotIndex.propVal<< std::endl; 
                readSlotsReadBram_rsp.write(LogEntry(slotIndex.propVal, 0, false));
            }

        }

        //if (internal_clock == 10000) {
            //deposit

        // if (!update_noncon_rsp.full()) {
        //     hbm_tmp = 0;
        //     for (int i=0; i<number_of_nodes; i++){
        //         if(i!=board_number){
        //             hbm_tmp=network_ptr[BROADCAST_BASE_ADDR + (BROADCAST_SG_LEN * board_number + queue_slots[i])];
        //             if (hbm_tmp != 0) {
        //                 queue_slots[i]++;
        //                 update_noncon_rsp.write(hbm_tmp);
        //             }
        //         }
        //     }
            
        // }
        
        if (!update_rsp.full()) {
            for (int i = 0; i < SYNC_GROUPS; i++) {
                int index = LOG_BASE_PTR + LOG_PTR_LEN * i + FUO[i]; 
                int log_proposal_number = network_ptr[LOG_BASE_PTR + LOG_PTR_LEN * i + LOG_MIN_PROP_PTR_LEN + FUO[i]];
                int log_operation = network_ptr[LOG_BASE_PTR + LOG_PTR_LEN * i + LOG_MIN_PROP_PTR_LEN + FUO[i] + 1];
                if (log_proposal_number != 0) {
                    std::cout << "Log change found! Prop: " << log_proposal_number << " Operation: " << log_operation << std::endl; 
                    update = log_operation;
                    update_rsp.write(update);
                    FUO[i]+=2; 
                }
            }
        }
            // internal_clock = 0; 
        //}
    }
}

void movie(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    int board_number,
    hls::stream<ap_uint<64>>& operation_stream,
    int number_of_operations,
    int number_of_nodes,
    int debug_exe,
    volatile int* HBM_PTR,
    hls::stream<LogEntry>& minPropReadBram_req,
    hls::stream<ap_uint<32>>& minPropReadBram_rsp,
    hls::stream<LogEntry>& readSlotsReadBram_req,
    hls::stream<LogEntry>& readSlotsReadBram_rsp,
    hls::stream<ap_uint<32>>& logReadBram_req,
    hls::stream<ap_uint<64>>& logReadBram_rsp,
    hls::stream<ap_uint<32>>& permissibility_req,
    hls::stream<ap_uint<32>>& permissibility_rsp,
    hls::stream<ap_uint<64>>& update_rsp,
    hls::stream<ap_uint<64>>& update_noncon_rsp,
    hls::stream<bool>& throughput_check
) {
    #pragma HLS PIPELINE
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data

    /*
        Internal streams for SMR module
    */
    static hls::stream<ap_uint<256>> smr_updated;
    static hls::stream<ProposedValue> proposed;
    static hls::stream<ap_uint<256>> smr_tx_meta;
    static hls::stream<ap_uint<64>> smr_tx_data;
    #pragma HLS STREAM depth=64 variable=smr_updated
    #pragma HLS STREAM depth=64 variable=proposed
    #pragma HLS STREAM depth=64 variable=smr_tx_meta
    #pragma HLS STREAM depth=64 variable=smr_tx_data

    /*
        Internal streams for sellItem module
    */
    static hls::stream<ap_uint<32>> stock_req;
    static hls::stream<ap_uint<256>> stock_tx_meta;
    static hls::stream<ap_uint<64>> stock_tx_data;
    #pragma HLS STREAM depth=64 variable=stock_tx_meta
    #pragma HLS STREAM depth=64 variable=stock_tx_data
    
    /*
        Internal streams for openAuction module
    */
    static hls::stream<ap_uint<32>> add_req;
    static hls::stream<ap_uint<256>> add_tx_meta;
    static hls::stream<ap_uint<64>> add_tx_data;
    #pragma HLS STREAM depth=64 variable=add_tx_meta
    #pragma HLS STREAM depth=64 variable=add_tx_data

    /*DEBUG STREAMS*/
    static hls::stream<ap_uint<256>> debug_tx_meta;
    static hls::stream<ap_uint<64>> debug_tx_data;

    /*
        Interal streams between SMR and MEM Manager
    */

    ap_uint<32> proposed_value, temp_amount, permiss_rsp;
    ap_uint<64> update, update_noncon; 
    static int counter = 0;
    static int debug_counter = 0;
    static bool done = true;
    static bool throughput_finished = false; 

    static int movie_size = 0;
    static int customer_size = 0;

    static bool movies[2000];
    static bool customers[2000];

    static int withdraw_updates = 0; 
    static ap_uint<64> operation; 

    static bool loaded = false; 

    BANK_MAIN_LOOP: while (counter < number_of_operations || withdraw_updates < debug_exe) {

        debug_counter++;

        if (!loaded && !operation_stream.empty()) { 
            operation_stream.read(operation);
            loaded = true; 
        }

        std::cout << "Counter: " << counter <<  " Method: " << operation << std::endl; 
        if (loaded) {
            switch (operation.range(31, 0))
            {

                //AddMovie
                case 0: 
                //RemoveMovie
                case 1: 
                //AddCustomer
                case 2: 
                //RemoveCustomer
                case 3:
                {
                    std::cout << "Method: " << operation.range(31, 0) << " Value: " << temp_amount.range(31, 0) << std::endl;
                    if (!proposed.full() && done) {
                        temp_amount = operation.range(63, 32);
                        proposed_value.range(31, 30) = operation.range(31, 0); 
                        proposed_value.range(29, 0) = temp_amount.range(31, 0);
                        int sync = (operation.range(31, 0) < 2) ? 0 : 1; 
                        proposed.write(ProposedValue(proposed_value, sync));
                        done = false;
                        loaded = false; 
                    }
                    break;
                }
            }
        }


        smr(
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
            board_number,
            number_of_nodes
        );


        meta_merger(
            smr_tx_meta,
            //add_tx_meta,
            m_axis_tx_meta
        );

        data_merger(
            smr_tx_data,
            //add_tx_data,
            m_axis_tx_data
        );

        // mem_manager(
        //     HBM_PTR,
        //     number_of_nodes,
        //     board_number,
        //     debug_exe,
        //     minPropReadBram_req,
        //     minPropReadBram_rsp,
        //     readSlotsReadBram_req,
        //     readSlotsReadBram_rsp,
        //     logReadBram_req,
        //     logReadBram_rsp,
        //     permissibility_req,
        //     permissibility_rsp,
        //     update_rsp,
        //     update_noncon_rsp,
        //     throughput_check
        // );


        if (!smr_updated.empty()) {
            ap_uint<256> temp;
            smr_updated.read(temp);
            done = true;
            counter++;
            switch (temp.range(31, 30))
            {
            case 0:
                std::cout << "AddMovie - Movie ID: " << temp.range(29, 0) << std::endl; 
                movies[temp.range(29, 0)] = true;
                movie_size++;
                break;
            
            case 1:
                std::cout << "DeleteMovie - Movie ID: " << temp.range(29, 0) << std::endl; 
                movies[temp.range(29, 0)] = false; 
                movie_size--;
                break; 

            case 2:
                std::cout << "AddCustomer Customer ID: " << temp.range(29, 0)  << std::endl; 
                customers[temp.range(29, 0)] = true;
                customer_size++;
                break;

            case 3:
                std::cout << "RemoveCustomer Customer ID: " << temp.range(29, 0)  << std::endl; 
                customers[temp.range(29, 0)] = false;
                customer_size--;
                break;
            default:
                break;
            }

        }

        if (!update_rsp.empty()) {
            update_rsp.read(update);
            std::cout << "Updaing from Log! Method: " << update.range(31, 30) << " Operation: " << update.range(29, 0) << std::endl; 
            switch (update.range(31, 30))
            {
            case 0:
                std::cout << "AddMovie - Movie ID: " << update.range(29, 0) << std::endl; 
                movies[update.range(29, 0)] = true;
                movie_size++;
                break;
            
            case 1:
                std::cout << "DeleteMovie - Movie ID: " << update.range(29, 0) << std::endl; 
                movies[update.range(29, 0)] = false; 
                movie_size--;
                break; 

            case 2:
                std::cout << "AddCustomer Customer ID: " << update.range(29, 0)  << std::endl; 
                customers[update.range(29, 0)] = true;
                customer_size++;
                break;

            case 3:
                std::cout << "RemoveCustomer Customer ID: " << update.range(29, 0)  << std::endl; 
                customers[update.range(29, 0)] = false;
                customer_size--;
                break;
            default:
                break;
            }

            withdraw_updates++;

        }

        // if (!update_noncon_rsp.empty()) {
        //     update_noncon_rsp.read(update_noncon);
        //     if (update_noncon < 2000 && update_noncon >= 0)
        //         students[update_noncon] = 1; 
        // }

    }
    if (withdraw_updates >= debug_exe) {
        throughput_check.write(false);
    }

}

void movie_stream_krnl(
    hls::stream<pkt256>& m_axis_tx_meta,
    hls::stream<pkt64>& m_axis_tx_data,
    hls::stream<pkt64>& s_axis_tx_status,
    ap_uint<64>* operation_list,
    volatile int* HBM_PTR,
    int board_number,
    int number_of_operations,
    int number_of_nodes,
    int debug_exe
) {

    #pragma HLS INTERFACE m_axi port=operation_list bundle=gmem0
    #pragma HLS INTERFACE m_axi port=HBM_PTR bundle=gmem1
    #pragma HLS INTERFACE axis port = m_axis_tx_meta
    #pragma HLS INTERFACE axis port = m_axis_tx_data
    #pragma HLS INTERFACE axis port = s_axis_tx_status
    #pragma HLS dataflow


    pkt64 status; 
    static hls::stream<ap_uint<64>> operation_stream;
    #pragma HLS STREAM depth=SWAP_SIZE variable=operation_stream

    static hls::stream<LogEntry> minPropReadBram_req;
    static hls::stream<ap_uint<32>> minPropReadBram_rsp;
    static hls::stream<LogEntry> readSlotsReadBram_req;
    static hls::stream<LogEntry> readSlotsReadBram_rsp;
    static hls::stream<ap_uint<32>> logReadBram_req;
    static hls::stream<ap_uint<64>> logReadBram_rsp;
    static hls::stream<ap_uint<32>> permissibility_req;
    static hls::stream<ap_uint<32>> permissibility_rsp;
    static hls::stream<ap_uint<64>> update_rsp;
    static hls::stream<ap_uint<64>> update_noncon_rsp;
    static hls::stream<bool> throughput_check;
    #pragma HLS STREAM depth=8 variable=minPropReadBram_req
    #pragma HLS STREAM depth=8 variable=minPropReadBram_rsp
    #pragma HLS STREAM depth=8 variable=readSlotsReadBram_req
    #pragma HLS STREAM depth=8 variable=readSlotsReadBram_rsp
    #pragma HLS STREAM depth=8 variable=logReadBram_req
    #pragma HLS STREAM depth=8 variable=logReadBram_rsp
    #pragma HLS STREAM depth=8 variable=permissibility_req
    #pragma HLS STREAM depth=8 variable=permissibility_rsp
    #pragma HLS STREAM depth=8 variable=update_rsp
    #pragma HLS STREAM depth=8 variable=update_noncon_rsp

    if (!s_axis_tx_status.empty()) {
        s_axis_tx_status.read(status);
    }

    movie(
        m_axis_tx_meta,
        m_axis_tx_data,
        board_number,
        operation_stream,
        number_of_operations,
        number_of_nodes,
        debug_exe,
        HBM_PTR,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        permissibility_req,
        permissibility_rsp,
        update_rsp,
        update_noncon_rsp,
        throughput_check
    );

    load_buffer(
        number_of_operations,
        operation_list,
        operation_stream
    );

    mem_manager(
        HBM_PTR,
        number_of_nodes,
        board_number,
        debug_exe,
        minPropReadBram_req,
        minPropReadBram_rsp,
        readSlotsReadBram_req,
        readSlotsReadBram_rsp,
        logReadBram_req,
        logReadBram_rsp,
        permissibility_req,
        permissibility_rsp,
        update_rsp,
        update_noncon_rsp,
        throughput_check
    );

}