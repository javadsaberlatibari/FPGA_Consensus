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

Once you gain access to OCT through **CloudLab**, reserve an `oct-build` node. The exact node specifications do not matter much, but a **minimum of 32 GB of RAM** is required.

By default, the node is reserved for **16 hours**. You will need to extend the reservation, since each individual use case takes approximately **3 hours to build**, for a total estimated build time of **~62 hours**.

We strongly recommend using **tmux** to run long builds so you do not need to maintain a persistent SSH connection.

### Xilinx License Setup

For all builds, a Xilinx license is required to generate the kernel. You can use OCT's floating license server.

Before starting any build, run:

```bash
export XILINXD_LICENSE_FILE=2100@xilinxlm
```

If this variable is not set, the build will fail after several hours.

---

## Use Cases

### CRDTs + YCSB

The CRDT use cases are available on the `vldb_crdts_plus_kv` branch of:

https://github.com/javadsaberlatibari/FPGA_Consensus

This branch contains all CRDTs as well as YCSB.

#### Build Instructions

1. Untar the IP repository:

```bash
tar -xvf iprepo.tar.gz
```

2. Start the build:

```bash
make build TARGET=HW DEVICE=<platform file> NET_KRNL=roce USER_KERNEL=<use-case> USER_KRNL_MODE=hls EXE_NUM=0
```

#### User Kernel Names

- bram_counter_bram_bench
- bram_gset_bram_bench
- bram_pnset_bram_bench
- bram_twopset_bram_bench
- bram_register_bram_bench
- bram_kv_store_bram_bench
- hybrid_kv_store_bram_bench

#### Running the Experiments

After the builds are complete:

1. Reserve execution nodes on OCT.
2. Modify `run-usercases2.sh` with your **node numbers** and **username**.
3. Run the script to execute the experiments.

---

### WRDTs

The WRDT use cases are available on the `wrdt-bank-no-failure` branch of:

https://github.com/javadsaberlatibari/FPGA_Consensus

#### Build Instructions

1. Untar the IP repository:

```bash
tar -xvf iprepo.tar.gz
```

2. Start the build:

```bash
make build TARGET=HW DEVICE=<platform file> NET_KRNL=roce USER_KERNEL=<use-case> USER_KRNL_MODE=hls EXE_NUM=0
```

#### User Kernel Names

- account_stream_krnl
- courseware_stream_krnl
- project_stream_krnl
- movie_stream_krnl
- auction_stream_krnl

#### Running the Experiments

After the builds are complete:

1. Reserve execution nodes on OCT.
2. Modify `run-usercases2.sh` with your **node numbers** and **username**.
3. Run the script to execute the experiments.

---

## Custom Verbs

Custom Verb experiments are located in a separate repository:

https://github.com/pyuvaraj37/safar_custom_verbs

All experiments are on the `main` branch.

#### Build Instructions

1. Clone the repository.
2. Untar the IP repository:

```bash
tar -xvf iprepo.tar.gz
```

3. Build each user kernel:

```bash
make build TARGET=HW DEVICE=<platform file> NET_KRNL=roce USER_KERNEL=<use-case> USER_KRNL_MODE=hls EXE_NUM=0
```

#### User Kernel Names

- account_custom_krnl
- courseware_custom_krnl
- project_custom_krnl
- movie_custom_krnl
- auction_custom_krnl
- counter_custom_krnl
- lww_custom_krnl

#### Running the Experiments

After the builds are complete:

1. Reserve OCT nodes.
2. Fill in the configuration information at the top of `run-usercase-all.sh`.
3. Run the script to execute all experiments.

---

## SmallBank

The SmallBank use case is hosted in its own repository:

https://github.com/pyuvaraj37/SmallBank

All code is on the `main` branch.

### Build Instructions

1. Clone the repository.
2. Untar the IP repository:

```bash
tar -xvf iprepo-original.tar.gz
```

3. Build the application kernel using CMake:

```bash
mkdir build
cd build
cmake ..
make installip
```

4. From the repository root, build the FPGA binary:

```bash
make build TARGET=HW PLATFORM=<platform file>
```

The platform file is located at:

```text
/opt/platforms/<device>/<device>.xpfm
```

### Running SmallBank

1. Reserve `oct-u280` nodes on CloudLab.
2. Use scripts in the `deploy/` directory to copy the build files to the nodes.
3. Use scripts in `deploy/local/bash/` to install the environment.
4. Run:

```bash
source env.sh
./enable.sh
```

5. Run each `run-experiment.sh` script (modify node numbers as needed).

All logs and result aggregation scripts are located in the `log/` directory, including scripts to aggregate results and generate Excel summaries.
