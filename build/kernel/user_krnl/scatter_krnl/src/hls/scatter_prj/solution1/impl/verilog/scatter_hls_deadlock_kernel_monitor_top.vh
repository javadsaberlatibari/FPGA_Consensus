
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [11:0] axis_block_sigs;
wire [13:0] inst_idle_sigs;
wire [6:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~openStatus_handler_U0.s_axis_open_status_TDATA_blk_n;
assign axis_block_sigs[1] = ~txStatus_handler_U0.s_axis_tx_status_TDATA_blk_n;
assign axis_block_sigs[2] = ~client_512_U0.m_axis_open_connection_TDATA_blk_n;
assign axis_block_sigs[3] = ~client_512_U0.m_axis_tx_data_TDATA_blk_n;
assign axis_block_sigs[4] = ~txMetaData_handler_U0.m_axis_tx_metadata_TDATA_blk_n;
assign axis_block_sigs[5] = ~closeConnection_handler_U0.m_axis_close_connection_TDATA_blk_n;
assign axis_block_sigs[6] = ~server_512_U0.m_axis_listen_port_TDATA_blk_n;
assign axis_block_sigs[7] = ~server_512_U0.s_axis_listen_port_status_TDATA_blk_n;
assign axis_block_sigs[8] = ~server_512_U0.s_axis_notifications_TDATA_blk_n;
assign axis_block_sigs[9] = ~server_512_U0.m_axis_read_package_TDATA_blk_n;
assign axis_block_sigs[10] = ~server_512_U0.s_axis_rx_metadata_TDATA_blk_n;
assign axis_block_sigs[11] = ~server_512_U0.s_axis_rx_data_TDATA_blk_n;

assign inst_idle_sigs[0] = entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (entry_proc_U0.ap_done & ~entry_proc_U0.ap_continue) | ~entry_proc_U0.runExperiment_c_blk_n | ~entry_proc_U0.useConn_c_blk_n | ~entry_proc_U0.useIpAddr_c_blk_n | ~entry_proc_U0.pkgWordCount_c_blk_n | ~entry_proc_U0.regBasePort_c_blk_n | ~entry_proc_U0.expectedRespInKB_c_blk_n | ~entry_proc_U0.clientPkgNum_c_blk_n | ~entry_proc_U0.regIpAddress0_c_blk_n | ~entry_proc_U0.regIpAddress1_c_blk_n | ~entry_proc_U0.regIpAddress2_c_blk_n | ~entry_proc_U0.regIpAddress3_c_blk_n | ~entry_proc_U0.regIpAddress4_c_blk_n | ~entry_proc_U0.regIpAddress5_c_blk_n | ~entry_proc_U0.regIpAddress6_c_blk_n | ~entry_proc_U0.regIpAddress7_c_blk_n | ~entry_proc_U0.regIpAddress8_c_blk_n | ~entry_proc_U0.regIpAddress9_c_blk_n | ~entry_proc_U0.regIpAddress10_c_blk_n;
assign inst_idle_sigs[1] = openStatus_handler_U0.ap_idle;
assign inst_block_sigs[1] = (openStatus_handler_U0.ap_done & ~openStatus_handler_U0.ap_continue) | ~openStatus_handler_U0.openConStatusBuffer_blk_n;
assign inst_idle_sigs[2] = txStatus_handler_U0.ap_idle;
assign inst_block_sigs[2] = (txStatus_handler_U0.ap_done & ~txStatus_handler_U0.ap_continue) | ~txStatus_handler_U0.txStatusBuffer_blk_n;
assign inst_idle_sigs[3] = client_512_U0.ap_idle;
assign inst_block_sigs[3] = (client_512_U0.ap_done & ~client_512_U0.ap_continue) | ~client_512_U0.runExperiment_blk_n | ~client_512_U0.useConn_blk_n | ~client_512_U0.useIpAddr_blk_n | ~client_512_U0.pkgWordCount_blk_n | ~client_512_U0.regBasePort_blk_n | ~client_512_U0.expectedRespInKB_blk_n | ~client_512_U0.clientPkgNum_blk_n | ~client_512_U0.regIpAddress0_blk_n | ~client_512_U0.regIpAddress1_blk_n | ~client_512_U0.regIpAddress2_blk_n | ~client_512_U0.regIpAddress3_blk_n | ~client_512_U0.regIpAddress4_blk_n | ~client_512_U0.regIpAddress5_blk_n | ~client_512_U0.regIpAddress6_blk_n | ~client_512_U0.regIpAddress7_blk_n | ~client_512_U0.regIpAddress8_blk_n | ~client_512_U0.regIpAddress9_blk_n | ~client_512_U0.regIpAddress10_blk_n | ~client_512_U0.openConStatusBuffer_blk_n | ~client_512_U0.txMetaDataBuffer_blk_n | ~client_512_U0.txStatusBuffer_blk_n | ~client_512_U0.closeConnectionBuffer_blk_n;
assign inst_idle_sigs[4] = txMetaData_handler_U0.ap_idle;
assign inst_block_sigs[4] = (txMetaData_handler_U0.ap_done & ~txMetaData_handler_U0.ap_continue) | ~txMetaData_handler_U0.txMetaDataBuffer_blk_n;
assign inst_idle_sigs[5] = closeConnection_handler_U0.ap_idle;
assign inst_block_sigs[5] = (closeConnection_handler_U0.ap_done & ~closeConnection_handler_U0.ap_continue) | ~closeConnection_handler_U0.closeConnectionBuffer_blk_n;
assign inst_idle_sigs[6] = server_512_U0.ap_idle;
assign inst_block_sigs[6] = (server_512_U0.ap_done & ~server_512_U0.ap_continue);

assign inst_idle_sigs[7] = 1'b0;
assign inst_idle_sigs[8] = openStatus_handler_U0.ap_idle;
assign inst_idle_sigs[9] = txStatus_handler_U0.ap_idle;
assign inst_idle_sigs[10] = client_512_U0.ap_idle;
assign inst_idle_sigs[11] = txMetaData_handler_U0.ap_idle;
assign inst_idle_sigs[12] = closeConnection_handler_U0.ap_idle;
assign inst_idle_sigs[13] = server_512_U0.ap_idle;

scatter_hls_deadlock_idx0_monitor scatter_hls_deadlock_idx0_monitor_U (
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
