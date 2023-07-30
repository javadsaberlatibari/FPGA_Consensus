set moduleName ip_handler_top
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
set C_modelName {ip_handler_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_raw int 1024 regular {axi_s 0 volatile  { s_axis_raw Data } }  }
	{ m_axis_arp int 1024 regular {axi_s 1 volatile  { m_axis_arp Data } }  }
	{ m_axis_icmpv6 int 1024 regular {axi_s 1 volatile  { m_axis_icmpv6 Data } }  }
	{ m_axis_ipv6udp int 1024 regular {axi_s 1 volatile  { m_axis_ipv6udp Data } }  }
	{ m_axis_icmp int 1024 regular {axi_s 1 volatile  { m_axis_icmp Data } }  }
	{ m_axis_udp int 1024 regular {axi_s 1 volatile  { m_axis_udp Data } }  }
	{ m_axis_tcp int 1024 regular {axi_s 1 volatile  { m_axis_tcp Data } }  }
	{ m_axis_roce int 1024 regular {axi_s 1 volatile  { m_axis_roce Data } }  }
	{ myIpAddress int 32 regular {ap_stable 0} }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_raw", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_arp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_icmpv6", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_ipv6udp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_icmp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_udp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_tcp", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_roce", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "myIpAddress", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ s_axis_raw_TDATA sc_in sc_lv 1024 signal 0 } 
	{ m_axis_arp_TDATA sc_out sc_lv 1024 signal 1 } 
	{ m_axis_icmpv6_TDATA sc_out sc_lv 1024 signal 2 } 
	{ m_axis_ipv6udp_TDATA sc_out sc_lv 1024 signal 3 } 
	{ m_axis_icmp_TDATA sc_out sc_lv 1024 signal 4 } 
	{ m_axis_udp_TDATA sc_out sc_lv 1024 signal 5 } 
	{ m_axis_tcp_TDATA sc_out sc_lv 1024 signal 6 } 
	{ m_axis_roce_TDATA sc_out sc_lv 1024 signal 7 } 
	{ myIpAddress sc_in sc_lv 32 signal 8 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_raw_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_raw_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_arp_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_arp_TREADY sc_in sc_logic 1 outacc 1 } 
	{ m_axis_icmp_TVALID sc_out sc_logic 1 outvld 4 } 
	{ m_axis_icmp_TREADY sc_in sc_logic 1 outacc 4 } 
	{ m_axis_tcp_TVALID sc_out sc_logic 1 outvld 6 } 
	{ m_axis_tcp_TREADY sc_in sc_logic 1 outacc 6 } 
	{ m_axis_icmpv6_TVALID sc_out sc_logic 1 outvld 2 } 
	{ m_axis_icmpv6_TREADY sc_in sc_logic 1 outacc 2 } 
	{ m_axis_ipv6udp_TVALID sc_out sc_logic 1 outvld 3 } 
	{ m_axis_ipv6udp_TREADY sc_in sc_logic 1 outacc 3 } 
	{ m_axis_udp_TVALID sc_out sc_logic 1 outvld 5 } 
	{ m_axis_udp_TREADY sc_in sc_logic 1 outacc 5 } 
	{ m_axis_roce_TVALID sc_out sc_logic 1 outvld 7 } 
	{ m_axis_roce_TREADY sc_in sc_logic 1 outacc 7 } 
}
set NewPortList {[ 
	{ "name": "s_axis_raw_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_raw", "role": "TDATA" }} , 
 	{ "name": "m_axis_arp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_arp", "role": "TDATA" }} , 
 	{ "name": "m_axis_icmpv6_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_icmpv6", "role": "TDATA" }} , 
 	{ "name": "m_axis_ipv6udp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_ipv6udp", "role": "TDATA" }} , 
 	{ "name": "m_axis_icmp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_icmp", "role": "TDATA" }} , 
 	{ "name": "m_axis_udp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_udp", "role": "TDATA" }} , 
 	{ "name": "m_axis_tcp_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_tcp", "role": "TDATA" }} , 
 	{ "name": "m_axis_roce_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_roce", "role": "TDATA" }} , 
 	{ "name": "myIpAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIpAddress", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_raw_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_raw", "role": "TVALID" }} , 
 	{ "name": "s_axis_raw_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_raw", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_arp", "role": "TVALID" }} , 
 	{ "name": "m_axis_arp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_arp", "role": "TREADY" }} , 
 	{ "name": "m_axis_icmp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_icmp", "role": "TVALID" }} , 
 	{ "name": "m_axis_icmp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_icmp", "role": "TREADY" }} , 
 	{ "name": "m_axis_tcp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tcp", "role": "TVALID" }} , 
 	{ "name": "m_axis_tcp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tcp", "role": "TREADY" }} , 
 	{ "name": "m_axis_icmpv6_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_icmpv6", "role": "TVALID" }} , 
 	{ "name": "m_axis_icmpv6_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_icmpv6", "role": "TREADY" }} , 
 	{ "name": "m_axis_ipv6udp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_ipv6udp", "role": "TVALID" }} , 
 	{ "name": "m_axis_ipv6udp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_ipv6udp", "role": "TREADY" }} , 
 	{ "name": "m_axis_udp_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_udp", "role": "TVALID" }} , 
 	{ "name": "m_axis_udp_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_udp", "role": "TREADY" }} , 
 	{ "name": "m_axis_roce_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_roce", "role": "TVALID" }} , 
 	{ "name": "m_axis_roce_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_roce", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "6", "7", "8", "10", "11", "12", "13", "15", "18", "21", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39"],
		"CDFG" : "ip_handler_top",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "25", "EstimateLatencyMax" : "25",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "detect_eth_protocol_512_U0"}],
		"OutputProcess" : [
			{"ID" : "18", "Name" : "detect_ipv6_protocol_512_U0"},
			{"ID" : "21", "Name" : "ip_handler_duplicate_stream_net_axis_512_U0"}],
		"Port" : [
			{"Name" : "s_axis_raw", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "s_axis_raw"}]},
			{"Name" : "m_axis_arp", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "m_axis_arp"}]},
			{"Name" : "m_axis_icmpv6", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "detect_ipv6_protocol_512_U0", "Port" : "m_axis_icmpv6"}]},
			{"Name" : "m_axis_ipv6udp", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "detect_ipv6_protocol_512_U0", "Port" : "m_axis_ipv6udp"}]},
			{"Name" : "m_axis_icmp", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "m_axis_icmp"}]},
			{"Name" : "m_axis_udp", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "ip_handler_duplicate_stream_net_axis_512_U0", "Port" : "m_axis_udp"}]},
			{"Name" : "m_axis_tcp", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "m_axis_tcp"}]},
			{"Name" : "m_axis_roce", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "ip_handler_duplicate_stream_net_axis_512_U0", "Port" : "m_axis_roce"}]},
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "header_ready_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "header_ready_1"}]},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "header_header_V_1"}]},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "header_idx_1"}]},
			{"Name" : "metaWritten_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "metaWritten_1"}]},
			{"Name" : "etherTypeFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "etherTypeFifo"},
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "etherTypeFifo"}]},
			{"Name" : "ethDataFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "detect_eth_protocol_512_U0", "Port" : "ethDataFifo"},
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "ethDataFifo"}]},
			{"Name" : "rep_fsmState_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "rep_fsmState_V"}]},
			{"Name" : "rep_etherType_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "rep_etherType_V"}]},
			{"Name" : "ipv4ShiftFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "ipv4ShiftFifo"},
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "ipv4ShiftFifo"}]},
			{"Name" : "ipv6ShiftFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "route_by_eth_protocol_512_U0", "Port" : "ipv6ShiftFifo"},
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "ipv6ShiftFifo"}]},
			{"Name" : "fsmState_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "fsmState_1"}]},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "prevWord_data_V_1"}]},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "prevWord_keep_V_1"}]},
			{"Name" : "rs_firstWord_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "rs_firstWord_1"}]},
			{"Name" : "ipDataFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Port" : "ipDataFifo"},
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "ipDataFifo"}]},
			{"Name" : "fsmState", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "fsmState"}]},
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "prevWord_data_V"}]},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "prevWord_keep_V"}]},
			{"Name" : "rs_firstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "rs_firstWord"}]},
			{"Name" : "ipv6DataFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Port" : "ipv6DataFifo"},
					{"ID" : "18", "SubInstance" : "detect_ipv6_protocol_512_U0", "Port" : "ipv6DataFifo"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "header_ready"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "header_header_V"}]},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "header_idx"}]},
			{"Name" : "ipDataMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "ipDataMetaFifo"},
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "ipDataMetaFifo"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "metaWritten"}]},
			{"Name" : "validIpAddressFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "validIpAddressFifo"},
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "validIpAddressFifo"}]},
			{"Name" : "ipv4ProtocolFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "extract_ip_meta_512_U0", "Port" : "ipv4ProtocolFifo"},
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "ipv4ProtocolFifo"}]},
			{"Name" : "ipDataCheckFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "ipDataCheckFifo"},
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "ipDataCheckFifo"}]},
			{"Name" : "cics_firstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_firstWord"}]},
			{"Name" : "cics_ip_sums_sum_V_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_0"}]},
			{"Name" : "cics_ip_sums_sum_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_1"}]},
			{"Name" : "cics_ip_sums_sum_V_2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_2"}]},
			{"Name" : "cics_ip_sums_sum_V_3", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_3"}]},
			{"Name" : "cics_ip_sums_sum_V_4", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_4"}]},
			{"Name" : "cics_ip_sums_sum_V_5", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_5"}]},
			{"Name" : "cics_ip_sums_sum_V_6", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_6"}]},
			{"Name" : "cics_ip_sums_sum_V_7", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_7"}]},
			{"Name" : "cics_ip_sums_sum_V_8", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_8"}]},
			{"Name" : "cics_ip_sums_sum_V_9", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_9"}]},
			{"Name" : "cics_ip_sums_sum_V_10", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_10"}]},
			{"Name" : "cics_ip_sums_sum_V_11", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_11"}]},
			{"Name" : "cics_ip_sums_sum_V_12", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_12"}]},
			{"Name" : "cics_ip_sums_sum_V_13", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_13"}]},
			{"Name" : "cics_ip_sums_sum_V_14", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_14"}]},
			{"Name" : "cics_ip_sums_sum_V_15", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_15"}]},
			{"Name" : "cics_ip_sums_sum_V_16", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_16"}]},
			{"Name" : "cics_ip_sums_sum_V_17", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_17"}]},
			{"Name" : "cics_ip_sums_sum_V_18", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_18"}]},
			{"Name" : "cics_ip_sums_sum_V_19", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_19"}]},
			{"Name" : "cics_ip_sums_sum_V_20", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_20"}]},
			{"Name" : "cics_ip_sums_sum_V_21", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_21"}]},
			{"Name" : "cics_ip_sums_sum_V_22", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_22"}]},
			{"Name" : "cics_ip_sums_sum_V_23", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_23"}]},
			{"Name" : "cics_ip_sums_sum_V_24", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_24"}]},
			{"Name" : "cics_ip_sums_sum_V_25", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_25"}]},
			{"Name" : "cics_ip_sums_sum_V_26", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_26"}]},
			{"Name" : "cics_ip_sums_sum_V_27", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_27"}]},
			{"Name" : "cics_ip_sums_sum_V_28", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_28"}]},
			{"Name" : "cics_ip_sums_sum_V_29", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "cics_ip_sums_sum_V_29"}]},
			{"Name" : "iph_subSumsFifoOut", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "ip_handler_compute_ipv4_checksum_U0", "Port" : "iph_subSumsFifoOut"},
					{"ID" : "11", "SubInstance" : "ip_handler_check_ipv4_checksum_32_U0", "Port" : "iph_subSumsFifoOut"}]},
			{"Name" : "validChecksumFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "ip_handler_check_ipv4_checksum_32_U0", "Port" : "validChecksumFifo"},
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "validChecksumFifo"}]},
			{"Name" : "iid_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "iid_state"}]},
			{"Name" : "ipv4ValidFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "ipv4ValidFifo"},
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "ipv4ValidFifo"}]},
			{"Name" : "ipDataDropFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "ip_invalid_dropper_512_U0", "Port" : "ipDataDropFifo"},
					{"ID" : "13", "SubInstance" : "cut_length_U0", "Port" : "ipDataDropFifo"}]},
			{"Name" : "cl_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "cut_length_U0", "Port" : "cl_state"}]},
			{"Name" : "ipDataCutFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "cut_length_U0", "Port" : "ipDataCutFifo"},
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "ipDataCutFifo"}]},
			{"Name" : "dip_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "dip_state"}]},
			{"Name" : "dip_ipProtocol_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "dip_ipProtocol_V"}]},
			{"Name" : "udpDataFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "detect_ipv4_protocol_512_U0", "Port" : "udpDataFifo"},
					{"ID" : "21", "SubInstance" : "ip_handler_duplicate_stream_net_axis_512_U0", "Port" : "udpDataFifo"}]},
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "detect_ipv6_protocol_512_U0", "Port" : "state_V"}]},
			{"Name" : "nextHeader_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "detect_ipv6_protocol_512_U0", "Port" : "nextHeader_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.detect_eth_protocol_512_U0", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "detect_eth_protocol_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis_raw", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_raw_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "call_ln64_clear_1_fu_155", "Port" : "header_ready_1", "Inst_start_state" : "2", "Inst_end_state" : "2"}]},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "call_ln64_clear_1_fu_155", "Port" : "header_idx_1", "Inst_start_state" : "2", "Inst_end_state" : "2"}]},
			{"Name" : "metaWritten_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "etherTypeFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "etherTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ethDataFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "25", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ethDataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_eth_protocol_512_U0.call_ln64_clear_1_fu_155", "Parent" : "1",
		"CDFG" : "clear_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "header_ready_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_idx_1", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_eth_protocol_512_U0.regslice_both_s_axis_raw_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.route_by_eth_protocol_512_U0", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "route_by_eth_protocol_512_s",
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
			{"Name" : "m_axis_arp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_arp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rep_fsmState_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "etherTypeFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "etherTypeFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ethDataFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "25", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ethDataFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rep_etherType_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv4ShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "26", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv6ShiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "27", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv6ShiftFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.route_by_eth_protocol_512_U0.regslice_both_m_axis_arp_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_handler_rshiftWordByOctet_net_axis_512_512_1_U0", "Parent" : "0",
		"CDFG" : "ip_handler_rshiftWordByOctet_net_axis_512_512_1_s",
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
			{"Name" : "fsmState_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv4ShiftFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "26", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipDataFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_handler_rshiftWordByOctet_net_axis_512_512_3_U0", "Parent" : "0",
		"CDFG" : "ip_handler_rshiftWordByOctet_net_axis_512_512_3_s",
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
			{"Name" : "fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv6ShiftFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "27", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv6ShiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv6DataFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["18"], "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv6DataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.extract_ip_meta_512_U0", "Parent" : "0", "Child" : ["9"],
		"CDFG" : "extract_ip_meta_512_s",
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
			{"Name" : "myIpAddress", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "ipDataFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "call_ln165_clear_fu_176", "Port" : "header_ready"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "call_ln165_clear_fu_176", "Port" : "header_idx"}]},
			{"Name" : "ipDataMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "30", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validIpAddressFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["12"], "DependentChan" : "31", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validIpAddressFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv4ProtocolFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["15"], "DependentChan" : "32", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ProtocolFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.extract_ip_meta_512_U0.call_ln165_clear_fu_176", "Parent" : "8",
		"CDFG" : "clear",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "header_ready", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_idx", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_handler_compute_ipv4_checksum_U0", "Parent" : "0",
		"CDFG" : "ip_handler_compute_ipv4_checksum",
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
			{"Name" : "ipDataMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "30", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataCheckFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["12"], "DependentChan" : "33", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCheckFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cics_firstWord", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_23", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_24", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_25", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_26", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_27", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_28", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cics_ip_sums_sum_V_29", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "iph_subSumsFifoOut", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11"], "DependentChan" : "34", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "iph_subSumsFifoOut_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_handler_check_ipv4_checksum_32_U0", "Parent" : "0",
		"CDFG" : "ip_handler_check_ipv4_checksum_32_s",
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
			{"Name" : "iph_subSumsFifoOut", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "34", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "iph_subSumsFifoOut_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "validChecksumFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["12"], "DependentChan" : "35", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validChecksumFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_invalid_dropper_512_U0", "Parent" : "0",
		"CDFG" : "ip_invalid_dropper_512_s",
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
			{"Name" : "iid_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "validChecksumFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["11"], "DependentChan" : "35", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validChecksumFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "validIpAddressFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "31", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "validIpAddressFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv4ValidFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["15"], "DependentChan" : "36", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ValidFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataCheckFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "33", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCheckFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataDropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "37", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataDropFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cut_length_U0", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "cut_length",
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
			{"Name" : "cl_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipDataDropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "37", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataDropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipDataCutFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["15"], "DependentChan" : "38", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCutFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.cut_length_U0.mux_646_64_1_1_U34", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.detect_ipv4_protocol_512_U0", "Parent" : "0", "Child" : ["16", "17"],
		"CDFG" : "detect_ipv4_protocol_512_s",
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
			{"Name" : "m_axis_icmp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_icmp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_tcp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tcp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dip_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv4ProtocolFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "32", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ProtocolFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ipv4ValidFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "36", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv4ValidFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dip_ipProtocol_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipDataCutFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["13"], "DependentChan" : "38", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipDataCutFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "udpDataFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["21"], "DependentChan" : "39", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpDataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_ipv4_protocol_512_U0.regslice_both_m_axis_icmp_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_ipv4_protocol_512_U0.regslice_both_m_axis_tcp_U", "Parent" : "15"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.detect_ipv6_protocol_512_U0", "Parent" : "0", "Child" : ["19", "20"],
		"CDFG" : "detect_ipv6_protocol_512_s",
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
			{"Name" : "m_axis_icmpv6", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_icmpv6_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_ipv6udp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_ipv6udp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ipv6DataFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ipv6DataFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "nextHeader_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_ipv6_protocol_512_U0.regslice_both_m_axis_icmpv6_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.detect_ipv6_protocol_512_U0.regslice_both_m_axis_ipv6udp_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_handler_duplicate_stream_net_axis_512_U0", "Parent" : "0", "Child" : ["22", "23"],
		"CDFG" : "ip_handler_duplicate_stream_net_axis_512_s",
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
			{"Name" : "m_axis_udp", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_udp_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_roce", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_roce_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "udpDataFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["15"], "DependentChan" : "39", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "udpDataFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ip_handler_duplicate_stream_net_axis_512_U0.regslice_both_m_axis_udp_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ip_handler_duplicate_stream_net_axis_512_U0.regslice_both_m_axis_roce_U", "Parent" : "21"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.etherTypeFifo_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ethDataFifo_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4ShiftFifo_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv6ShiftFifo_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipDataFifo_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv6DataFifo_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipDataMetaFifo_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.validIpAddressFifo_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4ProtocolFifo_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipDataCheckFifo_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.iph_subSumsFifoOut_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.validChecksumFifo_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4ValidFifo_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipDataDropFifo_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipDataCutFifo_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udpDataFifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ip_handler_top {
		s_axis_raw {Type I LastRead 1 FirstWrite -1}
		m_axis_arp {Type O LastRead -1 FirstWrite 1}
		m_axis_icmpv6 {Type O LastRead -1 FirstWrite 1}
		m_axis_ipv6udp {Type O LastRead -1 FirstWrite 1}
		m_axis_icmp {Type O LastRead -1 FirstWrite 1}
		m_axis_udp {Type O LastRead -1 FirstWrite 1}
		m_axis_tcp {Type O LastRead -1 FirstWrite 1}
		m_axis_roce {Type O LastRead -1 FirstWrite 1}
		myIpAddress {Type I LastRead 0 FirstWrite -1}
		header_ready_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		metaWritten_1 {Type IO LastRead -1 FirstWrite -1}
		etherTypeFifo {Type IO LastRead -1 FirstWrite -1}
		ethDataFifo {Type IO LastRead -1 FirstWrite -1}
		rep_fsmState_V {Type IO LastRead -1 FirstWrite -1}
		rep_etherType_V {Type IO LastRead -1 FirstWrite -1}
		ipv4ShiftFifo {Type IO LastRead -1 FirstWrite -1}
		ipv6ShiftFifo {Type IO LastRead -1 FirstWrite -1}
		fsmState_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		rs_firstWord_1 {Type IO LastRead -1 FirstWrite -1}
		ipDataFifo {Type IO LastRead -1 FirstWrite -1}
		fsmState {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		rs_firstWord {Type IO LastRead -1 FirstWrite -1}
		ipv6DataFifo {Type IO LastRead -1 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		ipDataMetaFifo {Type IO LastRead -1 FirstWrite -1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		validIpAddressFifo {Type IO LastRead -1 FirstWrite -1}
		ipv4ProtocolFifo {Type IO LastRead -1 FirstWrite -1}
		ipDataCheckFifo {Type IO LastRead -1 FirstWrite -1}
		cics_firstWord {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_0 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_1 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_2 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_3 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_4 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_5 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_6 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_7 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_8 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_9 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_10 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_11 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_12 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_13 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_14 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_15 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_16 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_17 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_18 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_19 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_20 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_21 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_22 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_23 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_24 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_25 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_26 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_27 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_28 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_29 {Type IO LastRead -1 FirstWrite -1}
		iph_subSumsFifoOut {Type IO LastRead -1 FirstWrite -1}
		validChecksumFifo {Type IO LastRead -1 FirstWrite -1}
		iid_state {Type IO LastRead -1 FirstWrite -1}
		ipv4ValidFifo {Type IO LastRead -1 FirstWrite -1}
		ipDataDropFifo {Type IO LastRead -1 FirstWrite -1}
		cl_state {Type IO LastRead -1 FirstWrite -1}
		ipDataCutFifo {Type IO LastRead -1 FirstWrite -1}
		dip_state {Type IO LastRead -1 FirstWrite -1}
		dip_ipProtocol_V {Type IO LastRead -1 FirstWrite -1}
		udpDataFifo {Type IO LastRead -1 FirstWrite -1}
		state_V {Type IO LastRead -1 FirstWrite -1}
		nextHeader_V {Type IO LastRead -1 FirstWrite -1}}
	detect_eth_protocol_512_s {
		s_axis_raw {Type I LastRead 1 FirstWrite -1}
		header_ready_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		metaWritten_1 {Type IO LastRead -1 FirstWrite -1}
		etherTypeFifo {Type O LastRead -1 FirstWrite 1}
		ethDataFifo {Type O LastRead -1 FirstWrite 1}}
	clear_1 {
		header_ready_1 {Type O LastRead -1 FirstWrite 0}
		header_idx_1 {Type O LastRead -1 FirstWrite 0}}
	route_by_eth_protocol_512_s {
		m_axis_arp {Type O LastRead -1 FirstWrite 1}
		rep_fsmState_V {Type IO LastRead -1 FirstWrite -1}
		etherTypeFifo {Type I LastRead 0 FirstWrite -1}
		ethDataFifo {Type I LastRead 0 FirstWrite -1}
		rep_etherType_V {Type IO LastRead -1 FirstWrite -1}
		ipv4ShiftFifo {Type O LastRead -1 FirstWrite 1}
		ipv6ShiftFifo {Type O LastRead -1 FirstWrite 1}}
	ip_handler_rshiftWordByOctet_net_axis_512_512_1_s {
		fsmState_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		ipv4ShiftFifo {Type I LastRead 0 FirstWrite -1}
		rs_firstWord_1 {Type IO LastRead -1 FirstWrite -1}
		ipDataFifo {Type O LastRead -1 FirstWrite 1}}
	ip_handler_rshiftWordByOctet_net_axis_512_512_3_s {
		fsmState {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		ipv6ShiftFifo {Type I LastRead 0 FirstWrite -1}
		rs_firstWord {Type IO LastRead -1 FirstWrite -1}
		ipv6DataFifo {Type O LastRead -1 FirstWrite 1}}
	extract_ip_meta_512_s {
		myIpAddress {Type I LastRead 1 FirstWrite -1}
		ipDataFifo {Type I LastRead 1 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		ipDataMetaFifo {Type O LastRead -1 FirstWrite 1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		validIpAddressFifo {Type O LastRead -1 FirstWrite 2}
		ipv4ProtocolFifo {Type O LastRead -1 FirstWrite 2}}
	clear {
		header_ready {Type O LastRead -1 FirstWrite 0}
		header_idx {Type O LastRead -1 FirstWrite 0}}
	ip_handler_compute_ipv4_checksum {
		ipDataMetaFifo {Type I LastRead 0 FirstWrite -1}
		ipDataCheckFifo {Type O LastRead -1 FirstWrite 1}
		cics_firstWord {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_0 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_1 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_2 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_3 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_4 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_5 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_6 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_7 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_8 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_9 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_10 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_11 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_12 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_13 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_14 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_15 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_16 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_17 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_18 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_19 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_20 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_21 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_22 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_23 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_24 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_25 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_26 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_27 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_28 {Type IO LastRead -1 FirstWrite -1}
		cics_ip_sums_sum_V_29 {Type IO LastRead -1 FirstWrite -1}
		iph_subSumsFifoOut {Type O LastRead -1 FirstWrite 2}}
	ip_handler_check_ipv4_checksum_32_s {
		iph_subSumsFifoOut {Type I LastRead 0 FirstWrite -1}
		validChecksumFifo {Type O LastRead -1 FirstWrite 5}}
	ip_invalid_dropper_512_s {
		iid_state {Type IO LastRead -1 FirstWrite -1}
		validChecksumFifo {Type I LastRead 0 FirstWrite -1}
		validIpAddressFifo {Type I LastRead 0 FirstWrite -1}
		ipv4ValidFifo {Type O LastRead -1 FirstWrite 1}
		ipDataCheckFifo {Type I LastRead 0 FirstWrite -1}
		ipDataDropFifo {Type O LastRead -1 FirstWrite 1}}
	cut_length {
		cl_state {Type IO LastRead -1 FirstWrite -1}
		ipDataDropFifo {Type I LastRead 0 FirstWrite -1}
		ipDataCutFifo {Type O LastRead -1 FirstWrite 1}}
	detect_ipv4_protocol_512_s {
		m_axis_icmp {Type O LastRead -1 FirstWrite 1}
		m_axis_tcp {Type O LastRead -1 FirstWrite 1}
		dip_state {Type IO LastRead -1 FirstWrite -1}
		ipv4ProtocolFifo {Type I LastRead 0 FirstWrite -1}
		ipv4ValidFifo {Type I LastRead 0 FirstWrite -1}
		dip_ipProtocol_V {Type IO LastRead -1 FirstWrite -1}
		ipDataCutFifo {Type I LastRead 0 FirstWrite -1}
		udpDataFifo {Type O LastRead -1 FirstWrite 1}}
	detect_ipv6_protocol_512_s {
		m_axis_icmpv6 {Type O LastRead -1 FirstWrite 1}
		m_axis_ipv6udp {Type O LastRead -1 FirstWrite 1}
		state_V {Type IO LastRead -1 FirstWrite -1}
		ipv6DataFifo {Type I LastRead 0 FirstWrite -1}
		nextHeader_V {Type IO LastRead -1 FirstWrite -1}}
	ip_handler_duplicate_stream_net_axis_512_s {
		m_axis_udp {Type O LastRead -1 FirstWrite 1}
		m_axis_roce {Type O LastRead -1 FirstWrite 1}
		udpDataFifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "25", "Max" : "25"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_raw { axis {  { s_axis_raw_TDATA in_data 0 1024 }  { s_axis_raw_TVALID in_vld 0 1 }  { s_axis_raw_TREADY in_acc 1 1 } } }
	m_axis_arp { axis {  { m_axis_arp_TDATA out_data 1 1024 }  { m_axis_arp_TVALID out_vld 1 1 }  { m_axis_arp_TREADY out_acc 0 1 } } }
	m_axis_icmpv6 { axis {  { m_axis_icmpv6_TDATA out_data 1 1024 }  { m_axis_icmpv6_TVALID out_vld 1 1 }  { m_axis_icmpv6_TREADY out_acc 0 1 } } }
	m_axis_ipv6udp { axis {  { m_axis_ipv6udp_TDATA out_data 1 1024 }  { m_axis_ipv6udp_TVALID out_vld 1 1 }  { m_axis_ipv6udp_TREADY out_acc 0 1 } } }
	m_axis_icmp { axis {  { m_axis_icmp_TDATA out_data 1 1024 }  { m_axis_icmp_TVALID out_vld 1 1 }  { m_axis_icmp_TREADY out_acc 0 1 } } }
	m_axis_udp { axis {  { m_axis_udp_TDATA out_data 1 1024 }  { m_axis_udp_TVALID out_vld 1 1 }  { m_axis_udp_TREADY out_acc 0 1 } } }
	m_axis_tcp { axis {  { m_axis_tcp_TDATA out_data 1 1024 }  { m_axis_tcp_TVALID out_vld 1 1 }  { m_axis_tcp_TREADY out_acc 0 1 } } }
	m_axis_roce { axis {  { m_axis_roce_TDATA out_data 1 1024 }  { m_axis_roce_TVALID out_vld 1 1 }  { m_axis_roce_TREADY out_acc 0 1 } } }
	myIpAddress { ap_stable {  { myIpAddress in_data 0 32 } } }
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
