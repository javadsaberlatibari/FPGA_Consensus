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
    id 50 \
    name regInvalidPsnDropCount \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_regInvalidPsnDropCount \
    op interface \
    ports { regInvalidPsnDropCount { O 32 vector } regInvalidPsnDropCount_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name rx_ibh2fsm_MetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2fsm_MetaFifo \
    op interface \
    ports { rx_ibh2fsm_MetaFifo_dout { I 192 vector } rx_ibh2fsm_MetaFifo_num_data_valid { I 2 vector } rx_ibh2fsm_MetaFifo_fifo_cap { I 2 vector } rx_ibh2fsm_MetaFifo_empty_n { I 1 bit } rx_ibh2fsm_MetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name rx_exhMetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhMetaFifo \
    op interface \
    ports { rx_exhMetaFifo_dout { I 64 vector } rx_exhMetaFifo_num_data_valid { I 2 vector } rx_exhMetaFifo_fifo_cap { I 2 vector } rx_exhMetaFifo_empty_n { I 1 bit } rx_exhMetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name rxIbh2stateTable_upd_req \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxIbh2stateTable_upd_req \
    op interface \
    ports { rxIbh2stateTable_upd_req_din { O 96 vector } rxIbh2stateTable_upd_req_num_data_valid { I 2 vector } rxIbh2stateTable_upd_req_fifo_cap { I 2 vector } rxIbh2stateTable_upd_req_full_n { I 1 bit } rxIbh2stateTable_upd_req_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name stateTable2rxIbh_rsp \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2rxIbh_rsp \
    op interface \
    ports { stateTable2rxIbh_rsp_dout { I 128 vector } stateTable2rxIbh_rsp_num_data_valid { I 2 vector } stateTable2rxIbh_rsp_fifo_cap { I 2 vector } stateTable2rxIbh_rsp_empty_n { I 1 bit } stateTable2rxIbh_rsp_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name rx_ibhDropFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropFifo \
    op interface \
    ports { rx_ibhDropFifo_din { O 1 vector } rx_ibhDropFifo_num_data_valid { I 2 vector } rx_ibhDropFifo_fifo_cap { I 2 vector } rx_ibhDropFifo_full_n { I 1 bit } rx_ibhDropFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name rx_ibhDropMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropMetaFifo \
    op interface \
    ports { rx_ibhDropMetaFifo_din { O 16 vector } rx_ibhDropMetaFifo_num_data_valid { I 2 vector } rx_ibhDropMetaFifo_fifo_cap { I 2 vector } rx_ibhDropMetaFifo_full_n { I 1 bit } rx_ibhDropMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name rx_fsm2exh_MetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_fsm2exh_MetaFifo \
    op interface \
    ports { rx_fsm2exh_MetaFifo_din { O 192 vector } rx_fsm2exh_MetaFifo_num_data_valid { I 2 vector } rx_fsm2exh_MetaFifo_fifo_cap { I 2 vector } rx_fsm2exh_MetaFifo_full_n { I 1 bit } rx_fsm2exh_MetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name rx_ibhEventFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhEventFifo \
    op interface \
    ports { rx_ibhEventFifo_din { O 96 vector } rx_ibhEventFifo_num_data_valid { I 2 vector } rx_ibhEventFifo_fifo_cap { I 2 vector } rx_ibhEventFifo_full_n { I 1 bit } rx_ibhEventFifo_write { O 1 bit } } \
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


