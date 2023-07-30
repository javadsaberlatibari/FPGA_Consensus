set SynModuleInfo {
  {SRCNAME process_arp_pkg<512> MODELNAME process_arp_pkg_512_s RTLNAME arp_server_subnet_top_process_arp_pkg_512_s
    SUBMODULES {
      {MODELNAME arp_server_subnet_top_regslice_both RTLNAME arp_server_subnet_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME arp_server_subnet_top_regslice_both_U}
    }
  }
  {SRCNAME generate_arp_pkg<512> MODELNAME generate_arp_pkg_512_s RTLNAME arp_server_subnet_top_generate_arp_pkg_512_s}
  {SRCNAME arp_table MODELNAME arp_table RTLNAME arp_server_subnet_top_arp_table
    SUBMODULES {
      {MODELNAME arp_server_subnet_top_arp_table_arpTable_macAddress_V_RAM_1P_BRAM_1R1W RTLNAME arp_server_subnet_top_arp_table_arpTable_macAddress_V_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME arp_server_subnet_top_arp_table_arpTable_valid_RAM_1P_BRAM_1R1W RTLNAME arp_server_subnet_top_arp_table_arpTable_valid_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME arp_server_subnet_top MODELNAME arp_server_subnet_top RTLNAME arp_server_subnet_top IS_TOP 1
    SUBMODULES {
      {MODELNAME arp_server_subnet_top_fifo_w192_d4_S RTLNAME arp_server_subnet_top_fifo_w192_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME arp_server_subnet_top_fifo_w32_d4_S RTLNAME arp_server_subnet_top_fifo_w32_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
