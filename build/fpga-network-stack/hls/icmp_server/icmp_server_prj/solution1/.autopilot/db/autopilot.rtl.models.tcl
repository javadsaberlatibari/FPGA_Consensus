set SynModuleInfo {
  {SRCNAME check_icmp_checksum MODELNAME check_icmp_checksum RTLNAME icmp_server_check_icmp_checksum
    SUBMODULES {
      {MODELNAME icmp_server_regslice_both RTLNAME icmp_server_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME icmp_server_regslice_both_U}
    }
  }
  {SRCNAME udpPortUnreachable MODELNAME udpPortUnreachable RTLNAME icmp_server_udpPortUnreachable}
  {SRCNAME udpAddIpHeader MODELNAME udpAddIpHeader RTLNAME icmp_server_udpAddIpHeader}
  {SRCNAME dropper MODELNAME dropper RTLNAME icmp_server_dropper}
  {SRCNAME insertChecksum MODELNAME insertChecksum RTLNAME icmp_server_insertChecksum}
  {SRCNAME icmp_server MODELNAME icmp_server RTLNAME icmp_server IS_TOP 1
    SUBMODULES {
      {MODELNAME icmp_server_fifo_w128_d64_A RTLNAME icmp_server_fifo_w128_d64_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME icmp_server_fifo_w1_d8_S RTLNAME icmp_server_fifo_w1_d8_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME icmp_server_fifo_w16_d16_S RTLNAME icmp_server_fifo_w16_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME icmp_server_fifo_w128_d192_A RTLNAME icmp_server_fifo_w128_d192_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME icmp_server_fifo_w64_d64_A RTLNAME icmp_server_fifo_w64_d64_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME icmp_server_fifo_w128_d16_A RTLNAME icmp_server_fifo_w128_d16_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
