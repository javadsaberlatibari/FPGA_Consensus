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
    id 153 \
    name m_axis_mem_read_cmd \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_read_cmd_TREADY { I 1 bit } m_axis_mem_read_cmd_TDATA { O 192 vector } m_axis_mem_read_cmd_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_read_cmd'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name rx_remoteMemCmd \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_remoteMemCmd \
    op interface \
    ports { rx_remoteMemCmd_dout { I 192 vector } rx_remoteMemCmd_num_data_valid { I 10 vector } rx_remoteMemCmd_fifo_cap { I 10 vector } rx_remoteMemCmd_empty_n { I 1 bit } rx_remoteMemCmd_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name tx_pkgInfoFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo \
    op interface \
    ports { tx_pkgInfoFifo_din { O 96 vector } tx_pkgInfoFifo_num_data_valid { I 8 vector } tx_pkgInfoFifo_fifo_cap { I 8 vector } tx_pkgInfoFifo_full_n { I 1 bit } tx_pkgInfoFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name tx_localMemCmdFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_localMemCmdFifo \
    op interface \
    ports { tx_localMemCmdFifo_dout { I 192 vector } tx_localMemCmdFifo_num_data_valid { I 2 vector } tx_localMemCmdFifo_fifo_cap { I 2 vector } tx_localMemCmdFifo_empty_n { I 1 bit } tx_localMemCmdFifo_read { O 1 bit } } \
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
set ID 157
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


