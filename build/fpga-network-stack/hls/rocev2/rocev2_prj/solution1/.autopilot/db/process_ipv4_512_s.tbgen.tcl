set moduleName process_ipv4_512_s
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
set C_modelName {process_ipv4<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_crc2ipFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_process2dropFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_process2dropLengthFifo int 4 regular {fifo 1 volatile } {global 1}  }
	{ rx_ip2udpMetaFifo int 64 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_crc2ipFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropLengthFifo", "interface" : "fifo", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_crc2ipFifo_dout sc_in sc_lv 1024 signal 0 } 
	{ rx_crc2ipFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rx_crc2ipFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rx_crc2ipFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_crc2ipFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_process2dropFifo_din sc_out sc_lv 1024 signal 1 } 
	{ rx_process2dropFifo_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ rx_process2dropFifo_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ rx_process2dropFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ rx_process2dropFifo_write sc_out sc_logic 1 signal 1 } 
	{ rx_process2dropLengthFifo_din sc_out sc_lv 4 signal 2 } 
	{ rx_process2dropLengthFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rx_process2dropLengthFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rx_process2dropLengthFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_process2dropLengthFifo_write sc_out sc_logic 1 signal 2 } 
	{ rx_ip2udpMetaFifo_din sc_out sc_lv 64 signal 3 } 
	{ rx_ip2udpMetaFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rx_ip2udpMetaFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rx_ip2udpMetaFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_ip2udpMetaFifo_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_crc2ipFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_crc2ipFifo", "role": "dout" }} , 
 	{ "name": "rx_crc2ipFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_crc2ipFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_crc2ipFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_crc2ipFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_crc2ipFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo", "role": "empty_n" }} , 
 	{ "name": "rx_crc2ipFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo", "role": "read" }} , 
 	{ "name": "rx_process2dropFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "din" }} , 
 	{ "name": "rx_process2dropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_process2dropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_process2dropFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "full_n" }} , 
 	{ "name": "rx_process2dropFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo", "role": "write" }} , 
 	{ "name": "rx_process2dropLengthFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "din" }} , 
 	{ "name": "rx_process2dropLengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_process2dropLengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_process2dropLengthFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "full_n" }} , 
 	{ "name": "rx_process2dropLengthFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengthFifo", "role": "write" }} , 
 	{ "name": "rx_ip2udpMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo", "role": "din" }} , 
 	{ "name": "rx_ip2udpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ip2udpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ip2udpMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_ip2udpMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "process_ipv4_512_s",
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
			{"Name" : "rx_crc2ipFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_crc2ipFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropLengthFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropLengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	process_ipv4_512_s {
		rx_crc2ipFifo {Type I LastRead 0 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropFifo {Type O LastRead -1 FirstWrite 1}
		metaWritten_3 {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropLengthFifo {Type O LastRead -1 FirstWrite 1}
		rx_ip2udpMetaFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_crc2ipFifo { ap_fifo {  { rx_crc2ipFifo_dout fifo_port_we 0 1024 }  { rx_crc2ipFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_crc2ipFifo_fifo_cap fifo_update 0 2 }  { rx_crc2ipFifo_empty_n fifo_status 0 1 }  { rx_crc2ipFifo_read fifo_data 1 1 } } }
	rx_process2dropFifo { ap_fifo {  { rx_process2dropFifo_din fifo_port_we 1 1024 }  { rx_process2dropFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_process2dropFifo_fifo_cap fifo_update 0 4 }  { rx_process2dropFifo_full_n fifo_status 0 1 }  { rx_process2dropFifo_write fifo_data 1 1 } } }
	rx_process2dropLengthFifo { ap_fifo {  { rx_process2dropLengthFifo_din fifo_port_we 1 4 }  { rx_process2dropLengthFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_process2dropLengthFifo_fifo_cap fifo_update 0 2 }  { rx_process2dropLengthFifo_full_n fifo_status 0 1 }  { rx_process2dropLengthFifo_write fifo_data 1 1 } } }
	rx_ip2udpMetaFifo { ap_fifo {  { rx_ip2udpMetaFifo_din fifo_port_we 1 64 }  { rx_ip2udpMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ip2udpMetaFifo_fifo_cap fifo_update 0 2 }  { rx_ip2udpMetaFifo_full_n fifo_status 0 1 }  { rx_ip2udpMetaFifo_write fifo_data 1 1 } } }
}
