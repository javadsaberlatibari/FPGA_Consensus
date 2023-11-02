#!/bin/bash
#ssh jsaber@pc155.cloudlab.umass.edu
#------------runnung crdts on fpgas---------------------------------------------------------
#Node_List="156 159 157 153 155 154";
source /tools/Xilinx/Vitis/2023.1/settings64.sh
source /opt/xilinx/xrt/setup.sh
NUM_Nodes=3 #number of nodes.
Node_List="156 159 157";
Arp_Delay_Base=400000000;
Number_of_Operations=10;
Write_Percentage=5;
Operations_Each_Node=$((Number_of_Operations/NUM_Nodes));

for i in $( seq 0 $((NUM_Nodes-=1)) ); do
    printf "make host codes----------------------------------'\n";
    make exe DEVICE=/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm USER_KRNL=crdt_counter_krnl EXE_NUM=${i}
done
h=0;
for j in $Node_List; do
    scp -r build_dir.hw.xilinx_u280_gen3x16_xdma_1_202211_1/network.xclbin jsaber@pc${j}.cloudlab.umass.edu:/users/jsaber
    scp -r host/host${h} jsaber@pc${j}.cloudlab.umass.edu:/users/jsaber
    ((h+=1))
    echo $h
done
h=0;
for n in $Node_List; do
    temp=$((NUM_Nodes - h));
    #temp=$((h + 1));
    Arp_Delay=$((Arp_Delay_Base*temp));
    printf "ssh jsaber@pc${n}.cloudlab.umass.edu './host${h} $h network.xclbin $Arp_Delay_Base&'\n";
    ssh jsaber@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host${h} network.xclbin $NUM_Nodes $Arp_Delay_Base $Number_of_Operations $Write_Percentage > host${h}.log "&
    ((h+=1))
done
#-------------------------------------------------------------------------------------------
wait