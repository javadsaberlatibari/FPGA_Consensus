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
    id 149 \
    name tx_connTable2ibh_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_connTable2ibh_rsp \
    op interface \
    ports { tx_connTable2ibh_rsp_dout { I 384 vector } tx_connTable2ibh_rsp_num_data_valid { I 4 vector } tx_connTable2ibh_rsp_fifo_cap { I 4 vector } tx_connTable2ibh_rsp_empty_n { I 1 bit } tx_connTable2ibh_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name tx_lengthFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_lengthFifo \
    op interface \
    ports { tx_lengthFifo_dout { I 16 vector } tx_lengthFifo_num_data_valid { I 3 vector } tx_lengthFifo_fifo_cap { I 3 vector } tx_lengthFifo_empty_n { I 1 bit } tx_lengthFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name tx_ipUdpMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ipUdpMetaFifo \
    op interface \
    ports { tx_ipUdpMetaFifo_din { O 256 vector } tx_ipUdpMetaFifo_num_data_valid { I 2 vector } tx_ipUdpMetaFifo_fifo_cap { I 2 vector } tx_ipUdpMetaFifo_full_n { I 1 bit } tx_ipUdpMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name tx_dstQpFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_dstQpFifo \
    op interface \
    ports { tx_dstQpFifo_din { O 24 vector } tx_dstQpFifo_num_data_valid { I 2 vector } tx_dstQpFifo_fifo_cap { I 2 vector } tx_dstQpFifo_full_n { I 1 bit } tx_dstQpFifo_write { O 1 bit } } \
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


