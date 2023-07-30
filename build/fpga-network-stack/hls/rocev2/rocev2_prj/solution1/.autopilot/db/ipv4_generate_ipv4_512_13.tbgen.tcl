set moduleName ipv4_generate_ipv4_512_13
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
set C_modelName {ipv4_generate_ipv4<512>13}
set C_modelType { void 0 }
set C_modelArgList {
	{ local_ip_address int 128 regular {fifo 0}  }
	{ tx_udp2ipMetaFifo int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_ip2crcFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ tx_shift2ipv4Fifo int 1024 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "local_ip_address", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tx_udp2ipMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ip2crcFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2ipv4Fifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} ]}
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
	{ local_ip_address_dout sc_in sc_lv 128 signal 0 } 
	{ local_ip_address_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ local_ip_address_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ local_ip_address_empty_n sc_in sc_logic 1 signal 0 } 
	{ local_ip_address_read sc_out sc_logic 1 signal 0 } 
	{ tx_shift2ipv4Fifo_dout sc_in sc_lv 1024 signal 3 } 
	{ tx_shift2ipv4Fifo_num_data_valid sc_in sc_lv 4 signal 3 } 
	{ tx_shift2ipv4Fifo_fifo_cap sc_in sc_lv 4 signal 3 } 
	{ tx_shift2ipv4Fifo_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_shift2ipv4Fifo_read sc_out sc_logic 1 signal 3 } 
	{ tx_udp2ipMetaFifo_dout sc_in sc_lv 64 signal 1 } 
	{ tx_udp2ipMetaFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ tx_udp2ipMetaFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ tx_udp2ipMetaFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_udp2ipMetaFifo_read sc_out sc_logic 1 signal 1 } 
	{ tx_ip2crcFifo_din sc_out sc_lv 1024 signal 2 } 
	{ tx_ip2crcFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_ip2crcFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_ip2crcFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ip2crcFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "local_ip_address_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "local_ip_address", "role": "dout" }} , 
 	{ "name": "local_ip_address_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_ip_address", "role": "num_data_valid" }} , 
 	{ "name": "local_ip_address_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_ip_address", "role": "fifo_cap" }} , 
 	{ "name": "local_ip_address_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_ip_address", "role": "empty_n" }} , 
 	{ "name": "local_ip_address_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_ip_address", "role": "read" }} , 
 	{ "name": "tx_shift2ipv4Fifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo", "role": "dout" }} , 
 	{ "name": "tx_shift2ipv4Fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_shift2ipv4Fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_shift2ipv4Fifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo", "role": "empty_n" }} , 
 	{ "name": "tx_shift2ipv4Fifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo", "role": "read" }} , 
 	{ "name": "tx_udp2ipMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "dout" }} , 
 	{ "name": "tx_udp2ipMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_udp2ipMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_udp2ipMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "empty_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo", "role": "read" }} , 
 	{ "name": "tx_ip2crcFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_ip2crcFifo", "role": "din" }} , 
 	{ "name": "tx_ip2crcFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ip2crcFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ip2crcFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ip2crcFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ip2crcFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ip2crcFifo", "role": "full_n" }} , 
 	{ "name": "tx_ip2crcFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ip2crcFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ipv4_generate_ipv4_512_13",
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
			{"Name" : "local_ip_address", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_ip_address_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gi_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_udp2ipMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ip2crcFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ip2crcFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2ipv4Fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ipv4_generate_ipv4_512_13 {
		local_ip_address {Type I LastRead 0 FirstWrite -1}
		gi_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_2 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_2 {Type IO LastRead -1 FirstWrite -1}
		tx_udp2ipMetaFifo {Type I LastRead 0 FirstWrite -1}
		tx_ip2crcFifo {Type O LastRead -1 FirstWrite 1}
		tx_shift2ipv4Fifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	local_ip_address { ap_fifo {  { local_ip_address_dout fifo_port_we 0 128 }  { local_ip_address_num_data_valid fifo_status_num_data_valid 0 3 }  { local_ip_address_fifo_cap fifo_update 0 3 }  { local_ip_address_empty_n fifo_status 0 1 }  { local_ip_address_read fifo_data 1 1 } } }
	tx_udp2ipMetaFifo { ap_fifo {  { tx_udp2ipMetaFifo_dout fifo_port_we 0 64 }  { tx_udp2ipMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_udp2ipMetaFifo_fifo_cap fifo_update 0 2 }  { tx_udp2ipMetaFifo_empty_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_read fifo_data 1 1 } } }
	tx_ip2crcFifo { ap_fifo {  { tx_ip2crcFifo_din fifo_port_we 1 1024 }  { tx_ip2crcFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ip2crcFifo_fifo_cap fifo_update 0 2 }  { tx_ip2crcFifo_full_n fifo_status 0 1 }  { tx_ip2crcFifo_write fifo_data 1 1 } } }
	tx_shift2ipv4Fifo { ap_fifo {  { tx_shift2ipv4Fifo_dout fifo_port_we 0 1024 }  { tx_shift2ipv4Fifo_num_data_valid fifo_status_num_data_valid 0 4 }  { tx_shift2ipv4Fifo_fifo_cap fifo_update 0 4 }  { tx_shift2ipv4Fifo_empty_n fifo_status 0 1 }  { tx_shift2ipv4Fifo_read fifo_data 1 1 } } }
}
