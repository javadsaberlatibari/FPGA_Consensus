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
    id 102 \
    name s_axis_tx_meta \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_tx_meta_TVALID { I 1 bit } s_axis_tx_meta_TDATA { I 256 vector } s_axis_tx_meta_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_tx_meta'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name tx_appMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo \
    op interface \
    ports { tx_appMetaFifo_din { O 256 vector } tx_appMetaFifo_num_data_valid { I 6 vector } tx_appMetaFifo_fifo_cap { I 6 vector } tx_appMetaFifo_full_n { I 1 bit } tx_appMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name tx_readReqAddr_push \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push \
    op interface \
    ports { tx_readReqAddr_push_din { O 128 vector } tx_readReqAddr_push_num_data_valid { I 2 vector } tx_readReqAddr_push_fifo_cap { I 2 vector } tx_readReqAddr_push_full_n { I 1 bit } tx_readReqAddr_push_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name tx_localMemCmdFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_localMemCmdFifo \
    op interface \
    ports { tx_localMemCmdFifo_din { O 192 vector } tx_localMemCmdFifo_num_data_valid { I 2 vector } tx_localMemCmdFifo_fifo_cap { I 2 vector } tx_localMemCmdFifo_full_n { I 1 bit } tx_localMemCmdFifo_write { O 1 bit } } \
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
set ID 106
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


