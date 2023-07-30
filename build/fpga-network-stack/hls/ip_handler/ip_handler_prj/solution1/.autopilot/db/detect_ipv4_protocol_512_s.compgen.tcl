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
    id 38 \
    name m_axis_icmp \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_icmp_TREADY { I 1 bit } m_axis_icmp_TDATA { O 1024 vector } m_axis_icmp_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_icmp'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 39 \
    name m_axis_tcp \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_tcp_TREADY { I 1 bit } m_axis_tcp_TDATA { O 1024 vector } m_axis_tcp_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_tcp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name ipv4ProtocolFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ipv4ProtocolFifo \
    op interface \
    ports { ipv4ProtocolFifo_dout { I 8 vector } ipv4ProtocolFifo_num_data_valid { I 6 vector } ipv4ProtocolFifo_fifo_cap { I 6 vector } ipv4ProtocolFifo_empty_n { I 1 bit } ipv4ProtocolFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name ipv4ValidFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ipv4ValidFifo \
    op interface \
    ports { ipv4ValidFifo_dout { I 1 vector } ipv4ValidFifo_num_data_valid { I 4 vector } ipv4ValidFifo_fifo_cap { I 4 vector } ipv4ValidFifo_empty_n { I 1 bit } ipv4ValidFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name ipDataCutFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ipDataCutFifo \
    op interface \
    ports { ipDataCutFifo_dout { I 1024 vector } ipDataCutFifo_num_data_valid { I 2 vector } ipDataCutFifo_fifo_cap { I 2 vector } ipDataCutFifo_empty_n { I 1 bit } ipDataCutFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name udpDataFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_udpDataFifo \
    op interface \
    ports { udpDataFifo_din { O 1024 vector } udpDataFifo_num_data_valid { I 2 vector } udpDataFifo_fifo_cap { I 2 vector } udpDataFifo_full_n { I 1 bit } udpDataFifo_write { O 1 bit } } \
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
set ID 44
set RegSliceName ip_handler_top_regslice_both
set RegSliceInstName ip_handler_top_regslice_both_U
set CoreName ap_simcore_ip_handler_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix ip_handler_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 45
set RegSliceName ip_handler_top_regslice_both
set RegSliceInstName ip_handler_top_regslice_both_U
set CoreName ap_simcore_ip_handler_top_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix ip_handler_top_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


