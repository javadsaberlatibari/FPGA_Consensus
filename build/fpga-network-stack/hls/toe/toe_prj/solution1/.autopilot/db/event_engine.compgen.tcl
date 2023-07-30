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
    id 110 \
    name rxEng2eventEng_setEvent \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rxEng2eventEng_setEvent \
    op interface \
    ports { rxEng2eventEng_setEvent_dout { I 224 vector } rxEng2eventEng_setEvent_num_data_valid { I 10 vector } rxEng2eventEng_setEvent_fifo_cap { I 10 vector } rxEng2eventEng_setEvent_empty_n { I 1 bit } rxEng2eventEng_setEvent_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name eventEng2ackDelay_event \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_eventEng2ackDelay_event \
    op interface \
    ports { eventEng2ackDelay_event_din { O 224 vector } eventEng2ackDelay_event_num_data_valid { I 7 vector } eventEng2ackDelay_event_fifo_cap { I 7 vector } eventEng2ackDelay_event_full_n { I 1 bit } eventEng2ackDelay_event_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name timer2eventEng_setEvent \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_timer2eventEng_setEvent \
    op interface \
    ports { timer2eventEng_setEvent_dout { I 128 vector } timer2eventEng_setEvent_num_data_valid { I 7 vector } timer2eventEng_setEvent_fifo_cap { I 7 vector } timer2eventEng_setEvent_empty_n { I 1 bit } timer2eventEng_setEvent_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name txApp2eventEng_setEvent \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txApp2eventEng_setEvent \
    op interface \
    ports { txApp2eventEng_setEvent_dout { I 128 vector } txApp2eventEng_setEvent_num_data_valid { I 7 vector } txApp2eventEng_setEvent_fifo_cap { I 7 vector } txApp2eventEng_setEvent_empty_n { I 1 bit } txApp2eventEng_setEvent_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name ackDelayFifoReadCount \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ackDelayFifoReadCount \
    op interface \
    ports { ackDelayFifoReadCount_dout { I 1 vector } ackDelayFifoReadCount_num_data_valid { I 7 vector } ackDelayFifoReadCount_fifo_cap { I 7 vector } ackDelayFifoReadCount_empty_n { I 1 bit } ackDelayFifoReadCount_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name ackDelayFifoWriteCount \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ackDelayFifoWriteCount \
    op interface \
    ports { ackDelayFifoWriteCount_dout { I 1 vector } ackDelayFifoWriteCount_num_data_valid { I 7 vector } ackDelayFifoWriteCount_fifo_cap { I 7 vector } ackDelayFifoWriteCount_empty_n { I 1 bit } ackDelayFifoWriteCount_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name txEngFifoReadCount \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_txEngFifoReadCount \
    op interface \
    ports { txEngFifoReadCount_dout { I 1 vector } txEngFifoReadCount_num_data_valid { I 7 vector } txEngFifoReadCount_fifo_cap { I 7 vector } txEngFifoReadCount_empty_n { I 1 bit } txEngFifoReadCount_read { O 1 bit } } \
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


