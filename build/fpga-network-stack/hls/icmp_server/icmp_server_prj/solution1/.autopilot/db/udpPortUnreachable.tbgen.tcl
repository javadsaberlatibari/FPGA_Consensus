set moduleName udpPortUnreachable
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {udpPortUnreachable}
set C_modelType { void 0 }
set C_modelArgList {
	{ udpIn int 128 regular {axi_s 0 volatile  { udpIn Data } }  }
	{ ttlIn int 128 regular {axi_s 0 volatile  { ttlIn Data } }  }
	{ udpPort2addIpHeader_data int 128 regular {fifo 1 volatile } {global 1}  }
	{ udpPort2addIpHeader_header int 64 regular {fifo 1 volatile } {global 1}  }
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "udpIn", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ttlIn", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "udpPort2addIpHeader_data", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "udpPort2addIpHeader_header", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ udpIn_TDATA sc_in sc_lv 128 signal 0 } 
	{ udpIn_TVALID sc_in sc_logic 1 invld 0 } 
	{ udpIn_TREADY sc_out sc_logic 1 inacc 0 } 
	{ ttlIn_TDATA sc_in sc_lv 128 signal 1 } 
	{ ttlIn_TVALID sc_in sc_logic 1 invld 1 } 
	{ ttlIn_TREADY sc_out sc_logic 1 inacc 1 } 
	{ udpPort2addIpHeader_data_din sc_out sc_lv 128 signal 2 } 
	{ udpPort2addIpHeader_data_num_data_valid sc_in sc_lv 9 signal 2 } 
	{ udpPort2addIpHeader_data_fifo_cap sc_in sc_lv 9 signal 2 } 
	{ udpPort2addIpHeader_data_full_n sc_in sc_logic 1 signal 2 } 
	{ udpPort2addIpHeader_data_write sc_out sc_logic 1 signal 2 } 
	{ udpPort2addIpHeader_header_din sc_out sc_lv 64 signal 3 } 
	{ udpPort2addIpHeader_header_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ udpPort2addIpHeader_header_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ udpPort2addIpHeader_header_full_n sc_in sc_logic 1 signal 3 } 
	{ udpPort2addIpHeader_header_write sc_out sc_logic 1 signal 3 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_din sc_out sc_lv 16 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid sc_in sc_lv 5 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap sc_in sc_lv 5 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_full_n sc_in sc_logic 1 signal 4 } 
	{ icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "udpIn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "udpIn", "role": "TDATA" }} , 
 	{ "name": "udpIn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "udpIn", "role": "TVALID" }} , 
 	{ "name": "udpIn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "udpIn", "role": "TREADY" }} , 
 	{ "name": "ttlIn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ttlIn", "role": "TDATA" }} , 
 	{ "name": "ttlIn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "ttlIn", "role": "TVALID" }} , 
 	{ "name": "ttlIn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "ttlIn", "role": "TREADY" }} , 
 	{ "name": "udpPort2addIpHeader_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_data", "role": "din" }} , 
 	{ "name": "udpPort2addIpHeader_data_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_data", "role": "num_data_valid" }} , 
 	{ "name": "udpPort2addIpHeader_data_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_data", "role": "fifo_cap" }} , 
 	{ "name": "udpPort2addIpHeader_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_data", "role": "full_n" }} , 
 	{ "name": "udpPort2addIpHeader_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_data", "role": "write" }} , 
 	{ "name": "udpPort2addIpHeader_header_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_header", "role": "din" }} , 
 	{ "name": "udpPort2addIpHeader_header_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_header", "role": "num_data_valid" }} , 
 	{ "name": "udpPort2addIpHeader_header_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_header", "role": "fifo_cap" }} , 
 	{ "name": "udpPort2addIpHeader_header_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_header", "role": "full_n" }} , 
 	{ "name": "udpPort2addIpHeader_header_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "udpPort2addIpHeader_header", "role": "write" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "din" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "num_data_valid" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "fifo_cap" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "full_n" }} , 
 	{ "name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "udpPortUnreachable",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "udpIn", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "udpIn_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ttlIn", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "ttlIn_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "udpState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipWordCounter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "streamSource_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpChecksum_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpPort2addIpHeader_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "udpPort2addIpHeader_header", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_header_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_udpIn_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_ttlIn_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	udpPortUnreachable {
		udpIn {Type I LastRead 0 FirstWrite -1}
		ttlIn {Type I LastRead 0 FirstWrite -1}
		udpState {Type IO LastRead -1 FirstWrite -1}
		ipWordCounter_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V {Type IO LastRead -1 FirstWrite -1}
		udpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_data {Type O LastRead 0 FirstWrite 0}
		udpPort2addIpHeader_header {Type O LastRead 0 FirstWrite 0}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams {Type O LastRead 0 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	udpIn { axis {  { udpIn_TDATA in_data 0 128 }  { udpIn_TVALID in_vld 0 1 }  { udpIn_TREADY in_acc 1 1 } } }
	ttlIn { axis {  { ttlIn_TDATA in_data 0 128 }  { ttlIn_TVALID in_vld 0 1 }  { ttlIn_TREADY in_acc 1 1 } } }
	udpPort2addIpHeader_data { ap_fifo {  { udpPort2addIpHeader_data_din fifo_port_we 1 128 }  { udpPort2addIpHeader_data_num_data_valid fifo_status_num_data_valid 0 9 }  { udpPort2addIpHeader_data_fifo_cap fifo_update 0 9 }  { udpPort2addIpHeader_data_full_n fifo_status 0 1 }  { udpPort2addIpHeader_data_write fifo_data 1 1 } } }
	udpPort2addIpHeader_header { ap_fifo {  { udpPort2addIpHeader_header_din fifo_port_we 1 64 }  { udpPort2addIpHeader_header_num_data_valid fifo_status_num_data_valid 0 7 }  { udpPort2addIpHeader_header_fifo_cap fifo_update 0 7 }  { udpPort2addIpHeader_header_full_n fifo_status 0 1 }  { udpPort2addIpHeader_header_write fifo_data 1 1 } } }
	icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams { ap_fifo {  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_din fifo_port_we 1 16 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid fifo_status_num_data_valid 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap fifo_update 0 5 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_full_n fifo_status 0 1 }  { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_write fifo_data 1 1 } } }
}
