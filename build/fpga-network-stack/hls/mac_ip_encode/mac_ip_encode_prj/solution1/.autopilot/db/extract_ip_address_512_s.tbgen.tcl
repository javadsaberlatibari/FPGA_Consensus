set moduleName extract_ip_address_512_s
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
set C_modelName {extract_ip_address<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_ip int 1024 regular {axi_s 0 volatile  { s_axis_ip Data } }  }
	{ m_axis_arp_lookup_request int 32 regular {axi_s 1 volatile  { m_axis_arp_lookup_request Data } }  }
	{ regSubNetMask int 32 regular {ap_stable 0} }
	{ regDefaultGateway int 32 regular {ap_stable 0} }
	{ dataStreamBuffer0 int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_ip", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_arp_lookup_request", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "regSubNetMask", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "regDefaultGateway", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dataStreamBuffer0", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_ip_TVALID sc_in sc_logic 1 invld 0 } 
	{ dataStreamBuffer0_din sc_out sc_lv 1024 signal 4 } 
	{ dataStreamBuffer0_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ dataStreamBuffer0_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ dataStreamBuffer0_full_n sc_in sc_logic 1 signal 4 } 
	{ dataStreamBuffer0_write sc_out sc_logic 1 signal 4 } 
	{ m_axis_arp_lookup_request_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axis_ip_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_ip_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_arp_lookup_request_TDATA sc_out sc_lv 32 signal 1 } 
	{ m_axis_arp_lookup_request_TVALID sc_out sc_logic 1 outvld 1 } 
	{ regSubNetMask sc_in sc_lv 32 signal 2 } 
	{ regDefaultGateway sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_ip_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_ip", "role": "TVALID" }} , 
 	{ "name": "dataStreamBuffer0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "dataStreamBuffer0", "role": "din" }} , 
 	{ "name": "dataStreamBuffer0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer0", "role": "num_data_valid" }} , 
 	{ "name": "dataStreamBuffer0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer0", "role": "fifo_cap" }} , 
 	{ "name": "dataStreamBuffer0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer0", "role": "full_n" }} , 
 	{ "name": "dataStreamBuffer0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer0", "role": "write" }} , 
 	{ "name": "m_axis_arp_lookup_request_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_arp_lookup_request", "role": "TREADY" }} , 
 	{ "name": "s_axis_ip_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_ip", "role": "TDATA" }} , 
 	{ "name": "s_axis_ip_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_ip", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_lookup_request_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_arp_lookup_request", "role": "TDATA" }} , 
 	{ "name": "m_axis_arp_lookup_request_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_arp_lookup_request", "role": "TVALID" }} , 
 	{ "name": "regSubNetMask", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regSubNetMask", "role": "default" }} , 
 	{ "name": "regDefaultGateway", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regDefaultGateway", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "extract_ip_address_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis_ip", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_ip_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_arp_lookup_request", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_arp_lookup_request_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "regSubNetMask", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "regDefaultGateway", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln70_clear_fu_171", "Port" : "header_ready"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln70_clear_fu_171", "Port" : "header_idx"}]},
			{"Name" : "dataStreamBuffer0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dataStreamBuffer0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ln70_clear_fu_171", "Parent" : "0",
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
			{"Name" : "header_idx", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_ip_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_arp_lookup_request_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	extract_ip_address_512_s {
		s_axis_ip {Type I LastRead 1 FirstWrite -1}
		m_axis_arp_lookup_request {Type O LastRead -1 FirstWrite 2}
		regSubNetMask {Type I LastRead 1 FirstWrite -1}
		regDefaultGateway {Type I LastRead 1 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		dataStreamBuffer0 {Type O LastRead -1 FirstWrite 1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}}
	clear {
		header_ready {Type O LastRead -1 FirstWrite 0}
		header_idx {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_ip { axis {  { s_axis_ip_TVALID in_vld 0 1 }  { s_axis_ip_TDATA in_data 0 1024 }  { s_axis_ip_TREADY in_acc 1 1 } } }
	m_axis_arp_lookup_request { axis {  { m_axis_arp_lookup_request_TREADY out_acc 0 1 }  { m_axis_arp_lookup_request_TDATA out_data 1 32 }  { m_axis_arp_lookup_request_TVALID out_vld 1 1 } } }
	regSubNetMask { ap_stable {  { regSubNetMask in_data 0 32 } } }
	regDefaultGateway { ap_stable {  { regDefaultGateway in_data 0 32 } } }
	dataStreamBuffer0 { ap_fifo {  { dataStreamBuffer0_din fifo_port_we 1 1024 }  { dataStreamBuffer0_num_data_valid fifo_status_num_data_valid 0 2 }  { dataStreamBuffer0_fifo_cap fifo_update 0 2 }  { dataStreamBuffer0_full_n fifo_status 0 1 }  { dataStreamBuffer0_write fifo_data 1 1 } } }
}
