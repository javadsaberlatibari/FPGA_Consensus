
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [9:0] axis_block_sigs;
wire [57:0] inst_idle_sigs;
wire [47:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~qp_interface_U0.s_axis_qp_interface_TDATA_blk_n;
assign axis_block_sigs[1] = ~rx_exh_fsm_512_U0.m_axis_mem_write_cmd_TDATA_blk_n;
assign axis_block_sigs[2] = ~merge_rx_pkgs_512_U0.m_axis_mem_write_data_TDATA_blk_n;
assign axis_block_sigs[3] = ~local_req_handler_U0.s_axis_tx_meta_TDATA_blk_n;
assign axis_block_sigs[4] = ~tx_pkg_arbiter_512_U0.s_axis_tx_data_TDATA_blk_n;
assign axis_block_sigs[5] = ~tx_pkg_arbiter_512_U0.s_axis_mem_read_data_TDATA_blk_n;
assign axis_block_sigs[6] = ~mem_cmd_merger_512_U0.m_axis_mem_read_cmd_TDATA_blk_n;
assign axis_block_sigs[7] = ~conn_table_U0.s_axis_qp_conn_interface_TDATA_blk_n;
assign axis_block_sigs[8] = ~extract_icrc_512_U0.s_axis_rx_data_TDATA_blk_n;
assign axis_block_sigs[9] = ~insert_icrc_512_U0.m_axis_tx_data_TDATA_blk_n;

assign inst_idle_sigs[0] = entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (entry_proc_U0.ap_done & ~entry_proc_U0.ap_continue) | ~entry_proc_U0.local_ip_address_c_blk_n;
assign inst_idle_sigs[1] = process_ipv4_512_U0.ap_idle;
assign inst_block_sigs[1] = (process_ipv4_512_U0.ap_done & ~process_ipv4_512_U0.ap_continue) | ~process_ipv4_512_U0.rx_crc2ipFifo_blk_n | ~process_ipv4_512_U0.rx_process2dropFifo_blk_n | ~process_ipv4_512_U0.rx_process2dropLengthFifo_blk_n | ~process_ipv4_512_U0.rx_ip2udpMetaFifo_blk_n;
assign inst_idle_sigs[2] = ipv4_drop_optional_ip_header_512_U0.ap_idle;
assign inst_block_sigs[2] = (ipv4_drop_optional_ip_header_512_U0.ap_done & ~ipv4_drop_optional_ip_header_512_U0.ap_continue) | ~ipv4_drop_optional_ip_header_512_U0.rx_process2dropLengthFifo_blk_n | ~ipv4_drop_optional_ip_header_512_U0.rx_process2dropFifo_blk_n | ~ipv4_drop_optional_ip_header_512_U0.rx_ip2udpFifo_blk_n;
assign inst_idle_sigs[3] = ipv4_lshiftWordByOctet_512_2_U0.ap_idle;
assign inst_block_sigs[3] = (ipv4_lshiftWordByOctet_512_2_U0.ap_done & ~ipv4_lshiftWordByOctet_512_2_U0.ap_continue) | ~ipv4_lshiftWordByOctet_512_2_U0.tx_shift2ipv4Fifo_blk_n | ~ipv4_lshiftWordByOctet_512_2_U0.tx_udp2ipFifo_blk_n;
assign inst_idle_sigs[4] = ipv4_generate_ipv4_512_13_U0.ap_idle;
assign inst_block_sigs[4] = (ipv4_generate_ipv4_512_13_U0.ap_done & ~ipv4_generate_ipv4_512_13_U0.ap_continue) | ~ipv4_generate_ipv4_512_13_U0.local_ip_address_blk_n | ~ipv4_generate_ipv4_512_13_U0.tx_udp2ipMetaFifo_blk_n | ~ipv4_generate_ipv4_512_13_U0.tx_ip2crcFifo_blk_n | ~ipv4_generate_ipv4_512_13_U0.tx_shift2ipv4Fifo_blk_n;
assign inst_idle_sigs[5] = process_udp_512_14_U0.ap_idle;
assign inst_block_sigs[5] = (process_udp_512_14_U0.ap_done & ~process_udp_512_14_U0.ap_continue) | ~process_udp_512_14_U0.rx_ip2udpFifo_blk_n | ~process_udp_512_14_U0.rx_udp2shiftFifo_blk_n | ~process_udp_512_14_U0.rx_udpMetaFifo_blk_n;
assign inst_idle_sigs[6] = udp_rshiftWordByOctet_net_axis_512_512_2_U0.ap_idle;
assign inst_block_sigs[6] = (udp_rshiftWordByOctet_net_axis_512_512_2_U0.ap_done & ~udp_rshiftWordByOctet_net_axis_512_512_2_U0.ap_continue) | ~udp_rshiftWordByOctet_net_axis_512_512_2_U0.rx_udp2shiftFifo_blk_n | ~udp_rshiftWordByOctet_net_axis_512_512_2_U0.rx_udp2ibFifo_blk_n;
assign inst_idle_sigs[7] = merge_rx_meta_U0.ap_idle;
assign inst_block_sigs[7] = (merge_rx_meta_U0.ap_done & ~merge_rx_meta_U0.ap_continue) | ~merge_rx_meta_U0.rx_ip2udpMetaFifo_blk_n | ~merge_rx_meta_U0.rx_udpMetaFifo_blk_n | ~merge_rx_meta_U0.rx_ipUdpMetaFifo_blk_n;
assign inst_idle_sigs[8] = split_tx_meta_U0.ap_idle;
assign inst_block_sigs[8] = (split_tx_meta_U0.ap_done & ~split_tx_meta_U0.ap_continue) | ~split_tx_meta_U0.tx_ipUdpMetaFifo_blk_n | ~split_tx_meta_U0.tx_udp2ipMetaFifo_blk_n | ~split_tx_meta_U0.tx_udpMetaFifo_blk_n;
assign inst_idle_sigs[9] = udp_lshiftWordByOctet_512_1_U0.ap_idle;
assign inst_block_sigs[9] = (udp_lshiftWordByOctet_512_1_U0.ap_done & ~udp_lshiftWordByOctet_512_1_U0.ap_continue) | ~udp_lshiftWordByOctet_512_1_U0.tx_shift2udpFifo_blk_n | ~udp_lshiftWordByOctet_512_1_U0.tx_ib2udpFifo_blk_n;
assign inst_idle_sigs[10] = generate_udp_512_U0.ap_idle;
assign inst_block_sigs[10] = (generate_udp_512_U0.ap_done & ~generate_udp_512_U0.ap_continue) | ~generate_udp_512_U0.tx_udpMetaFifo_blk_n | ~generate_udp_512_U0.tx_udp2ipFifo_blk_n | ~generate_udp_512_U0.tx_shift2udpFifo_blk_n;
assign inst_idle_sigs[11] = qp_interface_U0.ap_idle;
assign inst_block_sigs[11] = (qp_interface_U0.ap_done & ~qp_interface_U0.ap_continue) | ~qp_interface_U0.qpi2stateTable_upd_req_blk_n | ~qp_interface_U0.stateTable2qpi_rsp_blk_n | ~qp_interface_U0.if2msnTable_init_blk_n;
assign inst_idle_sigs[12] = rx_process_ibh_512_U0.ap_idle;
assign inst_block_sigs[12] = (rx_process_ibh_512_U0.ap_done & ~rx_process_ibh_512_U0.ap_continue) | ~rx_process_ibh_512_U0.rx_udp2ibFifo_blk_n | ~rx_process_ibh_512_U0.rx_ibh2shiftFifo_blk_n | ~rx_process_ibh_512_U0.rx_ibh2fsm_MetaFifo_blk_n | ~rx_process_ibh_512_U0.rx_ibh2exh_MetaFifo_blk_n;
assign inst_idle_sigs[13] = rshiftWordByOctet_net_axis_512_512_11_U0.ap_idle;
assign inst_block_sigs[13] = (rshiftWordByOctet_net_axis_512_512_11_U0.ap_done & ~rshiftWordByOctet_net_axis_512_512_11_U0.ap_continue) | ~rshiftWordByOctet_net_axis_512_512_11_U0.rx_ibh2shiftFifo_blk_n | ~rshiftWordByOctet_net_axis_512_512_11_U0.rx_shift2exhFifo_blk_n;
assign inst_idle_sigs[14] = rx_process_exh_512_U0.ap_idle;
assign inst_block_sigs[14] = (rx_process_exh_512_U0.ap_done & ~rx_process_exh_512_U0.ap_continue) | ~rx_process_exh_512_U0.rx_ibh2exh_MetaFifo_blk_n | ~rx_process_exh_512_U0.rx_shift2exhFifo_blk_n | ~rx_process_exh_512_U0.rx_exh2dropFifo_blk_n | ~rx_process_exh_512_U0.rx_exhMetaFifo_blk_n | ~rx_process_exh_512_U0.rx_exh2drop_MetaFifo_blk_n;
assign inst_idle_sigs[15] = rx_ibh_fsm_U0.ap_idle;
assign inst_block_sigs[15] = (rx_ibh_fsm_U0.ap_done & ~rx_ibh_fsm_U0.ap_continue) | ~rx_ibh_fsm_U0.rx_ibh2fsm_MetaFifo_blk_n | ~rx_ibh_fsm_U0.rx_exhMetaFifo_blk_n | ~rx_ibh_fsm_U0.rxIbh2stateTable_upd_req_blk_n | ~rx_ibh_fsm_U0.stateTable2rxIbh_rsp_blk_n | ~rx_ibh_fsm_U0.rx_ibhDropFifo_blk_n | ~rx_ibh_fsm_U0.rx_ibhDropMetaFifo_blk_n | ~rx_ibh_fsm_U0.rx_fsm2exh_MetaFifo_blk_n | ~rx_ibh_fsm_U0.rx_ibhEventFifo_blk_n;
assign inst_idle_sigs[16] = drop_ooo_ibh_512_U0.ap_idle;
assign inst_block_sigs[16] = (drop_ooo_ibh_512_U0.ap_done & ~drop_ooo_ibh_512_U0.ap_continue) | ~drop_ooo_ibh_512_U0.rx_ibhDropFifo_blk_n | ~drop_ooo_ibh_512_U0.rx_exh2dropFifo_blk_n | ~drop_ooo_ibh_512_U0.rx_ibhDrop2exhFifo_blk_n;
assign inst_idle_sigs[17] = ipUdpMetaHandler_512_U0.ap_idle;
assign inst_block_sigs[17] = (ipUdpMetaHandler_512_U0.ap_done & ~ipUdpMetaHandler_512_U0.ap_continue) | ~ipUdpMetaHandler_512_U0.rx_ipUdpMetaFifo_blk_n | ~ipUdpMetaHandler_512_U0.rx_exh2drop_MetaFifo_blk_n | ~ipUdpMetaHandler_512_U0.rx_ibhDropMetaFifo_blk_n | ~ipUdpMetaHandler_512_U0.exh_lengthFifo_blk_n | ~ipUdpMetaHandler_512_U0.rx_drop2exhFsm_MetaFifo_blk_n;
assign inst_idle_sigs[18] = rx_exh_fsm_512_U0.ap_idle;
assign inst_block_sigs[18] = (rx_exh_fsm_512_U0.ap_done & ~rx_exh_fsm_512_U0.ap_continue) | ~rx_exh_fsm_512_U0.rx_fsm2exh_MetaFifo_blk_n | ~rx_exh_fsm_512_U0.rx_drop2exhFsm_MetaFifo_blk_n | ~rx_exh_fsm_512_U0.rxExh2msnTable_upd_req_blk_n | ~rx_exh_fsm_512_U0.rx_readReqAddr_pop_req_blk_n | ~rx_exh_fsm_512_U0.msnTable2rxExh_rsp_blk_n | ~rx_exh_fsm_512_U0.exh_lengthFifo_blk_n | ~rx_exh_fsm_512_U0.rx_readReqAddr_pop_rsp_blk_n | ~rx_exh_fsm_512_U0.rx_exhEventMetaFifo_blk_n | ~rx_exh_fsm_512_U0.rx_pkgSplitTypeFifo_blk_n | ~rx_exh_fsm_512_U0.rx_pkgShiftTypeFifo_blk_n | ~rx_exh_fsm_512_U0.rx_readRequestFifo_blk_n | ~rx_exh_fsm_512_U0.rx_readReqTable_upd_req_blk_n;
assign inst_idle_sigs[19] = rx_exh_payload_512_U0.ap_idle;
assign inst_block_sigs[19] = (rx_exh_payload_512_U0.ap_done & ~rx_exh_payload_512_U0.ap_continue) | ~rx_exh_payload_512_U0.rx_pkgSplitTypeFifo_blk_n | ~rx_exh_payload_512_U0.rx_ibhDrop2exhFifo_blk_n | ~rx_exh_payload_512_U0.rx_exh2rethShiftFifo_blk_n | ~rx_exh_payload_512_U0.rx_exh2aethShiftFifo_blk_n | ~rx_exh_payload_512_U0.rx_exhNoShiftFifo_blk_n;
assign inst_idle_sigs[20] = handle_read_requests_U0.ap_idle;
assign inst_block_sigs[20] = (handle_read_requests_U0.ap_done & ~handle_read_requests_U0.ap_continue) | ~handle_read_requests_U0.rx_readRequestFifo_blk_n | ~handle_read_requests_U0.rx_remoteMemCmd_blk_n | ~handle_read_requests_U0.rx_readEvenFifo_blk_n;
assign inst_idle_sigs[21] = stream_merger_ackEvent_U0.ap_idle;
assign inst_block_sigs[21] = (stream_merger_ackEvent_U0.ap_done & ~stream_merger_ackEvent_U0.ap_continue) | ~stream_merger_ackEvent_U0.rx_exhEventMetaFifo_blk_n | ~stream_merger_ackEvent_U0.rx_ackEventFifo_blk_n | ~stream_merger_ackEvent_U0.rx_ibhEventFifo_blk_n;
assign inst_idle_sigs[22] = rshiftWordByOctet_routed_net_axis_512_1_512_12_U0.ap_idle;
assign inst_block_sigs[22] = (rshiftWordByOctet_routed_net_axis_512_1_512_12_U0.ap_done & ~rshiftWordByOctet_routed_net_axis_512_1_512_12_U0.ap_continue) | ~rshiftWordByOctet_routed_net_axis_512_1_512_12_U0.rx_exh2rethShiftFifo_blk_n | ~rshiftWordByOctet_routed_net_axis_512_1_512_12_U0.rx_rethSift2mergerFifo_blk_n;
assign inst_idle_sigs[23] = rshiftWordByOctet_net_axis_512_512_13_U0.ap_idle;
assign inst_block_sigs[23] = (rshiftWordByOctet_net_axis_512_512_13_U0.ap_done & ~rshiftWordByOctet_net_axis_512_512_13_U0.ap_continue) | ~rshiftWordByOctet_net_axis_512_512_13_U0.rx_exh2aethShiftFifo_blk_n | ~rshiftWordByOctet_net_axis_512_512_13_U0.rx_aethSift2mergerFifo_blk_n;
assign inst_idle_sigs[24] = merge_rx_pkgs_512_U0.ap_idle;
assign inst_block_sigs[24] = (merge_rx_pkgs_512_U0.ap_done & ~merge_rx_pkgs_512_U0.ap_continue) | ~merge_rx_pkgs_512_U0.rx_pkgShiftTypeFifo_blk_n | ~merge_rx_pkgs_512_U0.rx_aethSift2mergerFifo_blk_n | ~merge_rx_pkgs_512_U0.rx_rethSift2mergerFifo_blk_n | ~merge_rx_pkgs_512_U0.rx_exhNoShiftFifo_blk_n;
assign inst_idle_sigs[25] = local_req_handler_U0.ap_idle;
assign inst_block_sigs[25] = (local_req_handler_U0.ap_done & ~local_req_handler_U0.ap_continue) | ~local_req_handler_U0.tx_appMetaFifo_blk_n | ~local_req_handler_U0.tx_readReqAddr_push_blk_n | ~local_req_handler_U0.tx_localMemCmdFifo_blk_n;
assign inst_idle_sigs[26] = tx_pkg_arbiter_512_U0.ap_idle;
assign inst_block_sigs[26] = (tx_pkg_arbiter_512_U0.ap_done & ~tx_pkg_arbiter_512_U0.ap_continue) | ~tx_pkg_arbiter_512_U0.tx_pkgInfoFifo_blk_n | ~tx_pkg_arbiter_512_U0.tx_split2aethShift_blk_n | ~tx_pkg_arbiter_512_U0.tx_rethMerge2rethShift_blk_n | ~tx_pkg_arbiter_512_U0.tx_rawPayFifo_blk_n;
assign inst_idle_sigs[27] = meta_merger_U0.ap_idle;
assign inst_block_sigs[27] = (meta_merger_U0.ap_done & ~meta_merger_U0.ap_continue) | ~meta_merger_U0.rx_ackEventFifo_blk_n | ~meta_merger_U0.tx_ibhconnTable_req_blk_n | ~meta_merger_U0.tx_ibhMetaFifo_blk_n | ~meta_merger_U0.tx_exhMetaFifo_blk_n | ~meta_merger_U0.rx_readEvenFifo_blk_n | ~meta_merger_U0.tx_appMetaFifo_blk_n;
assign inst_idle_sigs[28] = lshiftWordByOctet_512_12_U0.ap_idle;
assign inst_block_sigs[28] = (lshiftWordByOctet_512_12_U0.ap_done & ~lshiftWordByOctet_512_12_U0.ap_continue) | ~lshiftWordByOctet_512_12_U0.tx_aethShift2payFifo_blk_n | ~lshiftWordByOctet_512_12_U0.tx_split2aethShift_blk_n;
assign inst_idle_sigs[29] = lshiftWordByOctet_512_13_U0.ap_idle;
assign inst_block_sigs[29] = (lshiftWordByOctet_512_13_U0.ap_done & ~lshiftWordByOctet_512_13_U0.ap_continue) | ~lshiftWordByOctet_512_13_U0.tx_rethShift2payFifo_blk_n | ~lshiftWordByOctet_512_13_U0.tx_rethMerge2rethShift_blk_n;
assign inst_idle_sigs[30] = generate_exh_512_U0.ap_idle;
assign inst_block_sigs[30] = (generate_exh_512_U0.ap_done & ~generate_exh_512_U0.ap_continue) | ~generate_exh_512_U0.tx_exhMetaFifo_blk_n | ~generate_exh_512_U0.txExh2msnTable_req_blk_n | ~generate_exh_512_U0.msnTable2txExh_rsp_blk_n | ~generate_exh_512_U0.tx_exh2payFifo_blk_n | ~generate_exh_512_U0.tx_packetInfoFifo_blk_n | ~generate_exh_512_U0.tx_lengthFifo_blk_n | ~generate_exh_512_U0.tx_readReqTable_upd_blk_n;
assign inst_idle_sigs[31] = append_payload_512_U0.ap_idle;
assign inst_block_sigs[31] = (append_payload_512_U0.ap_done & ~append_payload_512_U0.ap_continue) | ~append_payload_512_U0.tx_packetInfoFifo_blk_n | ~append_payload_512_U0.tx_exh2payFifo_blk_n | ~append_payload_512_U0.tx_exh2shiftFifo_blk_n | ~append_payload_512_U0.tx_aethShift2payFifo_blk_n | ~append_payload_512_U0.tx_rethShift2payFifo_blk_n | ~append_payload_512_U0.tx_rawPayFifo_blk_n;
assign inst_idle_sigs[32] = lshiftWordByOctet_512_11_U0.ap_idle;
assign inst_block_sigs[32] = (lshiftWordByOctet_512_11_U0.ap_done & ~lshiftWordByOctet_512_11_U0.ap_continue) | ~lshiftWordByOctet_512_11_U0.tx_shift2ibhFifo_blk_n | ~lshiftWordByOctet_512_11_U0.tx_exh2shiftFifo_blk_n;
assign inst_idle_sigs[33] = generate_ibh_512_U0.ap_idle;
assign inst_block_sigs[33] = (generate_ibh_512_U0.ap_done & ~generate_ibh_512_U0.ap_continue) | ~generate_ibh_512_U0.tx_ibhMetaFifo_blk_n | ~generate_ibh_512_U0.tx_dstQpFifo_blk_n | ~generate_ibh_512_U0.tx_ibhHeaderFifo_blk_n | ~generate_ibh_512_U0.txIbh2stateTable_upd_req_blk_n | ~generate_ibh_512_U0.stateTable2txIbh_rsp_blk_n;
assign inst_idle_sigs[34] = prepend_ibh_header_512_U0.ap_idle;
assign inst_block_sigs[34] = (prepend_ibh_header_512_U0.ap_done & ~prepend_ibh_header_512_U0.ap_continue) | ~prepend_ibh_header_512_U0.tx_ibhHeaderFifo_blk_n | ~prepend_ibh_header_512_U0.tx_ib2udpFifo_blk_n | ~prepend_ibh_header_512_U0.tx_shift2ibhFifo_blk_n;
assign inst_idle_sigs[35] = tx_ipUdpMetaMerger_U0.ap_idle;
assign inst_block_sigs[35] = (tx_ipUdpMetaMerger_U0.ap_done & ~tx_ipUdpMetaMerger_U0.ap_continue) | ~tx_ipUdpMetaMerger_U0.tx_connTable2ibh_rsp_blk_n | ~tx_ipUdpMetaMerger_U0.tx_lengthFifo_blk_n | ~tx_ipUdpMetaMerger_U0.tx_ipUdpMetaFifo_blk_n | ~tx_ipUdpMetaMerger_U0.tx_dstQpFifo_blk_n;
assign inst_idle_sigs[36] = mem_cmd_merger_512_U0.ap_idle;
assign inst_block_sigs[36] = (mem_cmd_merger_512_U0.ap_done & ~mem_cmd_merger_512_U0.ap_continue) | ~mem_cmd_merger_512_U0.rx_remoteMemCmd_blk_n | ~mem_cmd_merger_512_U0.tx_pkgInfoFifo_blk_n | ~mem_cmd_merger_512_U0.tx_localMemCmdFifo_blk_n;
assign inst_idle_sigs[37] = conn_table_U0.ap_idle;
assign inst_block_sigs[37] = (conn_table_U0.ap_done & ~conn_table_U0.ap_continue) | ~conn_table_U0.tx_ibhconnTable_req_blk_n | ~conn_table_U0.tx_connTable2ibh_rsp_blk_n;
assign inst_idle_sigs[38] = state_table_U0.ap_idle;
assign inst_block_sigs[38] = (state_table_U0.ap_done & ~state_table_U0.ap_continue) | ~state_table_U0.rxIbh2stateTable_upd_req_blk_n | ~state_table_U0.stateTable2rxIbh_rsp_blk_n | ~state_table_U0.txIbh2stateTable_upd_req_blk_n | ~state_table_U0.stateTable2txIbh_rsp_blk_n | ~state_table_U0.qpi2stateTable_upd_req_blk_n | ~state_table_U0.stateTable2qpi_rsp_blk_n;
assign inst_idle_sigs[39] = msn_table_U0.ap_idle;
assign inst_block_sigs[39] = (msn_table_U0.ap_done & ~msn_table_U0.ap_continue) | ~msn_table_U0.rxExh2msnTable_upd_req_blk_n | ~msn_table_U0.msnTable2rxExh_rsp_blk_n | ~msn_table_U0.txExh2msnTable_req_blk_n | ~msn_table_U0.msnTable2txExh_rsp_blk_n | ~msn_table_U0.if2msnTable_init_blk_n;
assign inst_idle_sigs[40] = read_req_table_U0.ap_idle;
assign inst_block_sigs[40] = (read_req_table_U0.ap_done & ~read_req_table_U0.ap_continue) | ~read_req_table_U0.tx_readReqTable_upd_blk_n | ~read_req_table_U0.rx_readReqTable_upd_req_blk_n;
assign inst_idle_sigs[41] = mq_freelist_handler_2048_U0.ap_idle;
assign inst_block_sigs[41] = (mq_freelist_handler_2048_U0.ap_done & ~mq_freelist_handler_2048_U0.ap_continue) | ~mq_freelist_handler_2048_U0.mq_releaseFifo_blk_n | ~mq_freelist_handler_2048_U0.mq_freeListFifo_blk_n;
assign inst_idle_sigs[42] = mq_pointer_table_500_U0.ap_idle;
assign inst_block_sigs[42] = (mq_pointer_table_500_U0.ap_done & ~mq_pointer_table_500_U0.ap_continue) | ~mq_pointer_table_500_U0.mq_pointerUpdFifo_blk_n | ~mq_pointer_table_500_U0.mq_pointerReqFifo_blk_n | ~mq_pointer_table_500_U0.mq_pointerRspFifo_blk_n;
assign inst_idle_sigs[43] = mq_meta_table_ap_uint_64_2048_U0.ap_idle;
assign inst_block_sigs[43] = (mq_meta_table_ap_uint_64_2048_U0.ap_done & ~mq_meta_table_ap_uint_64_2048_U0.ap_continue) | ~mq_meta_table_ap_uint_64_2048_U0.mq_metaReqFifo_blk_n | ~mq_meta_table_ap_uint_64_2048_U0.mq_metaRspFifo_blk_n;
assign inst_idle_sigs[44] = mq_process_requests_ap_uint_64_U0.ap_idle;
assign inst_block_sigs[44] = (mq_process_requests_ap_uint_64_U0.ap_done & ~mq_process_requests_ap_uint_64_U0.ap_continue) | ~mq_process_requests_ap_uint_64_U0.tx_readReqAddr_push_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_freeListFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_pointerReqFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.rx_readReqAddr_pop_req_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_pointerRspFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_metaReqFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_pointerUpdFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_metaRspFifo_blk_n | ~mq_process_requests_ap_uint_64_U0.rx_readReqAddr_pop_rsp_blk_n | ~mq_process_requests_ap_uint_64_U0.mq_releaseFifo_blk_n;
assign inst_idle_sigs[45] = Block_entry449_proc_U0.ap_idle;
assign inst_block_sigs[45] = (Block_entry449_proc_U0.ap_done & ~Block_entry449_proc_U0.ap_continue);
assign inst_idle_sigs[46] = extract_icrc_512_U0.ap_idle;
assign inst_block_sigs[46] = (extract_icrc_512_U0.ap_done & ~extract_icrc_512_U0.ap_continue) | ~extract_icrc_512_U0.rx_crc2ipFifo_blk_n;
assign inst_idle_sigs[47] = insert_icrc_512_U0.ap_idle;
assign inst_block_sigs[47] = (insert_icrc_512_U0.ap_done & ~insert_icrc_512_U0.ap_continue) | ~insert_icrc_512_U0.tx_ip2crcFifo_blk_n;

assign inst_idle_sigs[48] = 1'b0;
assign inst_idle_sigs[49] = qp_interface_U0.ap_idle;
assign inst_idle_sigs[50] = rx_exh_fsm_512_U0.ap_idle;
assign inst_idle_sigs[51] = merge_rx_pkgs_512_U0.ap_idle;
assign inst_idle_sigs[52] = local_req_handler_U0.ap_idle;
assign inst_idle_sigs[53] = tx_pkg_arbiter_512_U0.ap_idle;
assign inst_idle_sigs[54] = mem_cmd_merger_512_U0.ap_idle;
assign inst_idle_sigs[55] = conn_table_U0.ap_idle;
assign inst_idle_sigs[56] = extract_icrc_512_U0.ap_idle;
assign inst_idle_sigs[57] = insert_icrc_512_U0.ap_idle;

rocev2_top_hls_deadlock_idx0_monitor rocev2_top_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
