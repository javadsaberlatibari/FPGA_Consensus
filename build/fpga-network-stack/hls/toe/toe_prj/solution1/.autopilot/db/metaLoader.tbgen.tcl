set moduleName metaLoader
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
set C_modelName {metaLoader}
set C_modelType { void 0 }
set C_modelArgList {
	{ eventEng2txEng_event int 224 regular {fifo 0 volatile } {global 0}  }
	{ txEngFifoReadCount int 1 regular {fifo 1 volatile } {global 1}  }
	{ txEng2rxSar_req int 16 regular {fifo 1 volatile } {global 1}  }
	{ txEng2txSar_upd_req int 128 regular {fifo 1 volatile } {global 1}  }
	{ rxSar2txEng_rsp int 96 regular {fifo 0 volatile } {global 0}  }
	{ txSar2txEng_upd_rsp int 192 regular {fifo 0 volatile } {global 0}  }
	{ txEng2timer_setProbeTimer int 16 regular {fifo 1 volatile } {global 1}  }
	{ txEng_ipMetaFifo int 16 regular {fifo 1 volatile } {global 1}  }
	{ txEng_tcpMetaFifo int 160 regular {fifo 1 volatile } {global 1}  }
	{ txEng_isLookUpFifo int 1 regular {fifo 1 volatile } {global 1}  }
	{ txEng_isDDRbypass int 1 regular {fifo 1 volatile } {global 1}  }
	{ txEng2sLookup_rev_req int 16 regular {fifo 1 volatile } {global 1}  }
	{ txEng2timer_setRetransmitTimer int 64 regular {fifo 1 volatile } {global 1}  }
	{ txMetaloader2memAccessBreakdown int 128 regular {fifo 1 volatile } {global 1}  }
	{ txEng_tupleShortCutFifo int 96 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "eventEng2txEng_event", "interface" : "fifo", "bitwidth" : 224, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txEngFifoReadCount", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng2rxSar_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng2txSar_upd_req", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rxSar2txEng_rsp", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txSar2txEng_upd_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txEng2timer_setProbeTimer", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng_ipMetaFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng_tcpMetaFifo", "interface" : "fifo", "bitwidth" : 160, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng_isLookUpFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng_isDDRbypass", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng2sLookup_rev_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng2timer_setRetransmitTimer", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txMetaloader2memAccessBreakdown", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txEng_tupleShortCutFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 82
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ eventEng2txEng_event_dout sc_in sc_lv 224 signal 0 } 
	{ eventEng2txEng_event_num_data_valid sc_in sc_lv 7 signal 0 } 
	{ eventEng2txEng_event_fifo_cap sc_in sc_lv 7 signal 0 } 
	{ eventEng2txEng_event_empty_n sc_in sc_logic 1 signal 0 } 
	{ eventEng2txEng_event_read sc_out sc_logic 1 signal 0 } 
	{ txSar2txEng_upd_rsp_dout sc_in sc_lv 192 signal 5 } 
	{ txSar2txEng_upd_rsp_num_data_valid sc_in sc_lv 5 signal 5 } 
	{ txSar2txEng_upd_rsp_fifo_cap sc_in sc_lv 5 signal 5 } 
	{ txSar2txEng_upd_rsp_empty_n sc_in sc_logic 1 signal 5 } 
	{ txSar2txEng_upd_rsp_read sc_out sc_logic 1 signal 5 } 
	{ rxSar2txEng_rsp_dout sc_in sc_lv 96 signal 4 } 
	{ rxSar2txEng_rsp_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ rxSar2txEng_rsp_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ rxSar2txEng_rsp_empty_n sc_in sc_logic 1 signal 4 } 
	{ rxSar2txEng_rsp_read sc_out sc_logic 1 signal 4 } 
	{ txEngFifoReadCount_din sc_out sc_lv 1 signal 1 } 
	{ txEngFifoReadCount_num_data_valid sc_in sc_lv 7 signal 1 } 
	{ txEngFifoReadCount_fifo_cap sc_in sc_lv 7 signal 1 } 
	{ txEngFifoReadCount_full_n sc_in sc_logic 1 signal 1 } 
	{ txEngFifoReadCount_write sc_out sc_logic 1 signal 1 } 
	{ txEng2txSar_upd_req_din sc_out sc_lv 128 signal 3 } 
	{ txEng2txSar_upd_req_num_data_valid sc_in sc_lv 5 signal 3 } 
	{ txEng2txSar_upd_req_fifo_cap sc_in sc_lv 5 signal 3 } 
	{ txEng2txSar_upd_req_full_n sc_in sc_logic 1 signal 3 } 
	{ txEng2txSar_upd_req_write sc_out sc_logic 1 signal 3 } 
	{ txEng2rxSar_req_din sc_out sc_lv 16 signal 2 } 
	{ txEng2rxSar_req_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ txEng2rxSar_req_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ txEng2rxSar_req_full_n sc_in sc_logic 1 signal 2 } 
	{ txEng2rxSar_req_write sc_out sc_logic 1 signal 2 } 
	{ txEng_ipMetaFifo_din sc_out sc_lv 16 signal 7 } 
	{ txEng_ipMetaFifo_num_data_valid sc_in sc_lv 6 signal 7 } 
	{ txEng_ipMetaFifo_fifo_cap sc_in sc_lv 6 signal 7 } 
	{ txEng_ipMetaFifo_full_n sc_in sc_logic 1 signal 7 } 
	{ txEng_ipMetaFifo_write sc_out sc_logic 1 signal 7 } 
	{ txEng_isLookUpFifo_din sc_out sc_lv 1 signal 9 } 
	{ txEng_isLookUpFifo_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ txEng_isLookUpFifo_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ txEng_isLookUpFifo_full_n sc_in sc_logic 1 signal 9 } 
	{ txEng_isLookUpFifo_write sc_out sc_logic 1 signal 9 } 
	{ txEng2sLookup_rev_req_din sc_out sc_lv 16 signal 11 } 
	{ txEng2sLookup_rev_req_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ txEng2sLookup_rev_req_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ txEng2sLookup_rev_req_full_n sc_in sc_logic 1 signal 11 } 
	{ txEng2sLookup_rev_req_write sc_out sc_logic 1 signal 11 } 
	{ txEng_tcpMetaFifo_din sc_out sc_lv 160 signal 8 } 
	{ txEng_tcpMetaFifo_num_data_valid sc_in sc_lv 6 signal 8 } 
	{ txEng_tcpMetaFifo_fifo_cap sc_in sc_lv 6 signal 8 } 
	{ txEng_tcpMetaFifo_full_n sc_in sc_logic 1 signal 8 } 
	{ txEng_tcpMetaFifo_write sc_out sc_logic 1 signal 8 } 
	{ txEng_tupleShortCutFifo_din sc_out sc_lv 96 signal 14 } 
	{ txEng_tupleShortCutFifo_num_data_valid sc_in sc_lv 2 signal 14 } 
	{ txEng_tupleShortCutFifo_fifo_cap sc_in sc_lv 2 signal 14 } 
	{ txEng_tupleShortCutFifo_full_n sc_in sc_logic 1 signal 14 } 
	{ txEng_tupleShortCutFifo_write sc_out sc_logic 1 signal 14 } 
	{ txEng2timer_setRetransmitTimer_din sc_out sc_lv 64 signal 12 } 
	{ txEng2timer_setRetransmitTimer_num_data_valid sc_in sc_lv 2 signal 12 } 
	{ txEng2timer_setRetransmitTimer_fifo_cap sc_in sc_lv 2 signal 12 } 
	{ txEng2timer_setRetransmitTimer_full_n sc_in sc_logic 1 signal 12 } 
	{ txEng2timer_setRetransmitTimer_write sc_out sc_logic 1 signal 12 } 
	{ txMetaloader2memAccessBreakdown_din sc_out sc_lv 128 signal 13 } 
	{ txMetaloader2memAccessBreakdown_num_data_valid sc_in sc_lv 6 signal 13 } 
	{ txMetaloader2memAccessBreakdown_fifo_cap sc_in sc_lv 6 signal 13 } 
	{ txMetaloader2memAccessBreakdown_full_n sc_in sc_logic 1 signal 13 } 
	{ txMetaloader2memAccessBreakdown_write sc_out sc_logic 1 signal 13 } 
	{ txEng_isDDRbypass_din sc_out sc_lv 1 signal 10 } 
	{ txEng_isDDRbypass_num_data_valid sc_in sc_lv 6 signal 10 } 
	{ txEng_isDDRbypass_fifo_cap sc_in sc_lv 6 signal 10 } 
	{ txEng_isDDRbypass_full_n sc_in sc_logic 1 signal 10 } 
	{ txEng_isDDRbypass_write sc_out sc_logic 1 signal 10 } 
	{ txEng2timer_setProbeTimer_din sc_out sc_lv 16 signal 6 } 
	{ txEng2timer_setProbeTimer_num_data_valid sc_in sc_lv 2 signal 6 } 
	{ txEng2timer_setProbeTimer_fifo_cap sc_in sc_lv 2 signal 6 } 
	{ txEng2timer_setProbeTimer_full_n sc_in sc_logic 1 signal 6 } 
	{ txEng2timer_setProbeTimer_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "eventEng2txEng_event_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":224, "type": "signal", "bundle":{"name": "eventEng2txEng_event", "role": "dout" }} , 
 	{ "name": "eventEng2txEng_event_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "eventEng2txEng_event", "role": "num_data_valid" }} , 
 	{ "name": "eventEng2txEng_event_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "eventEng2txEng_event", "role": "fifo_cap" }} , 
 	{ "name": "eventEng2txEng_event_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventEng2txEng_event", "role": "empty_n" }} , 
 	{ "name": "eventEng2txEng_event_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventEng2txEng_event", "role": "read" }} , 
 	{ "name": "txSar2txEng_upd_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "txSar2txEng_upd_rsp", "role": "dout" }} , 
 	{ "name": "txSar2txEng_upd_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txSar2txEng_upd_rsp", "role": "num_data_valid" }} , 
 	{ "name": "txSar2txEng_upd_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txSar2txEng_upd_rsp", "role": "fifo_cap" }} , 
 	{ "name": "txSar2txEng_upd_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txSar2txEng_upd_rsp", "role": "empty_n" }} , 
 	{ "name": "txSar2txEng_upd_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txSar2txEng_upd_rsp", "role": "read" }} , 
 	{ "name": "rxSar2txEng_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rxSar2txEng_rsp", "role": "dout" }} , 
 	{ "name": "rxSar2txEng_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxSar2txEng_rsp", "role": "num_data_valid" }} , 
 	{ "name": "rxSar2txEng_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxSar2txEng_rsp", "role": "fifo_cap" }} , 
 	{ "name": "rxSar2txEng_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxSar2txEng_rsp", "role": "empty_n" }} , 
 	{ "name": "rxSar2txEng_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxSar2txEng_rsp", "role": "read" }} , 
 	{ "name": "txEngFifoReadCount_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "din" }} , 
 	{ "name": "txEngFifoReadCount_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "num_data_valid" }} , 
 	{ "name": "txEngFifoReadCount_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "fifo_cap" }} , 
 	{ "name": "txEngFifoReadCount_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "full_n" }} , 
 	{ "name": "txEngFifoReadCount_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "write" }} , 
 	{ "name": "txEng2txSar_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txEng2txSar_upd_req", "role": "din" }} , 
 	{ "name": "txEng2txSar_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txEng2txSar_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "txEng2txSar_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txEng2txSar_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "txEng2txSar_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2txSar_upd_req", "role": "full_n" }} , 
 	{ "name": "txEng2txSar_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2txSar_upd_req", "role": "write" }} , 
 	{ "name": "txEng2rxSar_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txEng2rxSar_req", "role": "din" }} , 
 	{ "name": "txEng2rxSar_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2rxSar_req", "role": "num_data_valid" }} , 
 	{ "name": "txEng2rxSar_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2rxSar_req", "role": "fifo_cap" }} , 
 	{ "name": "txEng2rxSar_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2rxSar_req", "role": "full_n" }} , 
 	{ "name": "txEng2rxSar_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2rxSar_req", "role": "write" }} , 
 	{ "name": "txEng_ipMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txEng_ipMetaFifo", "role": "din" }} , 
 	{ "name": "txEng_ipMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_ipMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "txEng_ipMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_ipMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "txEng_ipMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_ipMetaFifo", "role": "full_n" }} , 
 	{ "name": "txEng_ipMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_ipMetaFifo", "role": "write" }} , 
 	{ "name": "txEng_isLookUpFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isLookUpFifo", "role": "din" }} , 
 	{ "name": "txEng_isLookUpFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng_isLookUpFifo", "role": "num_data_valid" }} , 
 	{ "name": "txEng_isLookUpFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng_isLookUpFifo", "role": "fifo_cap" }} , 
 	{ "name": "txEng_isLookUpFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isLookUpFifo", "role": "full_n" }} , 
 	{ "name": "txEng_isLookUpFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isLookUpFifo", "role": "write" }} , 
 	{ "name": "txEng2sLookup_rev_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txEng2sLookup_rev_req", "role": "din" }} , 
 	{ "name": "txEng2sLookup_rev_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng2sLookup_rev_req", "role": "num_data_valid" }} , 
 	{ "name": "txEng2sLookup_rev_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng2sLookup_rev_req", "role": "fifo_cap" }} , 
 	{ "name": "txEng2sLookup_rev_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2sLookup_rev_req", "role": "full_n" }} , 
 	{ "name": "txEng2sLookup_rev_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2sLookup_rev_req", "role": "write" }} , 
 	{ "name": "txEng_tcpMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "txEng_tcpMetaFifo", "role": "din" }} , 
 	{ "name": "txEng_tcpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_tcpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "txEng_tcpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_tcpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "txEng_tcpMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpMetaFifo", "role": "full_n" }} , 
 	{ "name": "txEng_tcpMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpMetaFifo", "role": "write" }} , 
 	{ "name": "txEng_tupleShortCutFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "txEng_tupleShortCutFifo", "role": "din" }} , 
 	{ "name": "txEng_tupleShortCutFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tupleShortCutFifo", "role": "num_data_valid" }} , 
 	{ "name": "txEng_tupleShortCutFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tupleShortCutFifo", "role": "fifo_cap" }} , 
 	{ "name": "txEng_tupleShortCutFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tupleShortCutFifo", "role": "full_n" }} , 
 	{ "name": "txEng_tupleShortCutFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tupleShortCutFifo", "role": "write" }} , 
 	{ "name": "txEng2timer_setRetransmitTimer_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "txEng2timer_setRetransmitTimer", "role": "din" }} , 
 	{ "name": "txEng2timer_setRetransmitTimer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2timer_setRetransmitTimer", "role": "num_data_valid" }} , 
 	{ "name": "txEng2timer_setRetransmitTimer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2timer_setRetransmitTimer", "role": "fifo_cap" }} , 
 	{ "name": "txEng2timer_setRetransmitTimer_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2timer_setRetransmitTimer", "role": "full_n" }} , 
 	{ "name": "txEng2timer_setRetransmitTimer_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2timer_setRetransmitTimer", "role": "write" }} , 
 	{ "name": "txMetaloader2memAccessBreakdown_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txMetaloader2memAccessBreakdown", "role": "din" }} , 
 	{ "name": "txMetaloader2memAccessBreakdown_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txMetaloader2memAccessBreakdown", "role": "num_data_valid" }} , 
 	{ "name": "txMetaloader2memAccessBreakdown_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txMetaloader2memAccessBreakdown", "role": "fifo_cap" }} , 
 	{ "name": "txMetaloader2memAccessBreakdown_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaloader2memAccessBreakdown", "role": "full_n" }} , 
 	{ "name": "txMetaloader2memAccessBreakdown_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaloader2memAccessBreakdown", "role": "write" }} , 
 	{ "name": "txEng_isDDRbypass_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isDDRbypass", "role": "din" }} , 
 	{ "name": "txEng_isDDRbypass_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_isDDRbypass", "role": "num_data_valid" }} , 
 	{ "name": "txEng_isDDRbypass_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "txEng_isDDRbypass", "role": "fifo_cap" }} , 
 	{ "name": "txEng_isDDRbypass_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isDDRbypass", "role": "full_n" }} , 
 	{ "name": "txEng_isDDRbypass_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_isDDRbypass", "role": "write" }} , 
 	{ "name": "txEng2timer_setProbeTimer_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txEng2timer_setProbeTimer", "role": "din" }} , 
 	{ "name": "txEng2timer_setProbeTimer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2timer_setProbeTimer", "role": "num_data_valid" }} , 
 	{ "name": "txEng2timer_setProbeTimer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng2timer_setProbeTimer", "role": "fifo_cap" }} , 
 	{ "name": "txEng2timer_setProbeTimer_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2timer_setProbeTimer", "role": "full_n" }} , 
 	{ "name": "txEng2timer_setProbeTimer_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng2timer_setProbeTimer", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "metaLoader",
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
			{"Name" : "ml_FsmState_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_sessionID_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_rt_count_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_sarLoaded", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_randomValue_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_segmentCount_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eventEng2txEng_event", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "eventEng2txEng_event_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ml_curEvent_type", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_address_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_tuple_srcIp_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_tuple_dstIp_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_tuple_srcPort_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ml_curEvent_tuple_dstPort_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txEngFifoReadCount", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEngFifoReadCount_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng2rxSar_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng2rxSar_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng2txSar_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng2txSar_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rxSar_recvd_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxSar_windowSize_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_win_shift_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_not_ackd_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxSar2txEng_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxSar2txEng_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txSar2txEng_upd_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txSar2txEng_upd_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng2timer_setProbeTimer", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng2timer_setProbeTimer_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_ipMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_ipMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_tcpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_tcpMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_isLookUpFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_isLookUpFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_isDDRbypass", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_isDDRbypass_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng2sLookup_rev_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng2sLookup_rev_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng2timer_setRetransmitTimer", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng2timer_setRetransmitTimer_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txSarReg_ackd_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_usableWindow_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_app_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_usedLength_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_finReady", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_finSent", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txSarReg_win_shift_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txMetaloader2memAccessBreakdown", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txMetaloader2memAccessBreakdown_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_tupleShortCutFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_tupleShortCutFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	metaLoader {
		ml_FsmState_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_sessionID_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_length_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_rt_count_V {Type IO LastRead -1 FirstWrite -1}
		ml_sarLoaded {Type IO LastRead -1 FirstWrite -1}
		ml_randomValue_V {Type IO LastRead -1 FirstWrite -1}
		ml_segmentCount_V {Type IO LastRead -1 FirstWrite -1}
		eventEng2txEng_event {Type I LastRead 0 FirstWrite -1}
		ml_curEvent_type {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_address_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_tuple_srcIp_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_tuple_dstIp_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_tuple_srcPort_V {Type IO LastRead -1 FirstWrite -1}
		ml_curEvent_tuple_dstPort_V {Type IO LastRead -1 FirstWrite -1}
		txEngFifoReadCount {Type O LastRead -1 FirstWrite 1}
		txEng2rxSar_req {Type O LastRead -1 FirstWrite 2}
		txEng2txSar_upd_req {Type O LastRead -1 FirstWrite 2}
		rxSar_recvd_V {Type IO LastRead -1 FirstWrite -1}
		rxSar_windowSize_V {Type IO LastRead -1 FirstWrite -1}
		meta_win_shift_V {Type IO LastRead -1 FirstWrite -1}
		txSarReg_not_ackd_V {Type IO LastRead -1 FirstWrite -1}
		rxSar2txEng_rsp {Type I LastRead 0 FirstWrite -1}
		txSar2txEng_upd_rsp {Type I LastRead 0 FirstWrite -1}
		txEng2timer_setProbeTimer {Type O LastRead -1 FirstWrite 2}
		txEng_ipMetaFifo {Type O LastRead -1 FirstWrite 2}
		txEng_tcpMetaFifo {Type O LastRead -1 FirstWrite 2}
		txEng_isLookUpFifo {Type O LastRead -1 FirstWrite 2}
		txEng_isDDRbypass {Type O LastRead -1 FirstWrite 2}
		txEng2sLookup_rev_req {Type O LastRead -1 FirstWrite 2}
		txEng2timer_setRetransmitTimer {Type O LastRead -1 FirstWrite 2}
		txSarReg_ackd_V {Type IO LastRead -1 FirstWrite -1}
		txSarReg_usableWindow_V {Type IO LastRead -1 FirstWrite -1}
		txSarReg_app_V {Type IO LastRead -1 FirstWrite -1}
		txSarReg_usedLength_V {Type IO LastRead -1 FirstWrite -1}
		txSarReg_finReady {Type IO LastRead -1 FirstWrite -1}
		txSarReg_finSent {Type IO LastRead -1 FirstWrite -1}
		txSarReg_win_shift_V {Type IO LastRead -1 FirstWrite -1}
		txMetaloader2memAccessBreakdown {Type O LastRead -1 FirstWrite 2}
		txEng_tupleShortCutFifo {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	eventEng2txEng_event { ap_fifo {  { eventEng2txEng_event_dout fifo_port_we 0 224 }  { eventEng2txEng_event_num_data_valid fifo_status_num_data_valid 0 7 }  { eventEng2txEng_event_fifo_cap fifo_update 0 7 }  { eventEng2txEng_event_empty_n fifo_status 0 1 }  { eventEng2txEng_event_read fifo_data 1 1 } } }
	txEngFifoReadCount { ap_fifo {  { txEngFifoReadCount_din fifo_port_we 1 1 }  { txEngFifoReadCount_num_data_valid fifo_status_num_data_valid 0 7 }  { txEngFifoReadCount_fifo_cap fifo_update 0 7 }  { txEngFifoReadCount_full_n fifo_status 0 1 }  { txEngFifoReadCount_write fifo_data 1 1 } } }
	txEng2rxSar_req { ap_fifo {  { txEng2rxSar_req_din fifo_port_we 1 16 }  { txEng2rxSar_req_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng2rxSar_req_fifo_cap fifo_update 0 2 }  { txEng2rxSar_req_full_n fifo_status 0 1 }  { txEng2rxSar_req_write fifo_data 1 1 } } }
	txEng2txSar_upd_req { ap_fifo {  { txEng2txSar_upd_req_din fifo_port_we 1 128 }  { txEng2txSar_upd_req_num_data_valid fifo_status_num_data_valid 0 5 }  { txEng2txSar_upd_req_fifo_cap fifo_update 0 5 }  { txEng2txSar_upd_req_full_n fifo_status 0 1 }  { txEng2txSar_upd_req_write fifo_data 1 1 } } }
	rxSar2txEng_rsp { ap_fifo {  { rxSar2txEng_rsp_dout fifo_port_we 0 96 }  { rxSar2txEng_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { rxSar2txEng_rsp_fifo_cap fifo_update 0 2 }  { rxSar2txEng_rsp_empty_n fifo_status 0 1 }  { rxSar2txEng_rsp_read fifo_data 1 1 } } }
	txSar2txEng_upd_rsp { ap_fifo {  { txSar2txEng_upd_rsp_dout fifo_port_we 0 192 }  { txSar2txEng_upd_rsp_num_data_valid fifo_status_num_data_valid 0 5 }  { txSar2txEng_upd_rsp_fifo_cap fifo_update 0 5 }  { txSar2txEng_upd_rsp_empty_n fifo_status 0 1 }  { txSar2txEng_upd_rsp_read fifo_data 1 1 } } }
	txEng2timer_setProbeTimer { ap_fifo {  { txEng2timer_setProbeTimer_din fifo_port_we 1 16 }  { txEng2timer_setProbeTimer_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng2timer_setProbeTimer_fifo_cap fifo_update 0 2 }  { txEng2timer_setProbeTimer_full_n fifo_status 0 1 }  { txEng2timer_setProbeTimer_write fifo_data 1 1 } } }
	txEng_ipMetaFifo { ap_fifo {  { txEng_ipMetaFifo_din fifo_port_we 1 16 }  { txEng_ipMetaFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { txEng_ipMetaFifo_fifo_cap fifo_update 0 6 }  { txEng_ipMetaFifo_full_n fifo_status 0 1 }  { txEng_ipMetaFifo_write fifo_data 1 1 } } }
	txEng_tcpMetaFifo { ap_fifo {  { txEng_tcpMetaFifo_din fifo_port_we 1 160 }  { txEng_tcpMetaFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { txEng_tcpMetaFifo_fifo_cap fifo_update 0 6 }  { txEng_tcpMetaFifo_full_n fifo_status 0 1 }  { txEng_tcpMetaFifo_write fifo_data 1 1 } } }
	txEng_isLookUpFifo { ap_fifo {  { txEng_isLookUpFifo_din fifo_port_we 1 1 }  { txEng_isLookUpFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { txEng_isLookUpFifo_fifo_cap fifo_update 0 3 }  { txEng_isLookUpFifo_full_n fifo_status 0 1 }  { txEng_isLookUpFifo_write fifo_data 1 1 } } }
	txEng_isDDRbypass { ap_fifo {  { txEng_isDDRbypass_din fifo_port_we 1 1 }  { txEng_isDDRbypass_num_data_valid fifo_status_num_data_valid 0 6 }  { txEng_isDDRbypass_fifo_cap fifo_update 0 6 }  { txEng_isDDRbypass_full_n fifo_status 0 1 }  { txEng_isDDRbypass_write fifo_data 1 1 } } }
	txEng2sLookup_rev_req { ap_fifo {  { txEng2sLookup_rev_req_din fifo_port_we 1 16 }  { txEng2sLookup_rev_req_num_data_valid fifo_status_num_data_valid 0 3 }  { txEng2sLookup_rev_req_fifo_cap fifo_update 0 3 }  { txEng2sLookup_rev_req_full_n fifo_status 0 1 }  { txEng2sLookup_rev_req_write fifo_data 1 1 } } }
	txEng2timer_setRetransmitTimer { ap_fifo {  { txEng2timer_setRetransmitTimer_din fifo_port_we 1 64 }  { txEng2timer_setRetransmitTimer_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng2timer_setRetransmitTimer_fifo_cap fifo_update 0 2 }  { txEng2timer_setRetransmitTimer_full_n fifo_status 0 1 }  { txEng2timer_setRetransmitTimer_write fifo_data 1 1 } } }
	txMetaloader2memAccessBreakdown { ap_fifo {  { txMetaloader2memAccessBreakdown_din fifo_port_we 1 128 }  { txMetaloader2memAccessBreakdown_num_data_valid fifo_status_num_data_valid 0 6 }  { txMetaloader2memAccessBreakdown_fifo_cap fifo_update 0 6 }  { txMetaloader2memAccessBreakdown_full_n fifo_status 0 1 }  { txMetaloader2memAccessBreakdown_write fifo_data 1 1 } } }
	txEng_tupleShortCutFifo { ap_fifo {  { txEng_tupleShortCutFifo_din fifo_port_we 1 96 }  { txEng_tupleShortCutFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng_tupleShortCutFifo_fifo_cap fifo_update 0 2 }  { txEng_tupleShortCutFifo_full_n fifo_status 0 1 }  { txEng_tupleShortCutFifo_write fifo_data 1 1 } } }
}
