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
    id 194 \
    name tx_readReqAddr_push \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push \
    op interface \
    ports { tx_readReqAddr_push_dout { I 128 vector } tx_readReqAddr_push_num_data_valid { I 2 vector } tx_readReqAddr_push_fifo_cap { I 2 vector } tx_readReqAddr_push_empty_n { I 1 bit } tx_readReqAddr_push_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name mq_freeListFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_freeListFifo \
    op interface \
    ports { mq_freeListFifo_dout { I 16 vector } mq_freeListFifo_num_data_valid { I 12 vector } mq_freeListFifo_fifo_cap { I 12 vector } mq_freeListFifo_empty_n { I 1 bit } mq_freeListFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name mq_pointerReqFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerReqFifo \
    op interface \
    ports { mq_pointerReqFifo_din { O 32 vector } mq_pointerReqFifo_num_data_valid { I 2 vector } mq_pointerReqFifo_fifo_cap { I 2 vector } mq_pointerReqFifo_full_n { I 1 bit } mq_pointerReqFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name rx_readReqAddr_pop_req \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_req \
    op interface \
    ports { rx_readReqAddr_pop_req_dout { I 64 vector } rx_readReqAddr_pop_req_num_data_valid { I 2 vector } rx_readReqAddr_pop_req_fifo_cap { I 2 vector } rx_readReqAddr_pop_req_empty_n { I 1 bit } rx_readReqAddr_pop_req_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name mq_pointerRspFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerRspFifo \
    op interface \
    ports { mq_pointerRspFifo_dout { I 48 vector } mq_pointerRspFifo_num_data_valid { I 2 vector } mq_pointerRspFifo_fifo_cap { I 2 vector } mq_pointerRspFifo_empty_n { I 1 bit } mq_pointerRspFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name mq_metaReqFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo \
    op interface \
    ports { mq_metaReqFifo_din { O 256 vector } mq_metaReqFifo_num_data_valid { I 2 vector } mq_metaReqFifo_fifo_cap { I 2 vector } mq_metaReqFifo_full_n { I 1 bit } mq_metaReqFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name mq_pointerUpdFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerUpdFifo \
    op interface \
    ports { mq_pointerUpdFifo_din { O 64 vector } mq_pointerUpdFifo_num_data_valid { I 2 vector } mq_pointerUpdFifo_fifo_cap { I 2 vector } mq_pointerUpdFifo_full_n { I 1 bit } mq_pointerUpdFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name mq_metaRspFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaRspFifo \
    op interface \
    ports { mq_metaRspFifo_dout { I 128 vector } mq_metaRspFifo_num_data_valid { I 2 vector } mq_metaRspFifo_fifo_cap { I 2 vector } mq_metaRspFifo_empty_n { I 1 bit } mq_metaRspFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name rx_readReqAddr_pop_rsp \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_rsp \
    op interface \
    ports { rx_readReqAddr_pop_rsp_din { O 64 vector } rx_readReqAddr_pop_rsp_num_data_valid { I 2 vector } rx_readReqAddr_pop_rsp_fifo_cap { I 2 vector } rx_readReqAddr_pop_rsp_full_n { I 1 bit } rx_readReqAddr_pop_rsp_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name mq_releaseFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_releaseFifo \
    op interface \
    ports { mq_releaseFifo_din { O 16 vector } mq_releaseFifo_num_data_valid { I 2 vector } mq_releaseFifo_fifo_cap { I 2 vector } mq_releaseFifo_full_n { I 1 bit } mq_releaseFifo_write { O 1 bit } } \
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


