#!/bin/bash
#ssh jsaber@pc155.cloudlab.umass.edu
#------------runnung crdts on fpgas---------------------------------------------------------
#Node_List="156 159 157 153 155 154";
source /tools/Xilinx/Vitis/2023.1/settings64.sh
source /opt/xilinx/xrt/setup.sh
NUM_Nodes=4 #number of nodes.
#Node_List="""151 153 154 155 156 159"
Node_List="151 153 154 156"
Arp_Delay_Base=400000000;
# ACCOUNT 7500 10000 12500
# PROJECT 11250 15000 18750
# COURSEWARE 11250 15000 18750
# RUBiS 50000 66666 83332

EXE=0
IP="198.22.255.171"

Number_of_Operations=1000000;
#Number_of_Operations=524288;
Write_Percentage=25;
Usecase=account_stream
Operations_Each_Node=$((Number_of_Operations/NUM_Nodes));

# for i in $( seq 0 $((NUM_Nodes-=1)) ); do
#     printf "make host codes----------------------------------'\n";
#     make exe DEVICE=/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm USER_KRNL=${Usecase}_krnl EXE_NUM=${i}
# done
h=0
for n in $Node_List; do
    printf "Reseting Boards\n";
    ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; xbutil --force reset --d; rm -rf *"
    ((h+=1))
done
h=0;
t=1; 
for j in $Node_List; do
    #BITSTREAM
    scp -r build_dir.hw.xilinx_u280_gen3x16_xdma_1_202211_1/network.xclbin pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    #scp -r bitstreams/bank-hbm.xclbin pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj

    #MAKEFILE
    scp -r Makefile pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r config_rtl.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r config_hls.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r utils.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r common/ pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj

    #HOST + BENCHMARKS
    scp -r host/${Usecase}_krnl/host0.cpp pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r benchmarks/${NUM_Nodes}-${Number_of_Operations}-${Write_Percentage}/account-leader-fail/${t}.txt pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    #scp -r benchmarks/3-${Number_of_Operations}-${Write_Percentage}/account/${t}.txt pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    #scp -r /home/pyuvaraj/fpga-rdma-testbed/benchmarks/${NUM_Nodes}-${Number_of_Operations}-${Write_Percentage}/${Usecase}/${t}.txt pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    #scp -r /home/pyuvaraj/benchmarks/${NUM_Nodes}-${Number_of_Operations}-${Write_Percentage}/account/${t}.txt pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    
    #PROFILING
    scp xrt.ini pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj

    #GEN EXE
    ssh pyuvaraj@pc${j}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; source /proj/octfpga-PG0/tools/Xilinx/Vitis/2023.1/settings64.sh; make exe USER_KRNL=${Usecase}_krnl EXE_NUM=0"
    ((t+=1))
    ((h+=1))
    echo $h
done
h=0;
for n in $Node_List; do
    printf "ssh pyuvaraj@pc${n}.cloudlab.umass.edu './host${h} network.xclbin $NUM_Nodes $Number_of_Operations $Write_Percentage $h $EXE'\n";
    #ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host0 bank-hbm.xclbin $NUM_Nodes $Number_of_Operations $Write_Percentage $h $EXE > host${h}.log"&
    ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host0 network.xclbin $NUM_Nodes $Number_of_Operations $Write_Percentage $h $EXE $IP > host.log"&
    #ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host${h} ${Usecase}.xclbin $NUM_Nodes $Number_of_Operations $Write_Percentage $h $EXE > host${h}.log"&
    ((h+=1))
done
#-------------------------------------------------------------------------------------------
wait
