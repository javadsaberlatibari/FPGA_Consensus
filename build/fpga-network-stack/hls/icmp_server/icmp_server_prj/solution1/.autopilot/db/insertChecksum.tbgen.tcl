set moduleName insertChecksum
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
set C_modelName {insertChecksum}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis int 128 regular {axi_s 1 volatile  { m_axis Data } }  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams int 128 regular {fifo 0 volatile } {global 0}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 int 128 regular {fifo 0 volatile } {global 0}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams int 16 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_dout sc_in sc_lv 128 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid sc_in sc_lv 5 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap sc_in sc_lv 5 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_empty_n sc_in sc_logic 1 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_read sc_out sc_logic 1 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_dout sc_in sc_lv 16 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid sc_in sc_lv 5 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap sc_in sc_lv 5 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_empty_n sc_in sc_logic 1 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_read sc_out sc_logic 1 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_dout sc_in sc_lv 128 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_num_data_valid sc_in sc_lv 5 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_fifo_cap sc_in sc_lv 5 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_empty_n sc_in sc_logic 1 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_read sc_out sc_logic 1 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_dout sc_in sc_lv 16 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid sc_in sc_lv 5 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap sc_in sc_lv 5 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_empty_n sc_in sc_logic 1 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_read sc_out sc_logic 1 signal 4 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 0 } 
	{ m_axis_TDATA sc_out sc_lv 128 signal 0 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "dout" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "empty_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "read" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "dout" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "empty_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "read" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "role": "dout" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "role": "empty_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "role": "read" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "dout" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "empty_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "read" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis", "role": "TREADY" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis", "role": "TDATA" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "insertChecksum",
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
			{"Name" : "m_axis", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ic_wordCount_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "streamSource_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	insertChecksum {
		m_axis {Type O LastRead -1 FirstWrite 1}
		ic_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V_1 {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	m_axis { axis {  { m_axis_TREADY out_acc 0 1 }  { m_axis_TDATA out_data 1 128 }  { m_axis_TVALID out_vld 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_dout fifo_port_we 0 128 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_empty_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_read fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_dout fifo_port_we 0 128 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_empty_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_read fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_dout fifo_port_we 0 16 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_empty_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_read fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_dout fifo_port_we 0 16 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_empty_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_read fifo_data 1 1 } } }
}
