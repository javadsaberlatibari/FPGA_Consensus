set moduleName rx_ibh_fsm
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
set C_modelName {rx_ibh_fsm}
set C_modelType { void 0 }
set C_modelArgList {
	{ regInvalidPsnDropCount int 32 regular {pointer 1}  }
	{ rx_ibh2fsm_MetaFifo int 192 regular {fifo 0 volatile } {global 0}  }
	{ rx_exhMetaFifo int 64 regular {fifo 0 volatile } {global 0}  }
	{ rxIbh2stateTable_upd_req int 96 regular {fifo 1 volatile } {global 1}  }
	{ stateTable2rxIbh_rsp int 128 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDropFifo int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhDropMetaFifo int 16 regular {fifo 1 volatile } {global 1}  }
	{ rx_fsm2exh_MetaFifo int 192 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhEventFifo int 96 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "regInvalidPsnDropCount", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rx_ibh2fsm_MetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxIbh2stateTable_upd_req", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2rxIbh_rsp", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDropFifo", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDropMetaFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_fsm2exh_MetaFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhEventFifo", "interface" : "fifo", "bitwidth" : 96, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 49
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ibh2fsm_MetaFifo_dout sc_in sc_lv 192 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_exhMetaFifo_dout sc_in sc_lv 64 signal 2 } 
	{ rx_exhMetaFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rx_exhMetaFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rx_exhMetaFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_exhMetaFifo_read sc_out sc_logic 1 signal 2 } 
	{ stateTable2rxIbh_rsp_dout sc_in sc_lv 128 signal 4 } 
	{ stateTable2rxIbh_rsp_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ stateTable2rxIbh_rsp_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ stateTable2rxIbh_rsp_empty_n sc_in sc_logic 1 signal 4 } 
	{ stateTable2rxIbh_rsp_read sc_out sc_logic 1 signal 4 } 
	{ rxIbh2stateTable_upd_req_din sc_out sc_lv 96 signal 3 } 
	{ rxIbh2stateTable_upd_req_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rxIbh2stateTable_upd_req_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rxIbh2stateTable_upd_req_full_n sc_in sc_logic 1 signal 3 } 
	{ rxIbh2stateTable_upd_req_write sc_out sc_logic 1 signal 3 } 
	{ rx_ibhDropMetaFifo_din sc_out sc_lv 16 signal 6 } 
	{ rx_ibhDropMetaFifo_num_data_valid sc_in sc_lv 2 signal 6 } 
	{ rx_ibhDropMetaFifo_fifo_cap sc_in sc_lv 2 signal 6 } 
	{ rx_ibhDropMetaFifo_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_ibhDropMetaFifo_write sc_out sc_logic 1 signal 6 } 
	{ rx_ibhDropFifo_din sc_out sc_lv 1 signal 5 } 
	{ rx_ibhDropFifo_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ rx_ibhDropFifo_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ rx_ibhDropFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_ibhDropFifo_write sc_out sc_logic 1 signal 5 } 
	{ rx_ibhEventFifo_din sc_out sc_lv 96 signal 8 } 
	{ rx_ibhEventFifo_num_data_valid sc_in sc_lv 2 signal 8 } 
	{ rx_ibhEventFifo_fifo_cap sc_in sc_lv 2 signal 8 } 
	{ rx_ibhEventFifo_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_ibhEventFifo_write sc_out sc_logic 1 signal 8 } 
	{ rx_fsm2exh_MetaFifo_din sc_out sc_lv 192 signal 7 } 
	{ rx_fsm2exh_MetaFifo_num_data_valid sc_in sc_lv 2 signal 7 } 
	{ rx_fsm2exh_MetaFifo_fifo_cap sc_in sc_lv 2 signal 7 } 
	{ rx_fsm2exh_MetaFifo_full_n sc_in sc_logic 1 signal 7 } 
	{ rx_fsm2exh_MetaFifo_write sc_out sc_logic 1 signal 7 } 
	{ regInvalidPsnDropCount sc_out sc_lv 32 signal 0 } 
	{ regInvalidPsnDropCount_ap_vld sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo", "role": "dout" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo", "role": "read" }} , 
 	{ "name": "rx_exhMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "dout" }} , 
 	{ "name": "rx_exhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exhMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_exhMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "read" }} , 
 	{ "name": "stateTable2rxIbh_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "dout" }} , 
 	{ "name": "stateTable2rxIbh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "stateTable2rxIbh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "stateTable2rxIbh_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "empty_n" }} , 
 	{ "name": "stateTable2rxIbh_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp", "role": "read" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "din" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "num_data_valid" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "fifo_cap" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "full_n" }} , 
 	{ "name": "rxIbh2stateTable_upd_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_req", "role": "write" }} , 
 	{ "name": "rx_ibhDropMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "din" }} , 
 	{ "name": "rx_ibhDropMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDropMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDropMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_ibhDropMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "write" }} , 
 	{ "name": "rx_ibhDropFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "din" }} , 
 	{ "name": "rx_ibhDropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDropFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "full_n" }} , 
 	{ "name": "rx_ibhDropFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo", "role": "write" }} , 
 	{ "name": "rx_ibhEventFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "din" }} , 
 	{ "name": "rx_ibhEventFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhEventFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhEventFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "full_n" }} , 
 	{ "name": "rx_ibhEventFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo", "role": "write" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "din" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo", "role": "write" }} , 
 	{ "name": "regInvalidPsnDropCount", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regInvalidPsnDropCount", "role": "default" }} , 
 	{ "name": "regInvalidPsnDropCount_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regInvalidPsnDropCount", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "rx_ibh_fsm",
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
			{"Name" : "regInvalidPsnDropCount", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "fsmState_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_partition_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_dest_qp_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_validPSN", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_numPkg_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "emeta_isNak", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "isResponse", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibh2fsm_MetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibh2fsm_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exhMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "emeta_numPkg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxIbh2stateTable_upd_req", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rxIbh2stateTable_upd_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2rxIbh_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2rxIbh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDropMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_fsm2exh_MetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_fsm2exh_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "droppedPackets_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibhEventFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhEventFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	rx_ibh_fsm {
		regInvalidPsnDropCount {Type O LastRead -1 FirstWrite 2}
		fsmState_4 {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_4 {Type IO LastRead -1 FirstWrite -1}
		meta_partition_key_V {Type IO LastRead -1 FirstWrite -1}
		meta_dest_qp_V_2 {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V_2 {Type IO LastRead -1 FirstWrite -1}
		meta_validPSN {Type IO LastRead -1 FirstWrite -1}
		meta_numPkg_V_1 {Type IO LastRead -1 FirstWrite -1}
		emeta_isNak {Type IO LastRead -1 FirstWrite -1}
		isResponse {Type IO LastRead -1 FirstWrite -1}
		rx_ibh2fsm_MetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_exhMetaFifo {Type I LastRead 0 FirstWrite -1}
		emeta_numPkg_V {Type IO LastRead -1 FirstWrite -1}
		rxIbh2stateTable_upd_req {Type O LastRead -1 FirstWrite 1}
		stateTable2rxIbh_rsp {Type I LastRead 0 FirstWrite -1}
		rx_ibhDropFifo {Type O LastRead -1 FirstWrite 2}
		rx_ibhDropMetaFifo {Type O LastRead -1 FirstWrite 2}
		rx_fsm2exh_MetaFifo {Type O LastRead -1 FirstWrite 2}
		droppedPackets_V {Type IO LastRead -1 FirstWrite -1}
		rx_ibhEventFifo {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	regInvalidPsnDropCount { ap_vld {  { regInvalidPsnDropCount out_data 1 32 }  { regInvalidPsnDropCount_ap_vld out_vld 1 1 } } }
	rx_ibh2fsm_MetaFifo { ap_fifo {  { rx_ibh2fsm_MetaFifo_dout fifo_port_we 0 192 }  { rx_ibh2fsm_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibh2fsm_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_ibh2fsm_MetaFifo_empty_n fifo_status 0 1 }  { rx_ibh2fsm_MetaFifo_read fifo_data 1 1 } } }
	rx_exhMetaFifo { ap_fifo {  { rx_exhMetaFifo_dout fifo_port_we 0 64 }  { rx_exhMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_exhMetaFifo_fifo_cap fifo_update 0 2 }  { rx_exhMetaFifo_empty_n fifo_status 0 1 }  { rx_exhMetaFifo_read fifo_data 1 1 } } }
	rxIbh2stateTable_upd_req { ap_fifo {  { rxIbh2stateTable_upd_req_din fifo_port_we 1 96 }  { rxIbh2stateTable_upd_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rxIbh2stateTable_upd_req_fifo_cap fifo_update 0 2 }  { rxIbh2stateTable_upd_req_full_n fifo_status 0 1 }  { rxIbh2stateTable_upd_req_write fifo_data 1 1 } } }
	stateTable2rxIbh_rsp { ap_fifo {  { stateTable2rxIbh_rsp_dout fifo_port_we 0 128 }  { stateTable2rxIbh_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { stateTable2rxIbh_rsp_fifo_cap fifo_update 0 2 }  { stateTable2rxIbh_rsp_empty_n fifo_status 0 1 }  { stateTable2rxIbh_rsp_read fifo_data 1 1 } } }
	rx_ibhDropFifo { ap_fifo {  { rx_ibhDropFifo_din fifo_port_we 1 1 }  { rx_ibhDropFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhDropFifo_fifo_cap fifo_update 0 2 }  { rx_ibhDropFifo_full_n fifo_status 0 1 }  { rx_ibhDropFifo_write fifo_data 1 1 } } }
	rx_ibhDropMetaFifo { ap_fifo {  { rx_ibhDropMetaFifo_din fifo_port_we 1 16 }  { rx_ibhDropMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhDropMetaFifo_fifo_cap fifo_update 0 2 }  { rx_ibhDropMetaFifo_full_n fifo_status 0 1 }  { rx_ibhDropMetaFifo_write fifo_data 1 1 } } }
	rx_fsm2exh_MetaFifo { ap_fifo {  { rx_fsm2exh_MetaFifo_din fifo_port_we 1 192 }  { rx_fsm2exh_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_fsm2exh_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_fsm2exh_MetaFifo_full_n fifo_status 0 1 }  { rx_fsm2exh_MetaFifo_write fifo_data 1 1 } } }
	rx_ibhEventFifo { ap_fifo {  { rx_ibhEventFifo_din fifo_port_we 1 96 }  { rx_ibhEventFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhEventFifo_fifo_cap fifo_update 0 2 }  { rx_ibhEventFifo_full_n fifo_status 0 1 }  { rx_ibhEventFifo_write fifo_data 1 1 } } }
}
