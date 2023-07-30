set moduleName rshiftWordByOctet_routed_net_axis_512_1_512_12_s
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
set C_modelName {rshiftWordByOctet<routed_net_axis<512, 1>, 512, 12>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_exh2rethShiftFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_rethSift2mergerFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_exh2rethShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_rethSift2mergerFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rx_exh2rethShiftFifo_dout sc_in sc_lv 1024 signal 0 } 
	{ rx_exh2rethShiftFifo_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ rx_exh2rethShiftFifo_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ rx_exh2rethShiftFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_exh2rethShiftFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_rethSift2mergerFifo_din sc_out sc_lv 1024 signal 1 } 
	{ rx_rethSift2mergerFifo_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ rx_rethSift2mergerFifo_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ rx_rethSift2mergerFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ rx_rethSift2mergerFifo_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exh2rethShiftFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "dout" }} , 
 	{ "name": "rx_exh2rethShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2rethShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2rethShiftFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "empty_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo", "role": "read" }} , 
 	{ "name": "rx_rethSift2mergerFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFifo", "role": "din" }} , 
 	{ "name": "rx_rethSift2mergerFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_rethSift2mergerFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_rethSift2mergerFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFifo", "role": "full_n" }} , 
 	{ "name": "rx_rethSift2mergerFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "rshiftWordByOctet_routed_net_axis_512_1_512_12_s",
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
			{"Name" : "fsmState_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exh2rethShiftFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_rethSift2mergerFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_rethSift2mergerFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	rshiftWordByOctet_routed_net_axis_512_1_512_12_s {
		fsmState_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_8 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_5 {Type IO LastRead -1 FirstWrite -1}
		rx_exh2rethShiftFifo {Type I LastRead 0 FirstWrite -1}
		rs_firstWord_1 {Type IO LastRead -1 FirstWrite -1}
		rx_rethSift2mergerFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_exh2rethShiftFifo { ap_fifo {  { rx_exh2rethShiftFifo_dout fifo_port_we 0 1024 }  { rx_exh2rethShiftFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_exh2rethShiftFifo_fifo_cap fifo_update 0 3 }  { rx_exh2rethShiftFifo_empty_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_read fifo_data 1 1 } } }
	rx_rethSift2mergerFifo { ap_fifo {  { rx_rethSift2mergerFifo_din fifo_port_we 1 1024 }  { rx_rethSift2mergerFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_rethSift2mergerFifo_fifo_cap fifo_update 0 3 }  { rx_rethSift2mergerFifo_full_n fifo_status 0 1 }  { rx_rethSift2mergerFifo_write fifo_data 1 1 } } }
}
