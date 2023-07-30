set moduleName mq_pointer_table_500_s
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
set C_modelName {mq_pointer_table<500>}
set C_modelType { void 0 }
set C_modelArgList {
	{ mq_pointerUpdFifo int 64 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerReqFifo int 32 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo int 48 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mq_pointerUpdFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ mq_pointerUpdFifo_dout sc_in sc_lv 64 signal 0 } 
	{ mq_pointerUpdFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ mq_pointerUpdFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ mq_pointerUpdFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ mq_pointerUpdFifo_read sc_out sc_logic 1 signal 0 } 
	{ mq_pointerReqFifo_dout sc_in sc_lv 32 signal 1 } 
	{ mq_pointerReqFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ mq_pointerReqFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ mq_pointerReqFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ mq_pointerReqFifo_read sc_out sc_logic 1 signal 1 } 
	{ mq_pointerRspFifo_din sc_out sc_lv 48 signal 2 } 
	{ mq_pointerRspFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ mq_pointerRspFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ mq_pointerRspFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ mq_pointerRspFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_pointerUpdFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "dout" }} , 
 	{ "name": "mq_pointerUpdFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerUpdFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerUpdFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "empty_n" }} , 
 	{ "name": "mq_pointerUpdFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "read" }} , 
 	{ "name": "mq_pointerReqFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "dout" }} , 
 	{ "name": "mq_pointerReqFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerReqFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerReqFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "empty_n" }} , 
 	{ "name": "mq_pointerReqFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "read" }} , 
 	{ "name": "mq_pointerRspFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "din" }} , 
 	{ "name": "mq_pointerRspFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerRspFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerRspFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "full_n" }} , 
 	{ "name": "mq_pointerRspFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "mq_pointer_table_500_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mq_pointerUpdFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_lockedKey_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_isLocked", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptr_table_head_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ptr_table_tail_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ptr_table_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mq_pointerReqFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_wait", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_request_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_pointerRspFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_head_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_tail_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_valid_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mq_pointer_table_500_s {
		mq_pointerUpdFifo {Type I LastRead 0 FirstWrite -1}
		mq_lockedKey_V {Type IO LastRead -1 FirstWrite -1}
		mq_isLocked {Type IO LastRead -1 FirstWrite -1}
		ptr_table_head_V {Type IO LastRead -1 FirstWrite -1}
		ptr_table_tail_V {Type IO LastRead -1 FirstWrite -1}
		ptr_table_valid {Type IO LastRead -1 FirstWrite -1}
		mq_pointerReqFifo {Type I LastRead 1 FirstWrite -1}
		mq_wait {Type IO LastRead -1 FirstWrite -1}
		mq_request_key_V {Type IO LastRead -1 FirstWrite -1}
		mq_pointerRspFifo {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mq_pointerUpdFifo { ap_fifo {  { mq_pointerUpdFifo_dout fifo_port_we 0 64 }  { mq_pointerUpdFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerUpdFifo_fifo_cap fifo_update 0 2 }  { mq_pointerUpdFifo_empty_n fifo_status 0 1 }  { mq_pointerUpdFifo_read fifo_data 1 1 } } }
	mq_pointerReqFifo { ap_fifo {  { mq_pointerReqFifo_dout fifo_port_we 0 32 }  { mq_pointerReqFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerReqFifo_fifo_cap fifo_update 0 2 }  { mq_pointerReqFifo_empty_n fifo_status 0 1 }  { mq_pointerReqFifo_read fifo_data 1 1 } } }
	mq_pointerRspFifo { ap_fifo {  { mq_pointerRspFifo_din fifo_port_we 1 48 }  { mq_pointerRspFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerRspFifo_fifo_cap fifo_update 0 2 }  { mq_pointerRspFifo_full_n fifo_status 0 1 }  { mq_pointerRspFifo_write fifo_data 1 1 } } }
}
