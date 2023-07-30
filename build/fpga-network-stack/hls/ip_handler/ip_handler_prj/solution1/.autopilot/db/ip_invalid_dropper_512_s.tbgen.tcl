set moduleName ip_invalid_dropper_512_s
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
set C_modelName {ip_invalid_dropper<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ validChecksumFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ validIpAddressFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ ipv4ValidFifo int 1 regular {fifo 1 volatile } {global 1}  }
	{ ipDataCheckFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ ipDataDropFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "validChecksumFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "validIpAddressFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ipv4ValidFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ipDataCheckFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ipDataDropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ipDataCheckFifo_dout sc_in sc_lv 1024 signal 3 } 
	{ ipDataCheckFifo_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ ipDataCheckFifo_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ ipDataCheckFifo_empty_n sc_in sc_logic 1 signal 3 } 
	{ ipDataCheckFifo_read sc_out sc_logic 1 signal 3 } 
	{ validChecksumFifo_dout sc_in sc_lv 1 signal 0 } 
	{ validChecksumFifo_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ validChecksumFifo_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ validChecksumFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ validChecksumFifo_read sc_out sc_logic 1 signal 0 } 
	{ validIpAddressFifo_dout sc_in sc_lv 1 signal 1 } 
	{ validIpAddressFifo_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ validIpAddressFifo_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ validIpAddressFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ validIpAddressFifo_read sc_out sc_logic 1 signal 1 } 
	{ ipDataDropFifo_din sc_out sc_lv 1024 signal 4 } 
	{ ipDataDropFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ ipDataDropFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ ipDataDropFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ ipDataDropFifo_write sc_out sc_logic 1 signal 4 } 
	{ ipv4ValidFifo_din sc_out sc_lv 1 signal 2 } 
	{ ipv4ValidFifo_num_data_valid sc_in sc_lv 4 signal 2 } 
	{ ipv4ValidFifo_fifo_cap sc_in sc_lv 4 signal 2 } 
	{ ipv4ValidFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ ipv4ValidFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ipDataCheckFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipDataCheckFifo", "role": "dout" }} , 
 	{ "name": "ipDataCheckFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ipDataCheckFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipDataCheckFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ipDataCheckFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipDataCheckFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataCheckFifo", "role": "empty_n" }} , 
 	{ "name": "ipDataCheckFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataCheckFifo", "role": "read" }} , 
 	{ "name": "validChecksumFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "validChecksumFifo", "role": "dout" }} , 
 	{ "name": "validChecksumFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "validChecksumFifo", "role": "num_data_valid" }} , 
 	{ "name": "validChecksumFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "validChecksumFifo", "role": "fifo_cap" }} , 
 	{ "name": "validChecksumFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validChecksumFifo", "role": "empty_n" }} , 
 	{ "name": "validChecksumFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validChecksumFifo", "role": "read" }} , 
 	{ "name": "validIpAddressFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "validIpAddressFifo", "role": "dout" }} , 
 	{ "name": "validIpAddressFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "validIpAddressFifo", "role": "num_data_valid" }} , 
 	{ "name": "validIpAddressFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "validIpAddressFifo", "role": "fifo_cap" }} , 
 	{ "name": "validIpAddressFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validIpAddressFifo", "role": "empty_n" }} , 
 	{ "name": "validIpAddressFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "validIpAddressFifo", "role": "read" }} , 
 	{ "name": "ipDataDropFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "din" }} , 
 	{ "name": "ipDataDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipDataDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipDataDropFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "full_n" }} , 
 	{ "name": "ipDataDropFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipDataDropFifo", "role": "write" }} , 
 	{ "name": "ipv4ValidFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv4ValidFifo", "role": "din" }} , 
 	{ "name": "ipv4ValidFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ipv4ValidFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipv4ValidFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ipv4ValidFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipv4ValidFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv4ValidFifo", "role": "full_n" }} , 
 	{ "name": "ipv4ValidFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv4ValidFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ip_invalid_dropper_512_s",
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
			{"Name" : "iid_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validChecksumFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validChecksumFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "validIpAddressFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validIpAddressFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv4ValidFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ValidFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataCheckFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCheckFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataDropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataDropFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ip_invalid_dropper_512_s {
		iid_state {Type IO LastRead -1 FirstWrite -1}
		validChecksumFifo {Type I LastRead 0 FirstWrite -1}
		validIpAddressFifo {Type I LastRead 0 FirstWrite -1}
		ipv4ValidFifo {Type O LastRead -1 FirstWrite 1}
		ipDataCheckFifo {Type I LastRead 0 FirstWrite -1}
		ipDataDropFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	validChecksumFifo { ap_fifo {  { validChecksumFifo_dout fifo_port_we 0 1 }  { validChecksumFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { validChecksumFifo_fifo_cap fifo_update 0 3 }  { validChecksumFifo_empty_n fifo_status 0 1 }  { validChecksumFifo_read fifo_data 1 1 } } }
	validIpAddressFifo { ap_fifo {  { validIpAddressFifo_dout fifo_port_we 0 1 }  { validIpAddressFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { validIpAddressFifo_fifo_cap fifo_update 0 6 }  { validIpAddressFifo_empty_n fifo_status 0 1 }  { validIpAddressFifo_read fifo_data 1 1 } } }
	ipv4ValidFifo { ap_fifo {  { ipv4ValidFifo_din fifo_port_we 1 1 }  { ipv4ValidFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { ipv4ValidFifo_fifo_cap fifo_update 0 4 }  { ipv4ValidFifo_full_n fifo_status 0 1 }  { ipv4ValidFifo_write fifo_data 1 1 } } }
	ipDataCheckFifo { ap_fifo {  { ipDataCheckFifo_dout fifo_port_we 0 1024 }  { ipDataCheckFifo_num_data_valid fifo_status_num_data_valid 0 7 }  { ipDataCheckFifo_fifo_cap fifo_update 0 7 }  { ipDataCheckFifo_empty_n fifo_status 0 1 }  { ipDataCheckFifo_read fifo_data 1 1 } } }
	ipDataDropFifo { ap_fifo {  { ipDataDropFifo_din fifo_port_we 1 1024 }  { ipDataDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { ipDataDropFifo_fifo_cap fifo_update 0 2 }  { ipDataDropFifo_full_n fifo_status 0 1 }  { ipDataDropFifo_write fifo_data 1 1 } } }
}
