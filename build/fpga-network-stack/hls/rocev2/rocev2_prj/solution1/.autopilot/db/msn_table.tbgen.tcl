set moduleName msn_table
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
set C_modelName {msn_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxExh2msnTable_upd_req int 192 regular {fifo 0 volatile } {global 0}  }
	{ msnTable2rxExh_rsp int 192 regular {fifo 1 volatile } {global 1}  }
	{ txExh2msnTable_req int 16 regular {fifo 0 volatile } {global 0}  }
	{ msnTable2txExh_rsp int 64 regular {fifo 1 volatile } {global 1}  }
	{ if2msnTable_init int 64 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxExh2msnTable_upd_req", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2rxExh_rsp", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txExh2msnTable_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2txExh_rsp", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "if2msnTable_init", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} ]}
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
	{ rxExh2msnTable_upd_req_dout sc_in sc_lv 192 signal 0 } 
	{ rxExh2msnTable_upd_req_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rxExh2msnTable_upd_req_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rxExh2msnTable_upd_req_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxExh2msnTable_upd_req_read sc_out sc_logic 1 signal 0 } 
	{ txExh2msnTable_req_dout sc_in sc_lv 16 signal 2 } 
	{ txExh2msnTable_req_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ txExh2msnTable_req_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ txExh2msnTable_req_empty_n sc_in sc_logic 1 signal 2 } 
	{ txExh2msnTable_req_read sc_out sc_logic 1 signal 2 } 
	{ if2msnTable_init_dout sc_in sc_lv 64 signal 4 } 
	{ if2msnTable_init_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ if2msnTable_init_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ if2msnTable_init_empty_n sc_in sc_logic 1 signal 4 } 
	{ if2msnTable_init_read sc_out sc_logic 1 signal 4 } 
	{ msnTable2txExh_rsp_din sc_out sc_lv 64 signal 3 } 
	{ msnTable2txExh_rsp_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ msnTable2txExh_rsp_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ msnTable2txExh_rsp_full_n sc_in sc_logic 1 signal 3 } 
	{ msnTable2txExh_rsp_write sc_out sc_logic 1 signal 3 } 
	{ msnTable2rxExh_rsp_din sc_out sc_lv 192 signal 1 } 
	{ msnTable2rxExh_rsp_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ msnTable2rxExh_rsp_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ msnTable2rxExh_rsp_full_n sc_in sc_logic 1 signal 1 } 
	{ msnTable2rxExh_rsp_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxExh2msnTable_upd_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "dout" }} , 
 	{ "name": "rxExh2msnTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rxExh2msnTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rxExh2msnTable_upd_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "empty_n" }} , 
 	{ "name": "rxExh2msnTable_upd_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_req", "role": "read" }} , 
 	{ "name": "txExh2msnTable_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "dout" }} , 
 	{ "name": "txExh2msnTable_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "num_data_valid" }} , 
 	{ "name": "txExh2msnTable_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "fifo_cap" }} , 
 	{ "name": "txExh2msnTable_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "empty_n" }} , 
 	{ "name": "txExh2msnTable_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "read" }} , 
 	{ "name": "if2msnTable_init_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "dout" }} , 
 	{ "name": "if2msnTable_init_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "num_data_valid" }} , 
 	{ "name": "if2msnTable_init_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "fifo_cap" }} , 
 	{ "name": "if2msnTable_init_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "empty_n" }} , 
 	{ "name": "if2msnTable_init_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init", "role": "read" }} , 
 	{ "name": "msnTable2txExh_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "din" }} , 
 	{ "name": "msnTable2txExh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "msnTable2txExh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "msnTable2txExh_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "full_n" }} , 
 	{ "name": "msnTable2txExh_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "write" }} , 
 	{ "name": "msnTable2rxExh_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "din" }} , 
 	{ "name": "msnTable2rxExh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "msnTable2rxExh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "msnTable2rxExh_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "full_n" }} , 
 	{ "name": "msnTable2rxExh_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "msn_table",
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
			{"Name" : "rxExh2msnTable_upd_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxExh2msnTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msn_table_msn_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_vaddr_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_dma_length_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_r_key_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msnTable2rxExh_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2rxExh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txExh2msnTable_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txExh2msnTable_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2txExh_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2txExh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "if2msnTable_init", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "if2msnTable_init_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_msn_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_vaddr_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_dma_length_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_r_key_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	msn_table {
		rxExh2msnTable_upd_req {Type I LastRead 0 FirstWrite -1}
		msn_table_msn_V {Type IO LastRead -1 FirstWrite -1}
		msn_table_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		msn_table_dma_length_V {Type IO LastRead -1 FirstWrite -1}
		msn_table_r_key_V {Type IO LastRead -1 FirstWrite -1}
		msnTable2rxExh_rsp {Type O LastRead -1 FirstWrite 5}
		txExh2msnTable_req {Type I LastRead 1 FirstWrite -1}
		msnTable2txExh_rsp {Type O LastRead -1 FirstWrite 5}
		if2msnTable_init {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxExh2msnTable_upd_req { ap_fifo {  { rxExh2msnTable_upd_req_dout fifo_port_we 0 192 }  { rxExh2msnTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rxExh2msnTable_upd_req_fifo_cap fifo_update 0 2 }  { rxExh2msnTable_upd_req_empty_n fifo_status 0 1 }  { rxExh2msnTable_upd_req_read fifo_data 1 1 } } }
	msnTable2rxExh_rsp { ap_fifo {  { msnTable2rxExh_rsp_din fifo_port_we 1 192 }  { msnTable2rxExh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { msnTable2rxExh_rsp_fifo_cap fifo_update 0 2 }  { msnTable2rxExh_rsp_full_n fifo_status 0 1 }  { msnTable2rxExh_rsp_write fifo_data 1 1 } } }
	txExh2msnTable_req { ap_fifo {  { txExh2msnTable_req_dout fifo_port_we 0 16 }  { txExh2msnTable_req_num_data_valid fifo_status_num_data_valid 0 2 }  { txExh2msnTable_req_fifo_cap fifo_update 0 2 }  { txExh2msnTable_req_empty_n fifo_status 0 1 }  { txExh2msnTable_req_read fifo_data 1 1 } } }
	msnTable2txExh_rsp { ap_fifo {  { msnTable2txExh_rsp_din fifo_port_we 1 64 }  { msnTable2txExh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { msnTable2txExh_rsp_fifo_cap fifo_update 0 2 }  { msnTable2txExh_rsp_full_n fifo_status 0 1 }  { msnTable2txExh_rsp_write fifo_data 1 1 } } }
	if2msnTable_init { ap_fifo {  { if2msnTable_init_dout fifo_port_we 0 64 }  { if2msnTable_init_num_data_valid fifo_status_num_data_valid 0 2 }  { if2msnTable_init_fifo_cap fifo_update 0 2 }  { if2msnTable_init_empty_n fifo_status 0 1 }  { if2msnTable_init_read fifo_data 1 1 } } }
}
