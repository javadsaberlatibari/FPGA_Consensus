set moduleName clear
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
set C_modelName {clear}
set C_modelType { void 0 }
set C_modelArgList {
	{ header_ready int 1 regular {pointer 1} {global 1}  }
	{ header_idx int 16 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "header_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "header_idx", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 5
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ header_ready sc_out sc_lv 1 signal 0 } 
	{ header_ready_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ header_idx sc_out sc_lv 16 signal 1 } 
	{ header_idx_ap_vld sc_out sc_logic 1 outvld 1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "header_ready", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "header_ready", "role": "default" }} , 
 	{ "name": "header_ready_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "header_ready", "role": "ap_vld" }} , 
 	{ "name": "header_idx", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "header_idx", "role": "default" }} , 
 	{ "name": "header_idx_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "header_idx", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "clear",
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
			{"Name" : "header_ready", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_idx", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	clear {
		header_ready {Type O LastRead -1 FirstWrite 0}
		header_idx {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	header_ready { ap_vld {  { header_ready out_data 1 1 }  { header_ready_ap_vld out_vld 1 1 } } }
	header_idx { ap_vld {  { header_idx out_data 1 16 }  { header_idx_ap_vld out_vld 1 1 } } }
}
