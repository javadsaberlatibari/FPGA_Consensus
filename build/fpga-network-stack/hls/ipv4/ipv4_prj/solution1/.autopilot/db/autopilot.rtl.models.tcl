set SynModuleInfo {
  {SRCNAME process_ipv4<512> MODELNAME process_ipv4_512_s RTLNAME ipv4_top_process_ipv4_512_s
    SUBMODULES {
      {MODELNAME ipv4_top_regslice_both RTLNAME ipv4_top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME ipv4_top_regslice_both_U}
    }
  }
  {SRCNAME ipv4_drop_optional_ip_header<512> MODELNAME ipv4_drop_optional_ip_header_512_s RTLNAME ipv4_top_ipv4_drop_optional_ip_header_512_s}
  {SRCNAME {ipv4_lshiftWordByOctet<512, 2>} MODELNAME ipv4_lshiftWordByOctet_512_2_s RTLNAME ipv4_top_ipv4_lshiftWordByOctet_512_2_s}
  {SRCNAME ipv4_generate_ipv4<512> MODELNAME ipv4_generate_ipv4_512_s RTLNAME ipv4_top_ipv4_generate_ipv4_512_s}
  {SRCNAME ipv4_top MODELNAME ipv4_top RTLNAME ipv4_top IS_TOP 1
    SUBMODULES {
      {MODELNAME ipv4_top_fifo_w1024_d8_A RTLNAME ipv4_top_fifo_w1024_d8_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME ipv4_top_fifo_w4_d2_S RTLNAME ipv4_top_fifo_w4_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
