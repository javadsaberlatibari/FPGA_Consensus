# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 306 \
    name s_axis_open_conn_req \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_open_conn_req_TVALID { I 1 bit } s_axis_open_conn_req_TDATA { I 64 vector } s_axis_open_conn_req_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_open_conn_req'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 307 \
    name s_axis_close_conn_req \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_close_conn_req_TVALID { I 1 bit } s_axis_close_conn_req_TDATA { I 16 vector } s_axis_close_conn_req_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_close_conn_req'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 308 \
    name m_axis_open_conn_rsp \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_open_conn_rsp_TREADY { I 1 bit } m_axis_open_conn_rsp_TDATA { O 32 vector } m_axis_open_conn_rsp_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_open_conn_rsp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name myIpAddress \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_myIpAddress \
    op interface \
    ports { myIpAddress { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name portTable2txApp_port_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_portTable2txApp_port_rsp \
    op interface \
    ports { portTable2txApp_port_rsp_dout { I 16 vector } portTable2txApp_port_rsp_num_data_valid { I 3 vector } portTable2txApp_port_rsp_fifo_cap { I 3 vector } portTable2txApp_port_rsp_empty_n { I 1 bit } portTable2txApp_port_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 311 \
    name txApp2sLookup_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txApp2sLookup_req \
    op interface \
    ports { txApp2sLookup_req_din { O 96 vector } txApp2sLookup_req_num_data_valid { I 3 vector } txApp2sLookup_req_fifo_cap { I 3 vector } txApp2sLookup_req_full_n { I 1 bit } txApp2sLookup_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 312 \
    name sLookup2txApp_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sLookup2txApp_rsp \
    op interface \
    ports { sLookup2txApp_rsp_dout { I 32 vector } sLookup2txApp_rsp_num_data_valid { I 3 vector } sLookup2txApp_rsp_fifo_cap { I 3 vector } sLookup2txApp_rsp_empty_n { I 1 bit } sLookup2txApp_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 313 \
    name txApp2eventEng_mergeEvent \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txApp2eventEng_mergeEvent \
    op interface \
    ports { txApp2eventEng_mergeEvent_din { O 128 vector } txApp2eventEng_mergeEvent_num_data_valid { I 7 vector } txApp2eventEng_mergeEvent_fifo_cap { I 7 vector } txApp2eventEng_mergeEvent_full_n { I 1 bit } txApp2eventEng_mergeEvent_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 314 \
    name txApp2stateTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txApp2stateTable_upd_req \
    op interface \
    ports { txApp2stateTable_upd_req_din { O 96 vector } txApp2stateTable_upd_req_num_data_valid { I 2 vector } txApp2stateTable_upd_req_fifo_cap { I 2 vector } txApp2stateTable_upd_req_full_n { I 1 bit } txApp2stateTable_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 315 \
    name conEstablishedFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conEstablishedFifo \
    op interface \
    ports { conEstablishedFifo_dout { I 32 vector } conEstablishedFifo_num_data_valid { I 3 vector } conEstablishedFifo_fifo_cap { I 3 vector } conEstablishedFifo_empty_n { I 1 bit } conEstablishedFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 316 \
    name timer2txApp_notification \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_timer2txApp_notification \
    op interface \
    ports { timer2txApp_notification_dout { I 32 vector } timer2txApp_notification_num_data_valid { I 3 vector } timer2txApp_notification_fifo_cap { I 3 vector } timer2txApp_notification_empty_n { I 1 bit } timer2txApp_notification_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 317 \
    name stateTable2txApp_upd_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2txApp_upd_rsp \
    op interface \
    ports { stateTable2txApp_upd_rsp_dout { I 32 vector } stateTable2txApp_upd_rsp_num_data_valid { I 2 vector } stateTable2txApp_upd_rsp_fifo_cap { I 2 vector } stateTable2txApp_upd_rsp_empty_n { I 1 bit } stateTable2txApp_upd_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# RegSlice definition:
set ID 318
set RegSliceName toe_top_regslice_both
set RegSliceInstName toe_top_regslice_both_U
set CoreName ap_simcore_toe_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix toe_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 319
set RegSliceName toe_top_regslice_both
set RegSliceInstName toe_top_regslice_both_U
set CoreName ap_simcore_toe_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix toe_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 320
set RegSliceName toe_top_regslice_both
set RegSliceInstName toe_top_regslice_both_U
set CoreName ap_simcore_toe_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix toe_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


