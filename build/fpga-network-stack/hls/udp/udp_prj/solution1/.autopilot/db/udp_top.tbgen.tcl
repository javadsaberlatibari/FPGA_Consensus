set moduleName udp_top
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
set C_modelName {udp_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_rx_meta int 64 regular {axi_s 0 volatile  { s_axis_rx_meta Data } }  }
	{ s_axis_rx_data int 1024 regular {axi_s 0 volatile  { s_axis_rx_data Data } }  }
	{ m_axis_rx_meta int 256 regular {axi_s 1 volatile  { m_axis_rx_meta Data } }  }
	{ m_axis_rx_data int 1024 regular {axi_s 1 volatile  { m_axis_rx_data Data } }  }
	{ s_axis_tx_meta int 256 regular {axi_s 0 volatile  { s_axis_tx_meta Data } }  }
	{ s_axis_tx_data int 1024 regular {axi_s 0 volatile  { s_axis_tx_data Data } }  }
	{ m_axis_tx_meta int 64 regular {axi_s 1 volatile  { m_axis_tx_meta Data } }  }
	{ m_axis_tx_data int 1024 regular {axi_s 1 volatile  { m_axis_tx_data Data } }  }
	{ reg_ip_address int 128 unused {ap_stable 0} }
	{ reg_listen_port int 16 regular {ap_stable 0} }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_rx_meta", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_rx_meta", "interface" : "axis", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_tx_meta", "interface" : "axis", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_tx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_tx_meta", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_tx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "reg_ip_address", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "reg_listen_port", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ s_axis_rx_meta_TDATA sc_in sc_lv 64 signal 0 } 
	{ s_axis_rx_data_TDATA sc_in sc_lv 1024 signal 1 } 
	{ m_axis_rx_meta_TDATA sc_out sc_lv 256 signal 2 } 
	{ m_axis_rx_data_TDATA sc_out sc_lv 1024 signal 3 } 
	{ s_axis_tx_meta_TDATA sc_in sc_lv 256 signal 4 } 
	{ s_axis_tx_data_TDATA sc_in sc_lv 1024 signal 5 } 
	{ m_axis_tx_meta_TDATA sc_out sc_lv 64 signal 6 } 
	{ m_axis_tx_data_TDATA sc_out sc_lv 1024 signal 7 } 
	{ reg_ip_address sc_in sc_lv 128 signal 8 } 
	{ reg_listen_port sc_in sc_lv 16 signal 9 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_rx_data_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_rx_data_TREADY sc_out sc_logic 1 inacc 1 } 
	{ m_axis_rx_data_TVALID sc_out sc_logic 1 outvld 3 } 
	{ m_axis_rx_data_TREADY sc_in sc_logic 1 outacc 3 } 
	{ s_axis_rx_meta_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_rx_meta_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_rx_meta_TVALID sc_out sc_logic 1 outvld 2 } 
	{ m_axis_rx_meta_TREADY sc_in sc_logic 1 outacc 2 } 
	{ s_axis_tx_meta_TVALID sc_in sc_logic 1 invld 4 } 
	{ s_axis_tx_meta_TREADY sc_out sc_logic 1 inacc 4 } 
	{ m_axis_tx_meta_TVALID sc_out sc_logic 1 outvld 6 } 
	{ m_axis_tx_meta_TREADY sc_in sc_logic 1 outacc 6 } 
	{ s_axis_tx_data_TVALID sc_in sc_logic 1 invld 5 } 
	{ s_axis_tx_data_TREADY sc_out sc_logic 1 inacc 5 } 
	{ m_axis_tx_data_TVALID sc_out sc_logic 1 outvld 7 } 
	{ m_axis_tx_data_TREADY sc_in sc_logic 1 outacc 7 } 
}
set NewPortList {[ 
	{ "name": "s_axis_rx_meta_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_rx_meta", "role": "TDATA" }} , 
 	{ "name": "s_axis_rx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_rx_meta_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "m_axis_rx_meta", "role": "TDATA" }} , 
 	{ "name": "m_axis_rx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_meta_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "s_axis_tx_meta", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_meta_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_tx_meta", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "reg_ip_address", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "reg_ip_address", "role": "default" }} , 
 	{ "name": "reg_listen_port", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "reg_listen_port", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_rx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "m_axis_rx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_rx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "s_axis_rx_meta_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_meta", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_meta_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_meta", "role": "TREADY" }} , 
 	{ "name": "m_axis_rx_meta_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rx_meta", "role": "TVALID" }} , 
 	{ "name": "m_axis_rx_meta_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rx_meta", "role": "TREADY" }} , 
 	{ "name": "s_axis_tx_meta_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_meta", "role": "TVALID" }} , 
 	{ "name": "s_axis_tx_meta_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_meta", "role": "TREADY" }} , 
 	{ "name": "m_axis_tx_meta_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_meta", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_meta_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_meta", "role": "TREADY" }} , 
 	{ "name": "s_axis_tx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_tx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_data", "role": "TREADY" }} , 
 	{ "name": "m_axis_tx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_data", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "8", "11", "13", "15", "16", "17", "18"],
		"CDFG" : "udp_top",
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
			{"ID" : "1", "Name" : "process_udp_512_U0"},
			{"ID" : "8", "Name" : "split_tx_meta_U0"},
			{"ID" : "11", "Name" : "udp_lshiftWordByOctet_512_1_U0"}],
		"OutputProcess" : [
			{"ID" : "3", "Name" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0"},
			{"ID" : "5", "Name" : "merge_rx_meta_U0"},
			{"ID" : "13", "Name" : "generate_udp_512_U0"}],
		"Port" : [
			{"Name" : "s_axis_rx_meta", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "merge_rx_meta_U0", "Port" : "s_axis_rx_meta"}]},
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "s_axis_rx_data"}]},
			{"Name" : "m_axis_rx_meta", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "merge_rx_meta_U0", "Port" : "m_axis_rx_meta"}]},
			{"Name" : "m_axis_rx_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "m_axis_rx_data"}]},
			{"Name" : "s_axis_tx_meta", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "split_tx_meta_U0", "Port" : "s_axis_tx_meta"}]},
			{"Name" : "s_axis_tx_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "s_axis_tx_data"}]},
			{"Name" : "m_axis_tx_meta", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "split_tx_meta_U0", "Port" : "m_axis_tx_meta"}]},
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "m_axis_tx_data"}]},
			{"Name" : "reg_ip_address", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "reg_listen_port", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "pu_header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "pu_header_ready"}]},
			{"Name" : "pu_header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "pu_header_idx"}]},
			{"Name" : "pu_header_header_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "pu_header_header_V"}]},
			{"Name" : "rx_udp2shiftFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "rx_udp2shiftFifo"},
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "rx_udp2shiftFifo"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "metaWritten"}]},
			{"Name" : "rx_udpMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_udp_512_U0", "Port" : "rx_udpMetaFifo"},
					{"ID" : "5", "SubInstance" : "merge_rx_meta_U0", "Port" : "rx_udpMetaFifo"}]},
			{"Name" : "fsmState", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "fsmState"}]},
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "prevWord_data_V"}]},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "prevWord_keep_V"}]},
			{"Name" : "rs_firstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Port" : "rs_firstWord"}]},
			{"Name" : "tx_udpMetaFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "split_tx_meta_U0", "Port" : "tx_udpMetaFifo"},
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "tx_udpMetaFifo"}]},
			{"Name" : "ls_writeRemainder", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "ls_writeRemainder"}]},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "prevWord_data_V_1"}]},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "prevWord_keep_V_1"}]},
			{"Name" : "tx_shift2udpFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "tx_shift2udpFifo"},
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "tx_shift2udpFifo"}]},
			{"Name" : "ls_firstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "udp_lshiftWordByOctet_512_1_U0", "Port" : "ls_firstWord"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "state"}]},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "header_idx"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "generate_udp_512_U0", "Port" : "header_header_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.process_udp_512_U0", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "process_udp_512_s",
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
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "regListenPort", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "pu_header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2shiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_udp_512_U0.regslice_both_s_axis_rx_data_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udp_rshiftWordByOctet_net_axis_512_512_2_U0", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "udp_rshiftWordByOctet_net_axis_512_512_2_s",
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
			{"Name" : "m_axis_rx_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_rx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2shiftFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.udp_rshiftWordByOctet_net_axis_512_512_2_U0.regslice_both_m_axis_rx_data_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.merge_rx_meta_U0", "Parent" : "0", "Child" : ["6", "7"],
		"CDFG" : "merge_rx_meta",
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
			{"Name" : "s_axis_rx_meta", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_rx_meta", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_rx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udpMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.merge_rx_meta_U0.regslice_both_s_axis_rx_meta_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.merge_rx_meta_U0.regslice_both_m_axis_rx_meta_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.split_tx_meta_U0", "Parent" : "0", "Child" : ["9", "10"],
		"CDFG" : "split_tx_meta",
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
			{"Name" : "s_axis_tx_meta", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_tx_meta", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_tx_meta_U0.regslice_both_s_axis_tx_meta_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_tx_meta_U0.regslice_both_m_axis_tx_meta_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.udp_lshiftWordByOctet_512_1_U0", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "udp_lshiftWordByOctet_512_1_s",
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
			{"Name" : "s_axis_tx_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ls_writeRemainder", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_shift2udpFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2udpFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ls_firstWord", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.udp_lshiftWordByOctet_512_1_U0.regslice_both_s_axis_tx_data_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.generate_udp_512_U0", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "generate_udp_512_s",
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
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_udpMetaFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2udpFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["11"], "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2udpFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.generate_udp_512_U0.regslice_both_m_axis_tx_data_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rx_udp2shiftFifo_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rx_udpMetaFifo_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tx_udpMetaFifo_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tx_shift2udpFifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	udp_top {
		s_axis_rx_meta {Type I LastRead 0 FirstWrite -1}
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_rx_meta {Type O LastRead -1 FirstWrite 1}
		m_axis_rx_data {Type O LastRead -1 FirstWrite 1}
		s_axis_tx_meta {Type I LastRead 0 FirstWrite -1}
		s_axis_tx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_tx_meta {Type O LastRead -1 FirstWrite 1}
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		reg_ip_address {Type I LastRead -1 FirstWrite -1}
		reg_listen_port {Type I LastRead 0 FirstWrite -1}
		pu_header_ready {Type IO LastRead -1 FirstWrite -1}
		pu_header_idx {Type IO LastRead -1 FirstWrite -1}
		pu_header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo {Type IO LastRead -1 FirstWrite -1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_udpMetaFifo {Type IO LastRead -1 FirstWrite -1}
		fsmState {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		rs_firstWord {Type IO LastRead -1 FirstWrite -1}
		tx_udpMetaFifo {Type IO LastRead -1 FirstWrite -1}
		ls_writeRemainder {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		tx_shift2udpFifo {Type IO LastRead -1 FirstWrite -1}
		ls_firstWord {Type IO LastRead -1 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}}
	process_udp_512_s {
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		regListenPort {Type I LastRead 0 FirstWrite -1}
		pu_header_ready {Type IO LastRead -1 FirstWrite -1}
		pu_header_idx {Type IO LastRead -1 FirstWrite -1}
		pu_header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo {Type O LastRead -1 FirstWrite 2}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_udpMetaFifo {Type O LastRead -1 FirstWrite 1}}
	udp_rshiftWordByOctet_net_axis_512_512_2_s {
		m_axis_rx_data {Type O LastRead -1 FirstWrite 1}
		fsmState {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo {Type I LastRead 0 FirstWrite -1}
		rs_firstWord {Type IO LastRead -1 FirstWrite -1}}
	merge_rx_meta {
		s_axis_rx_meta {Type I LastRead 0 FirstWrite -1}
		m_axis_rx_meta {Type O LastRead -1 FirstWrite 1}
		rx_udpMetaFifo {Type I LastRead 0 FirstWrite -1}}
	split_tx_meta {
		s_axis_tx_meta {Type I LastRead 0 FirstWrite -1}
		m_axis_tx_meta {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo {Type O LastRead -1 FirstWrite 1}}
	udp_lshiftWordByOctet_512_1_s {
		s_axis_tx_data {Type I LastRead 0 FirstWrite -1}
		ls_writeRemainder {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		tx_shift2udpFifo {Type O LastRead -1 FirstWrite 1}
		ls_firstWord {Type IO LastRead -1 FirstWrite -1}}
	generate_udp_512_s {
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		state {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		tx_udpMetaFifo {Type I LastRead 0 FirstWrite -1}
		tx_shift2udpFifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_rx_meta { axis {  { s_axis_rx_meta_TDATA in_data 0 64 }  { s_axis_rx_meta_TVALID in_vld 0 1 }  { s_axis_rx_meta_TREADY in_acc 1 1 } } }
	s_axis_rx_data { axis {  { s_axis_rx_data_TDATA in_data 0 1024 }  { s_axis_rx_data_TVALID in_vld 0 1 }  { s_axis_rx_data_TREADY in_acc 1 1 } } }
	m_axis_rx_meta { axis {  { m_axis_rx_meta_TDATA out_data 1 256 }  { m_axis_rx_meta_TVALID out_vld 1 1 }  { m_axis_rx_meta_TREADY out_acc 0 1 } } }
	m_axis_rx_data { axis {  { m_axis_rx_data_TDATA out_data 1 1024 }  { m_axis_rx_data_TVALID out_vld 1 1 }  { m_axis_rx_data_TREADY out_acc 0 1 } } }
	s_axis_tx_meta { axis {  { s_axis_tx_meta_TDATA in_data 0 256 }  { s_axis_tx_meta_TVALID in_vld 0 1 }  { s_axis_tx_meta_TREADY in_acc 1 1 } } }
	s_axis_tx_data { axis {  { s_axis_tx_data_TDATA in_data 0 1024 }  { s_axis_tx_data_TVALID in_vld 0 1 }  { s_axis_tx_data_TREADY in_acc 1 1 } } }
	m_axis_tx_meta { axis {  { m_axis_tx_meta_TDATA out_data 1 64 }  { m_axis_tx_meta_TVALID out_vld 1 1 }  { m_axis_tx_meta_TREADY out_acc 0 1 } } }
	m_axis_tx_data { axis {  { m_axis_tx_data_TDATA out_data 1 1024 }  { m_axis_tx_data_TVALID out_vld 1 1 }  { m_axis_tx_data_TREADY out_acc 0 1 } } }
	reg_ip_address { ap_stable {  { reg_ip_address in_data 0 128 } } }
	reg_listen_port { ap_stable {  { reg_listen_port in_data 0 16 } } }
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
