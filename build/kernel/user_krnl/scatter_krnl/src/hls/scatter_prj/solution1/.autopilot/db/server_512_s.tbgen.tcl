set moduleName server_512_s
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
set C_modelName {server<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis_listen_port int 16 regular {axi_s 1 volatile  { m_axis_listen_port Data } }  }
	{ s_axis_listen_port_status int 8 regular {axi_s 0 volatile  { s_axis_listen_port_status Data } }  }
	{ s_axis_notifications int 96 regular {axi_s 0 volatile  { s_axis_notifications Data } }  }
	{ m_axis_read_package int 32 regular {axi_s 1 volatile  { m_axis_read_package Data } }  }
	{ s_axis_rx_metadata int 16 regular {axi_s 0 volatile  { s_axis_rx_metadata Data } }  }
	{ s_axis_rx_data int 1024 regular {axi_s 0 volatile  { s_axis_rx_data Data } }  }
	{ runExperiment int 1 regular  }
	{ usePort int 16 regular  }
	{ regBasePort int 16 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis_listen_port", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_listen_port_status", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_notifications", "interface" : "axis", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_read_package", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_rx_metadata", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "runExperiment", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "usePort", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "regBasePort", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_listen_port_status_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_notifications_TVALID sc_in sc_logic 1 invld 2 } 
	{ s_axis_rx_metadata_TVALID sc_in sc_logic 1 invld 4 } 
	{ s_axis_rx_data_TVALID sc_in sc_logic 1 invld 5 } 
	{ m_axis_listen_port_TREADY sc_in sc_logic 1 outacc 0 } 
	{ m_axis_read_package_TREADY sc_in sc_logic 1 outacc 3 } 
	{ m_axis_listen_port_TDATA sc_out sc_lv 16 signal 0 } 
	{ m_axis_listen_port_TVALID sc_out sc_logic 1 outvld 0 } 
	{ s_axis_listen_port_status_TDATA sc_in sc_lv 8 signal 1 } 
	{ s_axis_listen_port_status_TREADY sc_out sc_logic 1 inacc 1 } 
	{ s_axis_notifications_TDATA sc_in sc_lv 96 signal 2 } 
	{ s_axis_notifications_TREADY sc_out sc_logic 1 inacc 2 } 
	{ m_axis_read_package_TDATA sc_out sc_lv 32 signal 3 } 
	{ m_axis_read_package_TVALID sc_out sc_logic 1 outvld 3 } 
	{ s_axis_rx_metadata_TDATA sc_in sc_lv 16 signal 4 } 
	{ s_axis_rx_metadata_TREADY sc_out sc_logic 1 inacc 4 } 
	{ s_axis_rx_data_TDATA sc_in sc_lv 1024 signal 5 } 
	{ s_axis_rx_data_TREADY sc_out sc_logic 1 inacc 5 } 
	{ runExperiment sc_in sc_lv 1 signal 6 } 
	{ usePort sc_in sc_lv 16 signal 7 } 
	{ regBasePort sc_in sc_lv 16 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_listen_port_status_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_listen_port_status", "role": "TVALID" }} , 
 	{ "name": "s_axis_notifications_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_notifications", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_metadata_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_metadata", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_listen_port_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_listen_port", "role": "TREADY" }} , 
 	{ "name": "m_axis_read_package_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_read_package", "role": "TREADY" }} , 
 	{ "name": "m_axis_listen_port_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "m_axis_listen_port", "role": "TDATA" }} , 
 	{ "name": "m_axis_listen_port_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_listen_port", "role": "TVALID" }} , 
 	{ "name": "s_axis_listen_port_status_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_axis_listen_port_status", "role": "TDATA" }} , 
 	{ "name": "s_axis_listen_port_status_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_listen_port_status", "role": "TREADY" }} , 
 	{ "name": "s_axis_notifications_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "s_axis_notifications", "role": "TDATA" }} , 
 	{ "name": "s_axis_notifications_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_notifications", "role": "TREADY" }} , 
 	{ "name": "m_axis_read_package_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_read_package", "role": "TDATA" }} , 
 	{ "name": "m_axis_read_package_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_read_package", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_metadata_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_axis_rx_metadata", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_metadata_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_metadata", "role": "TREADY" }} , 
 	{ "name": "s_axis_rx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "runExperiment", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "runExperiment", "role": "default" }} , 
 	{ "name": "usePort", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "usePort", "role": "default" }} , 
 	{ "name": "regBasePort", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regBasePort", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "server_512_s",
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
			{"Name" : "m_axis_listen_port", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_listen_port_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_listen_port_status", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_listen_port_status_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_notifications", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_notifications_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_read_package", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_read_package_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_rx_metadata", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_metadata_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "runExperiment", "Type" : "None", "Direction" : "I"},
			{"Name" : "usePort", "Type" : "None", "Direction" : "I"},
			{"Name" : "regBasePort", "Type" : "None", "Direction" : "I"},
			{"Name" : "listenState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currentPort_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "openedPort_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "serverFsmState", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_listen_port_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_listen_port_status_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_notifications_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_read_package_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_rx_metadata_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_rx_data_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	server_512_s {
		m_axis_listen_port {Type O LastRead -1 FirstWrite 1}
		s_axis_listen_port_status {Type I LastRead 0 FirstWrite -1}
		s_axis_notifications {Type I LastRead 0 FirstWrite -1}
		m_axis_read_package {Type O LastRead -1 FirstWrite 1}
		s_axis_rx_metadata {Type I LastRead 0 FirstWrite -1}
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		runExperiment {Type I LastRead 0 FirstWrite -1}
		usePort {Type I LastRead 0 FirstWrite -1}
		regBasePort {Type I LastRead 0 FirstWrite -1}
		listenState {Type IO LastRead -1 FirstWrite -1}
		currentPort_V {Type IO LastRead -1 FirstWrite -1}
		openedPort_V {Type IO LastRead -1 FirstWrite -1}
		serverFsmState {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	m_axis_listen_port { axis {  { m_axis_listen_port_TREADY out_acc 0 1 }  { m_axis_listen_port_TDATA out_data 1 16 }  { m_axis_listen_port_TVALID out_vld 1 1 } } }
	s_axis_listen_port_status { axis {  { s_axis_listen_port_status_TVALID in_vld 0 1 }  { s_axis_listen_port_status_TDATA in_data 0 8 }  { s_axis_listen_port_status_TREADY in_acc 1 1 } } }
	s_axis_notifications { axis {  { s_axis_notifications_TVALID in_vld 0 1 }  { s_axis_notifications_TDATA in_data 0 96 }  { s_axis_notifications_TREADY in_acc 1 1 } } }
	m_axis_read_package { axis {  { m_axis_read_package_TREADY out_acc 0 1 }  { m_axis_read_package_TDATA out_data 1 32 }  { m_axis_read_package_TVALID out_vld 1 1 } } }
	s_axis_rx_metadata { axis {  { s_axis_rx_metadata_TVALID in_vld 0 1 }  { s_axis_rx_metadata_TDATA in_data 0 16 }  { s_axis_rx_metadata_TREADY in_acc 1 1 } } }
	s_axis_rx_data { axis {  { s_axis_rx_data_TVALID in_vld 0 1 }  { s_axis_rx_data_TDATA in_data 0 1024 }  { s_axis_rx_data_TREADY in_acc 1 1 } } }
	runExperiment { ap_none {  { runExperiment in_data 0 1 } } }
	usePort { ap_none {  { usePort in_data 0 16 } } }
	regBasePort { ap_none {  { regBasePort in_data 0 16 } } }
}
