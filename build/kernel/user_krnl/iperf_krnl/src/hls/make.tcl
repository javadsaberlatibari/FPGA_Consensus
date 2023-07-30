
open_project iperf_client_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 3.2 -name default

set_top iperf_client

add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/kernel/user_krnl/iperf_krnl/src/hls/iperf_client.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/kernel/user_krnl/iperf_krnl/src/hls"


add_files -tb /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/kernel/user_krnl/iperf_krnl/src/hls/test_iperf_client.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   export_design -format ip_catalog -ipname "iperf_client" -display_name "iperf client" -vendor "ethz.systems.fpga" -version "1.0"
} elseif {$command == "installip"} {
   file mkdir /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo
   file delete -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/iperf_client
   file copy -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/kernel/user_krnl/iperf_krnl/src/hls/iperf_client_prj/solution1/impl/ip /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/iperf_client/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
