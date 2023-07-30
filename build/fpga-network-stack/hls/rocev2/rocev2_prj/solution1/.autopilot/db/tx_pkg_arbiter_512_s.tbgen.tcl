set moduleName tx_pkg_arbiter_512_s
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
set C_modelName {tx_pkg_arbiter<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_tx_data int 1024 regular {axi_s 0 volatile  { s_axis_tx_data Data } }  }
	{ s_axis_mem_read_data int 1024 regular {axi_s 0 volatile  { s_axis_mem_read_data Data } }  }
	{ tx_pkgInfoFifo int 96 regular {fifo 0 volatile } {global 0}  }
	{ tx_split2aethShift int 1024 regular {fifo 1 volatile } {global 1}  }
	{ tx_rethMerge2rethShift int 1024 regular {fifo 1 volatile } {global 1}  }
	{ tx_rawPayFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_tx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_mem_read_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "tx_pkgInfoFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_split2aethShift", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethMerge2rethShift", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_mem_read_data_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_tx_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ tx_pkgInfoFifo_dout sc_in sc_lv 96 signal 2 } 
	{ tx_pkgInfoFifo_num_data_valid sc_in sc_lv 8 signal 2 } 
	{ tx_pkgInfoFifo_fifo_cap sc_in sc_lv 8 signal 2 } 
	{ tx_pkgInfoFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_pkgInfoFifo_read sc_out sc_logic 1 signal 2 } 
	{ tx_rawPayFifo_din sc_out sc_lv 1024 signal 5 } 
	{ tx_rawPayFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ tx_rawPayFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ tx_rawPayFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_rawPayFifo_write sc_out sc_logic 1 signal 5 } 
	{ tx_rethMerge2rethShift_din sc_out sc_lv 1024 signal 4 } 
	{ tx_rethMerge2rethShift_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ tx_rethMerge2rethShift_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ tx_rethMerge2rethShift_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_rethMerge2rethShift_write sc_out sc_logic 1 signal 4 } 
	{ tx_split2aethShift_din sc_out sc_lv 1024 signal 3 } 
	{ tx_split2aethShift_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ tx_split2aethShift_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ tx_split2aethShift_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_split2aethShift_write sc_out sc_logic 1 signal 3 } 
	{ s_axis_tx_data_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_tx_data_TREADY sc_out sc_logic 1 inacc 0 } 
	{ s_axis_mem_read_data_TDATA sc_in sc_lv 1024 signal 1 } 
	{ s_axis_mem_read_data_TREADY sc_out sc_logic 1 inacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_mem_read_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_tx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "tx_pkgInfoFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo", "role": "dout" }} , 
 	{ "name": "tx_pkgInfoFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_pkgInfoFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_pkgInfoFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo", "role": "empty_n" }} , 
 	{ "name": "tx_pkgInfoFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo", "role": "read" }} , 
 	{ "name": "tx_rawPayFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "din" }} , 
 	{ "name": "tx_rawPayFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_rawPayFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_rawPayFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "full_n" }} , 
 	{ "name": "tx_rawPayFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "write" }} , 
 	{ "name": "tx_rethMerge2rethShift_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShift", "role": "din" }} , 
 	{ "name": "tx_rethMerge2rethShift_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShift", "role": "num_data_valid" }} , 
 	{ "name": "tx_rethMerge2rethShift_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShift", "role": "fifo_cap" }} , 
 	{ "name": "tx_rethMerge2rethShift_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShift", "role": "full_n" }} , 
 	{ "name": "tx_rethMerge2rethShift_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShift", "role": "write" }} , 
 	{ "name": "tx_split2aethShift_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_split2aethShift", "role": "din" }} , 
 	{ "name": "tx_split2aethShift_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_split2aethShift", "role": "num_data_valid" }} , 
 	{ "name": "tx_split2aethShift_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_split2aethShift", "role": "fifo_cap" }} , 
 	{ "name": "tx_split2aethShift_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift", "role": "full_n" }} , 
 	{ "name": "tx_split2aethShift_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift", "role": "write" }} , 
 	{ "name": "s_axis_tx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_data", "role": "TREADY" }} , 
 	{ "name": "s_axis_mem_read_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_mem_read_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_mem_read_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_mem_read_data", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "tx_pkg_arbiter_512_s",
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
			{"Name" : "s_axis_tx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_mem_read_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_mem_read_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_type", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_words_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wordCounter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_pkgInfoFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_pkgInfoFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_split2aethShift", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_split2aethShift_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethMerge2rethShift", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethMerge2rethShift_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_tx_data_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_mem_read_data_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	tx_pkg_arbiter_512_s {
		s_axis_tx_data {Type I LastRead 0 FirstWrite -1}
		s_axis_mem_read_data {Type I LastRead 0 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		info_type {Type IO LastRead -1 FirstWrite -1}
		info_words_V {Type IO LastRead -1 FirstWrite -1}
		wordCounter_V {Type IO LastRead -1 FirstWrite -1}
		tx_pkgInfoFifo {Type I LastRead 0 FirstWrite -1}
		tx_split2aethShift {Type O LastRead -1 FirstWrite 1}
		tx_rethMerge2rethShift {Type O LastRead -1 FirstWrite 1}
		tx_rawPayFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_tx_data { axis {  { s_axis_tx_data_TVALID in_vld 0 1 }  { s_axis_tx_data_TDATA in_data 0 1024 }  { s_axis_tx_data_TREADY in_acc 1 1 } } }
	s_axis_mem_read_data { axis {  { s_axis_mem_read_data_TVALID in_vld 0 1 }  { s_axis_mem_read_data_TDATA in_data 0 1024 }  { s_axis_mem_read_data_TREADY in_acc 1 1 } } }
	tx_pkgInfoFifo { ap_fifo {  { tx_pkgInfoFifo_dout fifo_port_we 0 96 }  { tx_pkgInfoFifo_num_data_valid fifo_status_num_data_valid 0 8 }  { tx_pkgInfoFifo_fifo_cap fifo_update 0 8 }  { tx_pkgInfoFifo_empty_n fifo_status 0 1 }  { tx_pkgInfoFifo_read fifo_data 1 1 } } }
	tx_split2aethShift { ap_fifo {  { tx_split2aethShift_din fifo_port_we 1 1024 }  { tx_split2aethShift_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_split2aethShift_fifo_cap fifo_update 0 3 }  { tx_split2aethShift_full_n fifo_status 0 1 }  { tx_split2aethShift_write fifo_data 1 1 } } }
	tx_rethMerge2rethShift { ap_fifo {  { tx_rethMerge2rethShift_din fifo_port_we 1 1024 }  { tx_rethMerge2rethShift_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_rethMerge2rethShift_fifo_cap fifo_update 0 3 }  { tx_rethMerge2rethShift_full_n fifo_status 0 1 }  { tx_rethMerge2rethShift_write fifo_data 1 1 } } }
	tx_rawPayFifo { ap_fifo {  { tx_rawPayFifo_din fifo_port_we 1 1024 }  { tx_rawPayFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_rawPayFifo_fifo_cap fifo_update 0 3 }  { tx_rawPayFifo_full_n fifo_status 0 1 }  { tx_rawPayFifo_write fifo_data 1 1 } } }
}
