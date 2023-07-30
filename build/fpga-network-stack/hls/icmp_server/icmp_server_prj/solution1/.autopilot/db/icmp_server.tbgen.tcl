set moduleName icmp_server
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
set C_modelName {icmp_server}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis int 128 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ udpIn int 128 regular {axi_s 0 volatile  { udpIn Data } }  }
	{ ttlIn int 128 regular {axi_s 0 volatile  { ttlIn Data } }  }
	{ m_axis int 128 regular {axi_s 1 volatile  { m_axis Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "udpIn", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ttlIn", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ s_axis_TDATA sc_in sc_lv 128 signal 0 } 
	{ udpIn_TDATA sc_in sc_lv 128 signal 1 } 
	{ ttlIn_TDATA sc_in sc_lv 128 signal 2 } 
	{ m_axis_TDATA sc_out sc_lv 128 signal 3 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 0 } 
	{ udpIn_TVALID sc_in sc_logic 1 invld 1 } 
	{ udpIn_TREADY sc_out sc_logic 1 inacc 1 } 
	{ ttlIn_TVALID sc_in sc_logic 1 invld 2 } 
	{ ttlIn_TREADY sc_out sc_logic 1 inacc 2 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 3 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 3 } 
}
set NewPortList {[ 
	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis", "role": "TDATA" }} , 
 	{ "name": "udpIn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "udpIn", "role": "TDATA" }} , 
 	{ "name": "ttlIn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ttlIn", "role": "TDATA" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis", "role": "TDATA" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis", "role": "TVALID" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis", "role": "TREADY" }} , 
 	{ "name": "udpIn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "udpIn", "role": "TVALID" }} , 
 	{ "name": "udpIn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "udpIn", "role": "TREADY" }} , 
 	{ "name": "ttlIn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "ttlIn", "role": "TVALID" }} , 
 	{ "name": "ttlIn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "ttlIn", "role": "TREADY" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis", "role": "TVALID" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "6", "7", "8", "10", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "icmp_server",
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
			{"ID" : "1", "Name" : "check_icmp_checksum_U0"},
			{"ID" : "3", "Name" : "udpPortUnreachable_U0"}],
		"OutputProcess" : [
			{"ID" : "8", "Name" : "insertChecksum_U0"}],
		"Port" : [
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "s_axis"}]},
			{"Name" : "udpIn", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "udpIn"}]},
			{"Name" : "ttlIn", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "ttlIn"}]},
			{"Name" : "m_axis", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "m_axis"}]},
			{"Name" : "cics_writeLastOne", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_writeLastOne"}]},
			{"Name" : "cics_prevWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_prevWord_data_V"}]},
			{"Name" : "cics_prevWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_prevWord_keep_V"}]},
			{"Name" : "cics_prevWord_last_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_prevWord_last_V"}]},
			{"Name" : "packageBuffer1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dropper_U0", "Port" : "packageBuffer1"},
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "packageBuffer1"}]},
			{"Name" : "cics_computeCs", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_computeCs"}]},
			{"Name" : "cics_sums_V_3", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_sums_V_3"}]},
			{"Name" : "cics_sums_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_sums_V_1"}]},
			{"Name" : "cics_sums_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_sums_V"}]},
			{"Name" : "cics_sums_V_2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_sums_V_2"}]},
			{"Name" : "icmpChecksum_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "icmpChecksum_V"}]},
			{"Name" : "icmpType_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "icmpType_V"}]},
			{"Name" : "icmpCode_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "icmpCode_V"}]},
			{"Name" : "cics_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_state"}]},
			{"Name" : "validFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dropper_U0", "Port" : "validFifo"},
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "validFifo"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1"},
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1"}]},
			{"Name" : "cics_wordCount_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "check_icmp_checksum_U0", "Port" : "cics_wordCount_V"}]},
			{"Name" : "udpState", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "udpState"}]},
			{"Name" : "ipWordCounter_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "ipWordCounter_V"}]},
			{"Name" : "streamSource_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "streamSource_V"}]},
			{"Name" : "udpChecksum_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "udpChecksum_V"}]},
			{"Name" : "udpPort2addIpHeader_data", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "udpPort2addIpHeader_data"},
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "udpPort2addIpHeader_data"}]},
			{"Name" : "udpPort2addIpHeader_header", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "udpPort2addIpHeader_header"},
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "udpPort2addIpHeader_header"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udpPortUnreachable_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams"},
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams"}]},
			{"Name" : "addIpState", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "addIpState"}]},
			{"Name" : "tempWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "tempWord_data_V"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1"},
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1"}]},
			{"Name" : "tempWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "tempWord_keep_V"}]},
			{"Name" : "sourceIP_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "udpAddIpHeader_U0", "Port" : "sourceIP_V"}]},
			{"Name" : "d_isFirstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dropper_U0", "Port" : "d_isFirstWord"}]},
			{"Name" : "d_drop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dropper_U0", "Port" : "d_drop"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dropper_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams"},
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams"}]},
			{"Name" : "ic_wordCount_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "ic_wordCount_V"}]},
			{"Name" : "streamSource_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "insertChecksum_U0", "Port" : "streamSource_V_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.check_icmp_checksum_U0", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "check_icmp_checksum",
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
			{"Name" : "s_axis", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_writeLastOne", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_prevWord_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "packageBuffer1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "10", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "packageBuffer1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_computeCs", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_sums_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpChecksum_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpType_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmpCode_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "11", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "12", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_wordCount_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.check_icmp_checksum_U0.regslice_both_s_axis_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udpPortUnreachable_U0", "Parent" : "0", "Child" : ["4", "5"],
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
			{"Name" : "udpPort2addIpHeader_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "13", "DependentChanDepth" : "192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "udpPort2addIpHeader_header", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "14", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_header_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "15", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.udpPortUnreachable_U0.regslice_both_udpIn_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.udpPortUnreachable_U0.regslice_both_ttlIn_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udpAddIpHeader_U0", "Parent" : "0",
		"CDFG" : "udpAddIpHeader",
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
			{"Name" : "addIpState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tempWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpPort2addIpHeader_header", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "14", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_header_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "16", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tempWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sourceIP_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpPort2addIpHeader_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "13", "DependentChanDepth" : "192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpPort2addIpHeader_data_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dropper_U0", "Parent" : "0",
		"CDFG" : "dropper",
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
			{"Name" : "packageBuffer1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "10", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "packageBuffer1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "d_isFirstWord", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "d_drop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "11", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "17", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.insertChecksum_U0", "Parent" : "0", "Child" : ["9"],
		"CDFG" : "insertChecksum",
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
			{"Name" : "ic_wordCount_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "streamSource_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "17", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "16", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "12", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "15", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.insertChecksum_U0.regslice_both_m_axis_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.packageBuffer1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.validFifo_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udpPort2addIpHeader_data_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udpPort2addIpHeader_header_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	icmp_server {
		s_axis {Type I LastRead 0 FirstWrite -1}
		udpIn {Type I LastRead 0 FirstWrite -1}
		ttlIn {Type I LastRead 0 FirstWrite -1}
		m_axis {Type O LastRead -1 FirstWrite 1}
		cics_writeLastOne {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_last_V {Type IO LastRead -1 FirstWrite -1}
		packageBuffer1 {Type IO LastRead -1 FirstWrite -1}
		cics_computeCs {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_3 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_1 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_2 {Type IO LastRead -1 FirstWrite -1}
		icmpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		icmpType_V {Type IO LastRead -1 FirstWrite -1}
		icmpCode_V {Type IO LastRead -1 FirstWrite -1}
		cics_state {Type IO LastRead -1 FirstWrite -1}
		validFifo {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 {Type IO LastRead -1 FirstWrite -1}
		cics_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		udpState {Type IO LastRead -1 FirstWrite -1}
		ipWordCounter_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V {Type IO LastRead -1 FirstWrite -1}
		udpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_data {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_header {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams {Type IO LastRead -1 FirstWrite -1}
		addIpState {Type IO LastRead -1 FirstWrite -1}
		tempWord_data_V {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 {Type IO LastRead -1 FirstWrite -1}
		tempWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		sourceIP_V {Type IO LastRead -1 FirstWrite -1}
		d_isFirstWord {Type IO LastRead -1 FirstWrite -1}
		d_drop {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams {Type IO LastRead -1 FirstWrite -1}
		ic_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V_1 {Type IO LastRead -1 FirstWrite -1}}
	check_icmp_checksum {
		s_axis {Type I LastRead 0 FirstWrite -1}
		cics_writeLastOne {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		cics_prevWord_last_V {Type IO LastRead -1 FirstWrite -1}
		packageBuffer1 {Type O LastRead -1 FirstWrite 1}
		cics_computeCs {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_3 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_1 {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V {Type IO LastRead -1 FirstWrite -1}
		cics_sums_V_2 {Type IO LastRead -1 FirstWrite -1}
		icmpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		icmpType_V {Type IO LastRead -1 FirstWrite -1}
		icmpCode_V {Type IO LastRead -1 FirstWrite -1}
		cics_state {Type IO LastRead -1 FirstWrite -1}
		validFifo {Type O LastRead -1 FirstWrite 1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 {Type O LastRead -1 FirstWrite 1}
		cics_wordCount_V {Type IO LastRead -1 FirstWrite -1}}
	udpPortUnreachable {
		udpIn {Type I LastRead 0 FirstWrite -1}
		ttlIn {Type I LastRead 0 FirstWrite -1}
		udpState {Type IO LastRead -1 FirstWrite -1}
		ipWordCounter_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V {Type IO LastRead -1 FirstWrite -1}
		udpChecksum_V {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_data {Type O LastRead 0 FirstWrite 0}
		udpPort2addIpHeader_header {Type O LastRead 0 FirstWrite 0}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams {Type O LastRead 0 FirstWrite 0}}
	udpAddIpHeader {
		addIpState {Type IO LastRead -1 FirstWrite -1}
		tempWord_data_V {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_header {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 {Type O LastRead 0 FirstWrite 0}
		tempWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		sourceIP_V {Type IO LastRead -1 FirstWrite -1}
		udpPort2addIpHeader_data {Type I LastRead 0 FirstWrite -1}}
	dropper {
		packageBuffer1 {Type I LastRead 0 FirstWrite -1}
		d_isFirstWord {Type IO LastRead -1 FirstWrite -1}
		d_drop {Type IO LastRead -1 FirstWrite -1}
		validFifo {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams {Type O LastRead -1 FirstWrite 0}}
	insertChecksum {
		m_axis {Type O LastRead -1 FirstWrite 1}
		ic_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		streamSource_V_1 {Type IO LastRead -1 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 {Type I LastRead 0 FirstWrite -1}
		icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis { axis {  { s_axis_TDATA in_data 0 128 }  { s_axis_TVALID in_vld 0 1 }  { s_axis_TREADY in_acc 1 1 } } }
	udpIn { axis {  { udpIn_TDATA in_data 0 128 }  { udpIn_TVALID in_vld 0 1 }  { udpIn_TREADY in_acc 1 1 } } }
	ttlIn { axis {  { ttlIn_TDATA in_data 0 128 }  { ttlIn_TVALID in_vld 0 1 }  { ttlIn_TREADY in_acc 1 1 } } }
	m_axis { axis {  { m_axis_TDATA out_data 1 128 }  { m_axis_TVALID out_vld 1 1 }  { m_axis_TREADY out_acc 0 1 } } }
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
