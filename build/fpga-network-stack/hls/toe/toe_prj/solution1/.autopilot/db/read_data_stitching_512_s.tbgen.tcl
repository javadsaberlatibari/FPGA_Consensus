set moduleName read_data_stitching_512_s
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
set C_modelName {read_data_stitching<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_txread_data int 1024 regular {axi_s 0 volatile  { s_axis_txread_data Data } }  }
	{ memAccessBreakdown2txPkgStitcher int 1 regular {fifo 0 volatile } {global 0}  }
	{ txBufferReadDataStitched int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_txread_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "memAccessBreakdown2txPkgStitcher", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txBufferReadDataStitched", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_txread_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ memAccessBreakdown2txPkgStitcher_dout sc_in sc_lv 1 signal 1 } 
	{ memAccessBreakdown2txPkgStitcher_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ memAccessBreakdown2txPkgStitcher_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ memAccessBreakdown2txPkgStitcher_empty_n sc_in sc_logic 1 signal 1 } 
	{ memAccessBreakdown2txPkgStitcher_read sc_out sc_logic 1 signal 1 } 
	{ txBufferReadDataStitched_din sc_out sc_lv 1024 signal 2 } 
	{ txBufferReadDataStitched_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ txBufferReadDataStitched_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ txBufferReadDataStitched_full_n sc_in sc_logic 1 signal 2 } 
	{ txBufferReadDataStitched_write sc_out sc_logic 1 signal 2 } 
	{ s_axis_txread_data_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_txread_data_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_txread_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_txread_data", "role": "TVALID" }} , 
 	{ "name": "memAccessBreakdown2txPkgStitcher_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "memAccessBreakdown2txPkgStitcher", "role": "dout" }} , 
 	{ "name": "memAccessBreakdown2txPkgStitcher_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "memAccessBreakdown2txPkgStitcher", "role": "num_data_valid" }} , 
 	{ "name": "memAccessBreakdown2txPkgStitcher_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "memAccessBreakdown2txPkgStitcher", "role": "fifo_cap" }} , 
 	{ "name": "memAccessBreakdown2txPkgStitcher_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memAccessBreakdown2txPkgStitcher", "role": "empty_n" }} , 
 	{ "name": "memAccessBreakdown2txPkgStitcher_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memAccessBreakdown2txPkgStitcher", "role": "read" }} , 
 	{ "name": "txBufferReadDataStitched_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "txBufferReadDataStitched", "role": "din" }} , 
 	{ "name": "txBufferReadDataStitched_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txBufferReadDataStitched", "role": "num_data_valid" }} , 
 	{ "name": "txBufferReadDataStitched_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txBufferReadDataStitched", "role": "fifo_cap" }} , 
 	{ "name": "txBufferReadDataStitched_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txBufferReadDataStitched", "role": "full_n" }} , 
 	{ "name": "txBufferReadDataStitched_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txBufferReadDataStitched", "role": "write" }} , 
 	{ "name": "s_axis_txread_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_txread_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_txread_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_txread_data", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "read_data_stitching_512_s",
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
			{"Name" : "s_axis_txread_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_txread_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pkgNeedsMerge", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "offset_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "memAccessBreakdown2txPkgStitcher", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "memAccessBreakdown2txPkgStitcher_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txBufferReadDataStitched", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txBufferReadDataStitched_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_txread_data_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_data_stitching_512_s {
		s_axis_txread_data {Type I LastRead 0 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		pkgNeedsMerge {Type IO LastRead -1 FirstWrite -1}
		offset_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_6 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		memAccessBreakdown2txPkgStitcher {Type I LastRead 0 FirstWrite -1}
		txBufferReadDataStitched {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_txread_data { axis {  { s_axis_txread_data_TVALID in_vld 0 1 }  { s_axis_txread_data_TDATA in_data 0 1024 }  { s_axis_txread_data_TREADY in_acc 1 1 } } }
	memAccessBreakdown2txPkgStitcher { ap_fifo {  { memAccessBreakdown2txPkgStitcher_dout fifo_port_we 0 1 }  { memAccessBreakdown2txPkgStitcher_num_data_valid fifo_status_num_data_valid 0 6 }  { memAccessBreakdown2txPkgStitcher_fifo_cap fifo_update 0 6 }  { memAccessBreakdown2txPkgStitcher_empty_n fifo_status 0 1 }  { memAccessBreakdown2txPkgStitcher_read fifo_data 1 1 } } }
	txBufferReadDataStitched { ap_fifo {  { txBufferReadDataStitched_din fifo_port_we 1 1024 }  { txBufferReadDataStitched_num_data_valid fifo_status_num_data_valid 0 2 }  { txBufferReadDataStitched_fifo_cap fifo_update 0 2 }  { txBufferReadDataStitched_full_n fifo_status 0 1 }  { txBufferReadDataStitched_write fifo_data 1 1 } } }
}
