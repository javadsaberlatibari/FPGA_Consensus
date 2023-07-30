set moduleName state_table
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
set C_modelName {state_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxIbh2stateTable_upd_req int 96 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2rxIbh_rsp int 128 regular {fifo 1 volatile } {global 1}  }
	{ txIbh2stateTable_upd_req int 96 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2txIbh_rsp int 192 regular {fifo 1 volatile } {global 1}  }
	{ qpi2stateTable_upd_req int 160 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2qpi_rsp int 192 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxIbh2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2rxIbh_rsp", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txIbh2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2txIbh_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "qpi2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 160, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2qpi_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rxIbh2stateTable_upd_req_dout sc_in sc_lv 96 signal 0 } 
	{ rxIbh2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rxIbh2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rxIbh2stateTable_upd_req_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxIbh2stateTable_upd_req_read sc_out sc_logic 1 signal 0 } 
	{ txIbh2stateTable_upd_req_dout sc_in sc_lv 96 signal 2 } 
	{ txIbh2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ txIbh2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ txIbh2stateTable_upd_req_empty_n sc_in sc_logic 1 signal 2 } 
	{ txIbh2stateTable_upd_req_read sc_out sc_logic 1 signal 2 } 
	{ qpi2stateTable_upd_req_dout sc_in sc_lv 160 signal 4 } 
	{ qpi2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ qpi2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ qpi2stateTable_upd_req_empty_n sc_in sc_logic 1 signal 4 } 
	{ qpi2stateTable_upd_req_read sc_out sc_logic 1 signal 4 } 
	{ stateTable2qpi_rsp_din sc_out sc_lv 192 signal 5 } 
	{ stateTable2qpi_rsp_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ stateTable2qpi_rsp_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ stateTable2qpi_rsp_full_n sc_in sc_logic 1 signal 5 } 
	{ stateTable2qpi_rsp_write sc_out sc_logic 1 signal 5 } 
	{ stateTable2txIbh_rsp_din sc_out sc_lv 192 signal 3 } 
	{ stateTable2txIbh_rsp_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ stateTable2txIbh_rsp_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ stateTable2txIbh_rsp_full_n sc_in sc_logic 1 signal 3 } 
	{ stateTable2txIbh_rsp_write sc_out sc_logic 1 signal 3 } 
	{ stateTable2rxIbh_rsp_din sc_out sc_lv 128 signal 1 } 
	{ stateTable2rxIbh_rsp_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ stateTable2rxIbh_rsp_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ stateTable2rxIbh_rsp_full_n sc_in sc_logic 1 signal 1 } 
	{ stateTable2rxIbh_rsp_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "dout" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "empty_n" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "read" }} , 
 	{ "name": "txIbh2stateTable_upd_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "dout" }} , 
 	{ "name": "txIbh2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "txIbh2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "txIbh2stateTable_upd_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "empty_n" }} , 
 	{ "name": "txIbh2stateTable_upd_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_req", "role": "read" }} , 
 	{ "name": "qpi2stateTable_upd_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "dout" }} , 
 	{ "name": "qpi2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "qpi2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "qpi2stateTable_upd_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "empty_n" }} , 
 	{ "name": "qpi2stateTable_upd_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_req", "role": "read" }} , 
 	{ "name": "stateTable2qpi_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "din" }} , 
 	{ "name": "stateTable2qpi_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2qpi_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2qpi_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "full_n" }} , 
 	{ "name": "stateTable2qpi_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp", "role": "write" }} , 
 	{ "name": "stateTable2txIbh_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "din" }} , 
 	{ "name": "stateTable2txIbh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2txIbh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2txIbh_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "full_n" }} , 
 	{ "name": "stateTable2txIbh_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp", "role": "write" }} , 
 	{ "name": "stateTable2rxIbh_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "din" }} , 
 	{ "name": "stateTable2rxIbh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2rxIbh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2rxIbh_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "full_n" }} , 
 	{ "name": "stateTable2rxIbh_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "state_table",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rxIbh2stateTable_upd_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxIbh2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_table_req_old_unack_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_resp_epsn_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_retryCounter_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_resp_old_outstanding_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_req_next_psn_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_req_old_valid_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "stateTable2rxIbh_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2rxIbh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txIbh2stateTable_upd_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txIbh2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2txIbh_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2txIbh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "qpi2stateTable_upd_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "qpi2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2qpi_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2qpi_rsp_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_old_unack_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_resp_epsn_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_retryCounter_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_resp_old_outstanding_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_next_psn_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_old_valid_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	state_table {
		rxIbh2stateTable_upd_req {Type I LastRead 0 FirstWrite -1}
		state_table_req_old_unack_V {Type IO LastRead -1 FirstWrite -1}
		state_table_resp_epsn_V {Type IO LastRead -1 FirstWrite -1}
		state_table_retryCounter_V {Type IO LastRead -1 FirstWrite -1}
		state_table_resp_old_outstanding_V {Type IO LastRead -1 FirstWrite -1}
		state_table_req_next_psn_V {Type IO LastRead -1 FirstWrite -1}
		state_table_req_old_valid_V {Type IO LastRead -1 FirstWrite -1}
		stateTable2rxIbh_rsp {Type O LastRead -1 FirstWrite 5}
		txIbh2stateTable_upd_req {Type I LastRead 1 FirstWrite -1}
		stateTable2txIbh_rsp {Type O LastRead -1 FirstWrite 5}
		qpi2stateTable_upd_req {Type I LastRead 2 FirstWrite -1}
		stateTable2qpi_rsp {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxIbh2stateTable_upd_req { ap_fifo {  { rxIbh2stateTable_upd_req_dout fifo_port_we 0 96 }  { rxIbh2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rxIbh2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { rxIbh2stateTable_upd_req_empty_n fifo_status 0 1 }  { rxIbh2stateTable_upd_req_read fifo_data 1 1 } } }
	stateTable2rxIbh_rsp { ap_fifo {  { stateTable2rxIbh_rsp_din fifo_port_we 1 128 }  { stateTable2rxIbh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2rxIbh_rsp_fifo_cap fifo_update 0 2 }  { stateTable2rxIbh_rsp_full_n fifo_status 0 1 }  { stateTable2rxIbh_rsp_write fifo_data 1 1 } } }
	txIbh2stateTable_upd_req { ap_fifo {  { txIbh2stateTable_upd_req_dout fifo_port_we 0 96 }  { txIbh2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { txIbh2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { txIbh2stateTable_upd_req_empty_n fifo_status 0 1 }  { txIbh2stateTable_upd_req_read fifo_data 1 1 } } }
	stateTable2txIbh_rsp { ap_fifo {  { stateTable2txIbh_rsp_din fifo_port_we 1 192 }  { stateTable2txIbh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2txIbh_rsp_fifo_cap fifo_update 0 2 }  { stateTable2txIbh_rsp_full_n fifo_status 0 1 }  { stateTable2txIbh_rsp_write fifo_data 1 1 } } }
	qpi2stateTable_upd_req { ap_fifo {  { qpi2stateTable_upd_req_dout fifo_port_we 0 160 }  { qpi2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { qpi2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { qpi2stateTable_upd_req_empty_n fifo_status 0 1 }  { qpi2stateTable_upd_req_read fifo_data 1 1 } } }
	stateTable2qpi_rsp { ap_fifo {  { stateTable2qpi_rsp_din fifo_port_we 1 192 }  { stateTable2qpi_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2qpi_rsp_fifo_cap fifo_update 0 2 }  { stateTable2qpi_rsp_full_n fifo_status 0 1 }  { stateTable2qpi_rsp_write fifo_data 1 1 } } }
}
