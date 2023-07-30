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
    id 173 \
    name rxbuffer_data_count \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxbuffer_data_count \
    op interface \
    ports { rxbuffer_data_count { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name rxbuffer_max_data_count \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxbuffer_max_data_count \
    op interface \
    ports { rxbuffer_max_data_count { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name rxEng_fsmMetaDataFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng_fsmMetaDataFifo \
    op interface \
    ports { rxEng_fsmMetaDataFifo_dout { I 256 vector } rxEng_fsmMetaDataFifo_num_data_valid { I 2 vector } rxEng_fsmMetaDataFifo_fifo_cap { I 2 vector } rxEng_fsmMetaDataFifo_empty_n { I 1 bit } rxEng_fsmMetaDataFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name rxEng2stateTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2stateTable_upd_req \
    op interface \
    ports { rxEng2stateTable_upd_req_din { O 96 vector } rxEng2stateTable_upd_req_num_data_valid { I 2 vector } rxEng2stateTable_upd_req_fifo_cap { I 2 vector } rxEng2stateTable_upd_req_full_n { I 1 bit } rxEng2stateTable_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name rxEng2rxSar_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2rxSar_upd_req \
    op interface \
    ports { rxEng2rxSar_upd_req_din { O 192 vector } rxEng2rxSar_upd_req_num_data_valid { I 2 vector } rxEng2rxSar_upd_req_fifo_cap { I 2 vector } rxEng2rxSar_upd_req_full_n { I 1 bit } rxEng2rxSar_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name rxEng2txSar_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2txSar_upd_req \
    op interface \
    ports { rxEng2txSar_upd_req_din { O 192 vector } rxEng2txSar_upd_req_num_data_valid { I 5 vector } rxEng2txSar_upd_req_fifo_cap { I 5 vector } rxEng2txSar_upd_req_full_n { I 1 bit } rxEng2txSar_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name stateTable2rxEng_upd_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2rxEng_upd_rsp \
    op interface \
    ports { stateTable2rxEng_upd_rsp_dout { I 32 vector } stateTable2rxEng_upd_rsp_num_data_valid { I 2 vector } stateTable2rxEng_upd_rsp_fifo_cap { I 2 vector } stateTable2rxEng_upd_rsp_empty_n { I 1 bit } stateTable2rxEng_upd_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name rxSar2rxEng_upd_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxSar2rxEng_upd_rsp \
    op interface \
    ports { rxSar2rxEng_upd_rsp_dout { I 192 vector } rxSar2rxEng_upd_rsp_num_data_valid { I 2 vector } rxSar2rxEng_upd_rsp_fifo_cap { I 2 vector } rxSar2rxEng_upd_rsp_empty_n { I 1 bit } rxSar2rxEng_upd_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name txSar2rxEng_upd_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txSar2rxEng_upd_rsp \
    op interface \
    ports { txSar2rxEng_upd_rsp_dout { I 160 vector } txSar2rxEng_upd_rsp_num_data_valid { I 5 vector } txSar2rxEng_upd_rsp_fifo_cap { I 5 vector } txSar2rxEng_upd_rsp_empty_n { I 1 bit } txSar2rxEng_upd_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name rxEng2timer_clearRetransmitTimer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2timer_clearRetransmitTimer \
    op interface \
    ports { rxEng2timer_clearRetransmitTimer_din { O 32 vector } rxEng2timer_clearRetransmitTimer_num_data_valid { I 2 vector } rxEng2timer_clearRetransmitTimer_fifo_cap { I 2 vector } rxEng2timer_clearRetransmitTimer_full_n { I 1 bit } rxEng2timer_clearRetransmitTimer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name rxEng2timer_clearProbeTimer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2timer_clearProbeTimer \
    op interface \
    ports { rxEng2timer_clearProbeTimer_din { O 16 vector } rxEng2timer_clearProbeTimer_num_data_valid { I 2 vector } rxEng2timer_clearProbeTimer_fifo_cap { I 2 vector } rxEng2timer_clearProbeTimer_full_n { I 1 bit } rxEng2timer_clearProbeTimer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name rxEng2rxApp_notification \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2rxApp_notification \
    op interface \
    ports { rxEng2rxApp_notification_din { O 96 vector } rxEng2rxApp_notification_num_data_valid { I 3 vector } rxEng2rxApp_notification_fifo_cap { I 3 vector } rxEng2rxApp_notification_full_n { I 1 bit } rxEng2rxApp_notification_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name rxEng_fsmDropFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng_fsmDropFifo \
    op interface \
    ports { rxEng_fsmDropFifo_din { O 1 vector } rxEng_fsmDropFifo_num_data_valid { I 2 vector } rxEng_fsmDropFifo_fifo_cap { I 2 vector } rxEng_fsmDropFifo_full_n { I 1 bit } rxEng_fsmDropFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name rxEng_fsmEventFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng_fsmEventFifo \
    op interface \
    ports { rxEng_fsmEventFifo_din { O 128 vector } rxEng_fsmEventFifo_num_data_valid { I 2 vector } rxEng_fsmEventFifo_fifo_cap { I 2 vector } rxEng_fsmEventFifo_full_n { I 1 bit } rxEng_fsmEventFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name rxEng2timer_setCloseTimer \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2timer_setCloseTimer \
    op interface \
    ports { rxEng2timer_setCloseTimer_din { O 16 vector } rxEng2timer_setCloseTimer_num_data_valid { I 2 vector } rxEng2timer_setCloseTimer_fifo_cap { I 2 vector } rxEng2timer_setCloseTimer_full_n { I 1 bit } rxEng2timer_setCloseTimer_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name conEstablishedFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_conEstablishedFifo \
    op interface \
    ports { conEstablishedFifo_din { O 32 vector } conEstablishedFifo_num_data_valid { I 3 vector } conEstablishedFifo_fifo_cap { I 3 vector } conEstablishedFifo_full_n { I 1 bit } conEstablishedFifo_write { O 1 bit } } \
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


