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
    id 146 \
    name tx_ibhHeaderFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhHeaderFifo \
    op interface \
    ports { tx_ibhHeaderFifo_dout { I 256 vector } tx_ibhHeaderFifo_num_data_valid { I 2 vector } tx_ibhHeaderFifo_fifo_cap { I 2 vector } tx_ibhHeaderFifo_empty_n { I 1 bit } tx_ibhHeaderFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name tx_ib2udpFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ib2udpFifo \
    op interface \
    ports { tx_ib2udpFifo_din { O 1024 vector } tx_ib2udpFifo_num_data_valid { I 2 vector } tx_ib2udpFifo_fifo_cap { I 2 vector } tx_ib2udpFifo_full_n { I 1 bit } tx_ib2udpFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name tx_shift2ibhFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_shift2ibhFifo \
    op interface \
    ports { tx_shift2ibhFifo_dout { I 1024 vector } tx_shift2ibhFifo_num_data_valid { I 4 vector } tx_shift2ibhFifo_fifo_cap { I 4 vector } tx_shift2ibhFifo_empty_n { I 1 bit } tx_shift2ibhFifo_read { O 1 bit } } \
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


