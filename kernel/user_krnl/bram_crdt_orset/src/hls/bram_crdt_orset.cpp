#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"


void rdma_write(
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int write_value,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data
){
    //#pragma HLS dataflow
    
    pkt256 tx_meta;
    pkt512 tx_data;

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
    m_axis_tx_meta.write(tx_meta);
    //Write data only if laddr is 0 and  op is RDMA WRITE

    tx_data.data(63, 0) = write_value;
    tx_data.keep(7, 0) = 0xFF;
    tx_data.last = 1; 

    m_axis_tx_data.write(tx_data);
    
}




void crdt_orset(
    int op_num,
    int *ops,
    int s_axi_lqpn,
    ap_uint<64> s_axi_laddr,
    ap_uint<64> s_axi_raddr,
    int s_axi_len,
    int node_num,
    int board_num,
    hls::stream<pkt512>& s_axis_tx_status,
    hls::stream<pkt256>& m_axis_tx_meta, 
    hls::stream<pkt512>& m_axis_tx_data,
    hls::stream<ap_uint<256> >& axis_mem_request,
    hls::stream<ap_uint<64> >& update_set_request,
    hls::stream<ap_uint<32> >& element_tags
    //int wait_cyc
) {
    //#pragma inline 
    //#pragma HLS dataflow
    enum fsmStateType {IDLE_STATE, OPERATION_FETCH, QUERY, UPDATE_SET, DONE};
    static fsmStateType state = IDLE_STATE;
    static int op_cnt = 0; 

    pkt512 tmp_status;
    static ap_uint<64> gset[5000];
    static ap_uint<64> set_index=0;

    static ap_uint<64> log_index=0;
    static bool find_flag= false;
    static bool update_set= false;
    static ap_uint<64> write_counter=0;

    static ap_uint<32> current_set_el=0;
    static ap_uint<16> unique_tag=0;
    static ap_uint<32> tmp_tags;
    static ap_uint<32> send_tags;
    static ap_uint<64> write_ops_cnt=0;

    while(op_cnt<op_num){

        switch(state) {

            case IDLE_STATE: 
                //m_axis_tx_meta.write(tx_meta);
                if (!s_axis_tx_status.empty()) {
                    s_axis_tx_status.read(tmp_status);
                    state = OPERATION_FETCH; 
            }
          
            break; 

            case OPERATION_FETCH:
                if(op_cnt<op_num){

                    if(ops[op_cnt]==0)
                        state= QUERY;
                    else{
                        state= UPDATE_SET;
                        write_ops_cnt++;
                        //current_set_el=ops[op_cnt];
                    }
                    
                }
                else
                    state= DONE;

            break;

            case QUERY:

                if(!axis_mem_request.full()){
                    axis_mem_request.write(ops[op_cnt]);
                    state= OPERATION_FETCH;

                    op_cnt++;
                }

            break;

            case UPDATE_SET: 
                if(!update_set_request.full()){
                    if(ops[op_cnt]<0){ //remove find all tags to send!
                        current_set_el.range(31, 16)= 0;
                        current_set_el.range(15, 0)= (ops[op_cnt]*(-1));
                        update_set_request.write(current_set_el);
                        int j=0; 
                        int qpn_tmp=board_num*(node_num-1);
                        write_counter++;
                        while (j<node_num){
                            if(j!=board_num){
                                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                    rdma_write(
                                        qpn_tmp,
                                        s_axi_laddr,
                                        s_axi_raddr+(((board_num*3000)+write_counter)*4),
                                        s_axi_len,
                                        current_set_el,
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
                        
                        while(element_tags.empty());
                        element_tags.read(tmp_tags);
                        int num_tags=tmp_tags;
                        if (num_tags>0){
                            current_set_el.range(31, 16)= num_tags;
                            current_set_el.range(15, 0)= 0xFFFF;
                            int j=0; 
                            int qpn_tmp=board_num*(node_num-1);
                            write_counter++;
                            while (j<node_num){
                                if(j!=board_num){
                                    if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                        rdma_write(
                                            qpn_tmp,
                                            s_axi_laddr,
                                            s_axi_raddr+(((board_num*3000)+write_counter)*4),
                                            s_axi_len,
                                            current_set_el,
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
                        int k=0;
                        while(k<num_tags){
                            if(!element_tags.empty()){
                                element_tags.read(tmp_tags);
                                tmp_tags(31,31)=1;// to detemine this one is tag
                                k+=2;
                                int j=0; 
                                int qpn_tmp=board_num*(node_num-1);
                                write_counter++;
                                while (j<node_num){
                                    if(j!=board_num){
                                        if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                            rdma_write(
                                                qpn_tmp,
                                                s_axi_laddr,
                                                s_axi_raddr+(((board_num*3000)+write_counter)*4),
                                                s_axi_len,
                                                tmp_tags,
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
                    }
                    else{//add
                        //generate unique tag
                        unique_tag.range(15,13)=board_num;
                        unique_tag.range(12,0)=write_ops_cnt;
                        current_set_el.range(31, 16)= unique_tag;
                        current_set_el.range(15, 0)= ops[op_cnt];
                        update_set_request.write(current_set_el);
                        int j=0; 
                        int qpn_tmp=board_num*(node_num-1);
                        write_counter++;
                        while (j<node_num){
                            if(j!=board_num){
                                if(!m_axis_tx_meta.full() && !m_axis_tx_data.full()){
                                    rdma_write(
                                        qpn_tmp,
                                        s_axi_laddr,
                                        s_axi_raddr+(((board_num*3000)+write_counter)*4),
                                        s_axi_len,
                                        current_set_el,
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
                    state = OPERATION_FETCH; 
                    op_cnt++;
                }
                break; 
        }
    }

}
void update_orset(int *network_ptr, int node_num, int board_num, int query_num, int write_num, hls::stream<ap_uint<64> >& update_set_request, hls::stream<ap_uint<64> >& set_size_request, hls::stream<ap_uint<32> >& element_tags){

    static ap_uint<64> tmp_set_size_a=0;
    static ap_uint<64> tmp_set_size_r=0;
    static ap_uint<32> tmp_hbm;
    static int write_cnt=0;
    static int log_index[8]={0};
    static ap_uint<32> orseta [10000]={0};
    static bool orseta_valid [10000]={true};
    static ap_uint<32> orsetr [10000]={0};
    static ap_uint<64> current_set_el=0;
    bool first_find=false;
    int first_index=0;
    static int update_period=1000;
    static ap_uint<512> internal_clock=0;
    static ap_uint<64> tmp_tags;
    static ap_uint<32> remove_element;
    static ap_uint<32> real_remove=0;

    while (write_cnt<write_num){
        internal_clock++;
        if(!update_set_request.empty()){
            update_set_request.read(current_set_el);
            if(current_set_el.range(31,16)!=0){ // it is add operation. 
                orseta[tmp_set_size_a]=current_set_el;
                tmp_set_size_a++;
            } 
            else{
                //find=false;
                first_find=false;
                for(int i=0; i<tmp_set_size_a; i++){
                    if(current_set_el.range(15,0)== orsetr[i].range(15,0)){
                        //find= true;
                        //break;
                        if(!first_find){
                            first_find=true;
                            first_index= tmp_set_size_r;
                        }
                        orsetr[tmp_set_size_r]= current_set_el.range(31,0);
                        tmp_set_size_r++;
                    }
                }
                if(first_find){
                    element_tags.write((tmp_set_size_r- first_index));
                    int k = (tmp_set_size_r- first_index);
                    while(k>0){
                        if(k>2){

                            if(!element_tags.full()){
                                for (int m=0; m<2; m++)
                                    tmp_tags.range((15+(16*m)),((16*m)))=orsetr[first_index+m].range(31,16);
                            
                                element_tags.write(tmp_tags);
                                k-=2;
                            }

                        }
                        else{
                            if(!element_tags.full()){
                                for (int m=0; m<k; m++)
                                    tmp_tags.range((15+(16*(1-m))),((16*(1-m))))=orsetr[first_index+m].range(31,16);
                            
                                element_tags.write(tmp_tags);
                                k=0;
                            }
                        }
                    }
                }

            }

            write_cnt++;
        }
        if(internal_clock==update_period){
            internal_clock=0;
            int ntag=0;
            static bool wait_tag[8]={false};
                    for (int i=0; i<node_num; i++){
                        if(i!=board_num){
                            tmp_hbm=network_ptr[(i*3000)+log_index[i]];
                            if(tmp_hbm!=0){
                                if(wait_tag[i]){
                                    for(int k=0; k<2; k++){
                                        if(tmp_hbm(((16*k)+15),(16*k))!=0){
                                            remove_element.range(31,16)=tmp_hbm(((16*k)+15),(16*k));
                                            for(int l=0; l<tmp_set_size_a; l++){
                                                if(orseta[l]==remove_element){
                                                    real_remove++;
                                                    orseta_valid[l]=false;
                                                }
                                            }
                                            ntag-=2;
                                            if(ntag<0)
                                                wait_tag[i]=false;
                                        }
                                    }

                                }
                                else{
                                    if(tmp_hbm.range(15,0)==0xFFFF){//tag
                                        ntag=tmp_hbm.range(31,16);
                                        wait_tag[i]=true;
                                    }
                                    else if (tmp_hbm.range(31,16)==0)//remove
                                    {
                                        remove_element.range(15,0)=tmp_hbm.range(15,0);
                                    }
                                    else{//add
                                        orseta[tmp_set_size_a]=tmp_hbm;
                                        tmp_set_size_a++;
                                    }
                                    
                                }
                                log_index[i]++;
                            }
                        }
                            //remote_counter = network_ptr[i] + remote_counter;
                    }
        }

        if(!set_size_request.full()){
            set_size_request.write(tmp_set_size_a-real_remove);
        }

    }

}
void handle_query(int *setsize, int query_num, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& set_size_request){

    static int query_cnt=0;

    static ap_uint<64> tmp_set_size=0;
    static ap_uint<256> tmp_read=0;
    
    //#pragma HLS dataflow
    while (query_cnt<query_num){
        if(!axis_mem_request.empty()){
            axis_mem_request.read(tmp_read);
            query_cnt++;
            *setsize=tmp_set_size;
        }

        if(!set_size_request.empty()){
            set_size_request.read(tmp_set_size);
        }
    }


}
void bram_mem_maneger_orset(int *network_ptr, int *setsize, int node_num, int board_num, int query_num, int write_num, hls::stream<ap_uint<256> >& axis_mem_request, hls::stream<ap_uint<64> >& update_set_request, hls::stream<ap_uint<32> >& element_tags){

    #pragma HLS dataflow
    static hls::stream<ap_uint<64> > set_size_request;

    handle_query(setsize, query_num, axis_mem_request, set_size_request);
    update_orset(network_ptr, node_num, board_num, query_num, write_num, update_set_request, set_size_request, element_tags);
    
}


extern "C" {

    void bram_crdt_orset(
        hls::stream<pkt256>& m_axis_tx_meta, 
        hls::stream<pkt512>& m_axis_tx_data, 
        hls::stream<pkt512>& s_axis_tx_status, 
        int s_axi_lqpn, 
        ap_uint<64> s_axi_laddr,
        ap_uint<64> s_axi_raddr,
        int s_axi_len,
        int node_num,
        int board_num,
        int op_num,
        int query_num,
        int write_num,
        int *ops,
        int *crdt,
        int *network_ptr
        //int wait_cyc
        //ap_uint<512>* m_axi_status
    ) {

        #pragma HLS INTERFACE axis port = m_axis_tx_meta
        #pragma HLS INTERFACE axis port = m_axis_tx_data
        #pragma HLS INTERFACE axis port = s_axis_tx_status
        
        #pragma HLS INTERFACE m_axi port=ops bundle=gmem0
        #pragma HLS INTERFACE m_axi port=network_ptr bundle=gmem1
        #pragma HLS INTERFACE m_axi port=crdt bundle=gmem1

        #pragma HLS dataflow

        static hls::stream<ap_uint<256> > axis_mem_request;

            
        static hls::stream<ap_uint<64> > update_set_request;
        static hls::stream<ap_uint<32> > element_tags;

            crdt_orset(
                op_num,
                ops,
                s_axi_lqpn,
                s_axi_laddr,
                s_axi_raddr,
                s_axi_len,
                node_num,
                board_num,
                s_axis_tx_status,
                m_axis_tx_meta, 
                m_axis_tx_data,
                axis_mem_request,
                update_set_request,
                element_tags
                );
            bram_mem_maneger_orset(network_ptr, crdt, node_num, board_num, query_num, write_num, axis_mem_request, update_set_request, element_tags);

    }

}
