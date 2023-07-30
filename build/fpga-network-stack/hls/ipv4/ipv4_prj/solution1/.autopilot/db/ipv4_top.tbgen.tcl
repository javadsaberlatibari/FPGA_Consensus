set moduleName ipv4_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {ipv4_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_rx_data int 1024 regular {axi_s 0 volatile  { s_axis_rx_data Data } }  }
	{ m_axis_rx_meta int 64 regular {axi_s 1 volatile  { m_axis_rx_meta Data } }  }
	{ m_axis_rx_data int 1024 regular {axi_s 1 volatile  { m_axis_rx_data Data } }  }
	{ s_axis_tx_meta int 64 regular {axi_s 0 volatile  { s_axis_tx_meta Data } }  }
	{ s_axis_tx_data int 1024 regular {axi_s 0 volatile  { s_axis_tx_data Data } }  }
	{ m_axis_tx_data int 1024 regular {axi_s 1 volatile  { m_axis_tx_data Data } }  }
	{ local_ipv4_address int 32 regular {ap_stable 0} }
	{ protocol int 8 regular {ap_stable 0} }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_rx_meta", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_rx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_tx_meta", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_tx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_tx_data", "interface" : "axis", "bitwidth" : 1024, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_ipv4_address", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "protocol", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ s_axis_rx_data_TDATA sc_in sc_lv 1024 signal 0 } 
	{ m_axis_rx_meta_TDATA sc_out sc_lv 64 signal 1 } 
	{ m_axis_rx_data_TDATA sc_out sc_lv 1024 signal 2 } 
	{ s_axis_tx_meta_TDATA sc_in sc_lv 64 signal 3 } 
	{ s_axis_tx_data_TDATA sc_in sc_lv 1024 signal 4 } 
	{ m_axis_tx_data_TDATA sc_out sc_lv 1024 signal 5 } 
	{ local_ipv4_address sc_in sc_lv 32 signal 6 } 
	{ protocol sc_in sc_lv 8 signal 7 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_rx_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_rx_data_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_rx_meta_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_rx_meta_TREADY sc_in sc_logic 1 outacc 1 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ m_axis_rx_data_TVALID sc_out sc_logic 1 outvld 2 } 
	{ m_axis_rx_data_TREADY sc_in sc_logic 1 outacc 2 } 
	{ s_axis_tx_data_TVALID sc_in sc_logic 1 invld 4 } 
	{ s_axis_tx_data_TREADY sc_out sc_logic 1 inacc 4 } 
	{ s_axis_tx_meta_TVALID sc_in sc_logic 1 invld 3 } 
	{ s_axis_tx_meta_TREADY sc_out sc_logic 1 inacc 3 } 
	{ m_axis_tx_data_TVALID sc_out sc_logic 1 outvld 5 } 
	{ m_axis_tx_data_TREADY sc_in sc_logic 1 outacc 5 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
}
set NewPortList {[ 
	{ "name": "s_axis_rx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_rx_meta_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_rx_meta", "role": "TDATA" }} , 
 	{ "name": "m_axis_rx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_rx_data", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_meta_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_tx_meta", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "m_axis_tx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "m_axis_tx_data", "role": "TDATA" }} , 
 	{ "name": "local_ipv4_address", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "local_ipv4_address", "role": "default" }} , 
 	{ "name": "protocol", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "protocol", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_rx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_rx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "m_axis_rx_meta_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rx_meta", "role": "TVALID" }} , 
 	{ "name": "m_axis_rx_meta_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rx_meta", "role": "TREADY" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "m_axis_rx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_rx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_rx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_rx_data", "role": "TREADY" }} , 
 	{ "name": "s_axis_tx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "s_axis_tx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_data", "role": "TREADY" }} , 
 	{ "name": "s_axis_tx_meta_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_meta", "role": "TVALID" }} , 
 	{ "name": "s_axis_tx_meta_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_meta", "role": "TREADY" }} , 
 	{ "name": "m_axis_tx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_tx_data", "role": "TVALID" }} , 
 	{ "name": "m_axis_tx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_tx_data", "role": "TREADY" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "6", "8", "11", "12", "13"],
		"CDFG" : "ipv4_top",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "process_ipv4_512_U0"},
			{"ID" : "6", "Name" : "ipv4_lshiftWordByOctet_512_2_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "process_ipv4_512_U0"},
			{"ID" : "4", "Name" : "ipv4_drop_optional_ip_header_512_U0"},
			{"ID" : "8", "Name" : "ipv4_generate_ipv4_512_U0"}],
		"Port" : [
			{"Name" : "s_axis_rx_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "s_axis_rx_data"}]},
			{"Name" : "m_axis_rx_meta", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "m_axis_rx_meta"}]},
			{"Name" : "m_axis_rx_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "m_axis_rx_data"}]},
			{"Name" : "s_axis_tx_meta", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "s_axis_tx_meta"}]},
			{"Name" : "s_axis_tx_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "s_axis_tx_data"}]},
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "m_axis_tx_data"}]},
			{"Name" : "local_ipv4_address", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "protocol", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "header_ready"}]},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "header_idx"}]},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "header_header_V"}]},
			{"Name" : "rx_process2dropFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "rx_process2dropFifo"},
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "rx_process2dropFifo"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "metaWritten"}]},
			{"Name" : "rx_process2dropLengthFifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "process_ipv4_512_U0", "Port" : "rx_process2dropLengthFifo"},
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "rx_process2dropLengthFifo"}]},
			{"Name" : "doh_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "doh_state"}]},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "prevWord_data_V_1"}]},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "prevWord_keep_V_1"}]},
			{"Name" : "length_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "ipv4_drop_optional_ip_header_512_U0", "Port" : "length_V"}]},
			{"Name" : "ls_writeRemainder", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "ls_writeRemainder"}]},
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "prevWord_data_V"}]},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "prevWord_keep_V"}]},
			{"Name" : "tx_shift2ipv4Fifo", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "tx_shift2ipv4Fifo"},
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "tx_shift2ipv4Fifo"}]},
			{"Name" : "ls_firstWord", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "ipv4_lshiftWordByOctet_512_2_U0", "Port" : "ls_firstWord"}]},
			{"Name" : "gi_state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "gi_state"}]},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "header_idx_1"}]},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "ipv4_generate_ipv4_512_U0", "Port" : "header_header_V_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.process_ipv4_512_U0", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "process_ipv4_512_s",
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
			{"Name" : "m_axis_rx_meta", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_rx_meta_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "11", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropLengthFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "12", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropLengthFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_ipv4_512_U0.regslice_both_s_axis_rx_data_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_ipv4_512_U0.regslice_both_m_axis_rx_meta_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4_drop_optional_ip_header_512_U0", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "ipv4_drop_optional_ip_header_512_s",
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
			{"Name" : "doh_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropLengthFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "12", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropLengthFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_process2dropFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "11", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "length_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ipv4_drop_optional_ip_header_512_U0.regslice_both_m_axis_rx_data_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4_lshiftWordByOctet_512_2_U0", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "ipv4_lshiftWordByOctet_512_2_s",
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
			{"Name" : "prevWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_shift2ipv4Fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "13", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ls_firstWord", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ipv4_lshiftWordByOctet_512_2_U0.regslice_both_s_axis_tx_data_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ipv4_generate_ipv4_512_U0", "Parent" : "0", "Child" : ["9", "10"],
		"CDFG" : "ipv4_generate_ipv4_512_s",
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
			{"Name" : "m_axis_tx_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_ipv4_address", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "protocol", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "gi_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_shift2ipv4Fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "13", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ipv4_generate_ipv4_512_U0.regslice_both_s_axis_tx_meta_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ipv4_generate_ipv4_512_U0.regslice_both_m_axis_tx_data_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rx_process2dropFifo_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rx_process2dropLengthFifo_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tx_shift2ipv4Fifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ipv4_top {
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_rx_meta {Type O LastRead -1 FirstWrite 1}
		m_axis_rx_data {Type O LastRead -1 FirstWrite 1}
		s_axis_tx_meta {Type I LastRead 0 FirstWrite -1}
		s_axis_tx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		local_ipv4_address {Type I LastRead 0 FirstWrite -1}
		protocol {Type I LastRead 0 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropFifo {Type IO LastRead -1 FirstWrite -1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropLengthFifo {Type IO LastRead -1 FirstWrite -1}
		doh_state {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_V {Type IO LastRead -1 FirstWrite -1}
		ls_writeRemainder {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		tx_shift2ipv4Fifo {Type IO LastRead -1 FirstWrite -1}
		ls_firstWord {Type IO LastRead -1 FirstWrite -1}
		gi_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}}
	process_ipv4_512_s {
		s_axis_rx_data {Type I LastRead 0 FirstWrite -1}
		m_axis_rx_meta {Type O LastRead -1 FirstWrite 1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx {Type IO LastRead -1 FirstWrite -1}
		header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropFifo {Type O LastRead -1 FirstWrite 1}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropLengthFifo {Type O LastRead -1 FirstWrite 1}}
	ipv4_drop_optional_ip_header_512_s {
		m_axis_rx_data {Type O LastRead -1 FirstWrite 1}
		doh_state {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_1 {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropLengthFifo {Type I LastRead 0 FirstWrite -1}
		rx_process2dropFifo {Type I LastRead 0 FirstWrite -1}
		length_V {Type IO LastRead -1 FirstWrite -1}}
	ipv4_lshiftWordByOctet_512_2_s {
		s_axis_tx_data {Type I LastRead 0 FirstWrite -1}
		ls_writeRemainder {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		tx_shift2ipv4Fifo {Type O LastRead -1 FirstWrite 1}
		ls_firstWord {Type IO LastRead -1 FirstWrite -1}}
	ipv4_generate_ipv4_512_s {
		s_axis_tx_meta {Type I LastRead 0 FirstWrite -1}
		m_axis_tx_data {Type O LastRead -1 FirstWrite 1}
		local_ipv4_address {Type I LastRead 0 FirstWrite -1}
		protocol {Type I LastRead 0 FirstWrite -1}
		gi_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_1 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_1 {Type IO LastRead -1 FirstWrite -1}
		tx_shift2ipv4Fifo {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_rx_data { axis {  { s_axis_rx_data_TDATA in_data 0 1024 }  { s_axis_rx_data_TVALID in_vld 0 1 }  { s_axis_rx_data_TREADY in_acc 1 1 } } }
	m_axis_rx_meta { axis {  { m_axis_rx_meta_TDATA out_data 1 64 }  { m_axis_rx_meta_TVALID out_vld 1 1 }  { m_axis_rx_meta_TREADY out_acc 0 1 } } }
	m_axis_rx_data { axis {  { m_axis_rx_data_TDATA out_data 1 1024 }  { m_axis_rx_data_TVALID out_vld 1 1 }  { m_axis_rx_data_TREADY out_acc 0 1 } } }
	s_axis_tx_meta { axis {  { s_axis_tx_meta_TDATA in_data 0 64 }  { s_axis_tx_meta_TVALID in_vld 0 1 }  { s_axis_tx_meta_TREADY in_acc 1 1 } } }
	s_axis_tx_data { axis {  { s_axis_tx_data_TDATA in_data 0 1024 }  { s_axis_tx_data_TVALID in_vld 0 1 }  { s_axis_tx_data_TREADY in_acc 1 1 } } }
	m_axis_tx_data { axis {  { m_axis_tx_data_TDATA out_data 1 1024 }  { m_axis_tx_data_TVALID out_vld 1 1 }  { m_axis_tx_data_TREADY out_acc 0 1 } } }
	local_ipv4_address { ap_stable {  { local_ipv4_address in_data 0 32 } } }
	protocol { ap_stable {  { protocol in_data 0 8 } } }
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
