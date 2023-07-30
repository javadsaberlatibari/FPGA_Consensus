set moduleName rxPackageDropper_512_s
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
set C_modelName {rxPackageDropper<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis_rxwrite_data int 1024 regular {axi_s 1 volatile  { m_axis_rxwrite_data Data } }  }
	{ rxEng_metaHandlerDropFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ rxEng_fsmDropFifo int 1 regular {fifo 0 volatile } {global 0}  }
	{ rxEng_dataBuffer3 int 1024 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis_rxwrite_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rxEng_metaHandlerDropFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxEng_fsmDropFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxEng_dataBuffer3", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rxEng_dataBuffer3_dout sc_in sc_lv 1024 signal 3 } 
	{ rxEng_dataBuffer3_num_data_valid sc_in sc_lv 6 signal 3 } 
	{ rxEng_dataBuffer3_fifo_cap sc_in sc_lv 6 signal 3 } 
	{ rxEng_dataBuffer3_empty_n sc_in sc_logic 1 signal 3 } 
	{ rxEng_dataBuffer3_read sc_out sc_logic 1 signal 3 } 
	{ rxEng_fsmDropFifo_dout sc_in sc_lv 1 signal 2 } 
	{ rxEng_fsmDropFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rxEng_fsmDropFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rxEng_fsmDropFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ rxEng_fsmDropFifo_read sc_out sc_logic 1 signal 2 } 
	{ rxEng_metaHandlerDropFifo_dout sc_in sc_lv 1 signal 1 } 
	{ rxEng_metaHandlerDropFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ rxEng_metaHandlerDropFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ rxEng_metaHandlerDropFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rxEng_metaHandlerDropFifo_read sc_out sc_logic 1 signal 1 } 
	{ m_axis_rxwrite_data_TREADY sc_in sc_logic 1 outacc 0 } 
	{ m_axis_rxwrite_data_TDATA sc_out sc_lv 1024 signal 0 } 
	{ m_axis_rxwrite_data_TVALID sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxEng_dataBuffer3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rxEng_dataBuffer3", "role": "dout" }} , 
 	{ "name": "rxEng_dataBuffer3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rxEng_dataBuffer3", "role": "num_data_valid" }} , 
 	{ "name": "rxEng_dataBuffer3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rxEng_dataBuffer3", "role": "fifo_cap" }} , 
 	{ "name": "rxEng_dataBuffer3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_dataBuffer3", "role": "empty_n" }} , 
 	{ "name": "rxEng_dataBuffer3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_dataBuffer3", "role": "read" }} , 
 	{ "name": "rxEng_fsmDropFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_fsmDropFifo", "role": "dout" }} , 
 	{ "name": "rxEng_fsmDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxEng_fsmDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rxEng_fsmDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxEng_fsmDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rxEng_fsmDropFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_fsmDropFifo", "role": "empty_n" }} , 
 	{ "name": "rxEng_fsmDropFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_fsmDropFifo", "role": "read" }} , 
 	{ "name": "rxEng_metaHandlerDropFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_metaHandlerDropFifo", "role": "dout" }} , 
 	{ "name": "rxEng_metaHandlerDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxEng_metaHandlerDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rxEng_metaHandlerDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxEng_metaHandlerDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rxEng_metaHandlerDropFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_metaHandlerDropFifo", "role": "empty_n" }} , 
 	{ "name": "rxEng_metaHandlerDropFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxEng_metaHandlerDropFifo", "role": "read" }} , 
 	{ "name": "m_axis_rxwrite_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rxwrite_data", "role": "TREADY" }} , 
 	{ "name": "m_axis_rxwrite_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_rxwrite_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_rxwrite_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rxwrite_data", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "rxPackageDropper_512_s",
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
			{"Name" : "m_axis_rxwrite_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_rxwrite_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tpf_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxEng_metaHandlerDropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxEng_metaHandlerDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rxEng_fsmDropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxEng_fsmDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rxEng_dataBuffer3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxEng_dataBuffer3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_rxwrite_data_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rxPackageDropper_512_s {
		m_axis_rxwrite_data {Type O LastRead -1 FirstWrite 1}
		tpf_state {Type IO LastRead -1 FirstWrite -1}
		rxEng_metaHandlerDropFifo {Type I LastRead 0 FirstWrite -1}
		rxEng_fsmDropFifo {Type I LastRead 0 FirstWrite -1}
		rxEng_dataBuffer3 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	m_axis_rxwrite_data { axis {  { m_axis_rxwrite_data_TREADY out_acc 0 1 }  { m_axis_rxwrite_data_TDATA out_data 1 1024 }  { m_axis_rxwrite_data_TVALID out_vld 1 1 } } }
	rxEng_metaHandlerDropFifo { ap_fifo {  { rxEng_metaHandlerDropFifo_dout fifo_port_we 0 1 }  { rxEng_metaHandlerDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rxEng_metaHandlerDropFifo_fifo_cap fifo_update 0 2 }  { rxEng_metaHandlerDropFifo_empty_n fifo_status 0 1 }  { rxEng_metaHandlerDropFifo_read fifo_data 1 1 } } }
	rxEng_fsmDropFifo { ap_fifo {  { rxEng_fsmDropFifo_dout fifo_port_we 0 1 }  { rxEng_fsmDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rxEng_fsmDropFifo_fifo_cap fifo_update 0 2 }  { rxEng_fsmDropFifo_empty_n fifo_status 0 1 }  { rxEng_fsmDropFifo_read fifo_data 1 1 } } }
	rxEng_dataBuffer3 { ap_fifo {  { rxEng_dataBuffer3_dout fifo_port_we 0 1024 }  { rxEng_dataBuffer3_num_data_valid fifo_status_num_data_valid 0 6 }  { rxEng_dataBuffer3_fifo_cap fifo_update 0 6 }  { rxEng_dataBuffer3_empty_n fifo_status 0 1 }  { rxEng_dataBuffer3_read fifo_data 1 1 } } }
}
