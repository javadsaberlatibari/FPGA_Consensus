set moduleName drop_ooo_ibh_512_s
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
set C_modelName {drop_ooo_ibh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ibhDropFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDrop2exhFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ibhDropFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDrop2exhFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rx_exh2dropFifo_dout sc_in sc_lv 1024 signal 1 } 
	{ rx_exh2dropFifo_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ rx_exh2dropFifo_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ rx_exh2dropFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_exh2dropFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_ibhDropFifo_dout sc_in sc_lv 1 signal 0 } 
	{ rx_ibhDropFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rx_ibhDropFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rx_ibhDropFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ibhDropFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_ibhDrop2exhFifo_din sc_out sc_lv 1024 signal 2 } 
	{ rx_ibhDrop2exhFifo_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ rx_ibhDrop2exhFifo_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ rx_ibhDrop2exhFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_ibhDrop2exhFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exh2dropFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "dout" }} , 
 	{ "name": "rx_exh2dropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2dropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2dropFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "empty_n" }} , 
 	{ "name": "rx_exh2dropFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "read" }} , 
 	{ "name": "rx_ibhDropFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "dout" }} , 
 	{ "name": "rx_ibhDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDropFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibhDropFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "read" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "din" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "full_n" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "drop_ooo_ibh_512_s",
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
			{"Name" : "state_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibhDropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDrop2exhFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDrop2exhFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	drop_ooo_ibh_512_s {
		state_5 {Type IO LastRead -1 FirstWrite -1}
		rx_ibhDropFifo {Type I LastRead 0 FirstWrite -1}
		rx_exh2dropFifo {Type I LastRead 0 FirstWrite -1}
		rx_ibhDrop2exhFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ibhDropFifo { ap_fifo {  { rx_ibhDropFifo_dout fifo_port_we 0 1 }  { rx_ibhDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhDropFifo_fifo_cap fifo_update 0 2 }  { rx_ibhDropFifo_empty_n fifo_status 0 1 }  { rx_ibhDropFifo_read fifo_data 1 1 } } }
	rx_exh2dropFifo { ap_fifo {  { rx_exh2dropFifo_dout fifo_port_we 0 1024 }  { rx_exh2dropFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { rx_exh2dropFifo_fifo_cap fifo_update 0 6 }  { rx_exh2dropFifo_empty_n fifo_status 0 1 }  { rx_exh2dropFifo_read fifo_data 1 1 } } }
	rx_ibhDrop2exhFifo { ap_fifo {  { rx_ibhDrop2exhFifo_din fifo_port_we 1 1024 }  { rx_ibhDrop2exhFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { rx_ibhDrop2exhFifo_fifo_cap fifo_update 0 6 }  { rx_ibhDrop2exhFifo_full_n fifo_status 0 1 }  { rx_ibhDrop2exhFifo_write fifo_data 1 1 } } }
}
