set moduleName check_icmp_checksum
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
set C_modelName {check_icmp_checksum}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis int 128 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ packageBuffer1 int 128 regular {fifo 1 volatile } {global 1}  }
	{ validFifo int 1 regular {fifo 1 volatile } {global 1}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "packageBuffer1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "validFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ packageBuffer1_din sc_out sc_lv 128 signal 1 } 
	{ packageBuffer1_num_data_valid sc_in sc_lv 7 signal 1 } 
	{ packageBuffer1_fifo_cap sc_in sc_lv 7 signal 1 } 
	{ packageBuffer1_full_n sc_in sc_logic 1 signal 1 } 
	{ packageBuffer1_write sc_out sc_logic 1 signal 1 } 
	{ validFifo_din sc_out sc_lv 1 signal 2 } 
	{ validFifo_num_data_valid sc_in sc_lv 4 signal 2 } 
	{ validFifo_fifo_cap sc_in sc_lv 4 signal 2 } 
	{ validFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ validFifo_write sc_out sc_logic 1 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_din sc_out sc_lv 16 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid sc_in sc_lv 5 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap sc_in sc_lv 5 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_full_n sc_in sc_logic 1 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_write sc_out sc_logic 1 signal 3 } 
	{ s_axis_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis", "role": "TVALID" }} , 
 	{ "name": "packageBuffer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "din" }} , 
 	{ "name": "packageBuffer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "num_data_valid" }} , 
 	{ "name": "packageBuffer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "fifo_cap" }} , 
 	{ "name": "packageBuffer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "full_n" }} , 
 	{ "name": "packageBuffer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "write" }} , 
 	{ "name": "validFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "din" }} , 
 	{ "name": "validFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "validFifo", "role": "num_data_valid" }} , 
 	{ "name": "validFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "validFifo", "role": "fifo_cap" }} , 
 	{ "name": "validFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "full_n" }} , 
 	{ "name": "validFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "write" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "din" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "full_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "role": "write" }} , 
 	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis", "role": "TDATA" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "check_icmp_checksum",
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
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_writeLastOne", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "packageBuffer1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "packageBuffer1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_computeCs", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpChecksum_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpType_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpCode_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_wordCount_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	check_icmp_checksum {
		s_axis {Type I LastRead 0 FirstWrite -1}
		cics_writeLastOne {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_last_V {Type IO LastRead -1 FirstWrite -1}
		packageBuffer1 {Type O LastRead -1 FirstWrite 1}
		cics_computeCs {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_3 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_1 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_2 {Type IO LastRead -1 FirstWrite -1}
		icmpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		icmpType_V {Type IO LastRead -1 FirstWrite -1}
		icmpCode_V {Type IO LastRead -1 FirstWrite -1}
		cics_state {Type IO LastRead -1 FirstWrite -1}
		validFifo {Type O LastRead -1 FirstWrite 1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 {Type O LastRead -1 FirstWrite 1}
		cics_wordCount_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis { axis {  { s_axis_TVALID in_vld 0 1 }  { s_axis_TDATA in_data 0 128 }  { s_axis_TREADY in_acc 1 1 } } }
	packageBuffer1 { ap_fifo {  { packageBuffer1_din fifo_port_we 1 128 }  { packageBuffer1_num_data_valid fifo_status_num_data_valid 0 7 }  { packageBuffer1_fifo_cap fifo_update 0 7 }  { packageBuffer1_full_n fifo_status 0 1 }  { packageBuffer1_write fifo_data 1 1 } } }
	validFifo { ap_fifo {  { validFifo_din fifo_port_we 1 1 }  { validFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { validFifo_fifo_cap fifo_update 0 4 }  { validFifo_full_n fifo_status 0 1 }  { validFifo_write fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_din fifo_port_we 1 16 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_full_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_write fifo_data 1 1 } } }
}
