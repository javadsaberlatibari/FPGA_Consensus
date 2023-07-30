set moduleName dhcp_fsm
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
set C_modelName {dhcp_fsm}
set C_modelType { void 0 }
set C_modelArgList {
	{ dhcpIpAddressOut int 32 regular {pointer 1}  }
	{ dhcpEnable int 1 regular {pointer 0}  }
	{ inputIpAddress int 32 regular {pointer 0}  }
	{ portOpen int 1 regular {fifo 0 volatile } {global 0}  }
	{ dhcp_requestMetaFifo int 96 regular {fifo 1 volatile } {global 1}  }
	{ dhcp_replyMetaFifo int 128 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "dhcpIpAddressOut", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dhcpEnable", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "inputIpAddress", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "portOpen", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dhcp_requestMetaFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dhcp_replyMetaFifo", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ dhcp_replyMetaFifo_dout sc_in sc_lv 128 signal 5 } 
	{ dhcp_replyMetaFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ dhcp_replyMetaFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ dhcp_replyMetaFifo_empty_n sc_in sc_logic 1 signal 5 } 
	{ dhcp_replyMetaFifo_read sc_out sc_logic 1 signal 5 } 
	{ portOpen_dout sc_in sc_lv 1 signal 3 } 
	{ portOpen_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ portOpen_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ portOpen_empty_n sc_in sc_logic 1 signal 3 } 
	{ portOpen_read sc_out sc_logic 1 signal 3 } 
	{ dhcp_requestMetaFifo_din sc_out sc_lv 96 signal 4 } 
	{ dhcp_requestMetaFifo_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ dhcp_requestMetaFifo_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ dhcp_requestMetaFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ dhcp_requestMetaFifo_write sc_out sc_logic 1 signal 4 } 
	{ dhcpIpAddressOut sc_out sc_lv 32 signal 0 } 
	{ dhcpIpAddressOut_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ dhcpEnable sc_in sc_lv 1 signal 1 } 
	{ inputIpAddress sc_in sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "dhcp_replyMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "dhcp_replyMetaFifo", "role": "dout" }} , 
 	{ "name": "dhcp_replyMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dhcp_replyMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "dhcp_replyMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dhcp_replyMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "dhcp_replyMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcp_replyMetaFifo", "role": "empty_n" }} , 
 	{ "name": "dhcp_replyMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcp_replyMetaFifo", "role": "read" }} , 
 	{ "name": "portOpen_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "portOpen", "role": "dout" }} , 
 	{ "name": "portOpen_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "portOpen", "role": "num_data_valid" }} , 
 	{ "name": "portOpen_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "portOpen", "role": "fifo_cap" }} , 
 	{ "name": "portOpen_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "portOpen", "role": "empty_n" }} , 
 	{ "name": "portOpen_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "portOpen", "role": "read" }} , 
 	{ "name": "dhcp_requestMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "dhcp_requestMetaFifo", "role": "din" }} , 
 	{ "name": "dhcp_requestMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dhcp_requestMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "dhcp_requestMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dhcp_requestMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "dhcp_requestMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcp_requestMetaFifo", "role": "full_n" }} , 
 	{ "name": "dhcp_requestMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcp_requestMetaFifo", "role": "write" }} , 
 	{ "name": "dhcpIpAddressOut", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dhcpIpAddressOut", "role": "default" }} , 
 	{ "name": "dhcpIpAddressOut_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dhcpIpAddressOut", "role": "ap_vld" }} , 
 	{ "name": "dhcpEnable", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcpEnable", "role": "default" }} , 
 	{ "name": "inputIpAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputIpAddress", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "dhcp_fsm",
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
			{"Name" : "dhcpIpAddressOut", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dhcpEnable", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "inputIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "myIpAddress_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "time_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "randomValue_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIdentity_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IpAddressBuffer_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "portOpen", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "portOpen_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dhcp_requestMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_requestMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dhcp_replyMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_replyMetaFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	dhcp_fsm {
		dhcpIpAddressOut {Type O LastRead -1 FirstWrite 1}
		dhcpEnable {Type I LastRead 0 FirstWrite -1}
		inputIpAddress {Type I LastRead 0 FirstWrite -1}
		myIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		time_V {Type IO LastRead -1 FirstWrite -1}
		randomValue_V {Type IO LastRead -1 FirstWrite -1}
		myIdentity_V {Type IO LastRead -1 FirstWrite -1}
		IpAddressBuffer_V {Type IO LastRead -1 FirstWrite -1}
		portOpen {Type I LastRead 0 FirstWrite -1}
		dhcp_requestMetaFifo {Type O LastRead -1 FirstWrite 1}
		dhcp_replyMetaFifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	dhcpIpAddressOut { ap_vld {  { dhcpIpAddressOut out_data 1 32 }  { dhcpIpAddressOut_ap_vld out_vld 1 1 } } }
	dhcpEnable { ap_stable {  { dhcpEnable in_data 0 1 } } }
	inputIpAddress { ap_stable {  { inputIpAddress in_data 0 32 } } }
	portOpen { ap_fifo {  { portOpen_dout fifo_port_we 0 1 }  { portOpen_num_data_valid fifo_status_num_data_valid 0 2 }  { portOpen_fifo_cap fifo_update 0 2 }  { portOpen_empty_n fifo_status 0 1 }  { portOpen_read fifo_data 1 1 } } }
	dhcp_requestMetaFifo { ap_fifo {  { dhcp_requestMetaFifo_din fifo_port_we 1 96 }  { dhcp_requestMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { dhcp_requestMetaFifo_fifo_cap fifo_update 0 3 }  { dhcp_requestMetaFifo_full_n fifo_status 0 1 }  { dhcp_requestMetaFifo_write fifo_data 1 1 } } }
	dhcp_replyMetaFifo { ap_fifo {  { dhcp_replyMetaFifo_dout fifo_port_we 0 128 }  { dhcp_replyMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { dhcp_replyMetaFifo_fifo_cap fifo_update 0 3 }  { dhcp_replyMetaFifo_empty_n fifo_status 0 1 }  { dhcp_replyMetaFifo_read fifo_data 1 1 } } }
}
