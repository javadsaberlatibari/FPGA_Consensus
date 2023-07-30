set moduleName event_engine
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {event_engine}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxEng2eventEng_setEvent int 224 regular {fifo 0 volatile } {global 0}  }
	{ eventEng2ackDelay_event int 224 regular {fifo 1 volatile } {global 1}  }
	{ timer2eventEng_setEvent int 128 regular {fifo 0 volatile } {global 0}  }
	{ txApp2eventEng_setEvent int 128 regular {fifo 0 volatile } {global 0}  }
	{ ackDelayFifoReadCount int 1 regular {fifo 0 volatile } {global 0}  }
	{ ackDelayFifoWriteCount int 1 regular {fifo 0 volatile } {global 0}  }
	{ txEngFifoReadCount int 1 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxEng2eventEng_setEvent", "interface" : "fifo", "bitwidth" : 224, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "eventEng2ackDelay_event", "interface" : "fifo", "bitwidth" : 224, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "timer2eventEng_setEvent", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txApp2eventEng_setEvent", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ackDelayFifoReadCount", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ackDelayFifoWriteCount", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txEngFifoReadCount", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rxEng2eventEng_setEvent_dout sc_in sc_lv 224 signal 0 } 
	{ rxEng2eventEng_setEvent_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ rxEng2eventEng_setEvent_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ rxEng2eventEng_setEvent_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxEng2eventEng_setEvent_read sc_out sc_logic 1 signal 0 } 
	{ eventEng2ackDelay_event_din sc_out sc_lv 224 signal 1 } 
	{ eventEng2ackDelay_event_num_data_valid sc_in sc_lv 7 signal 1 } 
	{ eventEng2ackDelay_event_fifo_cap sc_in sc_lv 7 signal 1 } 
	{ eventEng2ackDelay_event_full_n sc_in sc_logic 1 signal 1 } 
	{ eventEng2ackDelay_event_write sc_out sc_logic 1 signal 1 } 
	{ timer2eventEng_setEvent_dout sc_in sc_lv 128 signal 2 } 
	{ timer2eventEng_setEvent_num_data_valid sc_in sc_lv 7 signal 2 } 
	{ timer2eventEng_setEvent_fifo_cap sc_in sc_lv 7 signal 2 } 
	{ timer2eventEng_setEvent_empty_n sc_in sc_logic 1 signal 2 } 
	{ timer2eventEng_setEvent_read sc_out sc_logic 1 signal 2 } 
	{ txApp2eventEng_setEvent_dout sc_in sc_lv 128 signal 3 } 
	{ txApp2eventEng_setEvent_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ txApp2eventEng_setEvent_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ txApp2eventEng_setEvent_empty_n sc_in sc_logic 1 signal 3 } 
	{ txApp2eventEng_setEvent_read sc_out sc_logic 1 signal 3 } 
	{ ackDelayFifoReadCount_dout sc_in sc_lv 1 signal 4 } 
	{ ackDelayFifoReadCount_num_data_valid sc_in sc_lv 7 signal 4 } 
	{ ackDelayFifoReadCount_fifo_cap sc_in sc_lv 7 signal 4 } 
	{ ackDelayFifoReadCount_empty_n sc_in sc_logic 1 signal 4 } 
	{ ackDelayFifoReadCount_read sc_out sc_logic 1 signal 4 } 
	{ ackDelayFifoWriteCount_dout sc_in sc_lv 1 signal 5 } 
	{ ackDelayFifoWriteCount_num_data_valid sc_in sc_lv 7 signal 5 } 
	{ ackDelayFifoWriteCount_fifo_cap sc_in sc_lv 7 signal 5 } 
	{ ackDelayFifoWriteCount_empty_n sc_in sc_logic 1 signal 5 } 
	{ ackDelayFifoWriteCount_read sc_out sc_logic 1 signal 5 } 
	{ txEngFifoReadCount_dout sc_in sc_lv 1 signal 6 } 
	{ txEngFifoReadCount_num_data_valid sc_in sc_lv 7 signal 6 } 
	{ txEngFifoReadCount_fifo_cap sc_in sc_lv 7 signal 6 } 
	{ txEngFifoReadCount_empty_n sc_in sc_logic 1 signal 6 } 
	{ txEngFifoReadCount_read sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxEng2eventEng_setEvent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":224, "type": "signal", "bundle":{"name": "rxEng2eventEng_setEvent", "role": "dout" }} , 
 	{ "name": "rxEng2eventEng_setEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "rxEng2eventEng_setEvent", "role": "num_data_valid" }} , 
 	{ "name": "rxEng2eventEng_setEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "rxEng2eventEng_setEvent", "role": "fifo_cap" }} , 
 	{ "name": "rxEng2eventEng_setEvent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng2eventEng_setEvent", "role": "empty_n" }} , 
 	{ "name": "rxEng2eventEng_setEvent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng2eventEng_setEvent", "role": "read" }} , 
 	{ "name": "eventEng2ackDelay_event_din", "direction": "out", "datatype": "sc_lv", "bitwidth":224, "type": "signal", "bundle":{"name": "eventEng2ackDelay_event", "role": "din" }} , 
 	{ "name": "eventEng2ackDelay_event_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "eventEng2ackDelay_event", "role": "num_data_valid" }} , 
 	{ "name": "eventEng2ackDelay_event_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "eventEng2ackDelay_event", "role": "fifo_cap" }} , 
 	{ "name": "eventEng2ackDelay_event_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventEng2ackDelay_event", "role": "full_n" }} , 
 	{ "name": "eventEng2ackDelay_event_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventEng2ackDelay_event", "role": "write" }} , 
 	{ "name": "timer2eventEng_setEvent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "timer2eventEng_setEvent", "role": "dout" }} , 
 	{ "name": "timer2eventEng_setEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "timer2eventEng_setEvent", "role": "num_data_valid" }} , 
 	{ "name": "timer2eventEng_setEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "timer2eventEng_setEvent", "role": "fifo_cap" }} , 
 	{ "name": "timer2eventEng_setEvent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "timer2eventEng_setEvent", "role": "empty_n" }} , 
 	{ "name": "timer2eventEng_setEvent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "timer2eventEng_setEvent", "role": "read" }} , 
 	{ "name": "txApp2eventEng_setEvent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "dout" }} , 
 	{ "name": "txApp2eventEng_setEvent_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "num_data_valid" }} , 
 	{ "name": "txApp2eventEng_setEvent_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "fifo_cap" }} , 
 	{ "name": "txApp2eventEng_setEvent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "empty_n" }} , 
 	{ "name": "txApp2eventEng_setEvent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txApp2eventEng_setEvent", "role": "read" }} , 
 	{ "name": "ackDelayFifoReadCount_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoReadCount", "role": "dout" }} , 
 	{ "name": "ackDelayFifoReadCount_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ackDelayFifoReadCount", "role": "num_data_valid" }} , 
 	{ "name": "ackDelayFifoReadCount_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ackDelayFifoReadCount", "role": "fifo_cap" }} , 
 	{ "name": "ackDelayFifoReadCount_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoReadCount", "role": "empty_n" }} , 
 	{ "name": "ackDelayFifoReadCount_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoReadCount", "role": "read" }} , 
 	{ "name": "ackDelayFifoWriteCount_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoWriteCount", "role": "dout" }} , 
 	{ "name": "ackDelayFifoWriteCount_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ackDelayFifoWriteCount", "role": "num_data_valid" }} , 
 	{ "name": "ackDelayFifoWriteCount_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ackDelayFifoWriteCount", "role": "fifo_cap" }} , 
 	{ "name": "ackDelayFifoWriteCount_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoWriteCount", "role": "empty_n" }} , 
 	{ "name": "ackDelayFifoWriteCount_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ackDelayFifoWriteCount", "role": "read" }} , 
 	{ "name": "txEngFifoReadCount_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "dout" }} , 
 	{ "name": "txEngFifoReadCount_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "num_data_valid" }} , 
 	{ "name": "txEngFifoReadCount_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "fifo_cap" }} , 
 	{ "name": "txEngFifoReadCount_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "empty_n" }} , 
 	{ "name": "txEngFifoReadCount_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEngFifoReadCount", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "event_engine",
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
			{"Name" : "rxEng2eventEng_setEvent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "512", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxEng2eventEng_setEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ee_writeCounter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ee_adReadCounter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ee_adWriteCounter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ee_txEngReadCounter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eventEng2ackDelay_event", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "eventEng2ackDelay_event_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "timer2eventEng_setEvent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "timer2eventEng_setEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txApp2eventEng_setEvent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txApp2eventEng_setEvent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackDelayFifoReadCount", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ackDelayFifoReadCount_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackDelayFifoWriteCount", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ackDelayFifoWriteCount_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEngFifoReadCount", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEngFifoReadCount_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	event_engine {
		rxEng2eventEng_setEvent {Type I LastRead 0 FirstWrite -1}
		ee_writeCounter {Type IO LastRead -1 FirstWrite -1}
		ee_adReadCounter {Type IO LastRead -1 FirstWrite -1}
		ee_adWriteCounter {Type IO LastRead -1 FirstWrite -1}
		ee_txEngReadCounter {Type IO LastRead -1 FirstWrite -1}
		eventEng2ackDelay_event {Type O LastRead 0 FirstWrite 0}
		timer2eventEng_setEvent {Type I LastRead 0 FirstWrite -1}
		txApp2eventEng_setEvent {Type I LastRead 0 FirstWrite -1}
		ackDelayFifoReadCount {Type I LastRead 0 FirstWrite -1}
		ackDelayFifoWriteCount {Type I LastRead 0 FirstWrite -1}
		txEngFifoReadCount {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	rxEng2eventEng_setEvent { ap_fifo {  { rxEng2eventEng_setEvent_dout fifo_port_we 0 224 }  { rxEng2eventEng_setEvent_num_data_valid fifo_status_num_data_valid 0 10 }  { rxEng2eventEng_setEvent_fifo_cap fifo_update 0 10 }  { rxEng2eventEng_setEvent_empty_n fifo_status 0 1 }  { rxEng2eventEng_setEvent_read fifo_data 1 1 } } }
	eventEng2ackDelay_event { ap_fifo {  { eventEng2ackDelay_event_din fifo_port_we 1 224 }  { eventEng2ackDelay_event_num_data_valid fifo_status_num_data_valid 0 7 }  { eventEng2ackDelay_event_fifo_cap fifo_update 0 7 }  { eventEng2ackDelay_event_full_n fifo_status 0 1 }  { eventEng2ackDelay_event_write fifo_data 1 1 } } }
	timer2eventEng_setEvent { ap_fifo {  { timer2eventEng_setEvent_dout fifo_port_we 0 128 }  { timer2eventEng_setEvent_num_data_valid fifo_status_num_data_valid 0 7 }  { timer2eventEng_setEvent_fifo_cap fifo_update 0 7 }  { timer2eventEng_setEvent_empty_n fifo_status 0 1 }  { timer2eventEng_setEvent_read fifo_data 1 1 } } }
	txApp2eventEng_setEvent { ap_fifo {  { txApp2eventEng_setEvent_dout fifo_port_we 0 128 }  { txApp2eventEng_setEvent_num_data_valid fifo_status_num_data_valid 0 7 }  { txApp2eventEng_setEvent_fifo_cap fifo_update 0 7 }  { txApp2eventEng_setEvent_empty_n fifo_status 0 1 }  { txApp2eventEng_setEvent_read fifo_data 1 1 } } }
	ackDelayFifoReadCount { ap_fifo {  { ackDelayFifoReadCount_dout fifo_port_we 0 1 }  { ackDelayFifoReadCount_num_data_valid fifo_status_num_data_valid 0 7 }  { ackDelayFifoReadCount_fifo_cap fifo_update 0 7 }  { ackDelayFifoReadCount_empty_n fifo_status 0 1 }  { ackDelayFifoReadCount_read fifo_data 1 1 } } }
	ackDelayFifoWriteCount { ap_fifo {  { ackDelayFifoWriteCount_dout fifo_port_we 0 1 }  { ackDelayFifoWriteCount_num_data_valid fifo_status_num_data_valid 0 7 }  { ackDelayFifoWriteCount_fifo_cap fifo_update 0 7 }  { ackDelayFifoWriteCount_empty_n fifo_status 0 1 }  { ackDelayFifoWriteCount_read fifo_data 1 1 } } }
	txEngFifoReadCount { ap_fifo {  { txEngFifoReadCount_dout fifo_port_we 0 1 }  { txEngFifoReadCount_num_data_valid fifo_status_num_data_valid 0 7 }  { txEngFifoReadCount_fifo_cap fifo_update 0 7 }  { txEngFifoReadCount_empty_n fifo_status 0 1 }  { txEngFifoReadCount_read fifo_data 1 1 } } }
}
