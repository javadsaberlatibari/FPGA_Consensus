
open_project ethernet_frame_padding_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 3.2 -name default

set_top ethernet_frame_padding

#add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/ethernet_frame_padding/../packet.hpp
#add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/ethernet_frame_padding/ethernet_frame_padding.hpp
add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/fpga-network-stack/hls/ethernet_frame_padding/ethernet_frame_padding.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/ethernet_frame_padding"


#add_files -tb test_ethernet_frame_padding.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   export_design -format ip_catalog -display_name "Ethernet Frame Padding" -vendor "ethz.systems.fpga" -version "0.1"
} elseif {$command == "installip"} {
   file mkdir /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo
   file delete -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/ethernet_frame_padding
   file copy -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/ethernet_frame_padding/ethernet_frame_padding_prj/solution1/impl/ip /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/ethernet_frame_padding/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
