set moduleName generate_ibh_512_s
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
set C_modelName {generate_ibh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_ibhMetaFifo int 192 regular {fifo 0 volatile } {global 0}  }
	{ tx_dstQpFifo int 24 regular {fifo 0 volatile } {global 0}  }
	{ tx_ibhHeaderFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ txIbh2stateTable_upd_req int 96 regular {fifo 1 volatile } {global 1}  }
	{ stateTable2txIbh_rsp int 192 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_ibhMetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_dstQpFifo", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhHeaderFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txIbh2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2txIbh_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_ibhMetaFifo_dout sc_in sc_lv 192 signal 0 } 
	{ tx_ibhMetaFifo_num_data_valid sc_in sc_lv 4 signal 0 } 
	{ tx_ibhMetaFifo_fifo_cap sc_in sc_lv 4 signal 0 } 
	{ tx_ibhMetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_ibhMetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ tx_dstQpFifo_dout sc_in sc_lv 24 signal 1 } 
	{ tx_dstQpFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ tx_dstQpFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ tx_dstQpFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_dstQpFifo_read sc_out sc_logic 1 signal 1 } 
	{ stateTable2txIbh_rsp_dout sc_in sc_lv 192 signal 4 } 
	{ stateTable2txIbh_rsp_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ stateTable2txIbh_rsp_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ stateTable2txIbh_rsp_empty_n sc_in sc_logic 1 signal 4 } 
	{ stateTable2txIbh_rsp_read sc_out sc_logic 1 signal 4 } 
	{ txIbh2stateTable_upd_req_din sc_out sc_lv 96 signal 3 } 
	{ txIbh2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ txIbh2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ txIbh2stateTable_upd_req_full_n sc_in sc_logic 1 signal 3 } 
	{ txIbh2stateTable_upd_req_write sc_out sc_logic 1 signal 3 } 
	{ tx_ibhHeaderFifo_din sc_out sc_lv 256 signal 2 } 
	{ tx_ibhHeaderFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_ibhHeaderFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_ibhHeaderFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ibhHeaderFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_ibhMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "dout" }} , 
 	{ "name": "tx_ibhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ibhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ibhMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "empty_n" }} , 
 	{ "name": "tx_ibhMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "read" }} , 
 	{ "name": "tx_dstQpFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "dout" }} , 
 	{ "name": "tx_dstQpFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_dstQpFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_dstQpFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "empty_n" }} , 
 	{ "name": "tx_dstQpFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "read" }} , 
 	{ "name": "stateTable2txIbh_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "dout" }} , 
 	{ "name": "stateTable2txIbh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2txIbh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2txIbh_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "empty_n" }} , 
 	{ "name": "stateTable2txIbh_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "read" }} , 
 	{ "name": "txIbh2stateTable_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "din" }} , 
 	{ "name": "txIbh2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "txIbh2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "txIbh2stateTable_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "full_n" }} , 
 	{ "name": "txIbh2stateTable_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "write" }} , 
 	{ "name": "tx_ibhHeaderFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_ibhHeaderFifo", "role": "din" }} , 
 	{ "name": "tx_ibhHeaderFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhHeaderFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ibhHeaderFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhHeaderFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ibhHeaderFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhHeaderFifo", "role": "full_n" }} , 
 	{ "name": "tx_ibhHeaderFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhHeaderFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "generate_ibh_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gi_state_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_ibhMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_dstQpFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_dstQpFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_dest_qp_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_numPkg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_ibhHeaderFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhHeaderFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txIbh2stateTable_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txIbh2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2txIbh_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2txIbh_rsp_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	generate_ibh_512_s {
		gi_state_1 {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_2 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_4 {Type IO LastRead -1 FirstWrite -1}
		tx_ibhMetaFifo {Type I LastRead 0 FirstWrite -1}
		tx_dstQpFifo {Type I LastRead 0 FirstWrite -1}
		meta_dest_qp_V_1 {Type IO LastRead -1 FirstWrite -1}
		meta_numPkg_V {Type IO LastRead -1 FirstWrite -1}
		tx_ibhHeaderFifo {Type O LastRead -1 FirstWrite 1}
		txIbh2stateTable_upd_req {Type O LastRead -1 FirstWrite 1}
		stateTable2txIbh_rsp {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_ibhMetaFifo { ap_fifo {  { tx_ibhMetaFifo_dout fifo_port_we 0 192 }  { tx_ibhMetaFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { tx_ibhMetaFifo_fifo_cap fifo_update 0 4 }  { tx_ibhMetaFifo_empty_n fifo_status 0 1 }  { tx_ibhMetaFifo_read fifo_data 1 1 } } }
	tx_dstQpFifo { ap_fifo {  { tx_dstQpFifo_dout fifo_port_we 0 24 }  { tx_dstQpFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_dstQpFifo_fifo_cap fifo_update 0 2 }  { tx_dstQpFifo_empty_n fifo_status 0 1 }  { tx_dstQpFifo_read fifo_data 1 1 } } }
	tx_ibhHeaderFifo { ap_fifo {  { tx_ibhHeaderFifo_din fifo_port_we 1 256 }  { tx_ibhHeaderFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ibhHeaderFifo_fifo_cap fifo_update 0 2 }  { tx_ibhHeaderFifo_full_n fifo_status 0 1 }  { tx_ibhHeaderFifo_write fifo_data 1 1 } } }
	txIbh2stateTable_upd_req { ap_fifo {  { txIbh2stateTable_upd_req_din fifo_port_we 1 96 }  { txIbh2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { txIbh2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { txIbh2stateTable_upd_req_full_n fifo_status 0 1 }  { txIbh2stateTable_upd_req_write fifo_data 1 1 } } }
	stateTable2txIbh_rsp { ap_fifo {  { stateTable2txIbh_rsp_dout fifo_port_we 0 192 }  { stateTable2txIbh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2txIbh_rsp_fifo_cap fifo_update 0 2 }  { stateTable2txIbh_rsp_empty_n fifo_status 0 1 }  { stateTable2txIbh_rsp_read fifo_data 1 1 } } }
}
