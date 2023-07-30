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
    id 126 \
    name tx_exhMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exhMetaFifo \
    op interface \
    ports { tx_exhMetaFifo_dout { I 256 vector } tx_exhMetaFifo_num_data_valid { I 3 vector } tx_exhMetaFifo_fifo_cap { I 3 vector } tx_exhMetaFifo_empty_n { I 1 bit } tx_exhMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name txExh2msnTable_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txExh2msnTable_req \
    op interface \
    ports { txExh2msnTable_req_din { O 16 vector } txExh2msnTable_req_num_data_valid { I 2 vector } txExh2msnTable_req_fifo_cap { I 2 vector } txExh2msnTable_req_full_n { I 1 bit } txExh2msnTable_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name msnTable2txExh_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_msnTable2txExh_rsp \
    op interface \
    ports { msnTable2txExh_rsp_dout { I 64 vector } msnTable2txExh_rsp_num_data_valid { I 2 vector } msnTable2txExh_rsp_fifo_cap { I 2 vector } msnTable2txExh_rsp_empty_n { I 1 bit } msnTable2txExh_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name tx_exh2payFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo \
    op interface \
    ports { tx_exh2payFifo_din { O 1024 vector } tx_exh2payFifo_num_data_valid { I 3 vector } tx_exh2payFifo_fifo_cap { I 3 vector } tx_exh2payFifo_full_n { I 1 bit } tx_exh2payFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name tx_packetInfoFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_packetInfoFifo \
    op interface \
    ports { tx_packetInfoFifo_din { O 24 vector } tx_packetInfoFifo_num_data_valid { I 2 vector } tx_packetInfoFifo_fifo_cap { I 2 vector } tx_packetInfoFifo_full_n { I 1 bit } tx_packetInfoFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name tx_lengthFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_lengthFifo \
    op interface \
    ports { tx_lengthFifo_din { O 16 vector } tx_lengthFifo_num_data_valid { I 3 vector } tx_lengthFifo_fifo_cap { I 3 vector } tx_lengthFifo_full_n { I 1 bit } tx_lengthFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name tx_readReqTable_upd \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqTable_upd \
    op interface \
    ports { tx_readReqTable_upd_din { O 64 vector } tx_readReqTable_upd_num_data_valid { I 2 vector } tx_readReqTable_upd_fifo_cap { I 2 vector } tx_readReqTable_upd_full_n { I 1 bit } tx_readReqTable_upd_write { O 1 bit } } \
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


