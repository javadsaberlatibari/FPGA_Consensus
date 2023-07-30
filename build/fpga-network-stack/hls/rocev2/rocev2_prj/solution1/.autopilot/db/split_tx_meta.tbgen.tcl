set moduleName split_tx_meta
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
set C_modelName {split_tx_meta}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_ipUdpMetaFifo int 256 regular {fifo 0 volatile } {global 0}  }
	{ tx_udp2ipMetaFifo int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_udpMetaFifo int 64 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_ipUdpMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ tx_ipUdpMetaFifo_dout sc_in sc_lv 256 signal 0 } 
	{ tx_ipUdpMetaFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ tx_ipUdpMetaFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ tx_ipUdpMetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_ipUdpMetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ tx_udp2ipMetaFifo_din sc_out sc_lv 64 signal 1 } 
	{ tx_udp2ipMetaFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ tx_udp2ipMetaFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ tx_udp2ipMetaFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ tx_udp2ipMetaFifo_write sc_out sc_logic 1 signal 1 } 
	{ tx_udpMetaFifo_din sc_out sc_lv 64 signal 2 } 
	{ tx_udpMetaFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_udpMetaFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_udpMetaFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_udpMetaFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_ipUdpMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "dout" }} , 
 	{ "name": "tx_ipUdpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ipUdpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ipUdpMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "empty_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "read" }} , 
 	{ "name": "tx_udp2ipMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "din" }} , 
 	{ "name": "tx_udp2ipMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_udp2ipMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_udp2ipMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "write" }} , 
 	{ "name": "tx_udpMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_udpMetaFifo", "role": "din" }} , 
 	{ "name": "tx_udpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_udpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_udpMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_udpMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "split_tx_meta",
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
			{"Name" : "tx_ipUdpMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	split_tx_meta {
		tx_ipUdpMetaFifo {Type I LastRead 0 FirstWrite -1}
		tx_udp2ipMetaFifo {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_ipUdpMetaFifo { ap_fifo {  { tx_ipUdpMetaFifo_dout fifo_port_we 0 256 }  { tx_ipUdpMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ipUdpMetaFifo_fifo_cap fifo_update 0 2 }  { tx_ipUdpMetaFifo_empty_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_read fifo_data 1 1 } } }
	tx_udp2ipMetaFifo { ap_fifo {  { tx_udp2ipMetaFifo_din fifo_port_we 1 64 }  { tx_udp2ipMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_udp2ipMetaFifo_fifo_cap fifo_update 0 2 }  { tx_udp2ipMetaFifo_full_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_write fifo_data 1 1 } } }
	tx_udpMetaFifo { ap_fifo {  { tx_udpMetaFifo_din fifo_port_we 1 64 }  { tx_udpMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_udpMetaFifo_fifo_cap fifo_update 0 2 }  { tx_udpMetaFifo_full_n fifo_status 0 1 }  { tx_udpMetaFifo_write fifo_data 1 1 } } }
}
