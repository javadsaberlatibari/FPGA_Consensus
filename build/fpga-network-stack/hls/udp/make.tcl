
open_project udp_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 3.2 -name default

set_top udp_top

#add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/udp/../packet.hpp
#add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/udp/udp.hpp
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/udp/udp.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/udp"


#add_files -tb test_udp.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   #config_rtl -module_prefix "udp_"
   export_design -format ip_catalog -ipname "udp" -display_name "UDP" -description "" -vendor "ethz.systems.fpga" -version "0.4"
} elseif {$command == "installip"} {
   file mkdir /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo
   file delete -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/udp
   file copy -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/udp/udp_prj/solution1/impl/ip /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/udp/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
