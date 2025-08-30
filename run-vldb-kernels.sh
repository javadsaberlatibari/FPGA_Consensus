#!/bin/bash
#ssh jsaber@pc155.cloudlab.umass.edu
#------------runnung crdts on fpgas---------------------------------------------------------
#Node_List="157 156 155 153 159 151"; jsaber
source /tools/Xilinx/Vitis/2023.1/settings64.sh
source /opt/xilinx/xrt/setup.sh
NUM_Nodes=1 #number of nodes.
Node_List="151 153 154 155 156 157 158 159";
Node_Mem="160"
Mem_IP="198.22.255.$((162 + $Node_Mem - 151))"
Node_Array=($Node_List);
Write_Percentage="50";
THROUGHPUT=1 #0 Response time
MODE="rs" #th to mesuare throughput, rs to mesuare response time
FAILURE=0
HBM=0 #0 default bram and 1 hbm
#Arp_Delay_Base=0; #400000000
Number_of_Operations=400000;
Use_Case="kv";
Bin_Add="HYBRID"
User_kernel_add="hybrid_YCSB_kv_store"


#printf"$User_kernel_add"
#printf"$Bin_Add"
for node_number_counter in $( seq $NUM_Nodes $NUM_Nodes ); do

    Operations_Each_Node=$((Number_of_Operations/node_number_counter));

    h=0;
    for j in $( seq 0 $((node_number_counter-=1)) ); do
        ssh jsaber@pc${Node_Array[j]}.cloudlab.umass.edu "rm -rf *; mkdir host"
        scp -r ~/Desktop/Saved_Files/${Use_Case}/$Bin_Add/network.xclbin jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber
        scp -r load-th.sh jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r host/$User_kernel_add jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber/host   #added for throughput
        scp -r Makefile jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r config_rtl.mk jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r load.sh jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r config_hls.mk jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r utils.mk jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r common jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        scp -r scripts jsaber@pc${Node_Array[j]}.cloudlab.umass.edu:/users/jsaber   #added for throughput
        ssh jsaber@pc${Node_Array[j]}.cloudlab.umass.edu "source load-th.sh; source /proj/octfpga-PG0/tools/Xilinx/Vitis_HLS/2023.1/settings64.sh; source /opt/xilinx/xrt/setup.sh; make exe DEVICE=/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm USER_KRNL=$User_kernel_add"
    #    sleep 3
        #((h+=1))
        #echo $h
    done
    
    for p in $Write_Percentage; do
    #------------------------------------------reset board-------------------------------------------
        for n in $( seq 0 $((node_number_counter-=1)) ); do
    
        ssh jsaber@pc${Node_Array[n]}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; xbutil --force reset --d"
        done
    #------------------------------------------reset board-------------------------------------------
        h=0;
        #scp -r load-th.sh jsaber@pc${Node_Mem}.cloudlab.umass.edu:/users/jsaber

        XRT=/opt/xilinx/xrt/bin
        for n in $( seq 0 $((node_number_counter-1)) ); do
            printf "Setting up Host Memory on Node ${n}\n";
            ssh jsaber@pc${Node_Array[n]}.cloudlab.umass.edu "sudo /opt/xilinx/xrt/bin/xbutil configure --host-mem --device --size 1G enable"
        done

        #ssh jsaber@pc${Node_Mem}.cloudlab.umass.edu "source load-th.sh"
        #ssh jsaber@pc${Node_Mem}.cloudlab.umass.edu "sudo kill $(ps aux | grep '[m]emcached' | awk '{print $2}');"
        #ssh jsaber@pc${Node_Mem}.cloudlab.umass.edu "memcached -m 64 -p 11211 -l 198.22.255.162 -vv"&
        ##sleep 20
        sleep 4
        for n in $( seq 0 $((node_number_counter-=1)) ); do
            temp=$((node_number_counter - h));
            #temp=$((h + 1));
            #Arp_Delay=$((Arp_Delay_Base*temp));
            printf "ssh jsaber@pc${Node_Array[n]}.cloudlab.umass.edu 'source /opt/xilinx/xrt/setup.sh; ./host/host1 network.xclbin $node_number_counter $h $Operations_Each_Node $p $MODE $Mem_IP > /users/jsaber/host${h}-${node_number_counter}-${p}.log '\n";
            ssh jsaber@pc${Node_Array[n]}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host/host1 network.xclbin $node_number_counter $h $Operations_Each_Node $p $MODE $Mem_IP > /users/jsaber/host${h}-${node_number_counter}-${p}.log "&
            #./host/host1 network.xclbin 3 0 4000 50 th 198.22.255.162
            ((h+=1))
        done
        wait
    done
    #-------------------------------------------------------------------------------------------
    wait

done
