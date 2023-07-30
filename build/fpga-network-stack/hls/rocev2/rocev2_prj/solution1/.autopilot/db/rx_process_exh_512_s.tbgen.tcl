set moduleName rx_process_exh_512_s
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
set C_modelName {rx_process_exh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ibh2exh_MetaFifo int 32 regular {fifo 0 volatile } {global 0}  }
	{ rx_shift2exhFifo int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_exhMetaFifo int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_exh2drop_MetaFifo int 512 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ibh2exh_MetaFifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_shift2exhFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhMetaFifo", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2drop_MetaFifo", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rx_shift2exhFifo_dout sc_in sc_lv 1024 signal 1 } 
	{ rx_shift2exhFifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ rx_shift2exhFifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ rx_shift2exhFifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_shift2exhFifo_read sc_out sc_logic 1 signal 1 } 
	{ rx_ibh2exh_MetaFifo_dout sc_in sc_lv 32 signal 0 } 
	{ rx_ibh2exh_MetaFifo_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ rx_ibh2exh_MetaFifo_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ rx_ibh2exh_MetaFifo_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ibh2exh_MetaFifo_read sc_out sc_logic 1 signal 0 } 
	{ rx_exh2dropFifo_din sc_out sc_lv 1024 signal 2 } 
	{ rx_exh2dropFifo_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ rx_exh2dropFifo_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ rx_exh2dropFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_exh2dropFifo_write sc_out sc_logic 1 signal 2 } 
	{ rx_exhMetaFifo_din sc_out sc_lv 64 signal 3 } 
	{ rx_exhMetaFifo_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ rx_exhMetaFifo_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ rx_exhMetaFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_exhMetaFifo_write sc_out sc_logic 1 signal 3 } 
	{ rx_exh2drop_MetaFifo_din sc_out sc_lv 512 signal 4 } 
	{ rx_exh2drop_MetaFifo_num_data_valid sc_in sc_lv 4 signal 4 } 
	{ rx_exh2drop_MetaFifo_fifo_cap sc_in sc_lv 4 signal 4 } 
	{ rx_exh2drop_MetaFifo_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_exh2drop_MetaFifo_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_shift2exhFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_shift2exhFifo", "role": "dout" }} , 
 	{ "name": "rx_shift2exhFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_shift2exhFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_shift2exhFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_shift2exhFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_shift2exhFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo", "role": "empty_n" }} , 
 	{ "name": "rx_shift2exhFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo", "role": "read" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo", "role": "dout" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo", "role": "empty_n" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo", "role": "read" }} , 
 	{ "name": "rx_exh2dropFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "din" }} , 
 	{ "name": "rx_exh2dropFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2dropFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2dropFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "full_n" }} , 
 	{ "name": "rx_exh2dropFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo", "role": "write" }} , 
 	{ "name": "rx_exhMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "din" }} , 
 	{ "name": "rx_exhMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exhMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exhMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_exhMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo", "role": "write" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "din" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "rx_process_exh_512_s",
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
			{"Name" : "state_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "opCode", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibh2exh_MetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibh2exh_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_shift2exhFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_shift2exhFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackHeader_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exh2dropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exhMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2drop_MetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2drop_MetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rdmaHeader_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_header_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33ns_35ns_66_2_1_U43", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rx_process_exh_512_s {
		state_1 {Type IO LastRead -1 FirstWrite -1}
		opCode {Type IO LastRead -1 FirstWrite -1}
		metaWritten_1 {Type IO LastRead -1 FirstWrite -1}
		rx_ibh2exh_MetaFifo {Type I LastRead 0 FirstWrite -1}
		rx_shift2exhFifo {Type I LastRead 0 FirstWrite -1}
		ackHeader_ready {Type IO LastRead -1 FirstWrite -1}
		ackHeader_idx {Type IO LastRead -1 FirstWrite -1}
		ackHeader_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_exh2dropFifo {Type O LastRead -1 FirstWrite 1}
		rx_exhMetaFifo {Type O LastRead -1 FirstWrite 5}
		rx_exh2drop_MetaFifo {Type O LastRead -1 FirstWrite 5}
		rdmaHeader_ready {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_idx {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_header_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ibh2exh_MetaFifo { ap_fifo {  { rx_ibh2exh_MetaFifo_dout fifo_port_we 0 32 }  { rx_ibh2exh_MetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_ibh2exh_MetaFifo_fifo_cap fifo_update 0 2 }  { rx_ibh2exh_MetaFifo_empty_n fifo_status 0 1 }  { rx_ibh2exh_MetaFifo_read fifo_data 1 1 } } }
	rx_shift2exhFifo { ap_fifo {  { rx_shift2exhFifo_dout fifo_port_we 0 1024 }  { rx_shift2exhFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_shift2exhFifo_fifo_cap fifo_update 0 2 }  { rx_shift2exhFifo_empty_n fifo_status 0 1 }  { rx_shift2exhFifo_read fifo_data 1 1 } } }
	rx_exh2dropFifo { ap_fifo {  { rx_exh2dropFifo_din fifo_port_we 1 1024 }  { rx_exh2dropFifo_num_data_valid fifo_status_num_data_valid 0 6 }  { rx_exh2dropFifo_fifo_cap fifo_update 0 6 }  { rx_exh2dropFifo_full_n fifo_status 0 1 }  { rx_exh2dropFifo_write fifo_data 1 1 } } }
	rx_exhMetaFifo { ap_fifo {  { rx_exhMetaFifo_din fifo_port_we 1 64 }  { rx_exhMetaFifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rx_exhMetaFifo_fifo_cap fifo_update 0 2 }  { rx_exhMetaFifo_full_n fifo_status 0 1 }  { rx_exhMetaFifo_write fifo_data 1 1 } } }
	rx_exh2drop_MetaFifo { ap_fifo {  { rx_exh2drop_MetaFifo_din fifo_port_we 1 512 }  { rx_exh2drop_MetaFifo_num_data_valid fifo_status_num_data_valid 0 4 }  { rx_exh2drop_MetaFifo_fifo_cap fifo_update 0 4 }  { rx_exh2drop_MetaFifo_full_n fifo_status 0 1 }  { rx_exh2drop_MetaFifo_write fifo_data 1 1 } } }
}
