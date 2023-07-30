set moduleName process_ipv4_512_s
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
set C_modelName {process_ipv4<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_rx_data int 1024 regular {axi_s 0 volatile  { s_axis_rx_data Data } }  }
	{ m_axis_rx_meta int 64 regular {axi_s 1 volatile  { m_axis_rx_meta Data } }  }
	{ rx_process2dropFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_process2dropLengthFifo int 4 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_rx_meta", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rx_process2dropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropLengthFifo", "interface" : "fifo", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_rx_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ rx_process2dropFifo_din sc_out sc_lv 1024 signal 2 } 
	{ rx_process2dropFifo_num_data_valid sc_in sc_lv 4 signal 2 } 
	{ rx_process2dropFifo_fifo_cap sc_in sc_lv 4 signal 2 } 
	{ rx_process2dropFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_process2dropFifo_write sc_out sc_logic 1 signal 2 } 
	{ rx_process2dropLengthFifo_din sc_out sc_lv 4 signal 3 } 
	{ rx_process2dropLengthFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rx_process2dropLengthFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rx_process2dropLengthFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_process2dropLengthFifo_write sc_out sc_logic 1 signal 3 } 
	{ m_axis_rx_meta_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axis_rx_data_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_rx_data_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_rx_meta_TDATA sc_out sc_lv 64 signal 1 } 
	{ m_axis_rx_meta_TVALID sc_out sc_logic 1 outvld 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_rx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "rx_process2dropFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "din" }} , 
 	{ "name": "rx_process2dropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_process2dropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_process2dropFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "full_n" }} , 
 	{ "name": "rx_process2dropFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "write" }} , 
 	{ "name": "rx_process2dropLengthFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "din" }} , 
 	{ "name": "rx_process2dropLengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_process2dropLengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_process2dropLengthFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "full_n" }} , 
 	{ "name": "rx_process2dropLengthFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "write" }} , 
 	{ "name": "m_axis_rx_meta_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rx_meta", "role": "TREADY" }} , 
 	{ "name": "s_axis_rx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "m_axis_rx_meta_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_rx_meta", "role": "TDATA" }} , 
 	{ "name": "m_axis_rx_meta_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rx_meta", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "process_ipv4_512_s",
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
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_rx_meta", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_rx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropLengthFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropLengthFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_rx_data_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_rx_meta_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	process_ipv4_512_s {
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_rx_meta {Type O LastRead -1 FirstWrite 1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropFifo {Type O LastRead -1 FirstWrite 1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropLengthFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_rx_data { axis {  { s_axis_rx_data_TVALID in_vld 0 1 }  { s_axis_rx_data_TDATA in_data 0 1024 }  { s_axis_rx_data_TREADY in_acc 1 1 } } }
	m_axis_rx_meta { axis {  { m_axis_rx_meta_TREADY out_acc 0 1 }  { m_axis_rx_meta_TDATA out_data 1 64 }  { m_axis_rx_meta_TVALID out_vld 1 1 } } }
	rx_process2dropFifo { ap_fifo {  { rx_process2dropFifo_din fifo_port_we 1 1024 }  { rx_process2dropFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_process2dropFifo_fifo_cap fifo_update 0 4 }  { rx_process2dropFifo_full_n fifo_status 0 1 }  { rx_process2dropFifo_write fifo_data 1 1 } } }
	rx_process2dropLengthFifo { ap_fifo {  { rx_process2dropLengthFifo_din fifo_port_we 1 4 }  { rx_process2dropLengthFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_process2dropLengthFifo_fifo_cap fifo_update 0 2 }  { rx_process2dropLengthFifo_full_n fifo_status 0 1 }  { rx_process2dropLengthFifo_write fifo_data 1 1 } } }
}
