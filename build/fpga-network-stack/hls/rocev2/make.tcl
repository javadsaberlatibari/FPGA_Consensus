if { [info exists ::env(LIBRARY_PATH)] } {
    set ::env(LIBRARY_PATH) /usr/lib/x86_64-linux-gnu:$env(LIBRARY_PATH)
} else {
    set ::env(LIBRARY_PATH) /usr/lib/x86_64-linux-gnu
}

open_project rocev2_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 3.2 -name default

set_top rocev2_top

add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../axi_utils.cpp
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ipv4/ipv4_utils.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ipv4/ipv4.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ipv6/ipv6.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../udp/udp.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/ib_utils.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/ib_transport_protocol.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/read_req_table.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/transport_timer.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/retransmitter/retransmitter.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/state_table.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/conn_table.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/../ib_transport_protocol/msn_table.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/rocev2.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"


add_files -tb /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/test_rocev2.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2"


#config_rtl -disable_start_propagation

#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design -argv {/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/write_read_read_large_receiver.in /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/write_read_read_large_receiver.out /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/rdma_txwriteread.in /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/rocev2/rdma_txwriteread.out}
} elseif {$command == "ip"} {
   #config_rtl -module_prefix "rocev2_"
   export_design -format ip_catalog -ipname "rocev2" -display_name "RoCEv2 Endpoint" -description "" -vendor "ethz.systems.fpga" -version "0.82"
} elseif {$command == "installip"} {
   file mkdir /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo
   #config_rtl -module_prefix "rocev2_"
   file delete -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/rocev2
   file copy -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2/rocev2_prj/solution1/impl/ip /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/rocev2/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip|installip> ."
}


exit
