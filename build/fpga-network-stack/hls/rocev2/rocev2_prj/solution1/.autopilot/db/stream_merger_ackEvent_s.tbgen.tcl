set moduleName stream_merger_ackEvent_s
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
set C_modelName {stream_merger<ackEvent>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_exhEventMetaFifo int 96 regular {fifo 0 volatile } {global 0}  }
	{ rx_ackEventFifo int 96 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhEventFifo int 96 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_exhEventMetaFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ackEventFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhEventFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} ]}
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
	{ rx_exhEventMetaFifo_dout sc_in sc_lv 96 signal 0 } 
	{ rx_exhEventMetaFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rx_exhEventMetaFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rx_exhEventMetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_exhEventMetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_ibhEventFifo_dout sc_in sc_lv 96 signal 2 } 
	{ rx_ibhEventFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rx_ibhEventFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rx_ibhEventFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_ibhEventFifo_read sc_out sc_logic 1 signal 2 } 
	{ rx_ackEventFifo_din sc_out sc_lv 96 signal 1 } 
	{ rx_ackEventFifo_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ rx_ackEventFifo_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ rx_ackEventFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ rx_ackEventFifo_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exhEventMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "dout" }} , 
 	{ "name": "rx_exhEventMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exhEventMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exhEventMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_exhEventMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo", "role": "read" }} , 
 	{ "name": "rx_ibhEventFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "dout" }} , 
 	{ "name": "rx_ibhEventFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhEventFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhEventFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibhEventFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "read" }} , 
 	{ "name": "rx_ackEventFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "din" }} , 
 	{ "name": "rx_ackEventFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ackEventFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ackEventFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "full_n" }} , 
 	{ "name": "rx_ackEventFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "stream_merger_ackEvent_s",
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
			{"Name" : "rx_exhEventMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhEventMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ackEventFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ackEventFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhEventFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhEventFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	stream_merger_ackEvent_s {
		rx_exhEventMetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_ackEventFifo {Type O LastRead -1 FirstWrite 2}
		rx_ibhEventFifo {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_exhEventMetaFifo { ap_fifo {  { rx_exhEventMetaFifo_dout fifo_port_we 0 96 }  { rx_exhEventMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_exhEventMetaFifo_fifo_cap fifo_update 0 2 }  { rx_exhEventMetaFifo_empty_n fifo_status 0 1 }  { rx_exhEventMetaFifo_read fifo_data 1 1 } } }
	rx_ackEventFifo { ap_fifo {  { rx_ackEventFifo_din fifo_port_we 1 96 }  { rx_ackEventFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_ackEventFifo_fifo_cap fifo_update 0 3 }  { rx_ackEventFifo_full_n fifo_status 0 1 }  { rx_ackEventFifo_write fifo_data 1 1 } } }
	rx_ibhEventFifo { ap_fifo {  { rx_ibhEventFifo_dout fifo_port_we 0 96 }  { rx_ibhEventFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhEventFifo_fifo_cap fifo_update 0 2 }  { rx_ibhEventFifo_empty_n fifo_status 0 1 }  { rx_ibhEventFifo_read fifo_data 1 1 } } }
}
