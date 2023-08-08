VIVADO := $(XILINX_VIVADO)/bin/vivado
$(TEMP_DIR)/${KRNL_1}.xo: kernel/${KRNL_1}/${KRNL_1}.xml kernel/${KRNL_1}/package_${KRNL_1}.tcl scripts/gen_xo.tcl kernel/${KRNL_1}/src/hdl/*.sv kernel/${KRNL_1}/src/hdl/*.v
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/${KRNL_1}.xo ${KRNL_1} $(TARGET) $(DEVICE) $(XSA) kernel/${KRNL_1}/${KRNL_1}.xml kernel/${KRNL_1}/package_${KRNL_1}.tcl

$(TEMP_DIR)/${KRNL_2}.xo: kernel/user_krnl/${KRNL_2}/src/hls/*.cpp
	mkdir -p $(TEMP_DIR)
	$(VPP) $(CLFLAGS) -c -k ${KRNL_2} -o $(TEMP_DIR)/${KRNL_2}.xo --input_files kernel/user_krnl/${KRNL_2}/src/hls/*.cpp

$(TEMP_DIR)/${KRNL_3}.xo: kernel/cmac_krnl/cmac_krnl.xml kernel/cmac_krnl/package_cmac_krnl.tcl scripts/gen_xo.tcl kernel/cmac_krnl/src/hdl/*.sv
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/${KRNL_3}.xo ${KRNL_3} $(TARGET) $(DEVICE) $(XSA) kernel/cmac_krnl/cmac_krnl.xml kernel/cmac_krnl/package_cmac_krnl.tcl
