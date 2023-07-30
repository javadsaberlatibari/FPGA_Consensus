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
    id 67 \
    name m_axis_mem_write_cmd \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_cmd_TREADY { I 1 bit } m_axis_mem_write_cmd_TDATA { O 192 vector } m_axis_mem_write_cmd_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_write_cmd'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name rx_fsm2exh_MetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_fsm2exh_MetaFifo \
    op interface \
    ports { rx_fsm2exh_MetaFifo_dout { I 192 vector } rx_fsm2exh_MetaFifo_num_data_valid { I 2 vector } rx_fsm2exh_MetaFifo_fifo_cap { I 2 vector } rx_fsm2exh_MetaFifo_empty_n { I 1 bit } rx_fsm2exh_MetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name rx_drop2exhFsm_MetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_drop2exhFsm_MetaFifo \
    op interface \
    ports { rx_drop2exhFsm_MetaFifo_dout { I 512 vector } rx_drop2exhFsm_MetaFifo_num_data_valid { I 2 vector } rx_drop2exhFsm_MetaFifo_fifo_cap { I 2 vector } rx_drop2exhFsm_MetaFifo_empty_n { I 1 bit } rx_drop2exhFsm_MetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name rxExh2msnTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxExh2msnTable_upd_req \
    op interface \
    ports { rxExh2msnTable_upd_req_din { O 192 vector } rxExh2msnTable_upd_req_num_data_valid { I 2 vector } rxExh2msnTable_upd_req_fifo_cap { I 2 vector } rxExh2msnTable_upd_req_full_n { I 1 bit } rxExh2msnTable_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name rx_readReqAddr_pop_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_req \
    op interface \
    ports { rx_readReqAddr_pop_req_din { O 64 vector } rx_readReqAddr_pop_req_num_data_valid { I 2 vector } rx_readReqAddr_pop_req_fifo_cap { I 2 vector } rx_readReqAddr_pop_req_full_n { I 1 bit } rx_readReqAddr_pop_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name msnTable2rxExh_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_msnTable2rxExh_rsp \
    op interface \
    ports { msnTable2rxExh_rsp_dout { I 192 vector } msnTable2rxExh_rsp_num_data_valid { I 2 vector } msnTable2rxExh_rsp_fifo_cap { I 2 vector } msnTable2rxExh_rsp_empty_n { I 1 bit } msnTable2rxExh_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name exh_lengthFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_exh_lengthFifo \
    op interface \
    ports { exh_lengthFifo_dout { I 16 vector } exh_lengthFifo_num_data_valid { I 3 vector } exh_lengthFifo_fifo_cap { I 3 vector } exh_lengthFifo_empty_n { I 1 bit } exh_lengthFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name rx_readReqAddr_pop_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_rsp \
    op interface \
    ports { rx_readReqAddr_pop_rsp_dout { I 64 vector } rx_readReqAddr_pop_rsp_num_data_valid { I 2 vector } rx_readReqAddr_pop_rsp_fifo_cap { I 2 vector } rx_readReqAddr_pop_rsp_empty_n { I 1 bit } rx_readReqAddr_pop_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name rx_exhEventMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhEventMetaFifo \
    op interface \
    ports { rx_exhEventMetaFifo_din { O 96 vector } rx_exhEventMetaFifo_num_data_valid { I 2 vector } rx_exhEventMetaFifo_fifo_cap { I 2 vector } rx_exhEventMetaFifo_full_n { I 1 bit } rx_exhEventMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name rx_pkgSplitTypeFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgSplitTypeFifo \
    op interface \
    ports { rx_pkgSplitTypeFifo_din { O 64 vector } rx_pkgSplitTypeFifo_num_data_valid { I 2 vector } rx_pkgSplitTypeFifo_fifo_cap { I 2 vector } rx_pkgSplitTypeFifo_full_n { I 1 bit } rx_pkgSplitTypeFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name rx_pkgShiftTypeFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgShiftTypeFifo \
    op interface \
    ports { rx_pkgShiftTypeFifo_din { O 32 vector } rx_pkgShiftTypeFifo_num_data_valid { I 2 vector } rx_pkgShiftTypeFifo_fifo_cap { I 2 vector } rx_pkgShiftTypeFifo_full_n { I 1 bit } rx_pkgShiftTypeFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name rx_readRequestFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readRequestFifo \
    op interface \
    ports { rx_readRequestFifo_din { O 256 vector } rx_readRequestFifo_num_data_valid { I 4 vector } rx_readRequestFifo_fifo_cap { I 4 vector } rx_readRequestFifo_full_n { I 1 bit } rx_readRequestFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name rx_readReqTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqTable_upd_req \
    op interface \
    ports { rx_readReqTable_upd_req_din { O 96 vector } rx_readReqTable_upd_req_num_data_valid { I 2 vector } rx_readReqTable_upd_req_fifo_cap { I 2 vector } rx_readReqTable_upd_req_full_n { I 1 bit } rx_readReqTable_upd_req_write { O 1 bit } } \
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
set ID 80
set RegSliceName rocev2_top_regslice_both
set RegSliceInstName rocev2_top_regslice_both_U
set CoreName ap_simcore_rocev2_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix rocev2_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


