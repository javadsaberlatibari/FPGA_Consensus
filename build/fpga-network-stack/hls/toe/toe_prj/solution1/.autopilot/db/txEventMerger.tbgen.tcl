set moduleName txEventMerger
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
set C_modelName {txEventMerger}
set C_modelType { void 0 }
set C_modelArgList {
	{ txApp2eventEng_mergeEvent int 128 regular {fifo 0 volatile } {global 0}  }
	{ txApp2eventEng_setEvent int 128 regular {fifo 1 volatile } {global 1}  }
	{ txAppStream2event_mergeEvent int 128 regular {fifo 0 volatile } {global 0}  }
	{ txApp_txEventCache int 128 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "txApp2eventEng_mergeEvent", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txApp2eventEng_setEvent", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txAppStream2event_mergeEvent", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txApp_txEventCache", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ txApp2eventEng_mergeEvent_dout sc_in sc_lv 128 signal 0 } 
	{ txApp2eventEng_mergeEvent_num_data_valid sc_in sc_lv 7 signal 0 } 
	{ txApp2eventEng_mergeEvent_fifo_cap sc_in sc_lv 7 signal 0 } 
	{ txApp2eventEng_mergeEvent_empty_n sc_in sc_logic 1 signal 0 } 
	{ txApp2eventEng_mergeEvent_read sc_out sc_logic 1 signal 0 } 
	{ txAppStream2event_mergeEvent_dout sc_in sc_lv 128 signal 2 } 
	{ txAppStream2event_mergeEvent_num_data_valid sc_in sc_lv 7 signal 2 } 
	{ txAppStream2event_mergeEvent_fifo_cap sc_in sc_lv 7 signal 2 } 
	{ txAppStream2event_mergeEvent_empty_n sc_in sc_logic 1 signal 2 } 
	{ txAppStream2event_mergeEvent_read sc_out sc_logic 1 signal 2 } 
	{ txApp2eventEng_setEvent_din sc_out sc_lv 128 signal 1 } 
	{ txApp2eventEng_setEvent_num_data_valid sc_in sc_lv 7 signal 1 } 
	{ txApp2eventEng_setEvent_fifo_cap sc_in sc_lv 7 signal 1 } 
	{ txApp2eventEng_setEvent_full_n sc_in sc_logic 1 signal 1 } 
	{ txApp2eventEng_setEvent_write sc_out sc_logic 1 signal 1 } 
	{ txApp_txEventCache_din sc_out sc_lv 128 signal 3 } 
	{ txApp_txEventCache_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ txApp_txEventCache_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ txApp_txEventCache_full_n sc_in sc_logic 1 signal 3 } 
	{ txApp_txEventCache_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "txApp2eventEng_mergeEvent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txApp2eventEng_mergeEvent", "role": "dout" }} , 
 	{ "name": "txApp2eventEng_mergeEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_mergeEvent", "role": "num_data_valid" }} , 
 	{ "name": "txApp2eventEng_mergeEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_mergeEvent", "role": "fifo_cap" }} , 
 	{ "name": "txApp2eventEng_mergeEvent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_mergeEvent", "role": "empty_n" }} , 
 	{ "name": "txApp2eventEng_mergeEvent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_mergeEvent", "role": "read" }} , 
 	{ "name": "txAppStream2event_mergeEvent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txAppStream2event_mergeEvent", "role": "dout" }} , 
 	{ "name": "txAppStream2event_mergeEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txAppStream2event_mergeEvent", "role": "num_data_valid" }} , 
 	{ "name": "txAppStream2event_mergeEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txAppStream2event_mergeEvent", "role": "fifo_cap" }} , 
 	{ "name": "txAppStream2event_mergeEvent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txAppStream2event_mergeEvent", "role": "empty_n" }} , 
 	{ "name": "txAppStream2event_mergeEvent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txAppStream2event_mergeEvent", "role": "read" }} , 
 	{ "name": "txApp2eventEng_setEvent_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "din" }} , 
 	{ "name": "txApp2eventEng_setEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "num_data_valid" }} , 
 	{ "name": "txApp2eventEng_setEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "fifo_cap" }} , 
 	{ "name": "txApp2eventEng_setEvent_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "full_n" }} , 
 	{ "name": "txApp2eventEng_setEvent_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "write" }} , 
 	{ "name": "txApp_txEventCache_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "din" }} , 
 	{ "name": "txApp_txEventCache_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "num_data_valid" }} , 
 	{ "name": "txApp_txEventCache_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "fifo_cap" }} , 
 	{ "name": "txApp_txEventCache_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "full_n" }} , 
 	{ "name": "txApp_txEventCache_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp_txEventCache", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "txEventMerger",
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
			{"Name" : "txApp2eventEng_mergeEvent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp2eventEng_mergeEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txApp2eventEng_setEvent", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp2eventEng_setEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txAppStream2event_mergeEvent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txAppStream2event_mergeEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txApp_txEventCache", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp_txEventCache_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	txEventMerger {
		txApp2eventEng_mergeEvent {Type I LastRead 0 FirstWrite -1}
		txApp2eventEng_setEvent {Type O LastRead -1 FirstWrite 2}
		txAppStream2event_mergeEvent {Type I LastRead 1 FirstWrite -1}
		txApp_txEventCache {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	txApp2eventEng_mergeEvent { ap_fifo {  { txApp2eventEng_mergeEvent_dout fifo_port_we 0 128 }  { txApp2eventEng_mergeEvent_num_data_valid fifo_status_num_data_valid 0 7 }  { txApp2eventEng_mergeEvent_fifo_cap fifo_update 0 7 }  { txApp2eventEng_mergeEvent_empty_n fifo_status 0 1 }  { txApp2eventEng_mergeEvent_read fifo_data 1 1 } } }
	txApp2eventEng_setEvent { ap_fifo {  { txApp2eventEng_setEvent_din fifo_port_we 1 128 }  { txApp2eventEng_setEvent_num_data_valid fifo_status_num_data_valid 0 7 }  { txApp2eventEng_setEvent_fifo_cap fifo_update 0 7 }  { txApp2eventEng_setEvent_full_n fifo_status 0 1 }  { txApp2eventEng_setEvent_write fifo_data 1 1 } } }
	txAppStream2event_mergeEvent { ap_fifo {  { txAppStream2event_mergeEvent_dout fifo_port_we 0 128 }  { txAppStream2event_mergeEvent_num_data_valid fifo_status_num_data_valid 0 7 }  { txAppStream2event_mergeEvent_fifo_cap fifo_update 0 7 }  { txAppStream2event_mergeEvent_empty_n fifo_status 0 1 }  { txAppStream2event_mergeEvent_read fifo_data 1 1 } } }
	txApp_txEventCache { ap_fifo {  { txApp_txEventCache_din fifo_port_we 1 128 }  { txApp_txEventCache_num_data_valid fifo_status_num_data_valid 0 7 }  { txApp_txEventCache_fifo_cap fifo_update 0 7 }  { txApp_txEventCache_full_n fifo_status 0 1 }  { txApp_txEventCache_write fifo_data 1 1 } } }
}
