set moduleName mq_process_requests_ap_uint_64_s
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
set C_modelName {mq_process_requests<ap_uint<64> >}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_readReqAddr_push int 128 regular {fifo 0 volatile } {global 0}  }
	{ mq_freeListFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerReqFifo int 32 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqAddr_pop_req int 64 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo int 48 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerUpdFifo int 64 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaRspFifo int 128 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqAddr_pop_rsp int 64 regular {fifo 1 volatile } {global 1}  }
	{ mq_releaseFifo int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_readReqAddr_push", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_freeListFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_req", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_rsp", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_releaseFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 57
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mq_pointerRspFifo_dout sc_in sc_lv 48 signal 4 } 
	{ mq_pointerRspFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ mq_pointerRspFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ mq_pointerRspFifo_empty_n sc_in sc_logic 1 signal 4 } 
	{ mq_pointerRspFifo_read sc_out sc_logic 1 signal 4 } 
	{ mq_metaRspFifo_dout sc_in sc_lv 128 signal 7 } 
	{ mq_metaRspFifo_num_data_valid sc_in sc_lv 2 signal 7 } 
	{ mq_metaRspFifo_fifo_cap sc_in sc_lv 2 signal 7 } 
	{ mq_metaRspFifo_empty_n sc_in sc_logic 1 signal 7 } 
	{ mq_metaRspFifo_read sc_out sc_logic 1 signal 7 } 
	{ rx_readReqAddr_pop_req_dout sc_in sc_lv 64 signal 3 } 
	{ rx_readReqAddr_pop_req_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rx_readReqAddr_pop_req_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rx_readReqAddr_pop_req_empty_n sc_in sc_logic 1 signal 3 } 
	{ rx_readReqAddr_pop_req_read sc_out sc_logic 1 signal 3 } 
	{ mq_freeListFifo_dout sc_in sc_lv 16 signal 1 } 
	{ mq_freeListFifo_num_data_valid sc_in sc_lv 12 signal 1 } 
	{ mq_freeListFifo_fifo_cap sc_in sc_lv 12 signal 1 } 
	{ mq_freeListFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ mq_freeListFifo_read sc_out sc_logic 1 signal 1 } 
	{ tx_readReqAddr_push_dout sc_in sc_lv 128 signal 0 } 
	{ tx_readReqAddr_push_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ tx_readReqAddr_push_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ tx_readReqAddr_push_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_readReqAddr_push_read sc_out sc_logic 1 signal 0 } 
	{ mq_metaReqFifo_din sc_out sc_lv 256 signal 5 } 
	{ mq_metaReqFifo_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ mq_metaReqFifo_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ mq_metaReqFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ mq_metaReqFifo_write sc_out sc_logic 1 signal 5 } 
	{ mq_pointerUpdFifo_din sc_out sc_lv 64 signal 6 } 
	{ mq_pointerUpdFifo_num_data_valid sc_in sc_lv 2 signal 6 } 
	{ mq_pointerUpdFifo_fifo_cap sc_in sc_lv 2 signal 6 } 
	{ mq_pointerUpdFifo_full_n sc_in sc_logic 1 signal 6 } 
	{ mq_pointerUpdFifo_write sc_out sc_logic 1 signal 6 } 
	{ rx_readReqAddr_pop_rsp_din sc_out sc_lv 64 signal 8 } 
	{ rx_readReqAddr_pop_rsp_num_data_valid sc_in sc_lv 2 signal 8 } 
	{ rx_readReqAddr_pop_rsp_fifo_cap sc_in sc_lv 2 signal 8 } 
	{ rx_readReqAddr_pop_rsp_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_readReqAddr_pop_rsp_write sc_out sc_logic 1 signal 8 } 
	{ mq_releaseFifo_din sc_out sc_lv 16 signal 9 } 
	{ mq_releaseFifo_num_data_valid sc_in sc_lv 2 signal 9 } 
	{ mq_releaseFifo_fifo_cap sc_in sc_lv 2 signal 9 } 
	{ mq_releaseFifo_full_n sc_in sc_logic 1 signal 9 } 
	{ mq_releaseFifo_write sc_out sc_logic 1 signal 9 } 
	{ mq_pointerReqFifo_din sc_out sc_lv 32 signal 2 } 
	{ mq_pointerReqFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ mq_pointerReqFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ mq_pointerReqFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ mq_pointerReqFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_pointerRspFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "dout" }} , 
 	{ "name": "mq_pointerRspFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerRspFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerRspFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "empty_n" }} , 
 	{ "name": "mq_pointerRspFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "dout" }} , 
 	{ "name": "mq_metaRspFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_metaRspFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_metaRspFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "empty_n" }} , 
 	{ "name": "mq_metaRspFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo", "role": "read" }} , 
 	{ "name": "rx_readReqAddr_pop_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "dout" }} , 
 	{ "name": "rx_readReqAddr_pop_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqAddr_pop_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqAddr_pop_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "empty_n" }} , 
 	{ "name": "rx_readReqAddr_pop_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_req", "role": "read" }} , 
 	{ "name": "mq_freeListFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "dout" }} , 
 	{ "name": "mq_freeListFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_freeListFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_freeListFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "empty_n" }} , 
 	{ "name": "mq_freeListFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo", "role": "read" }} , 
 	{ "name": "tx_readReqAddr_push_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "dout" }} , 
 	{ "name": "tx_readReqAddr_push_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "num_data_valid" }} , 
 	{ "name": "tx_readReqAddr_push_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "fifo_cap" }} , 
 	{ "name": "tx_readReqAddr_push_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "empty_n" }} , 
 	{ "name": "tx_readReqAddr_push_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_metaReqFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_metaReqFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo", "role": "write" }} , 
 	{ "name": "mq_pointerUpdFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "din" }} , 
 	{ "name": "mq_pointerUpdFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerUpdFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerUpdFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "full_n" }} , 
 	{ "name": "mq_pointerUpdFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo", "role": "write" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "din" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "num_data_valid" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "fifo_cap" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "full_n" }} , 
 	{ "name": "rx_readReqAddr_pop_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_rsp", "role": "write" }} , 
 	{ "name": "mq_releaseFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "din" }} , 
 	{ "name": "mq_releaseFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_releaseFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_releaseFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "full_n" }} , 
 	{ "name": "mq_releaseFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo", "role": "write" }} , 
 	{ "name": "mq_pointerReqFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "din" }} , 
 	{ "name": "mq_pointerReqFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "num_data_valid" }} , 
 	{ "name": "mq_pointerReqFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "fifo_cap" }} , 
 	{ "name": "mq_pointerReqFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "full_n" }} , 
 	{ "name": "mq_pointerReqFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mq_process_requests_ap_uint_64_s",
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
			{"Name" : "rt_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newMetaIdx_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "insert_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "insert_value_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "popRequest_op", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_head_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_tail_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_readReqAddr_push", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_freeListFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2048", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_freeListFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerReqFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "popRequest_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_pointerRspFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_releaseFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "mq_releaseFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	mq_process_requests_ap_uint_64_s {
		rt_state {Type IO LastRead -1 FirstWrite -1}
		newMetaIdx_V {Type IO LastRead -1 FirstWrite -1}
		insert_key_V {Type IO LastRead -1 FirstWrite -1}
		insert_value_V {Type IO LastRead -1 FirstWrite -1}
		popRequest_op {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_head_V {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_tail_V {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_valid {Type IO LastRead -1 FirstWrite -1}
		tx_readReqAddr_push {Type I LastRead 0 FirstWrite -1}
		mq_freeListFifo {Type I LastRead 0 FirstWrite -1}
		mq_pointerReqFifo {Type O LastRead -1 FirstWrite 1}
		rx_readReqAddr_pop_req {Type I LastRead 0 FirstWrite -1}
		popRequest_key_V {Type IO LastRead -1 FirstWrite -1}
		mq_pointerRspFifo {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo {Type O LastRead -1 FirstWrite 1}
		mq_pointerUpdFifo {Type O LastRead -1 FirstWrite 1}
		mq_metaRspFifo {Type I LastRead 0 FirstWrite -1}
		rx_readReqAddr_pop_rsp {Type O LastRead -1 FirstWrite 1}
		mq_releaseFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_readReqAddr_push { ap_fifo {  { tx_readReqAddr_push_dout fifo_port_we 0 128 }  { tx_readReqAddr_push_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_readReqAddr_push_fifo_cap fifo_update 0 2 }  { tx_readReqAddr_push_empty_n fifo_status 0 1 }  { tx_readReqAddr_push_read fifo_data 1 1 } } }
	mq_freeListFifo { ap_fifo {  { mq_freeListFifo_dout fifo_port_we 0 16 }  { mq_freeListFifo_num_data_valid fifo_status_num_data_valid 0 12 }  { mq_freeListFifo_fifo_cap fifo_update 0 12 }  { mq_freeListFifo_empty_n fifo_status 0 1 }  { mq_freeListFifo_read fifo_data 1 1 } } }
	mq_pointerReqFifo { ap_fifo {  { mq_pointerReqFifo_din fifo_port_we 1 32 }  { mq_pointerReqFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerReqFifo_fifo_cap fifo_update 0 2 }  { mq_pointerReqFifo_full_n fifo_status 0 1 }  { mq_pointerReqFifo_write fifo_data 1 1 } } }
	rx_readReqAddr_pop_req { ap_fifo {  { rx_readReqAddr_pop_req_dout fifo_port_we 0 64 }  { rx_readReqAddr_pop_req_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqAddr_pop_req_fifo_cap fifo_update 0 2 }  { rx_readReqAddr_pop_req_empty_n fifo_status 0 1 }  { rx_readReqAddr_pop_req_read fifo_data 1 1 } } }
	mq_pointerRspFifo { ap_fifo {  { mq_pointerRspFifo_dout fifo_port_we 0 48 }  { mq_pointerRspFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerRspFifo_fifo_cap fifo_update 0 2 }  { mq_pointerRspFifo_empty_n fifo_status 0 1 }  { mq_pointerRspFifo_read fifo_data 1 1 } } }
	mq_metaReqFifo { ap_fifo {  { mq_metaReqFifo_din fifo_port_we 1 256 }  { mq_metaReqFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_metaReqFifo_fifo_cap fifo_update 0 2 }  { mq_metaReqFifo_full_n fifo_status 0 1 }  { mq_metaReqFifo_write fifo_data 1 1 } } }
	mq_pointerUpdFifo { ap_fifo {  { mq_pointerUpdFifo_din fifo_port_we 1 64 }  { mq_pointerUpdFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_pointerUpdFifo_fifo_cap fifo_update 0 2 }  { mq_pointerUpdFifo_full_n fifo_status 0 1 }  { mq_pointerUpdFifo_write fifo_data 1 1 } } }
	mq_metaRspFifo { ap_fifo {  { mq_metaRspFifo_dout fifo_port_we 0 128 }  { mq_metaRspFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_metaRspFifo_fifo_cap fifo_update 0 2 }  { mq_metaRspFifo_empty_n fifo_status 0 1 }  { mq_metaRspFifo_read fifo_data 1 1 } } }
	rx_readReqAddr_pop_rsp { ap_fifo {  { rx_readReqAddr_pop_rsp_din fifo_port_we 1 64 }  { rx_readReqAddr_pop_rsp_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_readReqAddr_pop_rsp_fifo_cap fifo_update 0 2 }  { rx_readReqAddr_pop_rsp_full_n fifo_status 0 1 }  { rx_readReqAddr_pop_rsp_write fifo_data 1 1 } } }
	mq_releaseFifo { ap_fifo {  { mq_releaseFifo_din fifo_port_we 1 16 }  { mq_releaseFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { mq_releaseFifo_fifo_cap fifo_update 0 2 }  { mq_releaseFifo_full_n fifo_status 0 1 }  { mq_releaseFifo_write fifo_data 1 1 } } }
}
