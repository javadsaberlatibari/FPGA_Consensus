set moduleName insert_checksum_512_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {insert_checksum<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ txEng_tcpChecksumFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ txEng_tcpPkgBuffer4 int 1024 regular {fifo 0 volatile } {global 0}  }
	{ txEng_tcpPkgBuffer5 int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "txEng_tcpChecksumFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txEng_tcpPkgBuffer4", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txEng_tcpPkgBuffer5", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ txEng_tcpChecksumFifo_dout sc_in sc_lv 16 signal 0 } 
	{ txEng_tcpChecksumFifo_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ txEng_tcpChecksumFifo_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ txEng_tcpChecksumFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ txEng_tcpChecksumFifo_read sc_out sc_logic 1 signal 0 } 
	{ txEng_tcpPkgBuffer4_dout sc_in sc_lv 1024 signal 1 } 
	{ txEng_tcpPkgBuffer4_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ txEng_tcpPkgBuffer4_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ txEng_tcpPkgBuffer4_empty_n sc_in sc_logic 1 signal 1 } 
	{ txEng_tcpPkgBuffer4_read sc_out sc_logic 1 signal 1 } 
	{ txEng_tcpPkgBuffer5_din sc_out sc_lv 1024 signal 2 } 
	{ txEng_tcpPkgBuffer5_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ txEng_tcpPkgBuffer5_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ txEng_tcpPkgBuffer5_full_n sc_in sc_logic 1 signal 2 } 
	{ txEng_tcpPkgBuffer5_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "txEng_tcpChecksumFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txEng_tcpChecksumFifo", "role": "dout" }} , 
 	{ "name": "txEng_tcpChecksumFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng_tcpChecksumFifo", "role": "num_data_valid" }} , 
 	{ "name": "txEng_tcpChecksumFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "txEng_tcpChecksumFifo", "role": "fifo_cap" }} , 
 	{ "name": "txEng_tcpChecksumFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpChecksumFifo", "role": "empty_n" }} , 
 	{ "name": "txEng_tcpChecksumFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpChecksumFifo", "role": "read" }} , 
 	{ "name": "txEng_tcpPkgBuffer4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer4", "role": "dout" }} , 
 	{ "name": "txEng_tcpPkgBuffer4_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer4", "role": "num_data_valid" }} , 
 	{ "name": "txEng_tcpPkgBuffer4_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer4", "role": "fifo_cap" }} , 
 	{ "name": "txEng_tcpPkgBuffer4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer4", "role": "empty_n" }} , 
 	{ "name": "txEng_tcpPkgBuffer4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer4", "role": "read" }} , 
 	{ "name": "txEng_tcpPkgBuffer5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer5", "role": "din" }} , 
 	{ "name": "txEng_tcpPkgBuffer5_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer5", "role": "num_data_valid" }} , 
 	{ "name": "txEng_tcpPkgBuffer5_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer5", "role": "fifo_cap" }} , 
 	{ "name": "txEng_tcpPkgBuffer5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer5", "role": "full_n" }} , 
 	{ "name": "txEng_tcpPkgBuffer5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txEng_tcpPkgBuffer5", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "insert_checksum_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txEng_tcpChecksumFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_tcpChecksumFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_tcpPkgBuffer4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_tcpPkgBuffer4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txEng_tcpPkgBuffer5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txEng_tcpPkgBuffer5_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	insert_checksum_512_s {
		state_V {Type IO LastRead -1 FirstWrite -1}
		txEng_tcpChecksumFifo {Type I LastRead 1 FirstWrite -1}
		txEng_tcpPkgBuffer4 {Type I LastRead 1 FirstWrite -1}
		txEng_tcpPkgBuffer5 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	txEng_tcpChecksumFifo { ap_fifo {  { txEng_tcpChecksumFifo_dout fifo_port_we 0 16 }  { txEng_tcpChecksumFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { txEng_tcpChecksumFifo_fifo_cap fifo_update 0 3 }  { txEng_tcpChecksumFifo_empty_n fifo_status 0 1 }  { txEng_tcpChecksumFifo_read fifo_data 1 1 } } }
	txEng_tcpPkgBuffer4 { ap_fifo {  { txEng_tcpPkgBuffer4_dout fifo_port_we 0 1024 }  { txEng_tcpPkgBuffer4_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng_tcpPkgBuffer4_fifo_cap fifo_update 0 2 }  { txEng_tcpPkgBuffer4_empty_n fifo_status 0 1 }  { txEng_tcpPkgBuffer4_read fifo_data 1 1 } } }
	txEng_tcpPkgBuffer5 { ap_fifo {  { txEng_tcpPkgBuffer5_din fifo_port_we 1 1024 }  { txEng_tcpPkgBuffer5_num_data_valid fifo_status_num_data_valid 0 2 }  { txEng_tcpPkgBuffer5_fifo_cap fifo_update 0 2 }  { txEng_tcpPkgBuffer5_full_n fifo_status 0 1 }  { txEng_tcpPkgBuffer5_write fifo_data 1 1 } } }
}
