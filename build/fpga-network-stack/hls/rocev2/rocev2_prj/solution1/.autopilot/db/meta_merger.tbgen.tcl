set moduleName meta_merger
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
set C_modelName {meta_merger}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ackEventFifo int 96 regular {fifo 0 volatile } {global 0}  }
	{ tx_ibhconnTable_req int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo int 192 regular {fifo 1 volatile } {global 1}  }
	{ tx_exhMetaFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ rx_readEvenFifo int 256 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo int 256 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ackEventFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhconnTable_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exhMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readEvenFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ackEventFifo_dout sc_in sc_lv 96 signal 0 } 
	{ rx_ackEventFifo_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ rx_ackEventFifo_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ rx_ackEventFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ackEventFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_readEvenFifo_dout sc_in sc_lv 256 signal 4 } 
	{ rx_readEvenFifo_num_data_valid sc_in sc_lv 10 signal 4 } 
	{ rx_readEvenFifo_fifo_cap sc_in sc_lv 10 signal 4 } 
	{ rx_readEvenFifo_empty_n sc_in sc_logic 1 signal 4 } 
	{ rx_readEvenFifo_read sc_out sc_logic 1 signal 4 } 
	{ tx_appMetaFifo_dout sc_in sc_lv 256 signal 5 } 
	{ tx_appMetaFifo_num_data_valid sc_in sc_lv 6 signal 5 } 
	{ tx_appMetaFifo_fifo_cap sc_in sc_lv 6 signal 5 } 
	{ tx_appMetaFifo_empty_n sc_in sc_logic 1 signal 5 } 
	{ tx_appMetaFifo_read sc_out sc_logic 1 signal 5 } 
	{ tx_ibhconnTable_req_din sc_out sc_lv 16 signal 1 } 
	{ tx_ibhconnTable_req_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ tx_ibhconnTable_req_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ tx_ibhconnTable_req_full_n sc_in sc_logic 1 signal 1 } 
	{ tx_ibhconnTable_req_write sc_out sc_logic 1 signal 1 } 
	{ tx_ibhMetaFifo_din sc_out sc_lv 192 signal 2 } 
	{ tx_ibhMetaFifo_num_data_valid sc_in sc_lv 4 signal 2 } 
	{ tx_ibhMetaFifo_fifo_cap sc_in sc_lv 4 signal 2 } 
	{ tx_ibhMetaFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ibhMetaFifo_write sc_out sc_logic 1 signal 2 } 
	{ tx_exhMetaFifo_din sc_out sc_lv 256 signal 3 } 
	{ tx_exhMetaFifo_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ tx_exhMetaFifo_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ tx_exhMetaFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_exhMetaFifo_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ackEventFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "dout" }} , 
 	{ "name": "rx_ackEventFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ackEventFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ackEventFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ackEventFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo", "role": "read" }} , 
 	{ "name": "rx_readEvenFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "rx_readEvenFifo", "role": "dout" }} , 
 	{ "name": "rx_readEvenFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "rx_readEvenFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_readEvenFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "rx_readEvenFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_readEvenFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo", "role": "empty_n" }} , 
 	{ "name": "rx_readEvenFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_appMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_appMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "read" }} , 
 	{ "name": "tx_ibhconnTable_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "din" }} , 
 	{ "name": "tx_ibhconnTable_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "num_data_valid" }} , 
 	{ "name": "tx_ibhconnTable_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "fifo_cap" }} , 
 	{ "name": "tx_ibhconnTable_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "full_n" }} , 
 	{ "name": "tx_ibhconnTable_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ibhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ibhMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo", "role": "write" }} , 
 	{ "name": "tx_exhMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "din" }} , 
 	{ "name": "tx_exhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_exhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_exhMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_exhMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "meta_merger",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rx_ackEventFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ackEventFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhconnTable_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhconnTable_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exhMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readEvenFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "512", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readEvenFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33ns_35ns_66_2_1_U115", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	meta_merger {
		rx_ackEventFifo {Type I LastRead 0 FirstWrite -1}
		tx_ibhconnTable_req {Type O LastRead -1 FirstWrite 5}
		tx_ibhMetaFifo {Type O LastRead -1 FirstWrite 5}
		tx_exhMetaFifo {Type O LastRead -1 FirstWrite 5}
		rx_readEvenFifo {Type I LastRead 1 FirstWrite -1}
		tx_appMetaFifo {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ackEventFifo { ap_fifo {  { rx_ackEventFifo_dout fifo_port_we 0 96 }  { rx_ackEventFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { rx_ackEventFifo_fifo_cap fifo_update 0 3 }  { rx_ackEventFifo_empty_n fifo_status 0 1 }  { rx_ackEventFifo_read fifo_data 1 1 } } }
	tx_ibhconnTable_req { ap_fifo {  { tx_ibhconnTable_req_din fifo_port_we 1 16 }  { tx_ibhconnTable_req_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ibhconnTable_req_fifo_cap fifo_update 0 2 }  { tx_ibhconnTable_req_full_n fifo_status 0 1 }  { tx_ibhconnTable_req_write fifo_data 1 1 } } }
	tx_ibhMetaFifo { ap_fifo {  { tx_ibhMetaFifo_din fifo_port_we 1 192 }  { tx_ibhMetaFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { tx_ibhMetaFifo_fifo_cap fifo_update 0 4 }  { tx_ibhMetaFifo_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_write fifo_data 1 1 } } }
	tx_exhMetaFifo { ap_fifo {  { tx_exhMetaFifo_din fifo_port_we 1 256 }  { tx_exhMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_exhMetaFifo_fifo_cap fifo_update 0 3 }  { tx_exhMetaFifo_full_n fifo_status 0 1 }  { tx_exhMetaFifo_write fifo_data 1 1 } } }
	rx_readEvenFifo { ap_fifo {  { rx_readEvenFifo_dout fifo_port_we 0 256 }  { rx_readEvenFifo_num_data_valid fifo_status_num_data_valid 0 10 }  { rx_readEvenFifo_fifo_cap fifo_update 0 10 }  { rx_readEvenFifo_empty_n fifo_status 0 1 }  { rx_readEvenFifo_read fifo_data 1 1 } } }
	tx_appMetaFifo { ap_fifo {  { tx_appMetaFifo_dout fifo_port_we 0 256 }  { tx_appMetaFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { tx_appMetaFifo_fifo_cap fifo_update 0 6 }  { tx_appMetaFifo_empty_n fifo_status 0 1 }  { tx_appMetaFifo_read fifo_data 1 1 } } }
}
