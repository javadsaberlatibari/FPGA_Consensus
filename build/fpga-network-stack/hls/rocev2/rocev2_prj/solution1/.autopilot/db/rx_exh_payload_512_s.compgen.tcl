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
    id 81 \
    name rx_pkgSplitTypeFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgSplitTypeFifo \
    op interface \
    ports { rx_pkgSplitTypeFifo_dout { I 64 vector } rx_pkgSplitTypeFifo_num_data_valid { I 2 vector } rx_pkgSplitTypeFifo_fifo_cap { I 2 vector } rx_pkgSplitTypeFifo_empty_n { I 1 bit } rx_pkgSplitTypeFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name rx_ibhDrop2exhFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo \
    op interface \
    ports { rx_ibhDrop2exhFifo_dout { I 1024 vector } rx_ibhDrop2exhFifo_num_data_valid { I 6 vector } rx_ibhDrop2exhFifo_fifo_cap { I 6 vector } rx_ibhDrop2exhFifo_empty_n { I 1 bit } rx_ibhDrop2exhFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name rx_exh2rethShiftFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo \
    op interface \
    ports { rx_exh2rethShiftFifo_din { O 1024 vector } rx_exh2rethShiftFifo_num_data_valid { I 3 vector } rx_exh2rethShiftFifo_fifo_cap { I 3 vector } rx_exh2rethShiftFifo_full_n { I 1 bit } rx_exh2rethShiftFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name rx_exh2aethShiftFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2aethShiftFifo \
    op interface \
    ports { rx_exh2aethShiftFifo_din { O 1024 vector } rx_exh2aethShiftFifo_num_data_valid { I 3 vector } rx_exh2aethShiftFifo_fifo_cap { I 3 vector } rx_exh2aethShiftFifo_full_n { I 1 bit } rx_exh2aethShiftFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name rx_exhNoShiftFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo \
    op interface \
    ports { rx_exhNoShiftFifo_din { O 1024 vector } rx_exhNoShiftFifo_num_data_valid { I 3 vector } rx_exhNoShiftFifo_fifo_cap { I 3 vector } rx_exhNoShiftFifo_full_n { I 1 bit } rx_exhNoShiftFifo_write { O 1 bit } } \
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


