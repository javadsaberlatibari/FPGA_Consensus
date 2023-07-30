set moduleName ethernet_frame_padding
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {ethernet_frame_padding}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis int 128 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ m_axis int 128 regular {axi_s 1 volatile  { m_axis Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_TDATA sc_out sc_lv 128 signal 1 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis", "role": "TDATA" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis", "role": "TVALID" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis", "role": "TREADY" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis", "role": "TDATA" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis", "role": "TVALID" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "ethernet_frame_padding",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wordCounter_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ethernet_frame_padding {
		s_axis {Type I LastRead 0 FirstWrite -1}
		m_axis {Type O LastRead -1 FirstWrite 1}
		state_V {Type IO LastRead -1 FirstWrite -1}
		wordCounter_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis { axis {  { s_axis_TDATA in_data 0 128 }  { s_axis_TVALID in_vld 0 1 }  { s_axis_TREADY in_acc 1 1 } } }
	m_axis { axis {  { m_axis_TDATA out_data 1 128 }  { m_axis_TVALID out_vld 1 1 }  { m_axis_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
