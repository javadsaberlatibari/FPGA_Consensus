set moduleName ipUdpMetaHandler_512_s
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
set C_modelName {ipUdpMetaHandler<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ipUdpMetaFifo int 256 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2drop_MetaFifo int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDropMetaFifo int 16 regular {fifo 0 volatile } {global 0}  }
	{ exh_lengthFifo int 16 regular {fifo 1 volatile } {global 1}  }
	{ rx_drop2exhFsm_MetaFifo int 512 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ipUdpMetaFifo", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2drop_MetaFifo", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDropMetaFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "exh_lengthFifo", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_drop2exhFsm_MetaFifo", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rx_ipUdpMetaFifo_dout sc_in sc_lv 256 signal 0 } 
	{ rx_ipUdpMetaFifo_num_data_valid sc_in sc_lv 4 signal 0 } 
	{ rx_ipUdpMetaFifo_fifo_cap sc_in sc_lv 4 signal 0 } 
	{ rx_ipUdpMetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ipUdpMetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_exh2drop_MetaFifo_dout sc_in sc_lv 512 signal 1 } 
	{ rx_exh2drop_MetaFifo_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ rx_exh2drop_MetaFifo_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ rx_exh2drop_MetaFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_exh2drop_MetaFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_ibhDropMetaFifo_dout sc_in sc_lv 16 signal 2 } 
	{ rx_ibhDropMetaFifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rx_ibhDropMetaFifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rx_ibhDropMetaFifo_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_ibhDropMetaFifo_read sc_out sc_logic 1 signal 2 } 
	{ exh_lengthFifo_din sc_out sc_lv 16 signal 3 } 
	{ exh_lengthFifo_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ exh_lengthFifo_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ exh_lengthFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ exh_lengthFifo_write sc_out sc_logic 1 signal 3 } 
	{ rx_drop2exhFsm_MetaFifo_din sc_out sc_lv 512 signal 4 } 
	{ rx_drop2exhFsm_MetaFifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ rx_drop2exhFsm_MetaFifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ rx_drop2exhFsm_MetaFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_drop2exhFsm_MetaFifo_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ipUdpMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo", "role": "dout" }} , 
 	{ "name": "rx_ipUdpMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ipUdpMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ipUdpMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ipUdpMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo", "role": "read" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "dout" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "read" }} , 
 	{ "name": "rx_ibhDropMetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "dout" }} , 
 	{ "name": "rx_ibhDropMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibhDropMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibhDropMetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibhDropMetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo", "role": "read" }} , 
 	{ "name": "exh_lengthFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "din" }} , 
 	{ "name": "exh_lengthFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "num_data_valid" }} , 
 	{ "name": "exh_lengthFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "fifo_cap" }} , 
 	{ "name": "exh_lengthFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "full_n" }} , 
 	{ "name": "exh_lengthFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo", "role": "write" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "din" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_drop2exhFsm_MetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ipUdpMetaHandler_512_s",
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
			{"Name" : "rx_ipUdpMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ipUdpMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2drop_MetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2drop_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDropMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "exh_lengthFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "exh_lengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_drop2exhFsm_MetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_drop2exhFsm_MetaFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ipUdpMetaHandler_512_s {
		rx_ipUdpMetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_exh2drop_MetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_ibhDropMetaFifo {Type I LastRead 0 FirstWrite -1}
		exh_lengthFifo {Type O LastRead -1 FirstWrite 1}
		rx_drop2exhFsm_MetaFifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ipUdpMetaFifo { ap_fifo {  { rx_ipUdpMetaFifo_dout fifo_port_we 0 256 }  { rx_ipUdpMetaFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_ipUdpMetaFifo_fifo_cap fifo_update 0 4 }  { rx_ipUdpMetaFifo_empty_n fifo_status 0 1 }  { rx_ipUdpMetaFifo_read fifo_data 1 1 } } }
	rx_exh2drop_MetaFifo { ap_fifo {  { rx_exh2drop_MetaFifo_dout fifo_port_we 0 512 }  { rx_exh2drop_MetaFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_exh2drop_MetaFifo_fifo_cap fifo_update 0 4 }  { rx_exh2drop_MetaFifo_empty_n fifo_status 0 1 }  { rx_exh2drop_MetaFifo_read fifo_data 1 1 } } }
	rx_ibhDropMetaFifo { ap_fifo {  { rx_ibhDropMetaFifo_dout fifo_port_we 0 16 }  { rx_ibhDropMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibhDropMetaFifo_fifo_cap fifo_update 0 2 }  { rx_ibhDropMetaFifo_empty_n fifo_status 0 1 }  { rx_ibhDropMetaFifo_read fifo_data 1 1 } } }
	exh_lengthFifo { ap_fifo {  { exh_lengthFifo_din fifo_port_we 1 16 }  { exh_lengthFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { exh_lengthFifo_fifo_cap fifo_update 0 3 }  { exh_lengthFifo_full_n fifo_status 0 1 }  { exh_lengthFifo_write fifo_data 1 1 } } }
	rx_drop2exhFsm_MetaFifo { ap_fifo {  { rx_drop2exhFsm_MetaFifo_din fifo_port_we 1 512 }  { rx_drop2exhFsm_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_drop2exhFsm_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_drop2exhFsm_MetaFifo_full_n fifo_status 0 1 }  { rx_drop2exhFsm_MetaFifo_write fifo_data 1 1 } } }
}
