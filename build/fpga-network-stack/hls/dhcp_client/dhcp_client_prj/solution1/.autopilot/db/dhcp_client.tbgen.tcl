set moduleName dhcp_client
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
set C_modelName {dhcp_client}
set C_modelType { void 0 }
set C_modelArgList {
	{ m_axis_open_port int 16 regular {axi_s 1 volatile  { m_axis_open_port Data } }  }
	{ s_axis_open_port_status int 8 regular {axi_s 0 volatile  { s_axis_open_port_status Data } }  }
	{ s_axis_rx_metadata int 128 regular {axi_s 0 volatile  { s_axis_rx_metadata Data } }  }
	{ s_axis_rx_data int 128 regular {axi_s 0 volatile  { s_axis_rx_data Data } }  }
	{ m_axis_tx_metadata int 128 regular {axi_s 1 volatile  { m_axis_tx_metadata Data } }  }
	{ m_axis_tx_length int 16 regular {axi_s 1 volatile  { m_axis_tx_length Data } }  }
	{ m_axis_tx_data int 128 regular {axi_s 1 volatile  { m_axis_tx_data Data } }  }
	{ dhcpEnable int 1 regular {pointer 0}  }
	{ inputIpAddress int 32 regular {pointer 0}  }
	{ dhcpIpAddressOut int 32 regular {pointer 1}  }
	{ myMacAddress int 48 regular {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_axis_open_port", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_open_port_status", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_rx_metadata", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_rx_data", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_tx_metadata", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_tx_length", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_tx_data", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dhcpEnable", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "inputIpAddress", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dhcpIpAddressOut", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "myMacAddress", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ m_axis_open_port_TDATA sc_out sc_lv 16 signal 0 } 
	{ s_axis_open_port_status_TDATA sc_in sc_lv 8 signal 1 } 
	{ s_axis_rx_metadata_TDATA sc_in sc_lv 128 signal 2 } 
	{ s_axis_rx_data_TDATA sc_in sc_lv 128 signal 3 } 
	{ m_axis_tx_metadata_TDATA sc_out sc_lv 128 signal 4 } 
	{ m_axis_tx_length_TDATA sc_out sc_lv 16 signal 5 } 
	{ m_axis_tx_data_TDATA sc_out sc_lv 128 signal 6 } 
	{ dhcpEnable sc_in sc_lv 1 signal 7 } 
	{ inputIpAddress sc_in sc_lv 32 signal 8 } 
	{ dhcpIpAddressOut sc_out sc_lv 32 signal 9 } 
	{ myMacAddress sc_in sc_lv 48 signal 10 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axis_open_port_TVALID sc_out sc_logic 1 outvld 0 } 
	{ m_axis_open_port_TREADY sc_in sc_logic 1 outacc 0 } 
	{ s_axis_open_port_status_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_open_port_status_TREADY sc_out sc_logic 1 inacc 1 } 
	{ s_axis_rx_metadata_TVALID sc_in sc_logic 1 invld 2 } 
	{ s_axis_rx_metadata_TREADY sc_out sc_logic 1 inacc 2 } 
	{ s_axis_rx_data_TVALID sc_in sc_logic 1 invld 3 } 
	{ s_axis_rx_data_TREADY sc_out sc_logic 1 inacc 3 } 
	{ dhcpIpAddressOut_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ m_axis_tx_metadata_TVALID sc_out sc_logic 1 outvld 4 } 
	{ m_axis_tx_metadata_TREADY sc_in sc_logic 1 outacc 4 } 
	{ m_axis_tx_length_TVALID sc_out sc_logic 1 outvld 5 } 
	{ m_axis_tx_length_TREADY sc_in sc_logic 1 outacc 5 } 
	{ m_axis_tx_data_TVALID sc_out sc_logic 1 outvld 6 } 
	{ m_axis_tx_data_TREADY sc_in sc_logic 1 outacc 6 } 
}
set NewPortList {[ 
	{ "name": "m_axis_open_port_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "m_axis_open_port", "role": "TDATA" }} , 
 	{ "name": "s_axis_open_port_status_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_axis_open_port_status", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_metadata_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis_rx_metadata", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_metadata_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_tx_metadata", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_length_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "m_axis_tx_length", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "dhcpEnable", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dhcpEnable", "role": "default" }} , 
 	{ "name": "inputIpAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputIpAddress", "role": "default" }} , 
 	{ "name": "dhcpIpAddressOut", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dhcpIpAddressOut", "role": "default" }} , 
 	{ "name": "myMacAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddress", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axis_open_port_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_open_port", "role": "TVALID" }} , 
 	{ "name": "m_axis_open_port_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_open_port", "role": "TREADY" }} , 
 	{ "name": "s_axis_open_port_status_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_open_port_status", "role": "TVALID" }} , 
 	{ "name": "s_axis_open_port_status_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_open_port_status", "role": "TREADY" }} , 
 	{ "name": "s_axis_rx_metadata_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_metadata", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_metadata_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_metadata", "role": "TREADY" }} , 
 	{ "name": "s_axis_rx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "dhcpIpAddressOut_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dhcpIpAddressOut", "role": "ap_vld" }} , 
 	{ "name": "m_axis_tx_metadata_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_metadata", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_metadata_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_metadata", "role": "TREADY" }} , 
 	{ "name": "m_axis_tx_length_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_length", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_length_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_length", "role": "TREADY" }} , 
 	{ "name": "m_axis_tx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_data", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "7", "8", "12", "13", "14"],
		"CDFG" : "dhcp_client",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "open_dhcp_port_U0"},
			{"ID" : "4", "Name" : "receive_message_U0"}],
		"OutputProcess" : [
			{"ID" : "7", "Name" : "dhcp_fsm_U0"},
			{"ID" : "8", "Name" : "send_message_U0"}],
		"Port" : [
			{"Name" : "m_axis_open_port", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "m_axis_open_port"}]},
			{"Name" : "s_axis_open_port_status", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "s_axis_open_port_status"}]},
			{"Name" : "s_axis_rx_metadata", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "s_axis_rx_metadata"}]},
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "s_axis_rx_data"}]},
			{"Name" : "m_axis_tx_metadata", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "m_axis_tx_metadata"}]},
			{"Name" : "m_axis_tx_length", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "m_axis_tx_length"}]},
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "m_axis_tx_data"}]},
			{"Name" : "dhcpEnable", "Type" : "Stable", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "dhcpEnable"}]},
			{"Name" : "inputIpAddress", "Type" : "Stable", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "inputIpAddress"}]},
			{"Name" : "dhcpIpAddressOut", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "dhcpIpAddressOut"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "myMacAddress"},
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "myMacAddress"}]},
			{"Name" : "openPortWaitTime_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "openPortWaitTime_V"}]},
			{"Name" : "odp_listenDone", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "odp_listenDone"}]},
			{"Name" : "odp_waitListenStatus", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "odp_waitListenStatus"}]},
			{"Name" : "portOpen", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "portOpen"},
					{"ID" : "1", "SubInstance" : "open_dhcp_port_U0", "Port" : "portOpen"}]},
			{"Name" : "rm_wordCount_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "rm_wordCount_V"}]},
			{"Name" : "rm_isReply", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "rm_isReply"}]},
			{"Name" : "rm_correctMac", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "rm_correctMac"}]},
			{"Name" : "rm_isDHCP", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "rm_isDHCP"}]},
			{"Name" : "meta_identifier_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "meta_identifier_V"}]},
			{"Name" : "meta_assignedIpAddress_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "meta_assignedIpAddress_V"}]},
			{"Name" : "meta_serverAddress_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "meta_serverAddress_V"}]},
			{"Name" : "meta_type_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "meta_type_V_1"}]},
			{"Name" : "dhcp_replyMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "dhcp_replyMetaFifo"},
					{"ID" : "4", "SubInstance" : "receive_message_U0", "Port" : "dhcp_replyMetaFifo"}]},
			{"Name" : "myIpAddress_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "myIpAddress_V"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "state"}]},
			{"Name" : "time_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "time_V"}]},
			{"Name" : "randomValue_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "randomValue_V"}]},
			{"Name" : "myIdentity_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "myIdentity_V"}]},
			{"Name" : "IpAddressBuffer_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "IpAddressBuffer_V"}]},
			{"Name" : "dhcp_requestMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "dhcp_requestMetaFifo"},
					{"ID" : "7", "SubInstance" : "dhcp_fsm_U0", "Port" : "dhcp_requestMetaFifo"}]},
			{"Name" : "sm_wordCount_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "sm_wordCount_V"}]},
			{"Name" : "meta_type_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "meta_type_V"}]},
			{"Name" : "meta_requestedIpAddress_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "send_message_U0", "Port" : "meta_requestedIpAddress_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.open_dhcp_port_U0", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "open_dhcp_port",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m_axis_open_port", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_open_port_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_open_port_status", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_open_port_status_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "openPortWaitTime_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "odp_listenDone", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "odp_waitListenStatus", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "portOpen", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "12", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "portOpen_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.open_dhcp_port_U0.regslice_both_m_axis_open_port_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.open_dhcp_port_U0.regslice_both_s_axis_open_port_status_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.receive_message_U0", "Parent" : "0", "Child" : ["5", "6"],
		"CDFG" : "receive_message",
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
			{"Name" : "s_axis_rx_metadata", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_metadata_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "rm_wordCount_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rm_isReply", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rm_correctMac", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rm_isDHCP", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_identifier_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_assignedIpAddress_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_serverAddress_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_type_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dhcp_replyMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "13", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_replyMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.receive_message_U0.regslice_both_s_axis_rx_metadata_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.receive_message_U0.regslice_both_s_axis_rx_data_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dhcp_fsm_U0", "Parent" : "0",
		"CDFG" : "dhcp_fsm",
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
			{"Name" : "dhcpIpAddressOut", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dhcpEnable", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "inputIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "myIpAddress_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "time_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "randomValue_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIdentity_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IpAddressBuffer_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "portOpen", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "12", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "portOpen_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dhcp_requestMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "14", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_requestMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dhcp_replyMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "13", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_replyMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.send_message_U0", "Parent" : "0", "Child" : ["9", "10", "11"],
		"CDFG" : "send_message",
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
			{"Name" : "m_axis_tx_metadata", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_metadata_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_tx_length", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_length_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "myMacAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "sm_wordCount_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_type_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_requestedIpAddress_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dhcp_requestMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "14", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "dhcp_requestMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.send_message_U0.regslice_both_m_axis_tx_metadata_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.send_message_U0.regslice_both_m_axis_tx_length_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.send_message_U0.regslice_both_m_axis_tx_data_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.portOpen_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dhcp_replyMetaFifo_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dhcp_requestMetaFifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dhcp_client {
		m_axis_open_port {Type O LastRead 0 FirstWrite 1}
		s_axis_open_port_status {Type I LastRead 1 FirstWrite -1}
		s_axis_rx_metadata {Type I LastRead 0 FirstWrite -1}
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_tx_metadata {Type O LastRead -1 FirstWrite 1}
		m_axis_tx_length {Type O LastRead -1 FirstWrite 1}
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		dhcpEnable {Type I LastRead 0 FirstWrite -1}
		inputIpAddress {Type I LastRead 0 FirstWrite -1}
		dhcpIpAddressOut {Type O LastRead -1 FirstWrite 1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		openPortWaitTime_V {Type IO LastRead -1 FirstWrite -1}
		odp_listenDone {Type IO LastRead -1 FirstWrite -1}
		odp_waitListenStatus {Type IO LastRead -1 FirstWrite -1}
		portOpen {Type IO LastRead -1 FirstWrite -1}
		rm_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		rm_isReply {Type IO LastRead -1 FirstWrite -1}
		rm_correctMac {Type IO LastRead -1 FirstWrite -1}
		rm_isDHCP {Type IO LastRead -1 FirstWrite -1}
		meta_identifier_V {Type IO LastRead -1 FirstWrite -1}
		meta_assignedIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		meta_serverAddress_V {Type IO LastRead -1 FirstWrite -1}
		meta_type_V_1 {Type IO LastRead -1 FirstWrite -1}
		dhcp_replyMetaFifo {Type IO LastRead -1 FirstWrite -1}
		myIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		time_V {Type IO LastRead -1 FirstWrite -1}
		randomValue_V {Type IO LastRead -1 FirstWrite -1}
		myIdentity_V {Type IO LastRead -1 FirstWrite -1}
		IpAddressBuffer_V {Type IO LastRead -1 FirstWrite -1}
		dhcp_requestMetaFifo {Type IO LastRead -1 FirstWrite -1}
		sm_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		meta_type_V {Type IO LastRead -1 FirstWrite -1}
		meta_requestedIpAddress_V {Type IO LastRead -1 FirstWrite -1}}
	open_dhcp_port {
		m_axis_open_port {Type O LastRead 0 FirstWrite 1}
		s_axis_open_port_status {Type I LastRead 1 FirstWrite -1}
		openPortWaitTime_V {Type IO LastRead -1 FirstWrite -1}
		odp_listenDone {Type IO LastRead -1 FirstWrite -1}
		odp_waitListenStatus {Type IO LastRead -1 FirstWrite -1}
		portOpen {Type O LastRead -1 FirstWrite 2}}
	receive_message {
		s_axis_rx_metadata {Type I LastRead 0 FirstWrite -1}
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		rm_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		rm_isReply {Type IO LastRead -1 FirstWrite -1}
		rm_correctMac {Type IO LastRead -1 FirstWrite -1}
		rm_isDHCP {Type IO LastRead -1 FirstWrite -1}
		meta_identifier_V {Type IO LastRead -1 FirstWrite -1}
		meta_assignedIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		meta_serverAddress_V {Type IO LastRead -1 FirstWrite -1}
		meta_type_V_1 {Type IO LastRead -1 FirstWrite -1}
		dhcp_replyMetaFifo {Type O LastRead -1 FirstWrite 1}}
	dhcp_fsm {
		dhcpIpAddressOut {Type O LastRead -1 FirstWrite 1}
		dhcpEnable {Type I LastRead 0 FirstWrite -1}
		inputIpAddress {Type I LastRead 0 FirstWrite -1}
		myIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		time_V {Type IO LastRead -1 FirstWrite -1}
		randomValue_V {Type IO LastRead -1 FirstWrite -1}
		myIdentity_V {Type IO LastRead -1 FirstWrite -1}
		IpAddressBuffer_V {Type IO LastRead -1 FirstWrite -1}
		portOpen {Type I LastRead 0 FirstWrite -1}
		dhcp_requestMetaFifo {Type O LastRead -1 FirstWrite 1}
		dhcp_replyMetaFifo {Type I LastRead 0 FirstWrite -1}}
	send_message {
		m_axis_tx_metadata {Type O LastRead -1 FirstWrite 1}
		m_axis_tx_length {Type O LastRead -1 FirstWrite 1}
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		sm_wordCount_V {Type IO LastRead -1 FirstWrite -1}
		meta_type_V {Type IO LastRead -1 FirstWrite -1}
		meta_requestedIpAddress_V {Type IO LastRead -1 FirstWrite -1}
		dhcp_requestMetaFifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	m_axis_open_port { axis {  { m_axis_open_port_TDATA out_data 1 16 }  { m_axis_open_port_TVALID out_vld 1 1 }  { m_axis_open_port_TREADY out_acc 0 1 } } }
	s_axis_open_port_status { axis {  { s_axis_open_port_status_TDATA in_data 0 8 }  { s_axis_open_port_status_TVALID in_vld 0 1 }  { s_axis_open_port_status_TREADY in_acc 1 1 } } }
	s_axis_rx_metadata { axis {  { s_axis_rx_metadata_TDATA in_data 0 128 }  { s_axis_rx_metadata_TVALID in_vld 0 1 }  { s_axis_rx_metadata_TREADY in_acc 1 1 } } }
	s_axis_rx_data { axis {  { s_axis_rx_data_TDATA in_data 0 128 }  { s_axis_rx_data_TVALID in_vld 0 1 }  { s_axis_rx_data_TREADY in_acc 1 1 } } }
	m_axis_tx_metadata { axis {  { m_axis_tx_metadata_TDATA out_data 1 128 }  { m_axis_tx_metadata_TVALID out_vld 1 1 }  { m_axis_tx_metadata_TREADY out_acc 0 1 } } }
	m_axis_tx_length { axis {  { m_axis_tx_length_TDATA out_data 1 16 }  { m_axis_tx_length_TVALID out_vld 1 1 }  { m_axis_tx_length_TREADY out_acc 0 1 } } }
	m_axis_tx_data { axis {  { m_axis_tx_data_TDATA out_data 1 128 }  { m_axis_tx_data_TVALID out_vld 1 1 }  { m_axis_tx_data_TREADY out_acc 0 1 } } }
	dhcpEnable { ap_stable {  { dhcpEnable in_data 0 1 } } }
	inputIpAddress { ap_stable {  { inputIpAddress in_data 0 32 } } }
	dhcpIpAddressOut { ap_vld {  { dhcpIpAddressOut out_data 1 32 }  { dhcpIpAddressOut_ap_vld out_vld 1 1 } } }
	myMacAddress { ap_stable {  { myMacAddress in_data 0 48 } } }
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
