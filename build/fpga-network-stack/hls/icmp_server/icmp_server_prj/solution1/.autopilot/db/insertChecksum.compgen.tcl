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
    id 19 \
    name m_axis \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_TREADY { I 1 bit } m_axis_TDATA { O 128 vector } m_axis_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams \
    op interface \
    ports { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_dout { I 128 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_num_data_valid { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_fifo_cap { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_empty_n { I 1 bit } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1 \
    op interface \
    ports { icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_dout { I 128 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_num_data_valid { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_fifo_cap { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_empty_n { I 1 bit } icmp_server_stream_stream_stream_stream_axiWord_0_dataStreams_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1 \
    op interface \
    ports { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_dout { I 16 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_num_data_valid { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_fifo_cap { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_empty_n { I 1 bit } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams \
    op interface \
    ports { icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_dout { I 16 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_num_data_valid { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_fifo_cap { I 5 vector } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_empty_n { I 1 bit } icmp_server_stream_stream_stream_stream_axiWord_0_checksumStreams_read { O 1 bit } } \
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
set ID 24
set RegSliceName icmp_server_regslice_both
set RegSliceInstName icmp_server_regslice_both_U
set CoreName ap_simcore_icmp_server_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix icmp_server_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


