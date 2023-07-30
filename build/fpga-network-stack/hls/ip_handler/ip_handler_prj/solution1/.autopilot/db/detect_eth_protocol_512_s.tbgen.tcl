set moduleName detect_eth_protocol_512_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {detect_eth_protocol<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_raw int 1024 regular {axi_s 0 volatile  { s_axis_raw Data } }  }
	{ etherTypeFifo int 16 regular {fifo 1 volatile } {global 1}  }
	{ ethDataFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_raw", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "etherTypeFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ethDataFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_raw_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_raw_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_raw_TREADY sc_out sc_logic 1 inacc 0 } 
	{ etherTypeFifo_din sc_out sc_lv 16 signal 1 } 
	{ etherTypeFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ etherTypeFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ etherTypeFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ etherTypeFifo_write sc_out sc_logic 1 signal 1 } 
	{ ethDataFifo_din sc_out sc_lv 1024 signal 2 } 
	{ ethDataFifo_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ ethDataFifo_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ ethDataFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ ethDataFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_raw_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_raw", "role": "TDATA" }} , 
 	{ "name": "s_axis_raw_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_raw", "role": "TVALID" }} , 
 	{ "name": "s_axis_raw_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_raw", "role": "TREADY" }} , 
 	{ "name": "etherTypeFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "din" }} , 
 	{ "name": "etherTypeFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "num_data_valid" }} , 
 	{ "name": "etherTypeFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "fifo_cap" }} , 
 	{ "name": "etherTypeFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "full_n" }} , 
 	{ "name": "etherTypeFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "write" }} , 
 	{ "name": "ethDataFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "din" }} , 
 	{ "name": "ethDataFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "num_data_valid" }} , 
 	{ "name": "ethDataFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "fifo_cap" }} , 
 	{ "name": "ethDataFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "full_n" }} , 
 	{ "name": "ethDataFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "detect_eth_protocol_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis_raw", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_raw_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln64_clear_1_fu_155", "Port" : "header_ready_1", "Inst_start_state" : "2", "Inst_end_state" : "2"}]},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln64_clear_1_fu_155", "Port" : "header_idx_1", "Inst_start_state" : "2", "Inst_end_state" : "2"}]},
			{"Name" : "metaWritten_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "etherTypeFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "etherTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ethDataFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ethDataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ln64_clear_1_fu_155", "Parent" : "0",
		"CDFG" : "clear_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "header_ready_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_idx_1", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_raw_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	detect_eth_protocol_512_s {
		s_axis_raw {Type I LastRead 1 FirstWrite -1}
		header_ready_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		metaWritten_1 {Type IO LastRead -1 FirstWrite -1}
		etherTypeFifo {Type O LastRead -1 FirstWrite 1}
		ethDataFifo {Type O LastRead -1 FirstWrite 1}}
	clear_1 {
		header_ready_1 {Type O LastRead -1 FirstWrite 0}
		header_idx_1 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_raw { axis {  { s_axis_raw_TDATA in_data 0 1024 }  { s_axis_raw_TVALID in_vld 0 1 }  { s_axis_raw_TREADY in_acc 1 1 } } }
	etherTypeFifo { ap_fifo {  { etherTypeFifo_din fifo_port_we 1 16 }  { etherTypeFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { etherTypeFifo_fifo_cap fifo_update 0 2 }  { etherTypeFifo_full_n fifo_status 0 1 }  { etherTypeFifo_write fifo_data 1 1 } } }
	ethDataFifo { ap_fifo {  { ethDataFifo_din fifo_port_we 1 1024 }  { ethDataFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { ethDataFifo_fifo_cap fifo_update 0 3 }  { ethDataFifo_full_n fifo_status 0 1 }  { ethDataFifo_write fifo_data 1 1 } } }
}
