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
    id 141 \
    name tx_ibhMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo \
    op interface \
    ports { tx_ibhMetaFifo_dout { I 192 vector } tx_ibhMetaFifo_num_data_valid { I 4 vector } tx_ibhMetaFifo_fifo_cap { I 4 vector } tx_ibhMetaFifo_empty_n { I 1 bit } tx_ibhMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name tx_dstQpFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_dstQpFifo \
    op interface \
    ports { tx_dstQpFifo_dout { I 24 vector } tx_dstQpFifo_num_data_valid { I 2 vector } tx_dstQpFifo_fifo_cap { I 2 vector } tx_dstQpFifo_empty_n { I 1 bit } tx_dstQpFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name tx_ibhHeaderFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhHeaderFifo \
    op interface \
    ports { tx_ibhHeaderFifo_din { O 256 vector } tx_ibhHeaderFifo_num_data_valid { I 2 vector } tx_ibhHeaderFifo_fifo_cap { I 2 vector } tx_ibhHeaderFifo_full_n { I 1 bit } tx_ibhHeaderFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name txIbh2stateTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txIbh2stateTable_upd_req \
    op interface \
    ports { txIbh2stateTable_upd_req_din { O 96 vector } txIbh2stateTable_upd_req_num_data_valid { I 2 vector } txIbh2stateTable_upd_req_fifo_cap { I 2 vector } txIbh2stateTable_upd_req_full_n { I 1 bit } txIbh2stateTable_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name stateTable2txIbh_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2txIbh_rsp \
    op interface \
    ports { stateTable2txIbh_rsp_dout { I 192 vector } stateTable2txIbh_rsp_num_data_valid { I 2 vector } stateTable2txIbh_rsp_fifo_cap { I 2 vector } stateTable2txIbh_rsp_empty_n { I 1 bit } stateTable2txIbh_rsp_read { O 1 bit } } \
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


