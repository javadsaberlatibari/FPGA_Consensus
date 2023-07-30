set moduleName clear_1
set isTopModule 0
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {clear.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ optionalHeader_ready int 1 regular {pointer 1} {global 1}  }
	{ optionalHeader_idx int 16 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "optionalHeader_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "optionalHeader_idx", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 5
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ optionalHeader_ready sc_out sc_lv 1 signal 0 } 
	{ optionalHeader_ready_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ optionalHeader_idx sc_out sc_lv 16 signal 1 } 
	{ optionalHeader_idx_ap_vld sc_out sc_logic 1 outvld 1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "optionalHeader_ready", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "optionalHeader_ready", "role": "default" }} , 
 	{ "name": "optionalHeader_ready_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "optionalHeader_ready", "role": "ap_vld" }} , 
 	{ "name": "optionalHeader_idx", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "optionalHeader_idx", "role": "default" }} , 
 	{ "name": "optionalHeader_idx_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "optionalHeader_idx", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "optionalHeader_ready", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "optionalHeader_idx", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	clear_1 {
		optionalHeader_ready {Type O LastRead -1 FirstWrite 0}
		optionalHeader_idx {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	optionalHeader_ready { ap_vld {  { optionalHeader_ready out_data 1 1 }  { optionalHeader_ready_ap_vld out_vld 1 1 } } }
	optionalHeader_idx { ap_vld {  { optionalHeader_idx out_data 1 16 }  { optionalHeader_idx_ap_vld out_vld 1 1 } } }
}
