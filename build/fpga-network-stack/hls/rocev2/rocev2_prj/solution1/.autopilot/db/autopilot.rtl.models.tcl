set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME rocev2_top_entry_proc}
  {SRCNAME process_ipv4<512> MODELNAME process_ipv4_512_s RTLNAME rocev2_top_process_ipv4_512_s}
  {SRCNAME ipv4_drop_optional_ip_header<512> MODELNAME ipv4_drop_optional_ip_header_512_s RTLNAME rocev2_top_ipv4_drop_optional_ip_header_512_s}
  {SRCNAME {ipv4_lshiftWordByOctet<512, 2>} MODELNAME ipv4_lshiftWordByOctet_512_2_s RTLNAME rocev2_top_ipv4_lshiftWordByOctet_512_2_s}
  {SRCNAME ipv4_generate_ipv4<512>13 MODELNAME ipv4_generate_ipv4_512_13 RTLNAME rocev2_top_ipv4_generate_ipv4_512_13}
  {SRCNAME process_udp<512>14 MODELNAME process_udp_512_14 RTLNAME rocev2_top_process_udp_512_14}
  {SRCNAME {udp_rshiftWordByOctet<net_axis<512>, 512, 2>} MODELNAME udp_rshiftWordByOctet_net_axis_512_512_2_s RTLNAME rocev2_top_udp_rshiftWordByOctet_net_axis_512_512_2_s}
  {SRCNAME merge_rx_meta MODELNAME merge_rx_meta RTLNAME rocev2_top_merge_rx_meta}
  {SRCNAME split_tx_meta MODELNAME split_tx_meta RTLNAME rocev2_top_split_tx_meta}
  {SRCNAME {udp_lshiftWordByOctet<512, 1>} MODELNAME udp_lshiftWordByOctet_512_1_s RTLNAME rocev2_top_udp_lshiftWordByOctet_512_1_s}
  {SRCNAME generate_udp<512> MODELNAME generate_udp_512_s RTLNAME rocev2_top_generate_udp_512_s}
  {SRCNAME qp_interface MODELNAME qp_interface RTLNAME rocev2_top_qp_interface
    SUBMODULES {
      {MODELNAME rocev2_top_regslice_both RTLNAME rocev2_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME rocev2_top_regslice_both_U}
    }
  }
  {SRCNAME rx_process_ibh<512> MODELNAME rx_process_ibh_512_s RTLNAME rocev2_top_rx_process_ibh_512_s}
  {SRCNAME {rshiftWordByOctet<net_axis<512>, 512, 11>} MODELNAME rshiftWordByOctet_net_axis_512_512_11_s RTLNAME rocev2_top_rshiftWordByOctet_net_axis_512_512_11_s}
  {SRCNAME rx_process_exh<512> MODELNAME rx_process_exh_512_s RTLNAME rocev2_top_rx_process_exh_512_s
    SUBMODULES {
      {MODELNAME rocev2_top_mul_33ns_35ns_66_2_1 RTLNAME rocev2_top_mul_33ns_35ns_66_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rx_ibh_fsm MODELNAME rx_ibh_fsm RTLNAME rocev2_top_rx_ibh_fsm}
  {SRCNAME drop_ooo_ibh<512> MODELNAME drop_ooo_ibh_512_s RTLNAME rocev2_top_drop_ooo_ibh_512_s}
  {SRCNAME ipUdpMetaHandler<512> MODELNAME ipUdpMetaHandler_512_s RTLNAME rocev2_top_ipUdpMetaHandler_512_s}
  {SRCNAME rx_exh_fsm<512> MODELNAME rx_exh_fsm_512_s RTLNAME rocev2_top_rx_exh_fsm_512_s}
  {SRCNAME rx_exh_payload<512> MODELNAME rx_exh_payload_512_s RTLNAME rocev2_top_rx_exh_payload_512_s}
  {SRCNAME handle_read_requests MODELNAME handle_read_requests RTLNAME rocev2_top_handle_read_requests}
  {SRCNAME stream_merger<ackEvent> MODELNAME stream_merger_ackEvent_s RTLNAME rocev2_top_stream_merger_ackEvent_s}
  {SRCNAME {rshiftWordByOctet<routed_net_axis<512, 1>, 512, 12>} MODELNAME rshiftWordByOctet_routed_net_axis_512_1_512_12_s RTLNAME rocev2_top_rshiftWordByOctet_routed_net_axis_512_1_512_12_s}
  {SRCNAME {rshiftWordByOctet<net_axis<512>, 512, 13>} MODELNAME rshiftWordByOctet_net_axis_512_512_13_s RTLNAME rocev2_top_rshiftWordByOctet_net_axis_512_512_13_s}
  {SRCNAME merge_rx_pkgs<512> MODELNAME merge_rx_pkgs_512_s RTLNAME rocev2_top_merge_rx_pkgs_512_s}
  {SRCNAME local_req_handler MODELNAME local_req_handler RTLNAME rocev2_top_local_req_handler}
  {SRCNAME tx_pkg_arbiter<512> MODELNAME tx_pkg_arbiter_512_s RTLNAME rocev2_top_tx_pkg_arbiter_512_s}
  {SRCNAME meta_merger MODELNAME meta_merger RTLNAME rocev2_top_meta_merger}
  {SRCNAME {lshiftWordByOctet<512, 12>} MODELNAME lshiftWordByOctet_512_12_s RTLNAME rocev2_top_lshiftWordByOctet_512_12_s}
  {SRCNAME {lshiftWordByOctet<512, 13>} MODELNAME lshiftWordByOctet_512_13_s RTLNAME rocev2_top_lshiftWordByOctet_512_13_s}
  {SRCNAME generate_exh<512> MODELNAME generate_exh_512_s RTLNAME rocev2_top_generate_exh_512_s}
  {SRCNAME append_payload<512> MODELNAME append_payload_512_s RTLNAME rocev2_top_append_payload_512_s}
  {SRCNAME {lshiftWordByOctet<512, 11>} MODELNAME lshiftWordByOctet_512_11_s RTLNAME rocev2_top_lshiftWordByOctet_512_11_s}
  {SRCNAME generate_ibh<512> MODELNAME generate_ibh_512_s RTLNAME rocev2_top_generate_ibh_512_s}
  {SRCNAME prepend_ibh_header<512> MODELNAME prepend_ibh_header_512_s RTLNAME rocev2_top_prepend_ibh_header_512_s}
  {SRCNAME tx_ipUdpMetaMerger MODELNAME tx_ipUdpMetaMerger RTLNAME rocev2_top_tx_ipUdpMetaMerger}
  {SRCNAME mem_cmd_merger<512> MODELNAME mem_cmd_merger_512_s RTLNAME rocev2_top_mem_cmd_merger_512_s}
  {SRCNAME conn_table MODELNAME conn_table RTLNAME rocev2_top_conn_table
    SUBMODULES {
      {MODELNAME rocev2_top_conn_table_conn_table_remote_qpn_V_RAM_AUTO_1R1W RTLNAME rocev2_top_conn_table_conn_table_remote_qpn_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_conn_table_conn_table_remote_ip_address_V_RAM_AUTO_1R1W RTLNAME rocev2_top_conn_table_conn_table_remote_ip_address_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_conn_table_conn_table_remote_udp_port_V_RAM_AUTO_1R1W RTLNAME rocev2_top_conn_table_conn_table_remote_udp_port_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME state_table MODELNAME state_table RTLNAME rocev2_top_state_table
    SUBMODULES {
      {MODELNAME rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W RTLNAME rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_state_table_state_table_retryCounter_V_RAM_2P_BRAM_1R1W RTLNAME rocev2_top_state_table_state_table_retryCounter_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME msn_table MODELNAME msn_table RTLNAME rocev2_top_msn_table
    SUBMODULES {
      {MODELNAME rocev2_top_msn_table_msn_table_vaddr_V_RAM_2P_BRAM_1R1W RTLNAME rocev2_top_msn_table_msn_table_vaddr_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_msn_table_msn_table_dma_length_V_RAM_2P_BRAM_1R1W RTLNAME rocev2_top_msn_table_msn_table_dma_length_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME read_req_table MODELNAME read_req_table RTLNAME rocev2_top_read_req_table}
  {SRCNAME mq_freelist_handler<2048> MODELNAME mq_freelist_handler_2048_s RTLNAME rocev2_top_mq_freelist_handler_2048_s}
  {SRCNAME mq_pointer_table<500> MODELNAME mq_pointer_table_500_s RTLNAME rocev2_top_mq_pointer_table_500_s
    SUBMODULES {
      {MODELNAME rocev2_top_mq_pointer_table_500_s_ptr_table_head_V_RAM_T2P_BRAM_1R1W RTLNAME rocev2_top_mq_pointer_table_500_s_ptr_table_head_V_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_mq_pointer_table_500_s_ptr_table_valid_RAM_T2P_BRAM_1R1W RTLNAME rocev2_top_mq_pointer_table_500_s_ptr_table_valid_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {mq_meta_table<ap_uint<64>, 2048>} MODELNAME mq_meta_table_ap_uint_64_2048_s RTLNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s
    SUBMODULES {
      {MODELNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_value_V_RAM_T2P_BRAM_1R1W RTLNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_value_V_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_next_V_RAM_T2P_BRAM_1R1W RTLNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_next_V_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_valid_RAM_T2P_BRAM_1R1W RTLNAME rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_valid_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {mq_process_requests<ap_uint<64> >} MODELNAME mq_process_requests_ap_uint_64_s RTLNAME rocev2_top_mq_process_requests_ap_uint_64_s}
  {SRCNAME Block_entry449_proc MODELNAME Block_entry449_proc RTLNAME rocev2_top_Block_entry449_proc}
  {SRCNAME extract_icrc<512> MODELNAME extract_icrc_512_s RTLNAME rocev2_top_extract_icrc_512_s}
  {SRCNAME insert_icrc<512> MODELNAME insert_icrc_512_s RTLNAME rocev2_top_insert_icrc_512_s}
  {SRCNAME rocev2_top MODELNAME rocev2_top RTLNAME rocev2_top IS_TOP 1
    SUBMODULES {
      {MODELNAME rocev2_top_fifo_w128_d3_S RTLNAME rocev2_top_fifo_w128_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w1024_d2_S RTLNAME rocev2_top_fifo_w1024_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w1024_d8_A RTLNAME rocev2_top_fifo_w1024_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w4_d2_S RTLNAME rocev2_top_fifo_w4_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w64_d2_S RTLNAME rocev2_top_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w256_d8_A RTLNAME rocev2_top_fifo_w256_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w256_d2_S RTLNAME rocev2_top_fifo_w256_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w160_d2_S RTLNAME rocev2_top_fifo_w160_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w192_d2_S RTLNAME rocev2_top_fifo_w192_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w32_d2_S RTLNAME rocev2_top_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w1024_d32_A RTLNAME rocev2_top_fifo_w1024_d32_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w512_d8_A RTLNAME rocev2_top_fifo_w512_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w96_d2_S RTLNAME rocev2_top_fifo_w96_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w128_d2_S RTLNAME rocev2_top_fifo_w128_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w1_d2_S RTLNAME rocev2_top_fifo_w1_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w16_d2_S RTLNAME rocev2_top_fifo_w16_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w16_d4_S RTLNAME rocev2_top_fifo_w16_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w512_d2_S RTLNAME rocev2_top_fifo_w512_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w1024_d4_A RTLNAME rocev2_top_fifo_w1024_d4_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w192_d512_A RTLNAME rocev2_top_fifo_w192_d512_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w256_d512_A RTLNAME rocev2_top_fifo_w256_d512_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w96_d4_S RTLNAME rocev2_top_fifo_w96_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w256_d32_A RTLNAME rocev2_top_fifo_w256_d32_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w96_d128_A RTLNAME rocev2_top_fifo_w96_d128_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w192_d8_A RTLNAME rocev2_top_fifo_w192_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w256_d4_S RTLNAME rocev2_top_fifo_w256_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w24_d2_S RTLNAME rocev2_top_fifo_w24_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w384_d8_A RTLNAME rocev2_top_fifo_w384_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w16_d2048_A RTLNAME rocev2_top_fifo_w16_d2048_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME rocev2_top_fifo_w48_d2_S RTLNAME rocev2_top_fifo_w48_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
