set moduleName read_req_table
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
set C_modelName {read_req_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_readReqTable_upd int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqTable_upd_req int 96 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_readReqTable_upd", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} ]}
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
	{ tx_readReqTable_upd_dout sc_in sc_lv 64 signal 0 } 
	{ tx_readReqTable_upd_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ tx_readReqTable_upd_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ tx_readReqTable_upd_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_readReqTable_upd_read sc_out sc_logic 1 signal 0 } 
	{ rx_readReqTable_upd_req_dout sc_in sc_lv 96 signal 1 } 
	{ rx_readReqTable_upd_req_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ rx_readReqTable_upd_req_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ rx_readReqTable_upd_req_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_readReqTable_upd_req_read sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_readReqTable_upd_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "dout" }} , 
 	{ "name": "tx_readReqTable_upd_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "num_data_valid" }} , 
 	{ "name": "tx_readReqTable_upd_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "fifo_cap" }} , 
 	{ "name": "tx_readReqTable_upd_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "empty_n" }} , 
 	{ "name": "tx_readReqTable_upd_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "read" }} , 
 	{ "name": "rx_readReqTable_upd_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "dout" }} , 
 	{ "name": "rx_readReqTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqTable_upd_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "empty_n" }} , 
 	{ "name": "rx_readReqTable_upd_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_req", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "read_req_table",
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
			{"Name" : "tx_readReqTable_upd", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqTable_upd_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqTable_upd_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqTable_upd_req_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	read_req_table {
		tx_readReqTable_upd {Type I LastRead 0 FirstWrite -1}
		rx_readReqTable_upd_req {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_readReqTable_upd { ap_fifo {  { tx_readReqTable_upd_dout fifo_port_we 0 64 }  { tx_readReqTable_upd_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_readReqTable_upd_fifo_cap fifo_update 0 2 }  { tx_readReqTable_upd_empty_n fifo_status 0 1 }  { tx_readReqTable_upd_read fifo_data 1 1 } } }
	rx_readReqTable_upd_req { ap_fifo {  { rx_readReqTable_upd_req_dout fifo_port_we 0 96 }  { rx_readReqTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqTable_upd_req_fifo_cap fifo_update 0 2 }  { rx_readReqTable_upd_req_empty_n fifo_status 0 1 }  { rx_readReqTable_upd_req_read fifo_data 1 1 } } }
}
