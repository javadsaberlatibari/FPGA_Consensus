set moduleName generate_exh_512_s
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
set C_modelName {generate_exh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_exhMetaFifo int 256 regular {fifo 0 volatile } {global 0}  }
	{ txExh2msnTable_req int 16 regular {fifo 1 volatile } {global 1}  }
	{ msnTable2txExh_rsp int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ tx_packetInfoFifo int 24 regular {fifo 1 volatile } {global 1}  }
	{ tx_lengthFifo int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_readReqTable_upd int 64 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_exhMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txExh2msnTable_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2txExh_rsp", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_packetInfoFifo", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_lengthFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqTable_upd", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ msnTable2txExh_rsp_dout sc_in sc_lv 64 signal 2 } 
	{ msnTable2txExh_rsp_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ msnTable2txExh_rsp_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ msnTable2txExh_rsp_empty_n sc_in sc_logic 1 signal 2 } 
	{ msnTable2txExh_rsp_read sc_out sc_logic 1 signal 2 } 
	{ tx_exhMetaFifo_dout sc_in sc_lv 256 signal 0 } 
	{ tx_exhMetaFifo_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ tx_exhMetaFifo_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ tx_exhMetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_exhMetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ tx_packetInfoFifo_din sc_out sc_lv 24 signal 4 } 
	{ tx_packetInfoFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ tx_packetInfoFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ tx_packetInfoFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_packetInfoFifo_write sc_out sc_logic 1 signal 4 } 
	{ tx_exh2payFifo_din sc_out sc_lv 1024 signal 3 } 
	{ tx_exh2payFifo_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ tx_exh2payFifo_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ tx_exh2payFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_exh2payFifo_write sc_out sc_logic 1 signal 3 } 
	{ tx_lengthFifo_din sc_out sc_lv 16 signal 5 } 
	{ tx_lengthFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ tx_lengthFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ tx_lengthFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_lengthFifo_write sc_out sc_logic 1 signal 5 } 
	{ tx_readReqTable_upd_din sc_out sc_lv 64 signal 6 } 
	{ tx_readReqTable_upd_num_data_valid sc_in sc_lv 2 signal 6 } 
	{ tx_readReqTable_upd_fifo_cap sc_in sc_lv 2 signal 6 } 
	{ tx_readReqTable_upd_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_readReqTable_upd_write sc_out sc_logic 1 signal 6 } 
	{ txExh2msnTable_req_din sc_out sc_lv 16 signal 1 } 
	{ txExh2msnTable_req_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ txExh2msnTable_req_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ txExh2msnTable_req_full_n sc_in sc_logic 1 signal 1 } 
	{ txExh2msnTable_req_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "msnTable2txExh_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "dout" }} , 
 	{ "name": "msnTable2txExh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "msnTable2txExh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "msnTable2txExh_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "empty_n" }} , 
 	{ "name": "msnTable2txExh_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp", "role": "read" }} , 
 	{ "name": "tx_exhMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "dout" }} , 
 	{ "name": "tx_exhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_exhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_exhMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "empty_n" }} , 
 	{ "name": "tx_exhMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo", "role": "read" }} , 
 	{ "name": "tx_packetInfoFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "din" }} , 
 	{ "name": "tx_packetInfoFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_packetInfoFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_packetInfoFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "full_n" }} , 
 	{ "name": "tx_packetInfoFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo", "role": "write" }} , 
 	{ "name": "tx_exh2payFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "din" }} , 
 	{ "name": "tx_exh2payFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_exh2payFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_exh2payFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "full_n" }} , 
 	{ "name": "tx_exh2payFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo", "role": "write" }} , 
 	{ "name": "tx_lengthFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "din" }} , 
 	{ "name": "tx_lengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_lengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_lengthFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "full_n" }} , 
 	{ "name": "tx_lengthFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "write" }} , 
 	{ "name": "tx_readReqTable_upd_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "din" }} , 
 	{ "name": "tx_readReqTable_upd_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "num_data_valid" }} , 
 	{ "name": "tx_readReqTable_upd_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "fifo_cap" }} , 
 	{ "name": "tx_readReqTable_upd_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "full_n" }} , 
 	{ "name": "tx_readReqTable_upd_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd", "role": "write" }} , 
 	{ "name": "txExh2msnTable_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "din" }} , 
 	{ "name": "txExh2msnTable_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "num_data_valid" }} , 
 	{ "name": "txExh2msnTable_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "fifo_cap" }} , 
 	{ "name": "txExh2msnTable_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "full_n" }} , 
 	{ "name": "txExh2msnTable_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "generate_exh_512_s",
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
			{"Name" : "ge_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_addr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_isNak", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "msnMeta_msn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "msnMeta_r_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_exhMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_op_code_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_qpn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txExh2msnTable_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "txExh2msnTable_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2txExh_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2txExh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_packetInfoFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_packetInfoFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_lengthFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_lengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqTable_upd", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqTable_upd_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackHeader_header_V_1", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	generate_exh_512_s {
		ge_state {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_idx_1 {Type IO LastRead -1 FirstWrite -1}
		ackHeader_idx_1 {Type IO LastRead -1 FirstWrite -1}
		meta_addr_V {Type IO LastRead -1 FirstWrite -1}
		meta_length_V {Type IO LastRead -1 FirstWrite -1}
		meta_isNak {Type IO LastRead -1 FirstWrite -1}
		metaWritten_4 {Type IO LastRead -1 FirstWrite -1}
		msnMeta_msn_V {Type IO LastRead -1 FirstWrite -1}
		msnMeta_r_key_V {Type IO LastRead -1 FirstWrite -1}
		tx_exhMetaFifo {Type I LastRead 0 FirstWrite -1}
		meta_op_code_3 {Type IO LastRead -1 FirstWrite -1}
		meta_qpn_V {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V_1 {Type IO LastRead -1 FirstWrite -1}
		txExh2msnTable_req {Type O LastRead -1 FirstWrite 1}
		msnTable2txExh_rsp {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo {Type O LastRead -1 FirstWrite 1}
		tx_packetInfoFifo {Type O LastRead -1 FirstWrite 1}
		tx_lengthFifo {Type O LastRead -1 FirstWrite 1}
		tx_readReqTable_upd {Type O LastRead -1 FirstWrite 1}
		ackHeader_header_V_1 {Type O LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_exhMetaFifo { ap_fifo {  { tx_exhMetaFifo_dout fifo_port_we 0 256 }  { tx_exhMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_exhMetaFifo_fifo_cap fifo_update 0 3 }  { tx_exhMetaFifo_empty_n fifo_status 0 1 }  { tx_exhMetaFifo_read fifo_data 1 1 } } }
	txExh2msnTable_req { ap_fifo {  { txExh2msnTable_req_din fifo_port_we 1 16 }  { txExh2msnTable_req_num_data_valid fifo_status_num_data_valid 0 2 }  { txExh2msnTable_req_fifo_cap fifo_update 0 2 }  { txExh2msnTable_req_full_n fifo_status 0 1 }  { txExh2msnTable_req_write fifo_data 1 1 } } }
	msnTable2txExh_rsp { ap_fifo {  { msnTable2txExh_rsp_dout fifo_port_we 0 64 }  { msnTable2txExh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { msnTable2txExh_rsp_fifo_cap fifo_update 0 2 }  { msnTable2txExh_rsp_empty_n fifo_status 0 1 }  { msnTable2txExh_rsp_read fifo_data 1 1 } } }
	tx_exh2payFifo { ap_fifo {  { tx_exh2payFifo_din fifo_port_we 1 1024 }  { tx_exh2payFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_exh2payFifo_fifo_cap fifo_update 0 3 }  { tx_exh2payFifo_full_n fifo_status 0 1 }  { tx_exh2payFifo_write fifo_data 1 1 } } }
	tx_packetInfoFifo { ap_fifo {  { tx_packetInfoFifo_din fifo_port_we 1 24 }  { tx_packetInfoFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_packetInfoFifo_fifo_cap fifo_update 0 2 }  { tx_packetInfoFifo_full_n fifo_status 0 1 }  { tx_packetInfoFifo_write fifo_data 1 1 } } }
	tx_lengthFifo { ap_fifo {  { tx_lengthFifo_din fifo_port_we 1 16 }  { tx_lengthFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_lengthFifo_fifo_cap fifo_update 0 3 }  { tx_lengthFifo_full_n fifo_status 0 1 }  { tx_lengthFifo_write fifo_data 1 1 } } }
	tx_readReqTable_upd { ap_fifo {  { tx_readReqTable_upd_din fifo_port_we 1 64 }  { tx_readReqTable_upd_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_readReqTable_upd_fifo_cap fifo_update 0 2 }  { tx_readReqTable_upd_full_n fifo_status 0 1 }  { tx_readReqTable_upd_write fifo_data 1 1 } } }
}
