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
    id 116 \
    name rx_ackEventFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ackEventFifo \
    op interface \
    ports { rx_ackEventFifo_dout { I 96 vector } rx_ackEventFifo_num_data_valid { I 3 vector } rx_ackEventFifo_fifo_cap { I 3 vector } rx_ackEventFifo_empty_n { I 1 bit } rx_ackEventFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name tx_ibhconnTable_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhconnTable_req \
    op interface \
    ports { tx_ibhconnTable_req_din { O 16 vector } tx_ibhconnTable_req_num_data_valid { I 2 vector } tx_ibhconnTable_req_fifo_cap { I 2 vector } tx_ibhconnTable_req_full_n { I 1 bit } tx_ibhconnTable_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name tx_ibhMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo \
    op interface \
    ports { tx_ibhMetaFifo_din { O 192 vector } tx_ibhMetaFifo_num_data_valid { I 4 vector } tx_ibhMetaFifo_fifo_cap { I 4 vector } tx_ibhMetaFifo_full_n { I 1 bit } tx_ibhMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name tx_exhMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exhMetaFifo \
    op interface \
    ports { tx_exhMetaFifo_din { O 256 vector } tx_exhMetaFifo_num_data_valid { I 3 vector } tx_exhMetaFifo_fifo_cap { I 3 vector } tx_exhMetaFifo_full_n { I 1 bit } tx_exhMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name rx_readEvenFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readEvenFifo \
    op interface \
    ports { rx_readEvenFifo_dout { I 256 vector } rx_readEvenFifo_num_data_valid { I 10 vector } rx_readEvenFifo_fifo_cap { I 10 vector } rx_readEvenFifo_empty_n { I 1 bit } rx_readEvenFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name tx_appMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo \
    op interface \
    ports { tx_appMetaFifo_dout { I 256 vector } tx_appMetaFifo_num_data_valid { I 6 vector } tx_appMetaFifo_fifo_cap { I 6 vector } tx_appMetaFifo_empty_n { I 1 bit } tx_appMetaFifo_read { O 1 bit } } \
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


