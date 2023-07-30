set moduleName conn_table
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
set C_modelName {conn_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_qp_conn_interface int 384 regular {axi_s 0 volatile  { s_axis_qp_conn_interface Data } }  }
	{ tx_ibhconnTable_req int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_connTable2ibh_rsp int 384 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_qp_conn_interface", "interface" : "axis", "bitwidth" : 384, "direction" : "READONLY"} , 
 	{ "Name" : "tx_ibhconnTable_req", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_connTable2ibh_rsp", "interface" : "fifo", "bitwidth" : 384, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_qp_conn_interface_TVALID sc_in sc_logic 1 invld 0 } 
	{ tx_ibhconnTable_req_dout sc_in sc_lv 16 signal 1 } 
	{ tx_ibhconnTable_req_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ tx_ibhconnTable_req_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ tx_ibhconnTable_req_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_ibhconnTable_req_read sc_out sc_logic 1 signal 1 } 
	{ tx_connTable2ibh_rsp_din sc_out sc_lv 384 signal 2 } 
	{ tx_connTable2ibh_rsp_num_data_valid sc_in sc_lv 4 signal 2 } 
	{ tx_connTable2ibh_rsp_fifo_cap sc_in sc_lv 4 signal 2 } 
	{ tx_connTable2ibh_rsp_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_connTable2ibh_rsp_write sc_out sc_logic 1 signal 2 } 
	{ s_axis_qp_conn_interface_TDATA sc_in sc_lv 384 signal 0 } 
	{ s_axis_qp_conn_interface_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_qp_conn_interface_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_qp_conn_interface", "role": "TVALID" }} , 
 	{ "name": "tx_ibhconnTable_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "dout" }} , 
 	{ "name": "tx_ibhconnTable_req_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "num_data_valid" }} , 
 	{ "name": "tx_ibhconnTable_req_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "fifo_cap" }} , 
 	{ "name": "tx_ibhconnTable_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "empty_n" }} , 
 	{ "name": "tx_ibhconnTable_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req", "role": "read" }} , 
 	{ "name": "tx_connTable2ibh_rsp_din", "direction": "out", "datatype": "sc_lv", "bitwidth":384, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "din" }} , 
 	{ "name": "tx_connTable2ibh_rsp_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "num_data_valid" }} , 
 	{ "name": "tx_connTable2ibh_rsp_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "fifo_cap" }} , 
 	{ "name": "tx_connTable2ibh_rsp_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "full_n" }} , 
 	{ "name": "tx_connTable2ibh_rsp_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp", "role": "write" }} , 
 	{ "name": "s_axis_qp_conn_interface_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":384, "type": "signal", "bundle":{"name": "s_axis_qp_conn_interface", "role": "TDATA" }} , 
 	{ "name": "s_axis_qp_conn_interface_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_qp_conn_interface", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "conn_table",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_axis_qp_conn_interface", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_qp_conn_interface_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhconnTable_req", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhconnTable_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "conn_table_remote_qpn_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conn_table_remote_ip_address_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conn_table_remote_udp_port_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "tx_connTable2ibh_rsp", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "tx_connTable2ibh_rsp_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_qpn_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_ip_address_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_udp_port_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_axis_qp_conn_interface_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conn_table {
		s_axis_qp_conn_interface {Type I LastRead 0 FirstWrite -1}
		tx_ibhconnTable_req {Type I LastRead 0 FirstWrite -1}
		conn_table_remote_qpn_V {Type IO LastRead -1 FirstWrite -1}
		conn_table_remote_ip_address_V {Type IO LastRead -1 FirstWrite -1}
		conn_table_remote_udp_port_V {Type IO LastRead -1 FirstWrite -1}
		tx_connTable2ibh_rsp {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_qp_conn_interface { axis {  { s_axis_qp_conn_interface_TVALID in_vld 0 1 }  { s_axis_qp_conn_interface_TDATA in_data 0 384 }  { s_axis_qp_conn_interface_TREADY in_acc 1 1 } } }
	tx_ibhconnTable_req { ap_fifo {  { tx_ibhconnTable_req_dout fifo_port_we 0 16 }  { tx_ibhconnTable_req_num_data_valid fifo_status_num_data_valid 0 2 }  { tx_ibhconnTable_req_fifo_cap fifo_update 0 2 }  { tx_ibhconnTable_req_empty_n fifo_status 0 1 }  { tx_ibhconnTable_req_read fifo_data 1 1 } } }
	tx_connTable2ibh_rsp { ap_fifo {  { tx_connTable2ibh_rsp_din fifo_port_we 1 384 }  { tx_connTable2ibh_rsp_num_data_valid fifo_status_num_data_valid 0 4 }  { tx_connTable2ibh_rsp_fifo_cap fifo_update 0 4 }  { tx_connTable2ibh_rsp_full_n fifo_status 0 1 }  { tx_connTable2ibh_rsp_write fifo_data 1 1 } } }
}
