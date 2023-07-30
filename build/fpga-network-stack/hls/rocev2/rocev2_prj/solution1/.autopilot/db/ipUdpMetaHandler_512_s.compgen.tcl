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
    id 62 \
    name rx_ipUdpMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo \
    op interface \
    ports { rx_ipUdpMetaFifo_dout { I 256 vector } rx_ipUdpMetaFifo_num_data_valid { I 4 vector } rx_ipUdpMetaFifo_fifo_cap { I 4 vector } rx_ipUdpMetaFifo_empty_n { I 1 bit } rx_ipUdpMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name rx_exh2drop_MetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2drop_MetaFifo \
    op interface \
    ports { rx_exh2drop_MetaFifo_dout { I 512 vector } rx_exh2drop_MetaFifo_num_data_valid { I 4 vector } rx_exh2drop_MetaFifo_fifo_cap { I 4 vector } rx_exh2drop_MetaFifo_empty_n { I 1 bit } rx_exh2drop_MetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name rx_ibhDropMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropMetaFifo \
    op interface \
    ports { rx_ibhDropMetaFifo_dout { I 16 vector } rx_ibhDropMetaFifo_num_data_valid { I 2 vector } rx_ibhDropMetaFifo_fifo_cap { I 2 vector } rx_ibhDropMetaFifo_empty_n { I 1 bit } rx_ibhDropMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name exh_lengthFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_exh_lengthFifo \
    op interface \
    ports { exh_lengthFifo_din { O 16 vector } exh_lengthFifo_num_data_valid { I 3 vector } exh_lengthFifo_fifo_cap { I 3 vector } exh_lengthFifo_full_n { I 1 bit } exh_lengthFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name rx_drop2exhFsm_MetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_drop2exhFsm_MetaFifo \
    op interface \
    ports { rx_drop2exhFsm_MetaFifo_din { O 512 vector } rx_drop2exhFsm_MetaFifo_num_data_valid { I 2 vector } rx_drop2exhFsm_MetaFifo_fifo_cap { I 2 vector } rx_drop2exhFsm_MetaFifo_full_n { I 1 bit } rx_drop2exhFsm_MetaFifo_write { O 1 bit } } \
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


