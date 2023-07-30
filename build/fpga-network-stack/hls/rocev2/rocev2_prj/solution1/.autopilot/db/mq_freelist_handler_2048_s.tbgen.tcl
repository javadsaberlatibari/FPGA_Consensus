set moduleName mq_freelist_handler_2048_s
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
set C_modelName {mq_freelist_handler<2048>}
set C_modelType { void 0 }
set C_modelArgList {
	{ mq_releaseFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_freeListFifo int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mq_releaseFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_freeListFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mq_releaseFifo_dout sc_in sc_lv 16 signal 0 } 
	{ mq_releaseFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ mq_releaseFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ mq_releaseFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ mq_releaseFifo_read sc_out sc_logic 1 signal 0 } 
	{ mq_freeListFifo_din sc_out sc_lv 16 signal 1 } 
	{ mq_freeListFifo_num_data_valid sc_in sc_lv 12 signal 1 } 
	{ mq_freeListFifo_fifo_cap sc_in sc_lv 12 signal 1 } 
	{ mq_freeListFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ mq_freeListFifo_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_releaseFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "dout" }} , 
 	{ "name": "mq_releaseFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_releaseFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_releaseFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "empty_n" }} , 
 	{ "name": "mq_releaseFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "read" }} , 
 	{ "name": "mq_freeListFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "din" }} , 
 	{ "name": "mq_freeListFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_freeListFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_freeListFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "full_n" }} , 
 	{ "name": "mq_freeListFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mq_freelist_handler_2048_s",
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
			{"Name" : "mq_releaseFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_releaseFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_freeListFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2048", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_freeListFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "freeListCounter_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	mq_freelist_handler_2048_s {
		mq_releaseFifo {Type I LastRead 0 FirstWrite -1}
		mq_freeListFifo {Type O LastRead 1 FirstWrite 1}
		freeListCounter_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mq_releaseFifo { ap_fifo {  { mq_releaseFifo_dout fifo_port_we 0 16 }  { mq_releaseFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_releaseFifo_fifo_cap fifo_update 0 2 }  { mq_releaseFifo_empty_n fifo_status 0 1 }  { mq_releaseFifo_read fifo_data 1 1 } } }
	mq_freeListFifo { ap_fifo {  { mq_freeListFifo_din fifo_port_we 1 16 }  { mq_freeListFifo_num_data_valid fifo_status_num_data_valid 0 12 }  { mq_freeListFifo_fifo_cap fifo_update 0 12 }  { mq_freeListFifo_full_n fifo_status 0 1 }  { mq_freeListFifo_write fifo_data 1 1 } } }
}
