
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [3:0] axis_block_sigs;
wire [10:0] inst_idle_sigs;
wire [6:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~extract_ip_address_512_U0.s_axis_ip_TDATA_blk_n;
assign axis_block_sigs[1] = ~extract_ip_address_512_U0.m_axis_arp_lookup_request_TDATA_blk_n;
assign axis_block_sigs[2] = ~handle_arp_reply_512_U0.s_axis_arp_lookup_reply_TDATA_blk_n;
assign axis_block_sigs[3] = ~insert_ethernet_header_512_U0.m_axis_ip_TDATA_blk_n;

assign inst_idle_sigs[0] = extract_ip_address_512_U0.ap_idle;
assign inst_block_sigs[0] = (extract_ip_address_512_U0.ap_done & ~extract_ip_address_512_U0.ap_continue) | ~extract_ip_address_512_U0.dataStreamBuffer0_blk_n;
assign inst_idle_sigs[1] = mac_compute_ipv4_checksum_U0.ap_idle;
assign inst_block_sigs[1] = (mac_compute_ipv4_checksum_U0.ap_done & ~mac_compute_ipv4_checksum_U0.ap_continue) | ~mac_compute_ipv4_checksum_U0.dataStreamBuffer0_blk_n | ~mac_compute_ipv4_checksum_U0.dataStreamBuffer1_blk_n | ~mac_compute_ipv4_checksum_U0.subSumFifo_blk_n;
assign inst_idle_sigs[2] = mac_finalize_ipv4_checksum_32_U0.ap_idle;
assign inst_block_sigs[2] = (mac_finalize_ipv4_checksum_32_U0.ap_done & ~mac_finalize_ipv4_checksum_32_U0.ap_continue) | ~mac_finalize_ipv4_checksum_32_U0.subSumFifo_blk_n | ~mac_finalize_ipv4_checksum_32_U0.checksumFifo_blk_n;
assign inst_idle_sigs[3] = insert_ip_checksum_512_U0.ap_idle;
assign inst_block_sigs[3] = (insert_ip_checksum_512_U0.ap_done & ~insert_ip_checksum_512_U0.ap_continue) | ~insert_ip_checksum_512_U0.dataStreamBuffer1_blk_n | ~insert_ip_checksum_512_U0.checksumFifo_blk_n | ~insert_ip_checksum_512_U0.dataStreamBuffer2_blk_n;
assign inst_idle_sigs[4] = handle_arp_reply_512_U0.ap_idle;
assign inst_block_sigs[4] = (handle_arp_reply_512_U0.ap_done & ~handle_arp_reply_512_U0.ap_continue) | ~handle_arp_reply_512_U0.dataStreamBuffer2_blk_n | ~handle_arp_reply_512_U0.headerFifo_blk_n | ~handle_arp_reply_512_U0.dataStreamBuffer3_blk_n;
assign inst_idle_sigs[5] = mac_lshiftWordByOctet_512_1_U0.ap_idle;
assign inst_block_sigs[5] = (mac_lshiftWordByOctet_512_1_U0.ap_done & ~mac_lshiftWordByOctet_512_1_U0.ap_continue) | ~mac_lshiftWordByOctet_512_1_U0.dataStreamBuffer4_blk_n | ~mac_lshiftWordByOctet_512_1_U0.dataStreamBuffer3_blk_n;
assign inst_idle_sigs[6] = insert_ethernet_header_512_U0.ap_idle;
assign inst_block_sigs[6] = (insert_ethernet_header_512_U0.ap_done & ~insert_ethernet_header_512_U0.ap_continue) | ~insert_ethernet_header_512_U0.headerFifo_blk_n | ~insert_ethernet_header_512_U0.dataStreamBuffer4_blk_n;

assign inst_idle_sigs[7] = 1'b0;
assign inst_idle_sigs[8] = extract_ip_address_512_U0.ap_idle;
assign inst_idle_sigs[9] = handle_arp_reply_512_U0.ap_idle;
assign inst_idle_sigs[10] = insert_ethernet_header_512_U0.ap_idle;

mac_ip_encode_top_hls_deadlock_idx0_monitor mac_ip_encode_top_hls_deadlock_idx0_monitor_U (
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
