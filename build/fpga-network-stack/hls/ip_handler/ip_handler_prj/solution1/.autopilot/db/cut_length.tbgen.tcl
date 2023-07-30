set moduleName cut_length
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
set C_modelName {cut_length}
set C_modelType { void 0 }
set C_modelArgList {
	{ ipDataDropFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ ipDataCutFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ipDataDropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ipDataCutFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ipDataDropFifo_dout sc_in sc_lv 1024 signal 0 } 
	{ ipDataDropFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ ipDataDropFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ ipDataDropFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ ipDataDropFifo_read sc_out sc_logic 1 signal 0 } 
	{ ipDataCutFifo_din sc_out sc_lv 1024 signal 1 } 
	{ ipDataCutFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ ipDataCutFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ ipDataCutFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ ipDataCutFifo_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ipDataDropFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "dout" }} , 
 	{ "name": "ipDataDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipDataDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipDataDropFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "empty_n" }} , 
 	{ "name": "ipDataDropFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "read" }} , 
 	{ "name": "ipDataCutFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipDataCutFifo", "role": "din" }} , 
 	{ "name": "ipDataCutFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataCutFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipDataCutFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataCutFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipDataCutFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataCutFifo", "role": "full_n" }} , 
 	{ "name": "ipDataCutFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataCutFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "cut_length",
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
			{"Name" : "cl_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipDataDropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataCutFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCutFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_646_64_1_1_U34", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	cut_length {
		cl_state {Type IO LastRead -1 FirstWrite -1}
		ipDataDropFifo {Type I LastRead 0 FirstWrite -1}
		ipDataCutFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ipDataDropFifo { ap_fifo {  { ipDataDropFifo_dout fifo_port_we 0 1024 }  { ipDataDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { ipDataDropFifo_fifo_cap fifo_update 0 2 }  { ipDataDropFifo_empty_n fifo_status 0 1 }  { ipDataDropFifo_read fifo_data 1 1 } } }
	ipDataCutFifo { ap_fifo {  { ipDataCutFifo_din fifo_port_we 1 1024 }  { ipDataCutFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { ipDataCutFifo_fifo_cap fifo_update 0 2 }  { ipDataCutFifo_full_n fifo_status 0 1 }  { ipDataCutFifo_write fifo_data 1 1 } } }
}
