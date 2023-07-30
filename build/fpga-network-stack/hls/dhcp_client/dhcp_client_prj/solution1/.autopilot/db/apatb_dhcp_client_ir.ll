; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/dhcp_client/dhcp_client_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<bool, 0>" = type { i1 }
%"class.hls::stream<udpMetadata, 0>" = type { %struct.udpMetadata }
%struct.udpMetadata = type { %struct.sockaddr_in, %struct.sockaddr_in }
%struct.sockaddr_in = type { %"struct.ap_uint<16>", %"struct.ap_uint<32>" }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"class.hls::stream<ap_uint<16>, 0>" = type { %"struct.ap_uint<16>" }
%"class.hls::stream<net_axis<64>, 0>" = type { %"struct.net_axis<64>" }
%"struct.net_axis<64>" = type { %"struct.ap_uint<64>", %"struct.ap_uint<8>", %"struct.ap_uint<1>" }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"class.std::ios_base::Init" }
%"class.std::ios_base::Init" = type { i8 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"class.hls::stream<bool, 0>" }
%"struct.ap_uint<48>" = type { %"struct.ap_int_base<48, false>" }
%"struct.ap_int_base<48, false>" = type { %"struct.ssdm_int<48, false>" }
%"struct.ssdm_int<48, false>" = type { i48 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_dhcp_client_ir(%"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %openPort, %"class.hls::stream<bool, 0>"* noalias nocapture nonnull dereferenceable(1) %confirmPortStatus, %"class.hls::stream<udpMetadata, 0>"* noalias nocapture nonnull dereferenceable(16) %dataInMeta, %"class.hls::stream<net_axis<64>, 0>"* noalias nocapture nonnull dereferenceable(16) %dataIn, %"class.hls::stream<udpMetadata, 0>"* noalias nocapture nonnull dereferenceable(16) %dataOutMeta, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %dataOutLength, %"class.hls::stream<net_axis<64>, 0>"* noalias nocapture nonnull dereferenceable(16) %dataOut, %"struct.ap_uint<1>"* noalias nocapture nonnull readonly dereferenceable(1) %dhcpEnable, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly dereferenceable(4) %inputIpAddress, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %dhcpIpAddressOut, %"struct.ap_uint<48>"* noalias nocapture nonnull readonly dereferenceable(8) %myMacAddress) local_unnamed_addr #1 {
entry:
  %openPort_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %openPort_copy, i32 0) ]
  %confirmPortStatus_copy = alloca %"class.hls::stream<bool, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<bool, 0>"* %confirmPortStatus_copy, i32 0) ]
  %dataInMeta_copy = alloca %"class.hls::stream<udpMetadata, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<udpMetadata, 0>"* %dataInMeta_copy, i32 0) ]
  %dataIn_copy = alloca %"class.hls::stream<net_axis<64>, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<net_axis<64>, 0>"* %dataIn_copy, i32 0) ]
  %dataOutMeta_copy = alloca %"class.hls::stream<udpMetadata, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<udpMetadata, 0>"* %dataOutMeta_copy, i32 0) ]
  %dataOutLength_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %dataOutLength_copy, i32 0) ]
  %dataOut_copy = alloca %"class.hls::stream<net_axis<64>, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<net_axis<64>, 0>"* %dataOut_copy, i32 0) ]
  %dhcpEnable_copy = alloca i1, align 512
  %inputIpAddress_copy = alloca i32, align 512
  %dhcpIpAddressOut_copy = alloca i32, align 512
  %myMacAddress_copy = alloca i48, align 512
  call fastcc void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* nonnull %openPort, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %openPort_copy, %"class.hls::stream<bool, 0>"* nonnull %confirmPortStatus, %"class.hls::stream<bool, 0>"* nonnull align 512 %confirmPortStatus_copy, %"class.hls::stream<udpMetadata, 0>"* nonnull %dataInMeta, %"class.hls::stream<udpMetadata, 0>"* nonnull align 512 %dataInMeta_copy, %"class.hls::stream<net_axis<64>, 0>"* nonnull %dataIn, %"class.hls::stream<net_axis<64>, 0>"* nonnull align 512 %dataIn_copy, %"class.hls::stream<udpMetadata, 0>"* nonnull %dataOutMeta, %"class.hls::stream<udpMetadata, 0>"* nonnull align 512 %dataOutMeta_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %dataOutLength, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %dataOutLength_copy, %"class.hls::stream<net_axis<64>, 0>"* nonnull %dataOut, %"class.hls::stream<net_axis<64>, 0>"* nonnull align 512 %dataOut_copy, %"struct.ap_uint<1>"* nonnull %dhcpEnable, i1* nonnull align 512 %dhcpEnable_copy, %"struct.ap_uint<32>"* nonnull %inputIpAddress, i32* nonnull align 512 %inputIpAddress_copy, %"struct.ap_uint<32>"* nonnull %dhcpIpAddressOut, i32* nonnull align 512 %dhcpIpAddressOut_copy, %"struct.ap_uint<48>"* nonnull %myMacAddress, i48* nonnull align 512 %myMacAddress_copy)
  call void @apatb_dhcp_client_hw(%"class.hls::stream<ap_uint<16>, 0>"* %openPort_copy, %"class.hls::stream<bool, 0>"* %confirmPortStatus_copy, %"class.hls::stream<udpMetadata, 0>"* %dataInMeta_copy, %"class.hls::stream<net_axis<64>, 0>"* %dataIn_copy, %"class.hls::stream<udpMetadata, 0>"* %dataOutMeta_copy, %"class.hls::stream<ap_uint<16>, 0>"* %dataOutLength_copy, %"class.hls::stream<net_axis<64>, 0>"* %dataOut_copy, i1* %dhcpEnable_copy, i32* %inputIpAddress_copy, i32* %dhcpIpAddressOut_copy, i48* %myMacAddress_copy)
  call void @copy_back(%"class.hls::stream<ap_uint<16>, 0>"* %openPort, %"class.hls::stream<ap_uint<16>, 0>"* %openPort_copy, %"class.hls::stream<bool, 0>"* %confirmPortStatus, %"class.hls::stream<bool, 0>"* %confirmPortStatus_copy, %"class.hls::stream<udpMetadata, 0>"* %dataInMeta, %"class.hls::stream<udpMetadata, 0>"* %dataInMeta_copy, %"class.hls::stream<net_axis<64>, 0>"* %dataIn, %"class.hls::stream<net_axis<64>, 0>"* %dataIn_copy, %"class.hls::stream<udpMetadata, 0>"* %dataOutMeta, %"class.hls::stream<udpMetadata, 0>"* %dataOutMeta_copy, %"class.hls::stream<ap_uint<16>, 0>"* %dataOutLength, %"class.hls::stream<ap_uint<16>, 0>"* %dataOutLength_copy, %"class.hls::stream<net_axis<64>, 0>"* %dataOut, %"class.hls::stream<net_axis<64>, 0>"* %dataOut_copy, %"struct.ap_uint<1>"* %dhcpEnable, i1* %dhcpEnable_copy, %"struct.ap_uint<32>"* %inputIpAddress, i32* %inputIpAddress_copy, %"struct.ap_uint<32>"* %dhcpIpAddressOut, i32* %dhcpIpAddressOut_copy, %"struct.ap_uint<48>"* %myMacAddress, i48* %myMacAddress_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<1>"* noalias readonly, i1* noalias align 512, %"struct.ap_uint<32>"* noalias readonly, i32* noalias align 512, %"struct.ap_uint<32>"* noalias readonly, i32* noalias align 512, %"struct.ap_uint<48>"* noalias readonly, i48* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %1, %"class.hls::stream<ap_uint<16>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* align 512 %3, %"class.hls::stream<bool, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* align 512 %5, %"class.hls::stream<udpMetadata, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* align 512 %7, %"class.hls::stream<net_axis<64>, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* align 512 %9, %"class.hls::stream<udpMetadata, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %11, %"class.hls::stream<ap_uint<16>, 0>"* %10)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* align 512 %13, %"class.hls::stream<net_axis<64>, 0>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.193"(i1* align 512 %15, %"struct.ap_uint<1>"* %14)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %17, %"struct.ap_uint<32>"* %16)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %19, %"struct.ap_uint<32>"* %18)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<48>"(i48* align 512 %21, %"struct.ap_uint<48>"* %20)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ap_uint<16>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ap_uint<16>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %0, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ap_uint<16>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ap_uint<16>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_2(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ap_uint<16>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ap_uint<16>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ap_uint<16>, 0>", %"class.hls::stream<ap_uint<16>, 0>"* %2
  %8 = bitcast %"class.hls::stream<ap_uint<16>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ap_uint<16>, 0>"* %0 to i8*
  call void @fpga_fifo_push_2(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<bool, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<bool, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* nonnull align 512 %0, %"class.hls::stream<bool, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<bool, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<bool, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<bool, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<bool, 0>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<bool, 0>", %"class.hls::stream<bool, 0>"* %2
  %8 = bitcast %"class.hls::stream<bool, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<bool, 0>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<udpMetadata, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<udpMetadata, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* nonnull align 512 %0, %"class.hls::stream<udpMetadata, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<udpMetadata, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<udpMetadata, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<udpMetadata, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<udpMetadata, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<udpMetadata, 0>", %"class.hls::stream<udpMetadata, 0>"* %2
  %8 = bitcast %"class.hls::stream<udpMetadata, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<udpMetadata, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<net_axis<64>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<net_axis<64>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* nonnull align 512 %0, %"class.hls::stream<net_axis<64>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<net_axis<64>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<net_axis<64>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<net_axis<64>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<net_axis<64>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<net_axis<64>, 0>", %"class.hls::stream<net_axis<64>, 0>"* %2
  %8 = bitcast %"class.hls::stream<net_axis<64>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<net_axis<64>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512) unnamed_addr #5 {
entry:
  %2 = icmp eq %"struct.ap_uint<1>"* %0, null
  %3 = icmp eq i1* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<48>"(i48* noalias align 512, %"struct.ap_uint<48>"* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq i48* %0, null
  %3 = icmp eq %"struct.ap_uint<48>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<48>", %"struct.ap_uint<48>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = load i48, i48* %.0.0.04, align 8
  store i48 %5, i48* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<48>"* noalias, i48* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* %2, %"class.hls::stream<bool, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* %4, %"class.hls::stream<udpMetadata, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* %6, %"class.hls::stream<net_axis<64>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* %8, %"class.hls::stream<udpMetadata, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %10, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* %12, %"class.hls::stream<net_axis<64>, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.184"(%"struct.ap_uint<32>"* %16, i32* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.184"(%"struct.ap_uint<32>"* %18, i32* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<48>.171"(%"struct.ap_uint<48>"* %20, i48* align 512 %21)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<48>.171"(%"struct.ap_uint<48>"* noalias, i48* noalias readonly align 512) unnamed_addr #5 {
entry:
  %2 = icmp eq %"struct.ap_uint<48>"* %0, null
  %3 = icmp eq i48* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<48>", %"struct.ap_uint<48>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = load i48, i48* %1, align 512
  store i48 %5, i48* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* noalias align 512, %"struct.ap_uint<32>"* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq %"struct.ap_uint<32>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = load i32, i32* %.0.0.04, align 4
  store i32 %5, i32* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.184"(%"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512) unnamed_addr #5 {
entry:
  %2 = icmp eq %"struct.ap_uint<32>"* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = load i32, i32* %1, align 512
  store i32 %5, i32* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.193"(i1* noalias align 512, %"struct.ap_uint<1>"* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq i1* %0, null
  %3 = icmp eq %"struct.ap_uint<1>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_dhcp_client_hw(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, i1*, i32*, i32*, i48*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<udpMetadata, 0>"* noalias, %"class.hls::stream<udpMetadata, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<64>, 0>"* noalias, %"class.hls::stream<net_axis<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<48>"* noalias, i48* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* %2, %"class.hls::stream<bool, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* %4, %"class.hls::stream<udpMetadata, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* %6, %"class.hls::stream<net_axis<64>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<udpMetadata, 0>"(%"class.hls::stream<udpMetadata, 0>"* %8, %"class.hls::stream<udpMetadata, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %10, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<64>, 0>"(%"class.hls::stream<net_axis<64>, 0>"* %12, %"class.hls::stream<net_axis<64>, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.184"(%"struct.ap_uint<32>"* %18, i32* align 512 %19)
  ret void
}

define void @dhcp_client_hw_stub_wrapper(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, i1*, i32*, i32*, i48*) #7 {
entry:
  %11 = alloca %"struct.ap_uint<1>"
  %12 = alloca %"struct.ap_uint<32>"
  %13 = alloca %"struct.ap_uint<32>"
  %14 = alloca %"struct.ap_uint<48>"
  call void @copy_out(%"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* null, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<udpMetadata, 0>"* null, %"class.hls::stream<udpMetadata, 0>"* %2, %"class.hls::stream<net_axis<64>, 0>"* null, %"class.hls::stream<net_axis<64>, 0>"* %3, %"class.hls::stream<udpMetadata, 0>"* null, %"class.hls::stream<udpMetadata, 0>"* %4, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %5, %"class.hls::stream<net_axis<64>, 0>"* null, %"class.hls::stream<net_axis<64>, 0>"* %6, %"struct.ap_uint<1>"* %11, i1* %7, %"struct.ap_uint<32>"* %12, i32* %8, %"struct.ap_uint<32>"* %13, i32* %9, %"struct.ap_uint<48>"* %14, i48* %10)
  call void @dhcp_client_hw_stub(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<udpMetadata, 0>"* %2, %"class.hls::stream<net_axis<64>, 0>"* %3, %"class.hls::stream<udpMetadata, 0>"* %4, %"class.hls::stream<ap_uint<16>, 0>"* %5, %"class.hls::stream<net_axis<64>, 0>"* %6, %"struct.ap_uint<1>"* %11, %"struct.ap_uint<32>"* %12, %"struct.ap_uint<32>"* %13, %"struct.ap_uint<48>"* %14)
  call void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* null, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<udpMetadata, 0>"* null, %"class.hls::stream<udpMetadata, 0>"* %2, %"class.hls::stream<net_axis<64>, 0>"* null, %"class.hls::stream<net_axis<64>, 0>"* %3, %"class.hls::stream<udpMetadata, 0>"* null, %"class.hls::stream<udpMetadata, 0>"* %4, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %5, %"class.hls::stream<net_axis<64>, 0>"* null, %"class.hls::stream<net_axis<64>, 0>"* %6, %"struct.ap_uint<1>"* %11, i1* %7, %"struct.ap_uint<32>"* %12, i32* %8, %"struct.ap_uint<32>"* %13, i32* %9, %"struct.ap_uint<48>"* %14, i48* %10)
  ret void
}

declare void @dhcp_client_hw_stub(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, %"class.hls::stream<udpMetadata, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<64>, 0>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<48>"*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="16" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="8" }
attributes #10 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
