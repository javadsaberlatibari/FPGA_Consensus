# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name txEng_tcpMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_tcpMetaFifo \
    op interface \
    ports { txEng_tcpMetaFifo_dout { I 160 vector } txEng_tcpMetaFifo_num_data_valid { I 6 vector } txEng_tcpMetaFifo_fifo_cap { I 6 vector } txEng_tcpMetaFifo_empty_n { I 1 bit } txEng_tcpMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name txEng_tcpTupleFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_tcpTupleFifo \
    op interface \
    ports { txEng_tcpTupleFifo_dout { I 96 vector } txEng_tcpTupleFifo_num_data_valid { I 6 vector } txEng_tcpTupleFifo_fifo_cap { I 6 vector } txEng_tcpTupleFifo_empty_n { I 1 bit } txEng_tcpTupleFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name txEng_tcpPkgBuffer1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_tcpPkgBuffer1 \
    op interface \
    ports { txEng_tcpPkgBuffer1_din { O 1024 vector } txEng_tcpPkgBuffer1_num_data_valid { I 5 vector } txEng_tcpPkgBuffer1_fifo_cap { I 5 vector } txEng_tcpPkgBuffer1_full_n { I 1 bit } txEng_tcpPkgBuffer1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name txEng_shift2pseudoFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_shift2pseudoFifo \
    op interface \
    ports { txEng_shift2pseudoFifo_dout { I 1024 vector } txEng_shift2pseudoFifo_num_data_valid { I 2 vector } txEng_shift2pseudoFifo_fifo_cap { I 2 vector } txEng_shift2pseudoFifo_empty_n { I 1 bit } txEng_shift2pseudoFifo_read { O 1 bit } } \
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


