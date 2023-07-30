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
    id 197 \
    name eventEng2txEng_event \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_eventEng2txEng_event \
    op interface \
    ports { eventEng2txEng_event_dout { I 224 vector } eventEng2txEng_event_num_data_valid { I 7 vector } eventEng2txEng_event_fifo_cap { I 7 vector } eventEng2txEng_event_empty_n { I 1 bit } eventEng2txEng_event_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name txEngFifoReadCount \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEngFifoReadCount \
    op interface \
    ports { txEngFifoReadCount_din { O 1 vector } txEngFifoReadCount_num_data_valid { I 7 vector } txEngFifoReadCount_fifo_cap { I 7 vector } txEngFifoReadCount_full_n { I 1 bit } txEngFifoReadCount_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name txEng2rxSar_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng2rxSar_req \
    op interface \
    ports { txEng2rxSar_req_din { O 16 vector } txEng2rxSar_req_num_data_valid { I 2 vector } txEng2rxSar_req_fifo_cap { I 2 vector } txEng2rxSar_req_full_n { I 1 bit } txEng2rxSar_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name txEng2txSar_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng2txSar_upd_req \
    op interface \
    ports { txEng2txSar_upd_req_din { O 128 vector } txEng2txSar_upd_req_num_data_valid { I 5 vector } txEng2txSar_upd_req_fifo_cap { I 5 vector } txEng2txSar_upd_req_full_n { I 1 bit } txEng2txSar_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name rxSar2txEng_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxSar2txEng_rsp \
    op interface \
    ports { rxSar2txEng_rsp_dout { I 96 vector } rxSar2txEng_rsp_num_data_valid { I 2 vector } rxSar2txEng_rsp_fifo_cap { I 2 vector } rxSar2txEng_rsp_empty_n { I 1 bit } rxSar2txEng_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name txSar2txEng_upd_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txSar2txEng_upd_rsp \
    op interface \
    ports { txSar2txEng_upd_rsp_dout { I 192 vector } txSar2txEng_upd_rsp_num_data_valid { I 5 vector } txSar2txEng_upd_rsp_fifo_cap { I 5 vector } txSar2txEng_upd_rsp_empty_n { I 1 bit } txSar2txEng_upd_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name txEng2timer_setProbeTimer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng2timer_setProbeTimer \
    op interface \
    ports { txEng2timer_setProbeTimer_din { O 16 vector } txEng2timer_setProbeTimer_num_data_valid { I 2 vector } txEng2timer_setProbeTimer_fifo_cap { I 2 vector } txEng2timer_setProbeTimer_full_n { I 1 bit } txEng2timer_setProbeTimer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name txEng_ipMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_ipMetaFifo \
    op interface \
    ports { txEng_ipMetaFifo_din { O 16 vector } txEng_ipMetaFifo_num_data_valid { I 6 vector } txEng_ipMetaFifo_fifo_cap { I 6 vector } txEng_ipMetaFifo_full_n { I 1 bit } txEng_ipMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name txEng_tcpMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_tcpMetaFifo \
    op interface \
    ports { txEng_tcpMetaFifo_din { O 160 vector } txEng_tcpMetaFifo_num_data_valid { I 6 vector } txEng_tcpMetaFifo_fifo_cap { I 6 vector } txEng_tcpMetaFifo_full_n { I 1 bit } txEng_tcpMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name txEng_isLookUpFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_isLookUpFifo \
    op interface \
    ports { txEng_isLookUpFifo_din { O 1 vector } txEng_isLookUpFifo_num_data_valid { I 3 vector } txEng_isLookUpFifo_fifo_cap { I 3 vector } txEng_isLookUpFifo_full_n { I 1 bit } txEng_isLookUpFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name txEng_isDDRbypass \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_isDDRbypass \
    op interface \
    ports { txEng_isDDRbypass_din { O 1 vector } txEng_isDDRbypass_num_data_valid { I 6 vector } txEng_isDDRbypass_fifo_cap { I 6 vector } txEng_isDDRbypass_full_n { I 1 bit } txEng_isDDRbypass_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name txEng2sLookup_rev_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng2sLookup_rev_req \
    op interface \
    ports { txEng2sLookup_rev_req_din { O 16 vector } txEng2sLookup_rev_req_num_data_valid { I 3 vector } txEng2sLookup_rev_req_fifo_cap { I 3 vector } txEng2sLookup_rev_req_full_n { I 1 bit } txEng2sLookup_rev_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name txEng2timer_setRetransmitTimer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng2timer_setRetransmitTimer \
    op interface \
    ports { txEng2timer_setRetransmitTimer_din { O 64 vector } txEng2timer_setRetransmitTimer_num_data_valid { I 2 vector } txEng2timer_setRetransmitTimer_fifo_cap { I 2 vector } txEng2timer_setRetransmitTimer_full_n { I 1 bit } txEng2timer_setRetransmitTimer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name txMetaloader2memAccessBreakdown \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txMetaloader2memAccessBreakdown \
    op interface \
    ports { txMetaloader2memAccessBreakdown_din { O 128 vector } txMetaloader2memAccessBreakdown_num_data_valid { I 6 vector } txMetaloader2memAccessBreakdown_fifo_cap { I 6 vector } txMetaloader2memAccessBreakdown_full_n { I 1 bit } txMetaloader2memAccessBreakdown_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name txEng_tupleShortCutFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txEng_tupleShortCutFifo \
    op interface \
    ports { txEng_tupleShortCutFifo_din { O 96 vector } txEng_tupleShortCutFifo_num_data_valid { I 2 vector } txEng_tupleShortCutFifo_fifo_cap { I 2 vector } txEng_tupleShortCutFifo_full_n { I 1 bit } txEng_tupleShortCutFifo_write { O 1 bit } } \
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


