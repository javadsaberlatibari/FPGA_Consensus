
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [3:0] axis_block_sigs;
wire [8:0] inst_idle_sigs;
wire [4:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~check_icmp_checksum_U0.s_axis_TDATA_blk_n;
assign axis_block_sigs[1] = ~udpPortUnreachable_U0.udpIn_TDATA_blk_n;
assign axis_block_sigs[2] = ~udpPortUnreachable_U0.ttlIn_TDATA_blk_n;
assign axis_block_sigs[3] = ~insertChecksum_U0.m_axis_TDATA_blk_n;

assign inst_idle_sigs[0] = check_icmp_checksum_U0.ap_idle;
assign inst_block_sigs[0] = (check_icmp_checksum_U0.ap_done & ~check_icmp_checksum_U0.ap_continue) | ~check_icmp_checksum_U0.packageBuffer1_blk_n | ~check_icmp_checksum_U0.validFifo_blk_n | ~check_icmp_checksum_U0.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n;
assign inst_idle_sigs[1] = udpPortUnreachable_U0.ap_idle;
assign inst_block_sigs[1] = (udpPortUnreachable_U0.ap_done & ~udpPortUnreachable_U0.ap_continue) | ~udpPortUnreachable_U0.udpPort2addIpHeader_data_blk_n | ~udpPortUnreachable_U0.udpPort2addIpHeader_header_blk_n | ~udpPortUnreachable_U0.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n;
assign inst_idle_sigs[2] = udpAddIpHeader_U0.ap_idle;
assign inst_block_sigs[2] = (udpAddIpHeader_U0.ap_done & ~udpAddIpHeader_U0.ap_continue) | ~udpAddIpHeader_U0.udpPort2addIpHeader_header_blk_n | ~udpAddIpHeader_U0.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_blk_n | ~udpAddIpHeader_U0.udpPort2addIpHeader_data_blk_n;
assign inst_idle_sigs[3] = dropper_U0.ap_idle;
assign inst_block_sigs[3] = (dropper_U0.ap_done & ~dropper_U0.ap_continue) | ~dropper_U0.packageBuffer1_blk_n | ~dropper_U0.validFifo_blk_n | ~dropper_U0.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n;
assign inst_idle_sigs[4] = insertChecksum_U0.ap_idle;
assign inst_block_sigs[4] = (insertChecksum_U0.ap_done & ~insertChecksum_U0.ap_continue) | ~insertChecksum_U0.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n | ~insertChecksum_U0.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_blk_n | ~insertChecksum_U0.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n | ~insertChecksum_U0.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n;

assign inst_idle_sigs[5] = 1'b0;
assign inst_idle_sigs[6] = check_icmp_checksum_U0.ap_idle;
assign inst_idle_sigs[7] = udpPortUnreachable_U0.ap_idle;
assign inst_idle_sigs[8] = insertChecksum_U0.ap_idle;

icmp_server_hls_deadlock_idx0_monitor icmp_server_hls_deadlock_idx0_monitor_U (
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
