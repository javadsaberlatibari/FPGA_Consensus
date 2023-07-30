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
    id 49 \
    name m_axis_open_connection \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_open_connection_TREADY { I 1 bit } m_axis_open_connection_TDATA { O 64 vector } m_axis_open_connection_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_open_connection'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 50 \
    name m_axis_close_connection \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_close_connection_TREADY { I 1 bit } m_axis_close_connection_TDATA { O 16 vector } m_axis_close_connection_TVALID { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_close_connection'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name runExperiment \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_runExperiment \
    op interface \
    ports { runExperiment_dout { I 1 vector } runExperiment_num_data_valid { I 3 vector } runExperiment_fifo_cap { I 3 vector } runExperiment_empty_n { I 1 bit } runExperiment_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name dualModeEn \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dualModeEn \
    op interface \
    ports { dualModeEn_dout { I 1 vector } dualModeEn_num_data_valid { I 3 vector } dualModeEn_fifo_cap { I 3 vector } dualModeEn_empty_n { I 1 bit } dualModeEn_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name useConn \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_useConn \
    op interface \
    ports { useConn_dout { I 14 vector } useConn_num_data_valid { I 3 vector } useConn_fifo_cap { I 3 vector } useConn_empty_n { I 1 bit } useConn_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name useIpAddr \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_useIpAddr \
    op interface \
    ports { useIpAddr_dout { I 16 vector } useIpAddr_num_data_valid { I 3 vector } useIpAddr_fifo_cap { I 3 vector } useIpAddr_empty_n { I 1 bit } useIpAddr_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name pkgWordCount \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pkgWordCount \
    op interface \
    ports { pkgWordCount_dout { I 8 vector } pkgWordCount_num_data_valid { I 3 vector } pkgWordCount_fifo_cap { I 3 vector } pkgWordCount_empty_n { I 1 bit } pkgWordCount_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name packetGap \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_packetGap \
    op interface \
    ports { packetGap_dout { I 8 vector } packetGap_num_data_valid { I 3 vector } packetGap_fifo_cap { I 3 vector } packetGap_empty_n { I 1 bit } packetGap_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name timeInSeconds \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_timeInSeconds \
    op interface \
    ports { timeInSeconds_dout { I 32 vector } timeInSeconds_num_data_valid { I 3 vector } timeInSeconds_fifo_cap { I 3 vector } timeInSeconds_empty_n { I 1 bit } timeInSeconds_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name regIpAddress0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress0 \
    op interface \
    ports { regIpAddress0_dout { I 32 vector } regIpAddress0_num_data_valid { I 3 vector } regIpAddress0_fifo_cap { I 3 vector } regIpAddress0_empty_n { I 1 bit } regIpAddress0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name regIpAddress1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress1 \
    op interface \
    ports { regIpAddress1_dout { I 32 vector } regIpAddress1_num_data_valid { I 3 vector } regIpAddress1_fifo_cap { I 3 vector } regIpAddress1_empty_n { I 1 bit } regIpAddress1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name regIpAddress2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress2 \
    op interface \
    ports { regIpAddress2_dout { I 32 vector } regIpAddress2_num_data_valid { I 3 vector } regIpAddress2_fifo_cap { I 3 vector } regIpAddress2_empty_n { I 1 bit } regIpAddress2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name regIpAddress3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress3 \
    op interface \
    ports { regIpAddress3_dout { I 32 vector } regIpAddress3_num_data_valid { I 3 vector } regIpAddress3_fifo_cap { I 3 vector } regIpAddress3_empty_n { I 1 bit } regIpAddress3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name regIpAddress4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress4 \
    op interface \
    ports { regIpAddress4_dout { I 32 vector } regIpAddress4_num_data_valid { I 3 vector } regIpAddress4_fifo_cap { I 3 vector } regIpAddress4_empty_n { I 1 bit } regIpAddress4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name regIpAddress5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress5 \
    op interface \
    ports { regIpAddress5_dout { I 32 vector } regIpAddress5_num_data_valid { I 3 vector } regIpAddress5_fifo_cap { I 3 vector } regIpAddress5_empty_n { I 1 bit } regIpAddress5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name regIpAddress6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress6 \
    op interface \
    ports { regIpAddress6_dout { I 32 vector } regIpAddress6_num_data_valid { I 3 vector } regIpAddress6_fifo_cap { I 3 vector } regIpAddress6_empty_n { I 1 bit } regIpAddress6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name regIpAddress7 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress7 \
    op interface \
    ports { regIpAddress7_dout { I 32 vector } regIpAddress7_num_data_valid { I 3 vector } regIpAddress7_fifo_cap { I 3 vector } regIpAddress7_empty_n { I 1 bit } regIpAddress7_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name regIpAddress8 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress8 \
    op interface \
    ports { regIpAddress8_dout { I 32 vector } regIpAddress8_num_data_valid { I 3 vector } regIpAddress8_fifo_cap { I 3 vector } regIpAddress8_empty_n { I 1 bit } regIpAddress8_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name regIpAddress9 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_regIpAddress9 \
    op interface \
    ports { regIpAddress9_dout { I 32 vector } regIpAddress9_num_data_valid { I 3 vector } regIpAddress9_fifo_cap { I 3 vector } regIpAddress9_empty_n { I 1 bit } regIpAddress9_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name openConStatusBuffer \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_openConStatusBuffer \
    op interface \
    ports { openConStatusBuffer_dout { I 32 vector } openConStatusBuffer_num_data_valid { I 10 vector } openConStatusBuffer_fifo_cap { I 10 vector } openConStatusBuffer_empty_n { I 1 bit } openConStatusBuffer_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name txMetaDataBuffer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txMetaDataBuffer \
    op interface \
    ports { txMetaDataBuffer_din { O 32 vector } txMetaDataBuffer_num_data_valid { I 10 vector } txMetaDataBuffer_fifo_cap { I 10 vector } txMetaDataBuffer_full_n { I 1 bit } txMetaDataBuffer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name startSignalFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_startSignalFifo \
    op interface \
    ports { startSignalFifo_din { O 1 vector } startSignalFifo_num_data_valid { I 2 vector } startSignalFifo_fifo_cap { I 2 vector } startSignalFifo_full_n { I 1 bit } startSignalFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name txStatusBuffer \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txStatusBuffer \
    op interface \
    ports { txStatusBuffer_dout { I 32 vector } txStatusBuffer_num_data_valid { I 10 vector } txStatusBuffer_fifo_cap { I 10 vector } txStatusBuffer_empty_n { I 1 bit } txStatusBuffer_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name txDataBuffer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txDataBuffer \
    op interface \
    ports { txDataBuffer_din { O 1024 vector } txDataBuffer_num_data_valid { I 10 vector } txDataBuffer_fifo_cap { I 10 vector } txDataBuffer_full_n { I 1 bit } txDataBuffer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name stopSignalFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stopSignalFifo \
    op interface \
    ports { stopSignalFifo_dout { I 1 vector } stopSignalFifo_num_data_valid { I 2 vector } stopSignalFifo_fifo_cap { I 2 vector } stopSignalFifo_empty_n { I 1 bit } stopSignalFifo_read { O 1 bit } } \
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
set ID 74
set RegSliceName iperf_client_regslice_both
set RegSliceInstName iperf_client_regslice_both_U
set CoreName ap_simcore_iperf_client_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix iperf_client_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 75
set RegSliceName iperf_client_regslice_both
set RegSliceInstName iperf_client_regslice_both_U
set CoreName ap_simcore_iperf_client_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix iperf_client_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


