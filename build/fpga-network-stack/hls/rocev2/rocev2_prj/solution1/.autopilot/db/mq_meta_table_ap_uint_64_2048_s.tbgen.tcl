set moduleName mq_meta_table_ap_uint_64_2048_s
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
set C_modelName {mq_meta_table<ap_uint<64>, 2048>}
set C_modelType { void 0 }
set C_modelArgList {
	{ mq_metaReqFifo int 256 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaRspFifo int 128 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mq_metaReqFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ mq_metaReqFifo_dout sc_in sc_lv 256 signal 0 } 
	{ mq_metaReqFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ mq_metaReqFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ mq_metaReqFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ mq_metaReqFifo_read sc_out sc_logic 1 signal 0 } 
	{ mq_metaRspFifo_din sc_out sc_lv 128 signal 1 } 
	{ mq_metaRspFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ mq_metaRspFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ mq_metaRspFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ mq_metaRspFifo_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_metaReqFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_metaReqFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_metaReqFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "din" }} , 
 	{ "name": "mq_metaRspFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_metaRspFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_metaRspFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "full_n" }} , 
 	{ "name": "mq_metaRspFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "mq_meta_table_ap_uint_64_2048_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mq_metaReqFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_table_value_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_next_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_isTail", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mq_metaRspFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_value_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_next_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_valid_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_isTail_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mq_meta_table_ap_uint_64_2048_s {
		mq_metaReqFifo {Type I LastRead 0 FirstWrite -1}
		meta_table_value_V {Type IO LastRead -1 FirstWrite -1}
		meta_table_next_V {Type IO LastRead -1 FirstWrite -1}
		meta_table_valid {Type IO LastRead -1 FirstWrite -1}
		meta_table_isTail {Type IO LastRead -1 FirstWrite -1}
		mq_metaRspFifo {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mq_metaReqFifo { ap_fifo {  { mq_metaReqFifo_dout fifo_port_we 0 256 }  { mq_metaReqFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_metaReqFifo_fifo_cap fifo_update 0 2 }  { mq_metaReqFifo_empty_n fifo_status 0 1 }  { mq_metaReqFifo_read fifo_data 1 1 } } }
	mq_metaRspFifo { ap_fifo {  { mq_metaRspFifo_din fifo_port_we 1 128 }  { mq_metaRspFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_metaRspFifo_fifo_cap fifo_update 0 2 }  { mq_metaRspFifo_full_n fifo_status 0 1 }  { mq_metaRspFifo_write fifo_data 1 1 } } }
}
