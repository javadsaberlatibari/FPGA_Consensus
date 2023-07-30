set moduleName process_arp_pkg_512_s
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
set C_modelName {process_arp_pkg<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis int 1024 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ myIpAddress int 32 regular {ap_stable 0} }
	{ regRequestCount int 16 regular {pointer 1}  }
	{ regReplyCount int 16 regular {pointer 1}  }
	{ arpReplyMetaFifo int 192 regular {fifo 1 volatile } {global 1}  }
	{ arpTableInsertFifo int 192 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "myIpAddress", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "regRequestCount", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "regReplyCount", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arpReplyMetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "arpTableInsertFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ arpTableInsertFifo_din sc_out sc_lv 192 signal 5 } 
	{ arpTableInsertFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ arpTableInsertFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ arpTableInsertFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ arpTableInsertFifo_write sc_out sc_logic 1 signal 5 } 
	{ arpReplyMetaFifo_din sc_out sc_lv 192 signal 4 } 
	{ arpReplyMetaFifo_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ arpReplyMetaFifo_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ arpReplyMetaFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ arpReplyMetaFifo_write sc_out sc_logic 1 signal 4 } 
	{ s_axis_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 0 } 
	{ myIpAddress sc_in sc_lv 32 signal 1 } 
	{ regRequestCount sc_out sc_lv 16 signal 2 } 
	{ regRequestCount_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ regReplyCount sc_out sc_lv 16 signal 3 } 
	{ regReplyCount_ap_vld sc_out sc_logic 1 outvld 3 } 
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
 	{ "name": "arpTableInsertFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "din" }} , 
 	{ "name": "arpTableInsertFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "num_data_valid" }} , 
 	{ "name": "arpTableInsertFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "fifo_cap" }} , 
 	{ "name": "arpTableInsertFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "full_n" }} , 
 	{ "name": "arpTableInsertFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "write" }} , 
 	{ "name": "arpReplyMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "arpReplyMetaFifo", "role": "din" }} , 
 	{ "name": "arpReplyMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpReplyMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "arpReplyMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpReplyMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "arpReplyMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpReplyMetaFifo", "role": "full_n" }} , 
 	{ "name": "arpReplyMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpReplyMetaFifo", "role": "write" }} , 
 	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis", "role": "TDATA" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis", "role": "TREADY" }} , 
 	{ "name": "myIpAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIpAddress", "role": "default" }} , 
 	{ "name": "regRequestCount", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regRequestCount", "role": "default" }} , 
 	{ "name": "regRequestCount_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regRequestCount", "role": "ap_vld" }} , 
 	{ "name": "regReplyCount", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regReplyCount", "role": "default" }} , 
 	{ "name": "regReplyCount_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regReplyCount", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "process_arp_pkg_512_s",
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
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "regRequestCount", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "regReplyCount", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arpReplyMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpReplyMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pag_requestCounter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arpTableInsertFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpTableInsertFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pag_replyCounter_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	process_arp_pkg_512_s {
		s_axis {Type I LastRead 0 FirstWrite -1}
		myIpAddress {Type I LastRead 0 FirstWrite -1}
		regRequestCount {Type O LastRead -1 FirstWrite 2}
		regReplyCount {Type O LastRead -1 FirstWrite 2}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		arpReplyMetaFifo {Type O LastRead -1 FirstWrite 2}
		pag_requestCounter_V {Type IO LastRead -1 FirstWrite -1}
		arpTableInsertFifo {Type O LastRead -1 FirstWrite 2}
		pag_replyCounter_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis { axis {  { s_axis_TVALID in_vld 0 1 }  { s_axis_TDATA in_data 0 1024 }  { s_axis_TREADY in_acc 1 1 } } }
	myIpAddress { ap_stable {  { myIpAddress in_data 0 32 } } }
	regRequestCount { ap_vld {  { regRequestCount out_data 1 16 }  { regRequestCount_ap_vld out_vld 1 1 } } }
	regReplyCount { ap_vld {  { regReplyCount out_data 1 16 }  { regReplyCount_ap_vld out_vld 1 1 } } }
	arpReplyMetaFifo { ap_fifo {  { arpReplyMetaFifo_din fifo_port_we 1 192 }  { arpReplyMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { arpReplyMetaFifo_fifo_cap fifo_update 0 3 }  { arpReplyMetaFifo_full_n fifo_status 0 1 }  { arpReplyMetaFifo_write fifo_data 1 1 } } }
	arpTableInsertFifo { ap_fifo {  { arpTableInsertFifo_din fifo_port_we 1 192 }  { arpTableInsertFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { arpTableInsertFifo_fifo_cap fifo_update 0 3 }  { arpTableInsertFifo_full_n fifo_status 0 1 }  { arpTableInsertFifo_write fifo_data 1 1 } } }
}
