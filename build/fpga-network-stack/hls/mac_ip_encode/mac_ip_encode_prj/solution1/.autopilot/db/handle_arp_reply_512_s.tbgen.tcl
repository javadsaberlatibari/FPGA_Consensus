set moduleName handle_arp_reply_512_s
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
set C_modelName {handle_arp_reply<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_arp_lookup_reply int 128 regular {axi_s 0 volatile  { s_axis_arp_lookup_reply Data } }  }
	{ myMacAddress int 48 regular {ap_stable 0} }
	{ dataStreamBuffer2 int 1024 regular {fifo 0 volatile } {global 0}  }
	{ headerFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ dataStreamBuffer3 int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_arp_lookup_reply", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "myMacAddress", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "dataStreamBuffer2", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "headerFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dataStreamBuffer3", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ dataStreamBuffer2_dout sc_in sc_lv 1024 signal 2 } 
	{ dataStreamBuffer2_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ dataStreamBuffer2_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ dataStreamBuffer2_empty_n sc_in sc_logic 1 signal 2 } 
	{ dataStreamBuffer2_read sc_out sc_logic 1 signal 2 } 
	{ s_axis_arp_lookup_reply_TVALID sc_in sc_logic 1 invld 0 } 
	{ dataStreamBuffer3_din sc_out sc_lv 1024 signal 4 } 
	{ dataStreamBuffer3_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ dataStreamBuffer3_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ dataStreamBuffer3_full_n sc_in sc_logic 1 signal 4 } 
	{ dataStreamBuffer3_write sc_out sc_logic 1 signal 4 } 
	{ headerFifo_din sc_out sc_lv 256 signal 3 } 
	{ headerFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ headerFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ headerFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ headerFifo_write sc_out sc_logic 1 signal 3 } 
	{ s_axis_arp_lookup_reply_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_axis_arp_lookup_reply_TREADY sc_out sc_logic 1 inacc 0 } 
	{ myMacAddress sc_in sc_lv 48 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "dataStreamBuffer2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "dataStreamBuffer2", "role": "dout" }} , 
 	{ "name": "dataStreamBuffer2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer2", "role": "num_data_valid" }} , 
 	{ "name": "dataStreamBuffer2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer2", "role": "fifo_cap" }} , 
 	{ "name": "dataStreamBuffer2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer2", "role": "empty_n" }} , 
 	{ "name": "dataStreamBuffer2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer2", "role": "read" }} , 
 	{ "name": "s_axis_arp_lookup_reply_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_arp_lookup_reply", "role": "TVALID" }} , 
 	{ "name": "dataStreamBuffer3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "dataStreamBuffer3", "role": "din" }} , 
 	{ "name": "dataStreamBuffer3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer3", "role": "num_data_valid" }} , 
 	{ "name": "dataStreamBuffer3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "dataStreamBuffer3", "role": "fifo_cap" }} , 
 	{ "name": "dataStreamBuffer3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer3", "role": "full_n" }} , 
 	{ "name": "dataStreamBuffer3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dataStreamBuffer3", "role": "write" }} , 
 	{ "name": "headerFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "headerFifo", "role": "din" }} , 
 	{ "name": "headerFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "headerFifo", "role": "num_data_valid" }} , 
 	{ "name": "headerFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "headerFifo", "role": "fifo_cap" }} , 
 	{ "name": "headerFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "headerFifo", "role": "full_n" }} , 
 	{ "name": "headerFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "headerFifo", "role": "write" }} , 
 	{ "name": "s_axis_arp_lookup_reply_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis_arp_lookup_reply", "role": "TDATA" }} , 
 	{ "name": "s_axis_arp_lookup_reply_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_arp_lookup_reply", "role": "TREADY" }} , 
 	{ "name": "myMacAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddress", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "handle_arp_reply_512_s",
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
			{"Name" : "s_axis_arp_lookup_reply", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_arp_lookup_reply_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "har_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dataStreamBuffer2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dataStreamBuffer2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "headerFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "headerFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dataStreamBuffer3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dataStreamBuffer3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_arp_lookup_reply_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	handle_arp_reply_512_s {
		s_axis_arp_lookup_reply {Type I LastRead 0 FirstWrite -1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		har_state {Type IO LastRead -1 FirstWrite -1}
		dataStreamBuffer2 {Type I LastRead 0 FirstWrite -1}
		headerFifo {Type O LastRead -1 FirstWrite 1}
		dataStreamBuffer3 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_arp_lookup_reply { axis {  { s_axis_arp_lookup_reply_TVALID in_vld 0 1 }  { s_axis_arp_lookup_reply_TDATA in_data 0 128 }  { s_axis_arp_lookup_reply_TREADY in_acc 1 1 } } }
	myMacAddress { ap_stable {  { myMacAddress in_data 0 48 } } }
	dataStreamBuffer2 { ap_fifo {  { dataStreamBuffer2_dout fifo_port_we 0 1024 }  { dataStreamBuffer2_num_data_valid fifo_status_num_data_valid 0 2 }  { dataStreamBuffer2_fifo_cap fifo_update 0 2 }  { dataStreamBuffer2_empty_n fifo_status 0 1 }  { dataStreamBuffer2_read fifo_data 1 1 } } }
	headerFifo { ap_fifo {  { headerFifo_din fifo_port_we 1 256 }  { headerFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { headerFifo_fifo_cap fifo_update 0 2 }  { headerFifo_full_n fifo_status 0 1 }  { headerFifo_write fifo_data 1 1 } } }
	dataStreamBuffer3 { ap_fifo {  { dataStreamBuffer3_din fifo_port_we 1 1024 }  { dataStreamBuffer3_num_data_valid fifo_status_num_data_valid 0 2 }  { dataStreamBuffer3_fifo_cap fifo_update 0 2 }  { dataStreamBuffer3_full_n fifo_status 0 1 }  { dataStreamBuffer3_write fifo_data 1 1 } } }
}
