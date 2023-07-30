
open_project scatter_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 3.2 -name default

set_top scatter

add_files /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/kernel/user_krnl/scatter_krnl/src/hls/scatter.cpp -cflags "-I/mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/kernel/user_krnl/scatter_krnl/src/hls"


add_files -tb /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/kernel/user_krnl/scatter_krnl/src/hls/test_scatter.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   export_design -format ip_catalog -ipname "scatter" -display_name "scatter" -vendor "ethz.systems.fpga" -version "1.0"
} elseif {$command == "installip"} {
   file mkdir /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo
   file delete -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/scatter
   file copy -force /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/kernel/user_krnl/scatter_krnl/src/hls/scatter_prj/solution1/impl/ip /mnt/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/iprepo/scatter/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
