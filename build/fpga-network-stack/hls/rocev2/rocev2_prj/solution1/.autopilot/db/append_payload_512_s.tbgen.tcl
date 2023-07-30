set moduleName append_payload_512_s
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
set C_modelName {append_payload<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_packetInfoFifo int 24 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2shiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ tx_aethShift2payFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ tx_rethShift2payFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ tx_rawPayFifo int 1024 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_packetInfoFifo", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2shiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_aethShift2payFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethShift2payFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} ]}
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
	{ tx_rethShift2payFifo_dout sc_in sc_lv 1024 signal 4 } 
	{ tx_rethShift2payFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ tx_rethShift2payFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ tx_rethShift2payFifo_empty_n sc_in sc_logic 1 signal 4 } 
	{ tx_rethShift2payFifo_read sc_out sc_logic 1 signal 4 } 
	{ tx_aethShift2payFifo_dout sc_in sc_lv 1024 signal 3 } 
	{ tx_aethShift2payFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ tx_aethShift2payFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ tx_aethShift2payFifo_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_aethShift2payFifo_read sc_out sc_logic 1 signal 3 } 
	{ tx_exh2payFifo_dout sc_in sc_lv 1024 signal 1 } 
	{ tx_exh2payFifo_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ tx_exh2payFifo_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ tx_exh2payFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_exh2payFifo_read sc_out sc_logic 1 signal 1 } 
	{ tx_rawPayFifo_dout sc_in sc_lv 1024 signal 5 } 
	{ tx_rawPayFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ tx_rawPayFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ tx_rawPayFifo_empty_n sc_in sc_logic 1 signal 5 } 
	{ tx_rawPayFifo_read sc_out sc_logic 1 signal 5 } 
	{ tx_packetInfoFifo_dout sc_in sc_lv 24 signal 0 } 
	{ tx_packetInfoFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ tx_packetInfoFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ tx_packetInfoFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_packetInfoFifo_read sc_out sc_logic 1 signal 0 } 
	{ tx_exh2shiftFifo_din sc_out sc_lv 1024 signal 2 } 
	{ tx_exh2shiftFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_exh2shiftFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_exh2shiftFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_exh2shiftFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_rethShift2payFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo", "role": "dout" }} , 
 	{ "name": "tx_rethShift2payFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_rethShift2payFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_rethShift2payFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo", "role": "empty_n" }} , 
 	{ "name": "tx_rethShift2payFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo", "role": "read" }} , 
 	{ "name": "tx_aethShift2payFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo", "role": "dout" }} , 
 	{ "name": "tx_aethShift2payFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_aethShift2payFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_aethShift2payFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo", "role": "empty_n" }} , 
 	{ "name": "tx_aethShift2payFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo", "role": "read" }} , 
 	{ "name": "tx_exh2payFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "dout" }} , 
 	{ "name": "tx_exh2payFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_exh2payFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_exh2payFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "empty_n" }} , 
 	{ "name": "tx_exh2payFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "read" }} , 
 	{ "name": "tx_rawPayFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "dout" }} , 
 	{ "name": "tx_rawPayFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_rawPayFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_rawPayFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "empty_n" }} , 
 	{ "name": "tx_rawPayFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo", "role": "read" }} , 
 	{ "name": "tx_packetInfoFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "dout" }} , 
 	{ "name": "tx_packetInfoFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_packetInfoFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_packetInfoFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "empty_n" }} , 
 	{ "name": "tx_packetInfoFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "read" }} , 
 	{ "name": "tx_exh2shiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo", "role": "din" }} , 
 	{ "name": "tx_exh2shiftFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_exh2shiftFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_exh2shiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo", "role": "full_n" }} , 
 	{ "name": "tx_exh2shiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "append_payload_512_s",
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
			{"Name" : "state_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "firstPayload", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_isAETH", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_hasPayload", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_packetInfoFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_packetInfoFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2shiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2shiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_aethShift2payFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_aethShift2payFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethShift2payFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethShift2payFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	append_payload_512_s {
		state_6 {Type IO LastRead -1 FirstWrite -1}
		firstPayload {Type IO LastRead -1 FirstWrite -1}
		info_isAETH {Type IO LastRead -1 FirstWrite -1}
		info_hasPayload {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_7 {Type IO LastRead -1 FirstWrite -1}
		tx_packetInfoFifo {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo {Type I LastRead 0 FirstWrite -1}
		tx_exh2shiftFifo {Type O LastRead -1 FirstWrite 1}
		tx_aethShift2payFifo {Type I LastRead 0 FirstWrite -1}
		tx_rethShift2payFifo {Type I LastRead 0 FirstWrite -1}
		tx_rawPayFifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_packetInfoFifo { ap_fifo {  { tx_packetInfoFifo_dout fifo_port_we 0 24 }  { tx_packetInfoFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_packetInfoFifo_fifo_cap fifo_update 0 2 }  { tx_packetInfoFifo_empty_n fifo_status 0 1 }  { tx_packetInfoFifo_read fifo_data 1 1 } } }
	tx_exh2payFifo { ap_fifo {  { tx_exh2payFifo_dout fifo_port_we 0 1024 }  { tx_exh2payFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_exh2payFifo_fifo_cap fifo_update 0 3 }  { tx_exh2payFifo_empty_n fifo_status 0 1 }  { tx_exh2payFifo_read fifo_data 1 1 } } }
	tx_exh2shiftFifo { ap_fifo {  { tx_exh2shiftFifo_din fifo_port_we 1 1024 }  { tx_exh2shiftFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_exh2shiftFifo_fifo_cap fifo_update 0 2 }  { tx_exh2shiftFifo_full_n fifo_status 0 1 }  { tx_exh2shiftFifo_write fifo_data 1 1 } } }
	tx_aethShift2payFifo { ap_fifo {  { tx_aethShift2payFifo_dout fifo_port_we 0 1024 }  { tx_aethShift2payFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_aethShift2payFifo_fifo_cap fifo_update 0 2 }  { tx_aethShift2payFifo_empty_n fifo_status 0 1 }  { tx_aethShift2payFifo_read fifo_data 1 1 } } }
	tx_rethShift2payFifo { ap_fifo {  { tx_rethShift2payFifo_dout fifo_port_we 0 1024 }  { tx_rethShift2payFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_rethShift2payFifo_fifo_cap fifo_update 0 2 }  { tx_rethShift2payFifo_empty_n fifo_status 0 1 }  { tx_rethShift2payFifo_read fifo_data 1 1 } } }
	tx_rawPayFifo { ap_fifo {  { tx_rawPayFifo_dout fifo_port_we 0 1024 }  { tx_rawPayFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_rawPayFifo_fifo_cap fifo_update 0 3 }  { tx_rawPayFifo_empty_n fifo_status 0 1 }  { tx_rawPayFifo_read fifo_data 1 1 } } }
}
