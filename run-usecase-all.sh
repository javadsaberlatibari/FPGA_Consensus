#!/bin/bash


source /tools/Xilinx/Vitis/2023.1/settings64.sh
source /opt/xilinx/xrt/setup.sh

LOWER_BOUND_NODES=3
UPPER_BOUND_NODES=8
LOWER_BOUND_WP=15
UPPER_BOUND_WP=25

Node_List="151 153 154 155 156 157 158 159"
Number_of_Operations=1000000;
#Usecases="account courseware project movie rubis"
Usecases="rubis_stream"
dataset="rubis"
MEMCACHED_IP="198.22.255.171"
MEMCACHED_NODE=160
# THROUGHPUT
# ACCOUNT 7500 10000 12500
# PROJECT 11250 15000 18750
# COURSEWARE 11250 15000 18750
# RUBiS 50000 66666 83332
# EXE=125000
EXE=0

#COPY MAKEFILES
printf "Copying all Makefiles and Profiling files\n";
h=0;
t=1; 
for j in $Node_List; do
    #MAKEFILE
    scp -r Makefile pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r config_rtl.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r config_hls.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r utils.mk pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj
    scp -r common/ pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj

    #PROFILING
    scp xrt.ini pyuvaraj@pc${j}.cloudlab.umass.edu:/users/pyuvaraj

    ((t+=1))
    ((h+=1))
    echo $h
done

mkdir ./logs/ 

for usecase in $Usecases; do

    mkdir ./logs/${usecase}/ 

    #RESET BOARDS
    printf "Copying usecase specific files...\n";
    h=0
    for n in $Node_List; do
        #HOST + BENCHMARKS + bitstream
        #ssh pyuvaraj@pc${n}.cloudlab.umass.edu "rm -rf *;"
        scp -r host/${usecase}_krnl/host0.cpp pyuvaraj@pc${n}.cloudlab.umass.edu:/users/pyuvaraj
        scp -r bitstreams/${usecase}.xclbin pyuvaraj@pc${n}.cloudlab.umass.edu:/users/pyuvaraj
        #GEN EXE
        ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; source /proj/octfpga-PG0/tools/Xilinx/Vitis/2023.1/settings64.sh; make exe USER_KRNL=${usecase}_krnl EXE_NUM=0"
        ((h+=1))
    done


    for ((i = LOWER_BOUND_NODES; i <= UPPER_BOUND_NODES; i++)); do
        for ((w = LOWER_BOUND_WP; w <= UPPER_BOUND_WP; w+=5)); do
            mkdir ./logs/${usecase}/${i}-${w}/
            h=0
            t=1
            for n in $Node_List; do
                if (($h < $i)); then
                    ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; xbutil --force reset --d;"
                    scp -r /home/pyuvaraj/benchmarks/${i}-${Number_of_Operations}-${w}/${dataset}/${t}.txt pyuvaraj@pc${n}.cloudlab.umass.edu:/users/pyuvaraj
                    ((h+=1))
                    ((t+=1))
                else 
                    break
                fi 
            done
            wait

            printf "STARTING MEMCACHE"
            ssh pyuvaraj@pc${MEMCACHED_NODE}.cloudlab.umass.edu "memcached -d -m 64 -p 11211 -l ${MEMCACHED_IP}"&

            printf "Starting $usecase with $node nodes....\n";
            h=0;
            for n in $Node_List; do
                if (($h < $i)); then
                    ssh pyuvaraj@pc${n}.cloudlab.umass.edu "source /opt/xilinx/xrt/setup.sh; ./host0 ${usecase}.xclbin $i $Number_of_Operations $w $h $EXE $MEMCACHED_IP > host.log"&
                    ((h+=1))
                else 
                    break
                fi 
            done
            wait

            printf "KILLING MEMCACHE"
            ssh pyuvaraj@pc${MEMCACHED_NODE}.cloudlab.umass.edu "sudo pkill memcached";

            printf "Finished $Usecase with $node nodes.\n";
            printf "Copying logs...\n";
            h=0;
            for n in $Node_List; do
                if (($h < $i)); then
                    scp -r pyuvaraj@pc${n}.cloudlab.umass.edu:/users/pyuvaraj/host.log ./logs/${usecase}/${i}-${w}/log${h}.log
                    scp -r pyuvaraj@pc${n}.cloudlab.umass.edu:/users/pyuvaraj/power_profile_xilinx_u280_gen3x16_xdma_base_1-0.csv ./logs/${usecase}/${i}-${w}/power${h}.log
                    ((h+=1))
                else 
                    break
                fi 
            done
            wait
        done
    done 
done
#-------------------------------------------------------------------------------------------
wait
