set moduleName local_req_handler
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
set C_modelName {local_req_handler}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_tx_meta int 256 regular {axi_s 0 volatile  { s_axis_tx_meta Data } }  }
	{ tx_appMetaFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ tx_readReqAddr_push int 128 regular {fifo 1 volatile } {global 1}  }
	{ tx_localMemCmdFifo int 192 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_tx_meta", "interface" : "axis", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "tx_appMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqAddr_push", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_localMemCmdFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_tx_meta_TVALID sc_in sc_logic 1 invld 0 } 
	{ tx_appMetaFifo_din sc_out sc_lv 256 signal 1 } 
	{ tx_appMetaFifo_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ tx_appMetaFifo_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ tx_appMetaFifo_full_n sc_in sc_logic 1 signal 1 } 
	{ tx_appMetaFifo_write sc_out sc_logic 1 signal 1 } 
	{ tx_readReqAddr_push_din sc_out sc_lv 128 signal 2 } 
	{ tx_readReqAddr_push_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_readReqAddr_push_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_readReqAddr_push_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_readReqAddr_push_write sc_out sc_logic 1 signal 2 } 
	{ tx_localMemCmdFifo_din sc_out sc_lv 192 signal 3 } 
	{ tx_localMemCmdFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ tx_localMemCmdFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ tx_localMemCmdFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_localMemCmdFifo_write sc_out sc_logic 1 signal 3 } 
	{ s_axis_tx_meta_TDATA sc_in sc_lv 256 signal 0 } 
	{ s_axis_tx_meta_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_tx_meta_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_meta", "role": "TVALID" }} , 
 	{ "name": "tx_appMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_appMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_appMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo", "role": "write" }} , 
 	{ "name": "tx_readReqAddr_push_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "din" }} , 
 	{ "name": "tx_readReqAddr_push_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "num_data_valid" }} , 
 	{ "name": "tx_readReqAddr_push_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "fifo_cap" }} , 
 	{ "name": "tx_readReqAddr_push_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "full_n" }} , 
 	{ "name": "tx_readReqAddr_push_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "write" }} , 
 	{ "name": "tx_localMemCmdFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo", "role": "din" }} , 
 	{ "name": "tx_localMemCmdFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_localMemCmdFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_localMemCmdFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo", "role": "full_n" }} , 
 	{ "name": "tx_localMemCmdFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo", "role": "write" }} , 
 	{ "name": "s_axis_tx_meta_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "s_axis_tx_meta", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_meta_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_meta", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "local_req_handler",
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
			{"Name" : "s_axis_tx_meta", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "lrh_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_local_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_remote_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_length_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_qpn_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_appMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqAddr_push", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_localMemCmdFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_localMemCmdFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_tx_meta_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	local_req_handler {
		s_axis_tx_meta {Type I LastRead 0 FirstWrite -1}
		lrh_state {Type IO LastRead -1 FirstWrite -1}
		meta_local_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		meta_remote_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		meta_length_V_1 {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_5 {Type IO LastRead -1 FirstWrite -1}
		meta_qpn_V_1 {Type IO LastRead -1 FirstWrite -1}
		tx_appMetaFifo {Type O LastRead -1 FirstWrite 1}
		tx_readReqAddr_push {Type O LastRead -1 FirstWrite 1}
		tx_localMemCmdFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_tx_meta { axis {  { s_axis_tx_meta_TVALID in_vld 0 1 }  { s_axis_tx_meta_TDATA in_data 0 256 }  { s_axis_tx_meta_TREADY in_acc 1 1 } } }
	tx_appMetaFifo { ap_fifo {  { tx_appMetaFifo_din fifo_port_we 1 256 }  { tx_appMetaFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { tx_appMetaFifo_fifo_cap fifo_update 0 6 }  { tx_appMetaFifo_full_n fifo_status 0 1 }  { tx_appMetaFifo_write fifo_data 1 1 } } }
	tx_readReqAddr_push { ap_fifo {  { tx_readReqAddr_push_din fifo_port_we 1 128 }  { tx_readReqAddr_push_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_readReqAddr_push_fifo_cap fifo_update 0 2 }  { tx_readReqAddr_push_full_n fifo_status 0 1 }  { tx_readReqAddr_push_write fifo_data 1 1 } } }
	tx_localMemCmdFifo { ap_fifo {  { tx_localMemCmdFifo_din fifo_port_we 1 192 }  { tx_localMemCmdFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_localMemCmdFifo_fifo_cap fifo_update 0 2 }  { tx_localMemCmdFifo_full_n fifo_status 0 1 }  { tx_localMemCmdFifo_write fifo_data 1 1 } } }
}
