set moduleName arp_server_subnet_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {arp_server_subnet_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis int 1024 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ s_axis_arp_lookup_request int 32 regular {axi_s 0 volatile  { s_axis_arp_lookup_request Data } }  }
	{ s_axis_host_arp_lookup_request int 32 regular {axi_s 0 volatile  { s_axis_host_arp_lookup_request Data } }  }
	{ m_axis int 1024 regular {axi_s 1 volatile  { m_axis Data } }  }
	{ m_axis_arp_lookup_reply int 128 regular {axi_s 1 volatile  { m_axis_arp_lookup_reply Data } }  }
	{ m_axis_host_arp_lookup_reply int 128 regular {axi_s 1 volatile  { m_axis_host_arp_lookup_reply Data } }  }
	{ myMacAddress int 48 regular {ap_stable 0} }
	{ myIpAddress int 32 regular {ap_stable 0} }
	{ regRequestCount int 16 regular {pointer 1}  }
	{ regReplyCount int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_arp_lookup_request", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_host_arp_lookup_request", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_arp_lookup_reply", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_host_arp_lookup_reply", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "myMacAddress", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "myIpAddress", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "regRequestCount", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "regReplyCount", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ s_axis_TDATA sc_in sc_lv 1024 signal 0 } 
	{ s_axis_arp_lookup_request_TDATA sc_in sc_lv 32 signal 1 } 
	{ s_axis_host_arp_lookup_request_TDATA sc_in sc_lv 32 signal 2 } 
	{ m_axis_TDATA sc_out sc_lv 1024 signal 3 } 
	{ m_axis_arp_lookup_reply_TDATA sc_out sc_lv 128 signal 4 } 
	{ m_axis_host_arp_lookup_reply_TDATA sc_out sc_lv 128 signal 5 } 
	{ myMacAddress sc_in sc_lv 48 signal 6 } 
	{ myIpAddress sc_in sc_lv 32 signal 7 } 
	{ regRequestCount sc_out sc_lv 16 signal 8 } 
	{ regReplyCount sc_out sc_lv 16 signal 9 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 0 } 
	{ regRequestCount_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ regReplyCount_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 3 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 3 } 
	{ s_axis_arp_lookup_request_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_arp_lookup_request_TREADY sc_out sc_logic 1 inacc 1 } 
	{ s_axis_host_arp_lookup_request_TVALID sc_in sc_logic 1 invld 2 } 
	{ s_axis_host_arp_lookup_request_TREADY sc_out sc_logic 1 inacc 2 } 
	{ m_axis_arp_lookup_reply_TVALID sc_out sc_logic 1 outvld 4 } 
	{ m_axis_arp_lookup_reply_TREADY sc_in sc_logic 1 outacc 4 } 
	{ m_axis_host_arp_lookup_reply_TVALID sc_out sc_logic 1 outvld 5 } 
	{ m_axis_host_arp_lookup_reply_TREADY sc_in sc_logic 1 outacc 5 } 
}
set NewPortList {[ 
	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis", "role": "TDATA" }} , 
 	{ "name": "s_axis_arp_lookup_request_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TDATA" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TDATA" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis", "role": "TDATA" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TDATA" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TDATA" }} , 
 	{ "name": "myMacAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddress", "role": "default" }} , 
 	{ "name": "myIpAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIpAddress", "role": "default" }} , 
 	{ "name": "regRequestCount", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regRequestCount", "role": "default" }} , 
 	{ "name": "regReplyCount", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regReplyCount", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis", "role": "TVALID" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis", "role": "TREADY" }} , 
 	{ "name": "regRequestCount_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regRequestCount", "role": "ap_vld" }} , 
 	{ "name": "regReplyCount_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regReplyCount", "role": "ap_vld" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis", "role": "TVALID" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis", "role": "TREADY" }} , 
 	{ "name": "s_axis_arp_lookup_request_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TVALID" }} , 
 	{ "name": "s_axis_arp_lookup_request_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TREADY" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TVALID" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TVALID" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TREADY" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TVALID" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "12", "13", "14"],
		"CDFG" : "arp_server_subnet_top",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "process_arp_pkg_512_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "process_arp_pkg_512_U0"},
			{"ID" : "3", "Name" : "generate_arp_pkg_512_U0"},
			{"ID" : "5", "Name" : "arp_table_U0"}],
		"Port" : [
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "s_axis"}]},
			{"Name" : "s_axis_arp_lookup_request", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "s_axis_arp_lookup_request"}]},
			{"Name" : "s_axis_host_arp_lookup_request", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "s_axis_host_arp_lookup_request"}]},
			{"Name" : "m_axis", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "m_axis"}]},
			{"Name" : "m_axis_arp_lookup_reply", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "m_axis_arp_lookup_reply"}]},
			{"Name" : "m_axis_host_arp_lookup_reply", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "m_axis_host_arp_lookup_reply"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "regRequestCount", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "regRequestCount"}]},
			{"Name" : "regReplyCount", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "regReplyCount"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "header_ready"}]},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "header_idx"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "header_header_V"}]},
			{"Name" : "arpReplyMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "arpReplyMetaFifo"},
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "arpReplyMetaFifo"}]},
			{"Name" : "pag_requestCounter_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "pag_requestCounter_V"}]},
			{"Name" : "arpTableInsertFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "arpTableInsertFifo"},
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "arpTableInsertFifo"}]},
			{"Name" : "pag_replyCounter_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_arp_pkg_512_U0", "Port" : "pag_replyCounter_V"}]},
			{"Name" : "gap_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "gap_state"}]},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "header_idx_1"}]},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "header_header_V_1"}]},
			{"Name" : "arpRequestMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "arpRequestMetaFifo"},
					{"ID" : "3", "SubInstance" : "generate_arp_pkg_512_U0", "Port" : "arpRequestMetaFifo"}]},
			{"Name" : "arpTable_macAddress_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "arpTable_macAddress_V"}]},
			{"Name" : "arpTable_valid", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "arp_table_U0", "Port" : "arpTable_valid"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.process_arp_pkg_512_U0", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "process_arp_pkg_512_s",
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
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "regRequestCount", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "regReplyCount", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arpReplyMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "12", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpReplyMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pag_requestCounter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arpTableInsertFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "13", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpTableInsertFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pag_replyCounter_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_arp_pkg_512_U0.regslice_both_s_axis_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.generate_arp_pkg_512_U0", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "generate_arp_pkg_512_s",
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
			{"Name" : "m_axis", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "gap_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arpReplyMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "12", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpReplyMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arpRequestMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "14", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpRequestMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.generate_arp_pkg_512_U0.regslice_both_m_axis_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arp_table_U0", "Parent" : "0", "Child" : ["6", "7", "8", "9", "10", "11"],
		"CDFG" : "arp_table",
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
		"DependenceCheck" : [
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_47", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state1_pp0_iter0_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter0", "FromFinalOperation" : "ap_enable_operation_47", "FromFinalSV" : "0", "FromAddress" : "arpTable_macAddress_V_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_29", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state2_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_51", "ToFinalSV" : "1", "ToAddress" : "arpTable_macAddress_V_address0", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "RAW"},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_47", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state1_pp0_iter0_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter0", "FromFinalOperation" : "ap_enable_operation_47", "FromFinalSV" : "0", "FromAddress" : "arpTable_macAddress_V_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_37", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state2_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_57", "ToFinalSV" : "1", "ToAddress" : "arpTable_macAddress_V_address0", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "RAW"},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_49", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state1_pp0_iter0_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter0", "FromFinalOperation" : "ap_enable_operation_49", "FromFinalSV" : "0", "FromAddress" : "arpTable_valid_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_31", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state2_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_52", "ToFinalSV" : "1", "ToAddress" : "arpTable_valid_address0", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "RAW"},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_49", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state1_pp0_iter0_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter0", "FromFinalOperation" : "ap_enable_operation_49", "FromFinalSV" : "0", "FromAddress" : "arpTable_valid_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_39", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state2_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_58", "ToFinalSV" : "1", "ToAddress" : "arpTable_valid_address0", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "RAW"},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_29", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_51", "FromFinalSV" : "1", "FromAddress" : "arpTable_macAddress_V_address0", "FromType" : "R", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_47", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state1_pp0_iter0_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter0", "ToFinalOperation" : "ap_enable_operation_47", "ToFinalSV" : "0", "ToAddress" : "arpTable_macAddress_V_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "WAR", "StateEnableSignalListForFifoShift" : ["ap_enable_state1_pp0_iter0_stage0", "ap_enable_state2_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_31", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_52", "FromFinalSV" : "1", "FromAddress" : "arpTable_valid_address0", "FromType" : "R", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_49", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state1_pp0_iter0_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter0", "ToFinalOperation" : "ap_enable_operation_49", "ToFinalSV" : "0", "ToAddress" : "arpTable_valid_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "WAR", "StateEnableSignalListForFifoShift" : ["ap_enable_state1_pp0_iter0_stage0", "ap_enable_state2_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_37", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_57", "FromFinalSV" : "1", "FromAddress" : "arpTable_macAddress_V_address0", "FromType" : "R", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_47", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state1_pp0_iter0_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter0", "ToFinalOperation" : "ap_enable_operation_47", "ToFinalSV" : "0", "ToAddress" : "arpTable_macAddress_V_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "WAR", "StateEnableSignalListForFifoShift" : ["ap_enable_state1_pp0_iter0_stage0", "ap_enable_state2_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state1_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_39", "FromInitialSV" : "0", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_58", "FromFinalSV" : "1", "FromAddress" : "arpTable_valid_address0", "FromType" : "R", "ToInitialState" : "ap_enable_state1_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_49", "ToInitialSV" : "0", "ToFinalState" : "ap_enable_state1_pp0_iter0_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter0", "ToFinalOperation" : "ap_enable_operation_49", "ToFinalSV" : "0", "ToAddress" : "arpTable_valid_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet.cpp:178:9)", "Type" : "WAR", "StateEnableSignalListForFifoShift" : ["ap_enable_state1_pp0_iter0_stage0", "ap_enable_state2_pp0_iter1_stage0"]}],
		"Port" : [
			{"Name" : "s_axis_arp_lookup_request", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_arp_lookup_request_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_host_arp_lookup_request", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_host_arp_lookup_request_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_arp_lookup_reply", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_arp_lookup_reply_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_host_arp_lookup_reply", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_host_arp_lookup_reply_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arpTableInsertFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "13", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpTableInsertFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arpTable_macAddress_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "arpTable_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "arpRequestMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "14", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpRequestMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.arpTable_macAddress_V_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.arpTable_valid_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.regslice_both_s_axis_arp_lookup_request_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.regslice_both_s_axis_host_arp_lookup_request_U", "Parent" : "5"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.regslice_both_m_axis_arp_lookup_reply_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.arp_table_U0.regslice_both_m_axis_host_arp_lookup_reply_U", "Parent" : "5"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arpReplyMetaFifo_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arpTableInsertFifo_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arpRequestMetaFifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	arp_server_subnet_top {
		s_axis {Type I LastRead 0 FirstWrite -1}
		s_axis_arp_lookup_request {Type I LastRead 0 FirstWrite -1}
		s_axis_host_arp_lookup_request {Type I LastRead 0 FirstWrite -1}
		m_axis {Type O LastRead -1 FirstWrite 1}
		m_axis_arp_lookup_reply {Type O LastRead -1 FirstWrite 1}
		m_axis_host_arp_lookup_reply {Type O LastRead -1 FirstWrite 1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		myIpAddress {Type I LastRead 0 FirstWrite -1}
		regRequestCount {Type O LastRead -1 FirstWrite 2}
		regReplyCount {Type O LastRead -1 FirstWrite 2}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		arpReplyMetaFifo {Type IO LastRead -1 FirstWrite -1}
		pag_requestCounter_V {Type IO LastRead -1 FirstWrite -1}
		arpTableInsertFifo {Type IO LastRead -1 FirstWrite -1}
		pag_replyCounter_V {Type IO LastRead -1 FirstWrite -1}
		gap_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		arpRequestMetaFifo {Type IO LastRead -1 FirstWrite -1}
		arpTable_macAddress_V {Type IO LastRead -1 FirstWrite -1}
		arpTable_valid {Type IO LastRead -1 FirstWrite -1}}
	process_arp_pkg_512_s {
		s_axis {Type I LastRead 0 FirstWrite -1}
		myIpAddress {Type I LastRead 0 FirstWrite -1}
		regRequestCount {Type O LastRead -1 FirstWrite 2}
		regReplyCount {Type O LastRead -1 FirstWrite 2}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		arpReplyMetaFifo {Type O LastRead -1 FirstWrite 2}
		pag_requestCounter_V {Type IO LastRead -1 FirstWrite -1}
		arpTableInsertFifo {Type O LastRead -1 FirstWrite 2}
		pag_replyCounter_V {Type IO LastRead -1 FirstWrite -1}}
	generate_arp_pkg_512_s {
		m_axis {Type O LastRead -1 FirstWrite 1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		myIpAddress {Type I LastRead 0 FirstWrite -1}
		gap_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		arpReplyMetaFifo {Type I LastRead 0 FirstWrite -1}
		arpRequestMetaFifo {Type I LastRead 0 FirstWrite -1}}
	arp_table {
		s_axis_arp_lookup_request {Type I LastRead 0 FirstWrite -1}
		s_axis_host_arp_lookup_request {Type I LastRead 0 FirstWrite -1}
		m_axis_arp_lookup_reply {Type O LastRead -1 FirstWrite 1}
		m_axis_host_arp_lookup_reply {Type O LastRead -1 FirstWrite 1}
		arpTableInsertFifo {Type I LastRead 0 FirstWrite -1}
		arpTable_macAddress_V {Type IO LastRead -1 FirstWrite -1}
		arpTable_valid {Type IO LastRead -1 FirstWrite -1}
		arpRequestMetaFifo {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis { axis {  { s_axis_TDATA in_data 0 1024 }  { s_axis_TVALID in_vld 0 1 }  { s_axis_TREADY in_acc 1 1 } } }
	s_axis_arp_lookup_request { axis {  { s_axis_arp_lookup_request_TDATA in_data 0 32 }  { s_axis_arp_lookup_request_TVALID in_vld 0 1 }  { s_axis_arp_lookup_request_TREADY in_acc 1 1 } } }
	s_axis_host_arp_lookup_request { axis {  { s_axis_host_arp_lookup_request_TDATA in_data 0 32 }  { s_axis_host_arp_lookup_request_TVALID in_vld 0 1 }  { s_axis_host_arp_lookup_request_TREADY in_acc 1 1 } } }
	m_axis { axis {  { m_axis_TDATA out_data 1 1024 }  { m_axis_TVALID out_vld 1 1 }  { m_axis_TREADY out_acc 0 1 } } }
	m_axis_arp_lookup_reply { axis {  { m_axis_arp_lookup_reply_TDATA out_data 1 128 }  { m_axis_arp_lookup_reply_TVALID out_vld 1 1 }  { m_axis_arp_lookup_reply_TREADY out_acc 0 1 } } }
	m_axis_host_arp_lookup_reply { axis {  { m_axis_host_arp_lookup_reply_TDATA out_data 1 128 }  { m_axis_host_arp_lookup_reply_TVALID out_vld 1 1 }  { m_axis_host_arp_lookup_reply_TREADY out_acc 0 1 } } }
	myMacAddress { ap_stable {  { myMacAddress in_data 0 48 } } }
	myIpAddress { ap_stable {  { myIpAddress in_data 0 32 } } }
	regRequestCount { ap_vld {  { regRequestCount out_data 1 16 }  { regRequestCount_ap_vld out_vld 1 1 } } }
	regReplyCount { ap_vld {  { regReplyCount out_data 1 16 }  { regReplyCount_ap_vld out_vld 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
