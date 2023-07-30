
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [5:0] axis_block_sigs;
wire [8:0] inst_idle_sigs;
wire [3:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~process_ipv4_512_U0.s_axis_rx_data_TDATA_blk_n;
assign axis_block_sigs[1] = ~process_ipv4_512_U0.m_axis_rx_meta_TDATA_blk_n;
assign axis_block_sigs[2] = ~ipv4_drop_optional_ip_header_512_U0.m_axis_rx_data_TDATA_blk_n;
assign axis_block_sigs[3] = ~ipv4_lshiftWordByOctet_512_2_U0.s_axis_tx_data_TDATA_blk_n;
assign axis_block_sigs[4] = ~ipv4_generate_ipv4_512_U0.s_axis_tx_meta_TDATA_blk_n;
assign axis_block_sigs[5] = ~ipv4_generate_ipv4_512_U0.m_axis_tx_data_TDATA_blk_n;

assign inst_idle_sigs[0] = process_ipv4_512_U0.ap_idle;
assign inst_block_sigs[0] = (process_ipv4_512_U0.ap_done & ~process_ipv4_512_U0.ap_continue) | ~process_ipv4_512_U0.rx_process2dropFifo_blk_n | ~process_ipv4_512_U0.rx_process2dropLengthFifo_blk_n;
assign inst_idle_sigs[1] = ipv4_drop_optional_ip_header_512_U0.ap_idle;
assign inst_block_sigs[1] = (ipv4_drop_optional_ip_header_512_U0.ap_done & ~ipv4_drop_optional_ip_header_512_U0.ap_continue) | ~ipv4_drop_optional_ip_header_512_U0.rx_process2dropLengthFifo_blk_n | ~ipv4_drop_optional_ip_header_512_U0.rx_process2dropFifo_blk_n;
assign inst_idle_sigs[2] = ipv4_lshiftWordByOctet_512_2_U0.ap_idle;
assign inst_block_sigs[2] = (ipv4_lshiftWordByOctet_512_2_U0.ap_done & ~ipv4_lshiftWordByOctet_512_2_U0.ap_continue) | ~ipv4_lshiftWordByOctet_512_2_U0.tx_shift2ipv4Fifo_blk_n;
assign inst_idle_sigs[3] = ipv4_generate_ipv4_512_U0.ap_idle;
assign inst_block_sigs[3] = (ipv4_generate_ipv4_512_U0.ap_done & ~ipv4_generate_ipv4_512_U0.ap_continue) | ~ipv4_generate_ipv4_512_U0.tx_shift2ipv4Fifo_blk_n;

assign inst_idle_sigs[4] = 1'b0;
assign inst_idle_sigs[5] = process_ipv4_512_U0.ap_idle;
assign inst_idle_sigs[6] = ipv4_drop_optional_ip_header_512_U0.ap_idle;
assign inst_idle_sigs[7] = ipv4_lshiftWordByOctet_512_2_U0.ap_idle;
assign inst_idle_sigs[8] = ipv4_generate_ipv4_512_U0.ap_idle;

ipv4_top_hls_deadlock_idx0_monitor ipv4_top_hls_deadlock_idx0_monitor_U (
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
