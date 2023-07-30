set moduleName txAppStatusHandler
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
set C_modelName {txAppStatusHandler}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_txwrite_sts int 40 regular {axi_s 0 volatile  { s_axis_txwrite_sts Data } }  }
	{ txApp_txEventCache int 128 regular {fifo 0 volatile } {global 0}  }
	{ txApp2txSar_push int 64 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_txwrite_sts", "interface" : "axis", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "txApp_txEventCache", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txApp2txSar_push", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_txwrite_sts_TVALID sc_in sc_logic 1 invld 0 } 
	{ txApp_txEventCache_dout sc_in sc_lv 128 signal 1 } 
	{ txApp_txEventCache_num_data_valid sc_in sc_lv 7 signal 1 } 
	{ txApp_txEventCache_fifo_cap sc_in sc_lv 7 signal 1 } 
	{ txApp_txEventCache_empty_n sc_in sc_logic 1 signal 1 } 
	{ txApp_txEventCache_read sc_out sc_logic 1 signal 1 } 
	{ txApp2txSar_push_din sc_out sc_lv 64 signal 2 } 
	{ txApp2txSar_push_num_data_valid sc_in sc_lv 5 signal 2 } 
	{ txApp2txSar_push_fifo_cap sc_in sc_lv 5 signal 2 } 
	{ txApp2txSar_push_full_n sc_in sc_logic 1 signal 2 } 
	{ txApp2txSar_push_write sc_out sc_logic 1 signal 2 } 
	{ s_axis_txwrite_sts_TDATA sc_in sc_lv 40 signal 0 } 
	{ s_axis_txwrite_sts_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_txwrite_sts_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_txwrite_sts", "role": "TVALID" }} , 
 	{ "name": "txApp_txEventCache_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "dout" }} , 
 	{ "name": "txApp_txEventCache_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "num_data_valid" }} , 
 	{ "name": "txApp_txEventCache_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "fifo_cap" }} , 
 	{ "name": "txApp_txEventCache_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "empty_n" }} , 
 	{ "name": "txApp_txEventCache_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "read" }} , 
 	{ "name": "txApp2txSar_push_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "txApp2txSar_push", "role": "din" }} , 
 	{ "name": "txApp2txSar_push_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txApp2txSar_push", "role": "num_data_valid" }} , 
 	{ "name": "txApp2txSar_push_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "txApp2txSar_push", "role": "fifo_cap" }} , 
 	{ "name": "txApp2txSar_push_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2txSar_push", "role": "full_n" }} , 
 	{ "name": "txApp2txSar_push_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2txSar_push", "role": "write" }} , 
 	{ "name": "s_axis_txwrite_sts_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "s_axis_txwrite_sts", "role": "TDATA" }} , 
 	{ "name": "s_axis_txwrite_sts_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_txwrite_sts", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "txAppStatusHandler",
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
			{"Name" : "s_axis_txwrite_sts", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_txwrite_sts_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tash_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ev_sessionID_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ev_address_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ev_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txApp_txEventCache", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp_txEventCache_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txApp2txSar_push", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp2txSar_push_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_txwrite_sts_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	txAppStatusHandler {
		s_axis_txwrite_sts {Type I LastRead 0 FirstWrite -1}
		tash_state {Type IO LastRead -1 FirstWrite -1}
		ev_sessionID_V {Type IO LastRead -1 FirstWrite -1}
		ev_address_V {Type IO LastRead -1 FirstWrite -1}
		ev_length_V {Type IO LastRead -1 FirstWrite -1}
		txApp_txEventCache {Type I LastRead 0 FirstWrite -1}
		txApp2txSar_push {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_txwrite_sts { axis {  { s_axis_txwrite_sts_TVALID in_vld 0 1 }  { s_axis_txwrite_sts_TDATA in_data 0 40 }  { s_axis_txwrite_sts_TREADY in_acc 1 1 } } }
	txApp_txEventCache { ap_fifo {  { txApp_txEventCache_dout fifo_port_we 0 128 }  { txApp_txEventCache_num_data_valid fifo_status_num_data_valid 0 7 }  { txApp_txEventCache_fifo_cap fifo_update 0 7 }  { txApp_txEventCache_empty_n fifo_status 0 1 }  { txApp_txEventCache_read fifo_data 1 1 } } }
	txApp2txSar_push { ap_fifo {  { txApp2txSar_push_din fifo_port_we 1 64 }  { txApp2txSar_push_num_data_valid fifo_status_num_data_valid 0 5 }  { txApp2txSar_push_fifo_cap fifo_update 0 5 }  { txApp2txSar_push_full_n fifo_status 0 1 }  { txApp2txSar_push_write fifo_data 1 1 } } }
}
