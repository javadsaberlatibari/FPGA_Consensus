#!/bin/bash
#ssh jsaber@pc155.cloudlab.umass.edu
#------------runnung crdts on fpgas---------------------------------------------------------
#Node_List="156 159 157 153 155 154";
source /tools/Xilinx/Vitis/2023.1/settings64.sh
source /opt/xilinx/xrt/setup.sh


Node_List="156 157 158"

h=0
for n in $Node_List; do
    printf "Reseting Boards\n";
    ssh pyuvaraj@pc${n}.cloudlab.umass.edu "sudo apt install -y ocl-icd-libopencl1 opencl-headers; sudo apt install -y build-essential libmemcached-dev; sudo apt install -y memcached"
    ((h+=1))
done
#-------------------------------------------------------------------------------------------

# memcached -m 64 -p 11211 -l <ip> -vv

wait
