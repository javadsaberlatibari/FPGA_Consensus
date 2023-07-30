# This script segment is generated automatically by AutoPilot

set name rocev2_top_mul_33ns_35ns_66_2_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name rx_ibh2exh_MetaFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2exh_MetaFifo \
    op interface \
    ports { rx_ibh2exh_MetaFifo_dout { I 32 vector } rx_ibh2exh_MetaFifo_num_data_valid { I 2 vector } rx_ibh2exh_MetaFifo_fifo_cap { I 2 vector } rx_ibh2exh_MetaFifo_empty_n { I 1 bit } rx_ibh2exh_MetaFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name rx_shift2exhFifo \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_shift2exhFifo \
    op interface \
    ports { rx_shift2exhFifo_dout { I 1024 vector } rx_shift2exhFifo_num_data_valid { I 2 vector } rx_shift2exhFifo_fifo_cap { I 2 vector } rx_shift2exhFifo_empty_n { I 1 bit } rx_shift2exhFifo_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name rx_exh2dropFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2dropFifo \
    op interface \
    ports { rx_exh2dropFifo_din { O 1024 vector } rx_exh2dropFifo_num_data_valid { I 6 vector } rx_exh2dropFifo_fifo_cap { I 6 vector } rx_exh2dropFifo_full_n { I 1 bit } rx_exh2dropFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name rx_exhMetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhMetaFifo \
    op interface \
    ports { rx_exhMetaFifo_din { O 64 vector } rx_exhMetaFifo_num_data_valid { I 2 vector } rx_exhMetaFifo_fifo_cap { I 2 vector } rx_exhMetaFifo_full_n { I 1 bit } rx_exhMetaFifo_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name rx_exh2drop_MetaFifo \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2drop_MetaFifo \
    op interface \
    ports { rx_exh2drop_MetaFifo_din { O 512 vector } rx_exh2drop_MetaFifo_num_data_valid { I 4 vector } rx_exh2drop_MetaFifo_fifo_cap { I 4 vector } rx_exh2drop_MetaFifo_full_n { I 1 bit } rx_exh2drop_MetaFifo_write { O 1 bit } } \
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


