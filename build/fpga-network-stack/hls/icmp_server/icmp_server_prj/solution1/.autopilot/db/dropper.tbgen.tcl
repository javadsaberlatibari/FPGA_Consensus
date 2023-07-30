set moduleName dropper
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dropper}
set C_modelType { void 0 }
set C_modelArgList {
	{ packageBuffer1 int 128 regular {fifo 0 volatile } {global 0}  }
	{ validFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams int 128 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "packageBuffer1", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "validFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ packageBuffer1_dout sc_in sc_lv 128 signal 0 } 
	{ packageBuffer1_num_data_valid sc_in sc_lv 7 signal 0 } 
	{ packageBuffer1_fifo_cap sc_in sc_lv 7 signal 0 } 
	{ packageBuffer1_empty_n sc_in sc_logic 1 signal 0 } 
	{ packageBuffer1_read sc_out sc_logic 1 signal 0 } 
	{ validFifo_dout sc_in sc_lv 1 signal 1 } 
	{ validFifo_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ validFifo_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ validFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ validFifo_read sc_out sc_logic 1 signal 1 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_din sc_out sc_lv 128 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid sc_in sc_lv 5 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap sc_in sc_lv 5 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_full_n sc_in sc_logic 1 signal 2 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "packageBuffer1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "dout" }} , 
 	{ "name": "packageBuffer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "num_data_valid" }} , 
 	{ "name": "packageBuffer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "fifo_cap" }} , 
 	{ "name": "packageBuffer1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "empty_n" }} , 
 	{ "name": "packageBuffer1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packageBuffer1", "role": "read" }} , 
 	{ "name": "validFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "dout" }} , 
 	{ "name": "validFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "validFifo", "role": "num_data_valid" }} , 
 	{ "name": "validFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "validFifo", "role": "fifo_cap" }} , 
 	{ "name": "validFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "empty_n" }} , 
 	{ "name": "validFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validFifo", "role": "read" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "din" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "full_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "dropper",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "packageBuffer1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "packageBuffer1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "d_isFirstWord", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "d_drop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	dropper {
		packageBuffer1 {Type I LastRead 0 FirstWrite -1}
		d_isFirstWord {Type IO LastRead -1 FirstWrite -1}
		d_drop {Type IO LastRead -1 FirstWrite -1}
		validFifo {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	packageBuffer1 { ap_fifo {  { packageBuffer1_dout fifo_port_we 0 128 }  { packageBuffer1_num_data_valid fifo_status_num_data_valid 0 7 }  { packageBuffer1_fifo_cap fifo_update 0 7 }  { packageBuffer1_empty_n fifo_status 0 1 }  { packageBuffer1_read fifo_data 1 1 } } }
	validFifo { ap_fifo {  { validFifo_dout fifo_port_we 0 1 }  { validFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { validFifo_fifo_cap fifo_update 0 4 }  { validFifo_empty_n fifo_status 0 1 }  { validFifo_read fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_din fifo_port_we 1 128 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_full_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_write fifo_data 1 1 } } }
}
