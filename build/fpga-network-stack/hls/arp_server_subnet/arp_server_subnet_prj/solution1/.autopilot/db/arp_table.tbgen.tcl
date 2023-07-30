set moduleName arp_table
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
set C_modelName {arp_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_arp_lookup_request int 32 regular {axi_s 0 volatile  { s_axis_arp_lookup_request Data } }  }
	{ s_axis_host_arp_lookup_request int 32 regular {axi_s 0 volatile  { s_axis_host_arp_lookup_request Data } }  }
	{ m_axis_arp_lookup_reply int 128 regular {axi_s 1 volatile  { m_axis_arp_lookup_reply Data } }  }
	{ m_axis_host_arp_lookup_reply int 128 regular {axi_s 1 volatile  { m_axis_host_arp_lookup_reply Data } }  }
	{ arpTableInsertFifo int 192 regular {fifo 0 volatile } {global 0}  }
	{ arpRequestMetaFifo int 32 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_arp_lookup_request", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_host_arp_lookup_request", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_arp_lookup_reply", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_host_arp_lookup_reply", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arpTableInsertFifo", "interface" : "fifo", "bitwidth" : 192, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "arpRequestMetaFifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_host_arp_lookup_request_TVALID sc_in sc_logic 1 invld 1 } 
	{ s_axis_arp_lookup_request_TVALID sc_in sc_logic 1 invld 0 } 
	{ arpTableInsertFifo_dout sc_in sc_lv 192 signal 4 } 
	{ arpTableInsertFifo_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ arpTableInsertFifo_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ arpTableInsertFifo_empty_n sc_in sc_logic 1 signal 4 } 
	{ arpTableInsertFifo_read sc_out sc_logic 1 signal 4 } 
	{ m_axis_host_arp_lookup_reply_TREADY sc_in sc_logic 1 outacc 3 } 
	{ m_axis_arp_lookup_reply_TREADY sc_in sc_logic 1 outacc 2 } 
	{ arpRequestMetaFifo_din sc_out sc_lv 32 signal 5 } 
	{ arpRequestMetaFifo_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ arpRequestMetaFifo_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ arpRequestMetaFifo_full_n sc_in sc_logic 1 signal 5 } 
	{ arpRequestMetaFifo_write sc_out sc_logic 1 signal 5 } 
	{ s_axis_arp_lookup_request_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_arp_lookup_request_TREADY sc_out sc_logic 1 inacc 0 } 
	{ s_axis_host_arp_lookup_request_TDATA sc_in sc_lv 32 signal 1 } 
	{ s_axis_host_arp_lookup_request_TREADY sc_out sc_logic 1 inacc 1 } 
	{ m_axis_arp_lookup_reply_TDATA sc_out sc_lv 128 signal 2 } 
	{ m_axis_arp_lookup_reply_TVALID sc_out sc_logic 1 outvld 2 } 
	{ m_axis_host_arp_lookup_reply_TDATA sc_out sc_lv 128 signal 3 } 
	{ m_axis_host_arp_lookup_reply_TVALID sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TVALID" }} , 
 	{ "name": "s_axis_arp_lookup_request_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TVALID" }} , 
 	{ "name": "arpTableInsertFifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":192, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "dout" }} , 
 	{ "name": "arpTableInsertFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "num_data_valid" }} , 
 	{ "name": "arpTableInsertFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "fifo_cap" }} , 
 	{ "name": "arpTableInsertFifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "empty_n" }} , 
 	{ "name": "arpTableInsertFifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpTableInsertFifo", "role": "read" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TREADY" }} , 
 	{ "name": "arpRequestMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arpRequestMetaFifo", "role": "din" }} , 
 	{ "name": "arpRequestMetaFifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpRequestMetaFifo", "role": "num_data_valid" }} , 
 	{ "name": "arpRequestMetaFifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "arpRequestMetaFifo", "role": "fifo_cap" }} , 
 	{ "name": "arpRequestMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpRequestMetaFifo", "role": "full_n" }} , 
 	{ "name": "arpRequestMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arpRequestMetaFifo", "role": "write" }} , 
 	{ "name": "s_axis_arp_lookup_request_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TDATA" }} , 
 	{ "name": "s_axis_arp_lookup_request_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_arp_lookup_request", "role": "TREADY" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TDATA" }} , 
 	{ "name": "s_axis_host_arp_lookup_request_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_host_arp_lookup_request", "role": "TREADY" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TDATA" }} , 
 	{ "name": "m_axis_arp_lookup_reply_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_arp_lookup_reply", "role": "TVALID" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TDATA" }} , 
 	{ "name": "m_axis_host_arp_lookup_reply_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_host_arp_lookup_reply", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
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
			{"Name" : "arpTableInsertFifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpTableInsertFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arpTable_macAddress_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "arpTable_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "arpRequestMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "arpRequestMetaFifo_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arpTable_macAddress_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arpTable_valid_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_arp_lookup_request_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_host_arp_lookup_request_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_arp_lookup_reply_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_m_axis_host_arp_lookup_reply_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_arp_lookup_request { axis {  { s_axis_arp_lookup_request_TVALID in_vld 0 1 }  { s_axis_arp_lookup_request_TDATA in_data 0 32 }  { s_axis_arp_lookup_request_TREADY in_acc 1 1 } } }
	s_axis_host_arp_lookup_request { axis {  { s_axis_host_arp_lookup_request_TVALID in_vld 0 1 }  { s_axis_host_arp_lookup_request_TDATA in_data 0 32 }  { s_axis_host_arp_lookup_request_TREADY in_acc 1 1 } } }
	m_axis_arp_lookup_reply { axis {  { m_axis_arp_lookup_reply_TREADY out_acc 0 1 }  { m_axis_arp_lookup_reply_TDATA out_data 1 128 }  { m_axis_arp_lookup_reply_TVALID out_vld 1 1 } } }
	m_axis_host_arp_lookup_reply { axis {  { m_axis_host_arp_lookup_reply_TREADY out_acc 0 1 }  { m_axis_host_arp_lookup_reply_TDATA out_data 1 128 }  { m_axis_host_arp_lookup_reply_TVALID out_vld 1 1 } } }
	arpTableInsertFifo { ap_fifo {  { arpTableInsertFifo_dout fifo_port_we 0 192 }  { arpTableInsertFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { arpTableInsertFifo_fifo_cap fifo_update 0 3 }  { arpTableInsertFifo_empty_n fifo_status 0 1 }  { arpTableInsertFifo_read fifo_data 1 1 } } }
	arpRequestMetaFifo { ap_fifo {  { arpRequestMetaFifo_din fifo_port_we 1 32 }  { arpRequestMetaFifo_num_data_valid fifo_status_num_data_valid 0 3 }  { arpRequestMetaFifo_fifo_cap fifo_update 0 3 }  { arpRequestMetaFifo_full_n fifo_status 0 1 }  { arpRequestMetaFifo_write fifo_data 1 1 } } }
}
