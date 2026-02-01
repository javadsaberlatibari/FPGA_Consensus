# VLDB Code Supplement for Safar

## Overview

Safar is a complex FPGA system requiring specific tools and hardware to run properly. Luckily, the hardware and tools are available at the **Open Cloud Testbed (OCT)**, accessed via **CloudLab**.

There are a total of:

- **5 CRDTs**
- **5 WRDTs**
- **6 RDTs with custom verbs**
- **2 large real-world applications** that can run in hybrid mode

### CRDTs

- Counter  
- Register  
- GSet  
- TwoPSet  
- PNSet  

### WRDTs

- Account  
- Courseware  
- Project  
- Movie  
- Auction  

### Custom Verbs (RDTs)

- Account  
- Courseware  
- Project  
- Movie  
- Auction  
- LWW  

### Hybrid Applications

- YCSB  
- SmallBank  

The code for all of these is hosted in **three public GitHub repositories** created for the review process. Specific branches and build instructions are required and are described below.

- **CRDTs / WRDTs / YCSB**  
  https://github.com/javadsaberlatibari/FPGA_Consensus

- **Custom Verbs**  
  https://github.com/pyuvaraj37/safar_custom_verbs

- **SmallBank**  
  https://github.com/pyuvaraj37/SmallBank

---

## Open Cloud Testbed and Tools

Safar is built using **Vitis/Vivado 2023.2**, specifically targeting the **AMD Xilinx Alveo U280**.

While these tools can be installed locally, they are large and are already available through **OCT**. To sign up for OCT, follow the instructions here:

https://github.com/OCT-FPGA/OCT-Tutorials

Once you gain access to OCT through **CloudLab**, reserve an `oct-build` node. The exact specs are not critical, but **at least 32 GB of RAM** is required.

Each individual use case takes approximately **3 hours to build**. The total estimated build time for all use cases is **~62 hours**.

We strongly recommend using **tmux** to run long builds without maintaining a persistent SSH connection.

### Xilinx License Setup

```bash
export XILINXD_LICENSE_FILE=2100@xilinxlm
```

---

## Use Cases

### CRDTs + YCSB

Branch: `vldb_crdts_plus_kv`

Repository: https://github.com/javadsaberlatibari/FPGA_Consensus

```bash
make build TARGET=HW DEVICE=<platform file> NET_KRNL=roce USER_KERNEL=<use-case> USER_KRNL_MODE=hls EXE_NUM=0
```

User Kernels:

- bram_counter_bram_bench
- bram_gset_bram_bench
- bram_pnset_bram_bench
- bram_twopset_bram_bench
- bram_register_bram_bench
- bram_kv_store_bram_bench
- hybrid_kv_store_bram_bench

---

### WRDTs

Branch: `wrdt-bank-no-failure`

User Kernels:

- account_stream_krnl
- courseware_stream_krnl
- project_stream_krnl
- movie_stream_krnl
- auction_stream_krnl

---

## Custom Verbs

Repository: https://github.com/pyuvaraj37/safar_custom_verbs

User Kernels:

- account_custom_krnl
- courseware_custom_krnl
- project_custom_krnl
- movie_custom_krnl
- auction_custom_krnl
- counter_custom_krnl
- lww_custom_krnl

---

## SmallBank

Repository: https://github.com/pyuvaraj37/SmallBank

```bash
mkdir build
cd build
cmake ..
make installip
```

```bash
make build TARGET=HW PLATFORM=<platform file>
```

