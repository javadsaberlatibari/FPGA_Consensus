set moduleName rx_exh_fsm_512_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {rx_exh_fsm<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis_mem_write_cmd int 192 regular {axi_s 1 volatile  { m_axis_mem_write_cmd Data } }  }
	{ rx_fsm2exh_MetaFifo int 192 regular {fifo 0 volatile } {global 0}  }
	{ rx_drop2exhFsm_MetaFifo int 512 regular {fifo 0 volatile } {global 0}  }
	{ rxExh2msnTable_upd_req int 192 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqAddr_pop_req int 64 regular {fifo 1 volatile } {global 1}  }
	{ msnTable2rxExh_rsp int 192 regular {fifo 0 volatile } {global 0}  }
	{ exh_lengthFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqAddr_pop_rsp int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_exhEventMetaFifo int 96 regular {fifo 1 volatile } {global 1}  }
	{ rx_pkgSplitTypeFifo int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_pkgShiftTypeFifo int 32 regular {fifo 1 volatile } {global 1}  }
	{ rx_readRequestFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqTable_upd_req int 96 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis_mem_write_cmd", "interface" : "axis", "bitwidth" : 192, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rx_fsm2exh_MetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_drop2exhFsm_MetaFifo", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxExh2msnTable_upd_req", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_req", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2rxExh_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "exh_lengthFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_rsp", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhEventMetaFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_pkgSplitTypeFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_pkgShiftTypeFifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readRequestFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ msnTable2rxExh_rsp_dout sc_in sc_lv 192 signal 5 } 
	{ msnTable2rxExh_rsp_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ msnTable2rxExh_rsp_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ msnTable2rxExh_rsp_empty_n sc_in sc_logic 1 signal 5 } 
	{ msnTable2rxExh_rsp_read sc_out sc_logic 1 signal 5 } 
	{ exh_lengthFifo_dout sc_in sc_lv 16 signal 6 } 
	{ exh_lengthFifo_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ exh_lengthFifo_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ exh_lengthFifo_empty_n sc_in sc_logic 1 signal 6 } 
	{ exh_lengthFifo_read sc_out sc_logic 1 signal 6 } 
	{ rx_readReqAddr_pop_rsp_dout sc_in sc_lv 64 signal 7 } 
	{ rx_readReqAddr_pop_rsp_num_data_valid sc_in sc_lv 2 signal 7 } 
	{ rx_readReqAddr_pop_rsp_fifo_cap sc_in sc_lv 2 signal 7 } 
	{ rx_readReqAddr_pop_rsp_empty_n sc_in sc_logic 1 signal 7 } 
	{ rx_readReqAddr_pop_rsp_read sc_out sc_logic 1 signal 7 } 
	{ rx_fsm2exh_MetaFifo_dout sc_in sc_lv 192 signal 1 } 
	{ rx_fsm2exh_MetaFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ rx_fsm2exh_MetaFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ rx_fsm2exh_MetaFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_fsm2exh_MetaFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_drop2exhFsm_MetaFifo_dout sc_in sc_lv 512 signal 2 } 
	{ rx_drop2exhFsm_MetaFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rx_drop2exhFsm_MetaFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rx_drop2exhFsm_MetaFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_drop2exhFsm_MetaFifo_read sc_out sc_logic 1 signal 2 } 
	{ rx_pkgShiftTypeFifo_din sc_out sc_lv 32 signal 10 } 
	{ rx_pkgShiftTypeFifo_num_data_valid sc_in sc_lv 2 signal 10 } 
	{ rx_pkgShiftTypeFifo_fifo_cap sc_in sc_lv 2 signal 10 } 
	{ rx_pkgShiftTypeFifo_full_n sc_in sc_logic 1 signal 10 } 
	{ rx_pkgShiftTypeFifo_write sc_out sc_logic 1 signal 10 } 
	{ m_axis_mem_write_cmd_TREADY sc_in sc_logic 1 outacc 0 } 
	{ rxExh2msnTable_upd_req_din sc_out sc_lv 192 signal 3 } 
	{ rxExh2msnTable_upd_req_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rxExh2msnTable_upd_req_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rxExh2msnTable_upd_req_full_n sc_in sc_logic 1 signal 3 } 
	{ rxExh2msnTable_upd_req_write sc_out sc_logic 1 signal 3 } 
	{ rx_pkgSplitTypeFifo_din sc_out sc_lv 64 signal 9 } 
	{ rx_pkgSplitTypeFifo_num_data_valid sc_in sc_lv 2 signal 9 } 
	{ rx_pkgSplitTypeFifo_fifo_cap sc_in sc_lv 2 signal 9 } 
	{ rx_pkgSplitTypeFifo_full_n sc_in sc_logic 1 signal 9 } 
	{ rx_pkgSplitTypeFifo_write sc_out sc_logic 1 signal 9 } 
	{ rx_readReqTable_upd_req_din sc_out sc_lv 96 signal 12 } 
	{ rx_readReqTable_upd_req_num_data_valid sc_in sc_lv 2 signal 12 } 
	{ rx_readReqTable_upd_req_fifo_cap sc_in sc_lv 2 signal 12 } 
	{ rx_readReqTable_upd_req_full_n sc_in sc_logic 1 signal 12 } 
	{ rx_readReqTable_upd_req_write sc_out sc_logic 1 signal 12 } 
	{ rx_readRequestFifo_din sc_out sc_lv 256 signal 11 } 
	{ rx_readRequestFifo_num_data_valid sc_in sc_lv 4 signal 11 } 
	{ rx_readRequestFifo_fifo_cap sc_in sc_lv 4 signal 11 } 
	{ rx_readRequestFifo_full_n sc_in sc_logic 1 signal 11 } 
	{ rx_readRequestFifo_write sc_out sc_logic 1 signal 11 } 
	{ rx_exhEventMetaFifo_din sc_out sc_lv 96 signal 8 } 
	{ rx_exhEventMetaFifo_num_data_valid sc_in sc_lv 2 signal 8 } 
	{ rx_exhEventMetaFifo_fifo_cap sc_in sc_lv 2 signal 8 } 
	{ rx_exhEventMetaFifo_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_exhEventMetaFifo_write sc_out sc_logic 1 signal 8 } 
	{ rx_readReqAddr_pop_req_din sc_out sc_lv 64 signal 4 } 
	{ rx_readReqAddr_pop_req_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ rx_readReqAddr_pop_req_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ rx_readReqAddr_pop_req_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_readReqAddr_pop_req_write sc_out sc_logic 1 signal 4 } 
	{ m_axis_mem_write_cmd_TDATA sc_out sc_lv 192 signal 0 } 
	{ m_axis_mem_write_cmd_TVALID sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "msnTable2rxExh_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "dout" }} , 
 	{ "name": "msnTable2rxExh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "msnTable2rxExh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "msnTable2rxExh_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "empty_n" }} , 
 	{ "name": "msnTable2rxExh_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "read" }} , 
 	{ "name": "exh_lengthFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "dout" }} , 
 	{ "name": "exh_lengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "exh_lengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "exh_lengthFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "empty_n" }} , 
 	{ "name": "exh_lengthFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "read" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "dout" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "empty_n" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "read" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "dout" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "read" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "dout" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "read" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo", "role": "din" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo", "role": "full_n" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo", "role": "write" }} , 
 	{ "name": "m_axis_mem_write_cmd_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_mem_write_cmd", "role": "TREADY" }} , 
 	{ "name": "rxExh2msnTable_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "din" }} , 
 	{ "name": "rxExh2msnTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rxExh2msnTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rxExh2msnTable_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "full_n" }} , 
 	{ "name": "rxExh2msnTable_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "write" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "din" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "full_n" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "write" }} , 
 	{ "name": "rx_readReqTable_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "din" }} , 
 	{ "name": "rx_readReqTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqTable_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "full_n" }} , 
 	{ "name": "rx_readReqTable_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "write" }} , 
 	{ "name": "rx_readRequestFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "rx_readRequestFifo", "role": "din" }} , 
 	{ "name": "rx_readRequestFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_readRequestFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_readRequestFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_readRequestFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_readRequestFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo", "role": "full_n" }} , 
 	{ "name": "rx_readRequestFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo", "role": "write" }} , 
 	{ "name": "rx_exhEventMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "din" }} , 
 	{ "name": "rx_exhEventMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exhEventMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exhEventMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_exhEventMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "write" }} , 
 	{ "name": "rx_readReqAddr_pop_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "din" }} , 
 	{ "name": "rx_readReqAddr_pop_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqAddr_pop_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqAddr_pop_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "full_n" }} , 
 	{ "name": "rx_readReqAddr_pop_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "write" }} , 
 	{ "name": "m_axis_mem_write_cmd_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "m_axis_mem_write_cmd", "role": "TDATA" }} , 
 	{ "name": "m_axis_mem_write_cmd_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_mem_write_cmd", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "rx_exh_fsm_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m_axis_mem_write_cmd", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_mem_write_cmd_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pe_fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_dest_qp_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "exHeader_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "consumeReadAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dmaMeta_msn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dmaMeta_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpLength_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_fsm2exh_MetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_fsm2exh_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_drop2exhFsm_MetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_drop2exhFsm_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rxExh2msnTable_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxExh2msnTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2rxExh_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2rxExh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "exh_lengthFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "exh_lengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dmaMeta_dma_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "readReqAddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exhEventMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhEventMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_pkgSplitTypeFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_pkgSplitTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_pkgShiftTypeFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_pkgShiftTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readRequestFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readRequestFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqTable_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqTable_upd_req_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_mem_write_cmd_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rx_exh_fsm_512_s {
		m_axis_mem_write_cmd {Type O LastRead -1 FirstWrite 1}
		pe_fsmState {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_1 {Type IO LastRead -1 FirstWrite -1}
		meta_dest_qp_V {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V {Type IO LastRead -1 FirstWrite -1}
		exHeader_header_V {Type IO LastRead -1 FirstWrite -1}
		consumeReadAddr {Type IO LastRead -1 FirstWrite -1}
		dmaMeta_msn_V {Type IO LastRead -1 FirstWrite -1}
		dmaMeta_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		udpLength_V {Type IO LastRead -1 FirstWrite -1}
		rx_fsm2exh_MetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_drop2exhFsm_MetaFifo {Type I LastRead 0 FirstWrite -1}
		rxExh2msnTable_upd_req {Type O LastRead -1 FirstWrite 1}
		rx_readReqAddr_pop_req {Type O LastRead -1 FirstWrite 1}
		msnTable2rxExh_rsp {Type I LastRead 0 FirstWrite -1}
		exh_lengthFifo {Type I LastRead 0 FirstWrite -1}
		rx_readReqAddr_pop_rsp {Type I LastRead 0 FirstWrite -1}
		dmaMeta_dma_length_V {Type IO LastRead -1 FirstWrite -1}
		readReqAddr_V {Type IO LastRead -1 FirstWrite -1}
		rx_exhEventMetaFifo {Type O LastRead -1 FirstWrite 1}
		rx_pkgSplitTypeFifo {Type O LastRead -1 FirstWrite 1}
		rx_pkgShiftTypeFifo {Type O LastRead -1 FirstWrite 1}
		rx_readRequestFifo {Type O LastRead -1 FirstWrite 1}
		rx_readReqTable_upd_req {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	m_axis_mem_write_cmd { axis {  { m_axis_mem_write_cmd_TREADY out_acc 0 1 }  { m_axis_mem_write_cmd_TDATA out_data 1 192 }  { m_axis_mem_write_cmd_TVALID out_vld 1 1 } } }
	rx_fsm2exh_MetaFifo { ap_fifo {  { rx_fsm2exh_MetaFifo_dout fifo_port_we 0 192 }  { rx_fsm2exh_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_fsm2exh_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_fsm2exh_MetaFifo_empty_n fifo_status 0 1 }  { rx_fsm2exh_MetaFifo_read fifo_data 1 1 } } }
	rx_drop2exhFsm_MetaFifo { ap_fifo {  { rx_drop2exhFsm_MetaFifo_dout fifo_port_we 0 512 }  { rx_drop2exhFsm_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_drop2exhFsm_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_drop2exhFsm_MetaFifo_empty_n fifo_status 0 1 }  { rx_drop2exhFsm_MetaFifo_read fifo_data 1 1 } } }
	rxExh2msnTable_upd_req { ap_fifo {  { rxExh2msnTable_upd_req_din fifo_port_we 1 192 }  { rxExh2msnTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rxExh2msnTable_upd_req_fifo_cap fifo_update 0 2 }  { rxExh2msnTable_upd_req_full_n fifo_status 0 1 }  { rxExh2msnTable_upd_req_write fifo_data 1 1 } } }
	rx_readReqAddr_pop_req { ap_fifo {  { rx_readReqAddr_pop_req_din fifo_port_we 1 64 }  { rx_readReqAddr_pop_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqAddr_pop_req_fifo_cap fifo_update 0 2 }  { rx_readReqAddr_pop_req_full_n fifo_status 0 1 }  { rx_readReqAddr_pop_req_write fifo_data 1 1 } } }
	msnTable2rxExh_rsp { ap_fifo {  { msnTable2rxExh_rsp_dout fifo_port_we 0 192 }  { msnTable2rxExh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { msnTable2rxExh_rsp_fifo_cap fifo_update 0 2 }  { msnTable2rxExh_rsp_empty_n fifo_status 0 1 }  { msnTable2rxExh_rsp_read fifo_data 1 1 } } }
	exh_lengthFifo { ap_fifo {  { exh_lengthFifo_dout fifo_port_we 0 16 }  { exh_lengthFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { exh_lengthFifo_fifo_cap fifo_update 0 3 }  { exh_lengthFifo_empty_n fifo_status 0 1 }  { exh_lengthFifo_read fifo_data 1 1 } } }
	rx_readReqAddr_pop_rsp { ap_fifo {  { rx_readReqAddr_pop_rsp_dout fifo_port_we 0 64 }  { rx_readReqAddr_pop_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqAddr_pop_rsp_fifo_cap fifo_update 0 2 }  { rx_readReqAddr_pop_rsp_empty_n fifo_status 0 1 }  { rx_readReqAddr_pop_rsp_read fifo_data 1 1 } } }
	rx_exhEventMetaFifo { ap_fifo {  { rx_exhEventMetaFifo_din fifo_port_we 1 96 }  { rx_exhEventMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_exhEventMetaFifo_fifo_cap fifo_update 0 2 }  { rx_exhEventMetaFifo_full_n fifo_status 0 1 }  { rx_exhEventMetaFifo_write fifo_data 1 1 } } }
	rx_pkgSplitTypeFifo { ap_fifo {  { rx_pkgSplitTypeFifo_din fifo_port_we 1 64 }  { rx_pkgSplitTypeFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_pkgSplitTypeFifo_fifo_cap fifo_update 0 2 }  { rx_pkgSplitTypeFifo_full_n fifo_status 0 1 }  { rx_pkgSplitTypeFifo_write fifo_data 1 1 } } }
	rx_pkgShiftTypeFifo { ap_fifo {  { rx_pkgShiftTypeFifo_din fifo_port_we 1 32 }  { rx_pkgShiftTypeFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_pkgShiftTypeFifo_fifo_cap fifo_update 0 2 }  { rx_pkgShiftTypeFifo_full_n fifo_status 0 1 }  { rx_pkgShiftTypeFifo_write fifo_data 1 1 } } }
	rx_readRequestFifo { ap_fifo {  { rx_readRequestFifo_din fifo_port_we 1 256 }  { rx_readRequestFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_readRequestFifo_fifo_cap fifo_update 0 4 }  { rx_readRequestFifo_full_n fifo_status 0 1 }  { rx_readRequestFifo_write fifo_data 1 1 } } }
	rx_readReqTable_upd_req { ap_fifo {  { rx_readReqTable_upd_req_din fifo_port_we 1 96 }  { rx_readReqTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqTable_upd_req_fifo_cap fifo_update 0 2 }  { rx_readReqTable_upd_req_full_n fifo_status 0 1 }  { rx_readReqTable_upd_req_write fifo_data 1 1 } } }
}
