set moduleName tx_ipUdpMetaMerger
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
set C_modelName {tx_ipUdpMetaMerger}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_connTable2ibh_rsp int 384 regular {fifo 0 volatile } {global 0}  }
	{ tx_lengthFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_ipUdpMetaFifo int 256 regular {fifo 1 volatile } {global 1}  }
	{ tx_dstQpFifo int 24 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_connTable2ibh_rsp", "interface" : "fifo", "bitwidth" : 384, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_lengthFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_dstQpFifo", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_connTable2ibh_rsp_dout sc_in sc_lv 384 signal 0 } 
	{ tx_connTable2ibh_rsp_num_data_valid sc_in sc_lv 4 signal 0 } 
	{ tx_connTable2ibh_rsp_fifo_cap sc_in sc_lv 4 signal 0 } 
	{ tx_connTable2ibh_rsp_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_connTable2ibh_rsp_read sc_out sc_logic 1 signal 0 } 
	{ tx_lengthFifo_dout sc_in sc_lv 16 signal 1 } 
	{ tx_lengthFifo_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ tx_lengthFifo_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ tx_lengthFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_lengthFifo_read sc_out sc_logic 1 signal 1 } 
	{ tx_ipUdpMetaFifo_din sc_out sc_lv 256 signal 2 } 
	{ tx_ipUdpMetaFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ tx_ipUdpMetaFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ tx_ipUdpMetaFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ipUdpMetaFifo_write sc_out sc_logic 1 signal 2 } 
	{ tx_dstQpFifo_din sc_out sc_lv 24 signal 3 } 
	{ tx_dstQpFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ tx_dstQpFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ tx_dstQpFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_dstQpFifo_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_connTable2ibh_rsp_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":384, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "dout" }} , 
 	{ "name": "tx_connTable2ibh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "tx_connTable2ibh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "tx_connTable2ibh_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "empty_n" }} , 
 	{ "name": "tx_connTable2ibh_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "read" }} , 
 	{ "name": "tx_lengthFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "dout" }} , 
 	{ "name": "tx_lengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_lengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_lengthFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "empty_n" }} , 
 	{ "name": "tx_lengthFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo", "role": "read" }} , 
 	{ "name": "tx_ipUdpMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "din" }} , 
 	{ "name": "tx_ipUdpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_ipUdpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_ipUdpMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "full_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo", "role": "write" }} , 
 	{ "name": "tx_dstQpFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "din" }} , 
 	{ "name": "tx_dstQpFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "num_data_valid" }} , 
 	{ "name": "tx_dstQpFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "fifo_cap" }} , 
 	{ "name": "tx_dstQpFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "full_n" }} , 
 	{ "name": "tx_dstQpFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "tx_ipUdpMetaMerger",
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
			{"Name" : "tx_connTable2ibh_rsp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_connTable2ibh_rsp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_lengthFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_lengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_dstQpFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_dstQpFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	tx_ipUdpMetaMerger {
		tx_connTable2ibh_rsp {Type I LastRead 0 FirstWrite -1}
		tx_lengthFifo {Type I LastRead 0 FirstWrite -1}
		tx_ipUdpMetaFifo {Type O LastRead -1 FirstWrite 1}
		tx_dstQpFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_connTable2ibh_rsp { ap_fifo {  { tx_connTable2ibh_rsp_dout fifo_port_we 0 384 }  { tx_connTable2ibh_rsp_num_data_valid fifo_status_num_data_valid 0 4 }  { tx_connTable2ibh_rsp_fifo_cap fifo_update 0 4 }  { tx_connTable2ibh_rsp_empty_n fifo_status 0 1 }  { tx_connTable2ibh_rsp_read fifo_data 1 1 } } }
	tx_lengthFifo { ap_fifo {  { tx_lengthFifo_dout fifo_port_we 0 16 }  { tx_lengthFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { tx_lengthFifo_fifo_cap fifo_update 0 3 }  { tx_lengthFifo_empty_n fifo_status 0 1 }  { tx_lengthFifo_read fifo_data 1 1 } } }
	tx_ipUdpMetaFifo { ap_fifo {  { tx_ipUdpMetaFifo_din fifo_port_we 1 256 }  { tx_ipUdpMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ipUdpMetaFifo_fifo_cap fifo_update 0 2 }  { tx_ipUdpMetaFifo_full_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_write fifo_data 1 1 } } }
	tx_dstQpFifo { ap_fifo {  { tx_dstQpFifo_din fifo_port_we 1 24 }  { tx_dstQpFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_dstQpFifo_fifo_cap fifo_update 0 2 }  { tx_dstQpFifo_full_n fifo_status 0 1 }  { tx_dstQpFifo_write fifo_data 1 1 } } }
}
