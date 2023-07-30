
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [7:0] axis_block_sigs;
wire [17:0] inst_idle_sigs;
wire [11:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~detect_eth_protocol_512_U0.s_axis_raw_TDATA_blk_n;
assign axis_block_sigs[1] = ~route_by_eth_protocol_512_U0.m_axis_arp_TDATA_blk_n;
assign axis_block_sigs[2] = ~detect_ipv4_protocol_512_U0.m_axis_icmp_TDATA_blk_n;
assign axis_block_sigs[3] = ~detect_ipv4_protocol_512_U0.m_axis_tcp_TDATA_blk_n;
assign axis_block_sigs[4] = ~detect_ipv6_protocol_512_U0.m_axis_icmpv6_TDATA_blk_n;
assign axis_block_sigs[5] = ~detect_ipv6_protocol_512_U0.m_axis_ipv6udp_TDATA_blk_n;
assign axis_block_sigs[6] = ~ip_handler_duplicate_stream_net_axis_512_U0.m_axis_udp_TDATA_blk_n;
assign axis_block_sigs[7] = ~ip_handler_duplicate_stream_net_axis_512_U0.m_axis_roce_TDATA_blk_n;

assign inst_idle_sigs[0] = detect_eth_protocol_512_U0.ap_idle;
assign inst_block_sigs[0] = (detect_eth_protocol_512_U0.ap_done & ~detect_eth_protocol_512_U0.ap_continue) | ~detect_eth_protocol_512_U0.etherTypeFifo_blk_n | ~detect_eth_protocol_512_U0.ethDataFifo_blk_n;
assign inst_idle_sigs[1] = route_by_eth_protocol_512_U0.ap_idle;
assign inst_block_sigs[1] = (route_by_eth_protocol_512_U0.ap_done & ~route_by_eth_protocol_512_U0.ap_continue) | ~route_by_eth_protocol_512_U0.etherTypeFifo_blk_n | ~route_by_eth_protocol_512_U0.ethDataFifo_blk_n | ~route_by_eth_protocol_512_U0.ipv4ShiftFifo_blk_n | ~route_by_eth_protocol_512_U0.ipv6ShiftFifo_blk_n;
assign inst_idle_sigs[2] = ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0.ap_idle;
assign inst_block_sigs[2] = (ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0.ap_done & ~ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0.ap_continue) | ~ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0.ipv4ShiftFifo_blk_n | ~ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0.ipDataFifo_blk_n;
assign inst_idle_sigs[3] = ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0.ap_idle;
assign inst_block_sigs[3] = (ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0.ap_done & ~ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0.ap_continue) | ~ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0.ipv6ShiftFifo_blk_n | ~ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0.ipv6DataFifo_blk_n;
assign inst_idle_sigs[4] = extract_ip_meta_512_U0.ap_idle;
assign inst_block_sigs[4] = (extract_ip_meta_512_U0.ap_done & ~extract_ip_meta_512_U0.ap_continue) | ~extract_ip_meta_512_U0.ipDataFifo_blk_n | ~extract_ip_meta_512_U0.ipDataMetaFifo_blk_n | ~extract_ip_meta_512_U0.validIpAddressFifo_blk_n | ~extract_ip_meta_512_U0.ipv4ProtocolFifo_blk_n;
assign inst_idle_sigs[5] = ip_handler_compute_ipv4_checksum_U0.ap_idle;
assign inst_block_sigs[5] = (ip_handler_compute_ipv4_checksum_U0.ap_done & ~ip_handler_compute_ipv4_checksum_U0.ap_continue) | ~ip_handler_compute_ipv4_checksum_U0.ipDataMetaFifo_blk_n | ~ip_handler_compute_ipv4_checksum_U0.ipDataCheckFifo_blk_n | ~ip_handler_compute_ipv4_checksum_U0.iph_subSumsFifoOut_blk_n;
assign inst_idle_sigs[6] = ip_handler_check_ipv4_checksum_32_U0.ap_idle;
assign inst_block_sigs[6] = (ip_handler_check_ipv4_checksum_32_U0.ap_done & ~ip_handler_check_ipv4_checksum_32_U0.ap_continue) | ~ip_handler_check_ipv4_checksum_32_U0.iph_subSumsFifoOut_blk_n | ~ip_handler_check_ipv4_checksum_32_U0.validChecksumFifo_blk_n;
assign inst_idle_sigs[7] = ip_invalid_dropper_512_U0.ap_idle;
assign inst_block_sigs[7] = (ip_invalid_dropper_512_U0.ap_done & ~ip_invalid_dropper_512_U0.ap_continue) | ~ip_invalid_dropper_512_U0.validChecksumFifo_blk_n | ~ip_invalid_dropper_512_U0.validIpAddressFifo_blk_n | ~ip_invalid_dropper_512_U0.ipv4ValidFifo_blk_n | ~ip_invalid_dropper_512_U0.ipDataCheckFifo_blk_n | ~ip_invalid_dropper_512_U0.ipDataDropFifo_blk_n;
assign inst_idle_sigs[8] = cut_length_U0.ap_idle;
assign inst_block_sigs[8] = (cut_length_U0.ap_done & ~cut_length_U0.ap_continue) | ~cut_length_U0.ipDataDropFifo_blk_n | ~cut_length_U0.ipDataCutFifo_blk_n;
assign inst_idle_sigs[9] = detect_ipv4_protocol_512_U0.ap_idle;
assign inst_block_sigs[9] = (detect_ipv4_protocol_512_U0.ap_done & ~detect_ipv4_protocol_512_U0.ap_continue) | ~detect_ipv4_protocol_512_U0.ipv4ProtocolFifo_blk_n | ~detect_ipv4_protocol_512_U0.ipv4ValidFifo_blk_n | ~detect_ipv4_protocol_512_U0.ipDataCutFifo_blk_n | ~detect_ipv4_protocol_512_U0.udpDataFifo_blk_n;
assign inst_idle_sigs[10] = detect_ipv6_protocol_512_U0.ap_idle;
assign inst_block_sigs[10] = (detect_ipv6_protocol_512_U0.ap_done & ~detect_ipv6_protocol_512_U0.ap_continue) | ~detect_ipv6_protocol_512_U0.ipv6DataFifo_blk_n;
assign inst_idle_sigs[11] = ip_handler_duplicate_stream_net_axis_512_U0.ap_idle;
assign inst_block_sigs[11] = (ip_handler_duplicate_stream_net_axis_512_U0.ap_done & ~ip_handler_duplicate_stream_net_axis_512_U0.ap_continue) | ~ip_handler_duplicate_stream_net_axis_512_U0.udpDataFifo_blk_n;

assign inst_idle_sigs[12] = 1'b0;
assign inst_idle_sigs[13] = detect_eth_protocol_512_U0.ap_idle;
assign inst_idle_sigs[14] = route_by_eth_protocol_512_U0.ap_idle;
assign inst_idle_sigs[15] = detect_ipv4_protocol_512_U0.ap_idle;
assign inst_idle_sigs[16] = detect_ipv6_protocol_512_U0.ap_idle;
assign inst_idle_sigs[17] = ip_handler_duplicate_stream_net_axis_512_U0.ap_idle;

ip_handler_top_hls_deadlock_idx0_monitor ip_handler_top_hls_deadlock_idx0_monitor_U (
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
