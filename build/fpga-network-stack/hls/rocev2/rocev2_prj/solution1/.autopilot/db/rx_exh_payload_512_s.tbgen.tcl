set moduleName rx_exh_payload_512_s
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
set C_modelName {rx_exh_payload<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_pkgSplitTypeFifo int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDrop2exhFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2rethShiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_exh2aethShiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_exhNoShiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_pkgSplitTypeFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDrop2exhFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2rethShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2aethShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhNoShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_pkgSplitTypeFifo_dout sc_in sc_lv 64 signal 0 } 
	{ rx_pkgSplitTypeFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rx_pkgSplitTypeFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rx_pkgSplitTypeFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_pkgSplitTypeFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_ibhDrop2exhFifo_dout sc_in sc_lv 1024 signal 1 } 
	{ rx_ibhDrop2exhFifo_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ rx_ibhDrop2exhFifo_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ rx_ibhDrop2exhFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_ibhDrop2exhFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_exh2aethShiftFifo_din sc_out sc_lv 1024 signal 3 } 
	{ rx_exh2aethShiftFifo_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ rx_exh2aethShiftFifo_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ rx_exh2aethShiftFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_exh2aethShiftFifo_write sc_out sc_logic 1 signal 3 } 
	{ rx_exh2rethShiftFifo_din sc_out sc_lv 1024 signal 2 } 
	{ rx_exh2rethShiftFifo_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ rx_exh2rethShiftFifo_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ rx_exh2rethShiftFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_exh2rethShiftFifo_write sc_out sc_logic 1 signal 2 } 
	{ rx_exhNoShiftFifo_din sc_out sc_lv 1024 signal 4 } 
	{ rx_exhNoShiftFifo_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ rx_exhNoShiftFifo_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ rx_exhNoShiftFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_exhNoShiftFifo_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "dout" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "empty_n" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo", "role": "read" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "dout" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "read" }} , 
 	{ "name": "rx_exh2aethShiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exh2aethShiftFifo", "role": "din" }} , 
 	{ "name": "rx_exh2aethShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2aethShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2aethShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2aethShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2aethShiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2aethShiftFifo", "role": "full_n" }} , 
 	{ "name": "rx_exh2aethShiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2aethShiftFifo", "role": "write" }} , 
 	{ "name": "rx_exh2rethShiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "din" }} , 
 	{ "name": "rx_exh2rethShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2rethShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2rethShiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "full_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "write" }} , 
 	{ "name": "rx_exhNoShiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exhNoShiftFifo", "role": "din" }} , 
 	{ "name": "rx_exhNoShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exhNoShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exhNoShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exhNoShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exhNoShiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhNoShiftFifo", "role": "full_n" }} , 
 	{ "name": "rx_exhNoShiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhNoShiftFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "rx_exh_payload_512_s",
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
			{"Name" : "rep_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_route", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_pkgSplitTypeFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_pkgSplitTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_op_code", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibhDrop2exhFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDrop2exhFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2rethShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2aethShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2aethShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exhNoShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhNoShiftFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	rx_exh_payload_512_s {
		rep_state {Type IO LastRead -1 FirstWrite -1}
		meta_route {Type IO LastRead -1 FirstWrite -1}
		rx_pkgSplitTypeFifo {Type I LastRead 0 FirstWrite -1}
		meta_op_code {Type IO LastRead -1 FirstWrite -1}
		rx_ibhDrop2exhFifo {Type I LastRead 0 FirstWrite -1}
		rx_exh2rethShiftFifo {Type O LastRead -1 FirstWrite 1}
		rx_exh2aethShiftFifo {Type O LastRead -1 FirstWrite 1}
		rx_exhNoShiftFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_pkgSplitTypeFifo { ap_fifo {  { rx_pkgSplitTypeFifo_dout fifo_port_we 0 64 }  { rx_pkgSplitTypeFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_pkgSplitTypeFifo_fifo_cap fifo_update 0 2 }  { rx_pkgSplitTypeFifo_empty_n fifo_status 0 1 }  { rx_pkgSplitTypeFifo_read fifo_data 1 1 } } }
	rx_ibhDrop2exhFifo { ap_fifo {  { rx_ibhDrop2exhFifo_dout fifo_port_we 0 1024 }  { rx_ibhDrop2exhFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { rx_ibhDrop2exhFifo_fifo_cap fifo_update 0 6 }  { rx_ibhDrop2exhFifo_empty_n fifo_status 0 1 }  { rx_ibhDrop2exhFifo_read fifo_data 1 1 } } }
	rx_exh2rethShiftFifo { ap_fifo {  { rx_exh2rethShiftFifo_din fifo_port_we 1 1024 }  { rx_exh2rethShiftFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_exh2rethShiftFifo_fifo_cap fifo_update 0 3 }  { rx_exh2rethShiftFifo_full_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_write fifo_data 1 1 } } }
	rx_exh2aethShiftFifo { ap_fifo {  { rx_exh2aethShiftFifo_din fifo_port_we 1 1024 }  { rx_exh2aethShiftFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_exh2aethShiftFifo_fifo_cap fifo_update 0 3 }  { rx_exh2aethShiftFifo_full_n fifo_status 0 1 }  { rx_exh2aethShiftFifo_write fifo_data 1 1 } } }
	rx_exhNoShiftFifo { ap_fifo {  { rx_exhNoShiftFifo_din fifo_port_we 1 1024 }  { rx_exhNoShiftFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_exhNoShiftFifo_fifo_cap fifo_update 0 3 }  { rx_exhNoShiftFifo_full_n fifo_status 0 1 }  { rx_exhNoShiftFifo_write fifo_data 1 1 } } }
}
