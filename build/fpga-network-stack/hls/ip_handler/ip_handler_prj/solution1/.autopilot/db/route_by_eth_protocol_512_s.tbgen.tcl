set moduleName route_by_eth_protocol_512_s
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
set C_modelName {route_by_eth_protocol<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis_arp int 1024 regular {axi_s 1 volatile  { m_axis_arp Data } }  }
	{ etherTypeFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ ethDataFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ ipv4ShiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ ipv6ShiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis_arp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "etherTypeFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ethDataFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ipv4ShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ipv6ShiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ etherTypeFifo_dout sc_in sc_lv 16 signal 1 } 
	{ etherTypeFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ etherTypeFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ etherTypeFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ etherTypeFifo_read sc_out sc_logic 1 signal 1 } 
	{ ethDataFifo_dout sc_in sc_lv 1024 signal 2 } 
	{ ethDataFifo_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ ethDataFifo_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ ethDataFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ ethDataFifo_read sc_out sc_logic 1 signal 2 } 
	{ ipv6ShiftFifo_din sc_out sc_lv 1024 signal 4 } 
	{ ipv6ShiftFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ ipv6ShiftFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ ipv6ShiftFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ ipv6ShiftFifo_write sc_out sc_logic 1 signal 4 } 
	{ ipv4ShiftFifo_din sc_out sc_lv 1024 signal 3 } 
	{ ipv4ShiftFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ ipv4ShiftFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ ipv4ShiftFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ ipv4ShiftFifo_write sc_out sc_logic 1 signal 3 } 
	{ m_axis_arp_TREADY sc_in sc_logic 1 outacc 0 } 
	{ m_axis_arp_TDATA sc_out sc_lv 1024 signal 0 } 
	{ m_axis_arp_TVALID sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "etherTypeFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "dout" }} , 
 	{ "name": "etherTypeFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "num_data_valid" }} , 
 	{ "name": "etherTypeFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "fifo_cap" }} , 
 	{ "name": "etherTypeFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "empty_n" }} , 
 	{ "name": "etherTypeFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etherTypeFifo", "role": "read" }} , 
 	{ "name": "ethDataFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "dout" }} , 
 	{ "name": "ethDataFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "num_data_valid" }} , 
 	{ "name": "ethDataFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "fifo_cap" }} , 
 	{ "name": "ethDataFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "empty_n" }} , 
 	{ "name": "ethDataFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ethDataFifo", "role": "read" }} , 
 	{ "name": "ipv6ShiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipv6ShiftFifo", "role": "din" }} , 
 	{ "name": "ipv6ShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipv6ShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipv6ShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipv6ShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipv6ShiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv6ShiftFifo", "role": "full_n" }} , 
 	{ "name": "ipv6ShiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv6ShiftFifo", "role": "write" }} , 
 	{ "name": "ipv4ShiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "ipv4ShiftFifo", "role": "din" }} , 
 	{ "name": "ipv4ShiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipv4ShiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "ipv4ShiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ipv4ShiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "ipv4ShiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv4ShiftFifo", "role": "full_n" }} , 
 	{ "name": "ipv4ShiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ipv4ShiftFifo", "role": "write" }} , 
 	{ "name": "m_axis_arp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_arp", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_arp", "role": "TDATA" }} , 
 	{ "name": "m_axis_arp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_arp", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "route_by_eth_protocol_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m_axis_arp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_arp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rep_fsmState_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "etherTypeFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "etherTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ethDataFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ethDataFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rep_etherType_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv4ShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv6ShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv6ShiftFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_arp_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	route_by_eth_protocol_512_s {
		m_axis_arp {Type O LastRead -1 FirstWrite 1}
		rep_fsmState_V {Type IO LastRead -1 FirstWrite -1}
		etherTypeFifo {Type I LastRead 0 FirstWrite -1}
		ethDataFifo {Type I LastRead 0 FirstWrite -1}
		rep_etherType_V {Type IO LastRead -1 FirstWrite -1}
		ipv4ShiftFifo {Type O LastRead -1 FirstWrite 1}
		ipv6ShiftFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	m_axis_arp { axis {  { m_axis_arp_TREADY out_acc 0 1 }  { m_axis_arp_TDATA out_data 1 1024 }  { m_axis_arp_TVALID out_vld 1 1 } } }
	etherTypeFifo { ap_fifo {  { etherTypeFifo_dout fifo_port_we 0 16 }  { etherTypeFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { etherTypeFifo_fifo_cap fifo_update 0 2 }  { etherTypeFifo_empty_n fifo_status 0 1 }  { etherTypeFifo_read fifo_data 1 1 } } }
	ethDataFifo { ap_fifo {  { ethDataFifo_dout fifo_port_we 0 1024 }  { ethDataFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { ethDataFifo_fifo_cap fifo_update 0 3 }  { ethDataFifo_empty_n fifo_status 0 1 }  { ethDataFifo_read fifo_data 1 1 } } }
	ipv4ShiftFifo { ap_fifo {  { ipv4ShiftFifo_din fifo_port_we 1 1024 }  { ipv4ShiftFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { ipv4ShiftFifo_fifo_cap fifo_update 0 2 }  { ipv4ShiftFifo_full_n fifo_status 0 1 }  { ipv4ShiftFifo_write fifo_data 1 1 } } }
	ipv6ShiftFifo { ap_fifo {  { ipv6ShiftFifo_din fifo_port_we 1 1024 }  { ipv6ShiftFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { ipv6ShiftFifo_fifo_cap fifo_update 0 2 }  { ipv6ShiftFifo_full_n fifo_status 0 1 }  { ipv6ShiftFifo_write fifo_data 1 1 } } }
}
