set moduleName qp_interface
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
set C_modelName {qp_interface}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_qp_interface int 256 regular {axi_s 0 volatile  { s_axis_qp_interface Data } }  }
	{ qpi2stateTable_upd_req int 160 regular {fifo 1 volatile } {global 1}  }
	{ stateTable2qpi_rsp int 192 regular {fifo 0 volatile } {global 0}  }
	{ if2msnTable_init int 64 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_qp_interface", "interface" : "axis", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "qpi2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 160, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2qpi_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "if2msnTable_init", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_qp_interface_TVALID sc_in sc_logic 1 invld 0 } 
	{ stateTable2qpi_rsp_dout sc_in sc_lv 192 signal 2 } 
	{ stateTable2qpi_rsp_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ stateTable2qpi_rsp_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ stateTable2qpi_rsp_empty_n sc_in sc_logic 1 signal 2 } 
	{ stateTable2qpi_rsp_read sc_out sc_logic 1 signal 2 } 
	{ qpi2stateTable_upd_req_din sc_out sc_lv 160 signal 1 } 
	{ qpi2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ qpi2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ qpi2stateTable_upd_req_full_n sc_in sc_logic 1 signal 1 } 
	{ qpi2stateTable_upd_req_write sc_out sc_logic 1 signal 1 } 
	{ if2msnTable_init_din sc_out sc_lv 64 signal 3 } 
	{ if2msnTable_init_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ if2msnTable_init_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ if2msnTable_init_full_n sc_in sc_logic 1 signal 3 } 
	{ if2msnTable_init_write sc_out sc_logic 1 signal 3 } 
	{ s_axis_qp_interface_TDATA sc_in sc_lv 256 signal 0 } 
	{ s_axis_qp_interface_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_qp_interface_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_qp_interface", "role": "TVALID" }} , 
 	{ "name": "stateTable2qpi_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "dout" }} , 
 	{ "name": "stateTable2qpi_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2qpi_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2qpi_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "empty_n" }} , 
 	{ "name": "stateTable2qpi_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "read" }} , 
 	{ "name": "qpi2stateTable_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "din" }} , 
 	{ "name": "qpi2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "qpi2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "qpi2stateTable_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "full_n" }} , 
 	{ "name": "qpi2stateTable_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "write" }} , 
 	{ "name": "if2msnTable_init_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "din" }} , 
 	{ "name": "if2msnTable_init_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "num_data_valid" }} , 
 	{ "name": "if2msnTable_init_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "fifo_cap" }} , 
 	{ "name": "if2msnTable_init_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "full_n" }} , 
 	{ "name": "if2msnTable_init_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "write" }} , 
 	{ "name": "s_axis_qp_interface_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "s_axis_qp_interface", "role": "TDATA" }} , 
 	{ "name": "s_axis_qp_interface_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_qp_interface", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "qp_interface",
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
			{"Name" : "s_axis_qp_interface", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_qp_interface_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "qp_fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_newState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_qp_num_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_remote_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_local_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_r_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "qpi2stateTable_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "qpi2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2qpi_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2qpi_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "if2msnTable_init", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "if2msnTable_init_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_qp_interface_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	qp_interface {
		s_axis_qp_interface {Type I LastRead 0 FirstWrite -1}
		qp_fsmState {Type IO LastRead -1 FirstWrite -1}
		context_newState {Type IO LastRead -1 FirstWrite -1}
		context_qp_num_V {Type IO LastRead -1 FirstWrite -1}
		context_remote_psn_V {Type IO LastRead -1 FirstWrite -1}
		context_local_psn_V {Type IO LastRead -1 FirstWrite -1}
		context_r_key_V {Type IO LastRead -1 FirstWrite -1}
		qpi2stateTable_upd_req {Type O LastRead -1 FirstWrite 1}
		stateTable2qpi_rsp {Type I LastRead 0 FirstWrite -1}
		if2msnTable_init {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_qp_interface { axis {  { s_axis_qp_interface_TVALID in_vld 0 1 }  { s_axis_qp_interface_TDATA in_data 0 256 }  { s_axis_qp_interface_TREADY in_acc 1 1 } } }
	qpi2stateTable_upd_req { ap_fifo {  { qpi2stateTable_upd_req_din fifo_port_we 1 160 }  { qpi2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { qpi2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { qpi2stateTable_upd_req_full_n fifo_status 0 1 }  { qpi2stateTable_upd_req_write fifo_data 1 1 } } }
	stateTable2qpi_rsp { ap_fifo {  { stateTable2qpi_rsp_dout fifo_port_we 0 192 }  { stateTable2qpi_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2qpi_rsp_fifo_cap fifo_update 0 2 }  { stateTable2qpi_rsp_empty_n fifo_status 0 1 }  { stateTable2qpi_rsp_read fifo_data 1 1 } } }
	if2msnTable_init { ap_fifo {  { if2msnTable_init_din fifo_port_we 1 64 }  { if2msnTable_init_num_data_valid fifo_status_num_data_valid 0 2 }  { if2msnTable_init_fifo_cap fifo_update 0 2 }  { if2msnTable_init_full_n fifo_status 0 1 }  { if2msnTable_init_write fifo_data 1 1 } } }
}
