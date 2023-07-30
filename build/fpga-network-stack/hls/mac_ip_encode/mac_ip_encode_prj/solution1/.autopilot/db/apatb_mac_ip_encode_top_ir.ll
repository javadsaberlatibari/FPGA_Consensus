; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/mac_ip_encode/mac_ip_encode_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<arpTableReply, 0>" = type { %struct.arpTableReply }
%struct.arpTableReply = type { %"struct.ap_uint<48>", i1 }
%"struct.ap_uint<48>" = type { %"struct.ap_int_base<48, false>" }
%"struct.ap_int_base<48, false>" = type { %"struct.ssdm_int<48, false>" }
%"struct.ssdm_int<48, false>" = type { i48 }
%"class.hls::stream<net_axis<512>, 0>" = type { %"struct.net_axis<512>" }
%"struct.net_axis<512>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<1>" }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<ap_uint<32>, 0>" = type { %"struct.ap_uint<32>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_mac_ip_encode_top_ir(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %dataIn, %"class.hls::stream<arpTableReply, 0>"* noalias nocapture nonnull dereferenceable(16) %arpTableIn, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %dataOut, %"class.hls::stream<ap_uint<32>, 0>"* noalias nocapture nonnull dereferenceable(4) %arpTableOut, %"struct.ap_uint<48>"* nocapture readonly %myMacAddress, %"struct.ap_uint<32>"* nocapture readonly %regSubNetMask, %"struct.ap_uint<32>"* nocapture readonly %regDefaultGateway) local_unnamed_addr #1 {
entry:
  %dataIn_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %dataIn_copy, i32 0) ]
  %arpTableIn_copy = alloca %"class.hls::stream<arpTableReply, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<arpTableReply, 0>"* %arpTableIn_copy, i32 0) ]
  %dataOut_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %dataOut_copy, i32 0) ]
  %arpTableOut_copy = alloca %"class.hls::stream<ap_uint<32>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<ap_uint<32>, 0>"* %arpTableOut_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* nonnull %dataIn, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %dataIn_copy, %"class.hls::stream<arpTableReply, 0>"* nonnull %arpTableIn, %"class.hls::stream<arpTableReply, 0>"* nonnull align 512 %arpTableIn_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %dataOut, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %dataOut_copy, %"class.hls::stream<ap_uint<32>, 0>"* nonnull %arpTableOut, %"class.hls::stream<ap_uint<32>, 0>"* nonnull align 512 %arpTableOut_copy)
  call void @apatb_mac_ip_encode_top_hw(%"class.hls::stream<net_axis<512>, 0>"* %dataIn_copy, %"class.hls::stream<arpTableReply, 0>"* %arpTableIn_copy, %"class.hls::stream<net_axis<512>, 0>"* %dataOut_copy, %"class.hls::stream<ap_uint<32>, 0>"* %arpTableOut_copy, %"struct.ap_uint<48>"* %myMacAddress, %"struct.ap_uint<32>"* %regSubNetMask, %"struct.ap_uint<32>"* %regDefaultGateway)
  call void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* %dataIn, %"class.hls::stream<net_axis<512>, 0>"* %dataIn_copy, %"class.hls::stream<arpTableReply, 0>"* %arpTableIn, %"class.hls::stream<arpTableReply, 0>"* %arpTableIn_copy, %"class.hls::stream<net_axis<512>, 0>"* %dataOut, %"class.hls::stream<net_axis<512>, 0>"* %dataOut_copy, %"class.hls::stream<ap_uint<32>, 0>"* %arpTableOut, %"class.hls::stream<ap_uint<32>, 0>"* %arpTableOut_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %1, %"class.hls::stream<net_axis<512>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* align 512 %3, %"class.hls::stream<arpTableReply, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %5, %"class.hls::stream<net_axis<512>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* align 512 %7, %"class.hls::stream<ap_uint<32>, 0>"* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<net_axis<512>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<net_axis<512>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %0, %"class.hls::stream<net_axis<512>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<net_axis<512>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<net_axis<512>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_128(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<net_axis<512>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<net_axis<512>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_128(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<net_axis<512>, 0>", %"class.hls::stream<net_axis<512>, 0>"* %2
  %8 = bitcast %"class.hls::stream<net_axis<512>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<net_axis<512>, 0>"* %0 to i8*
  call void @fpga_fifo_push_128(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<arpTableReply, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<arpTableReply, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* nonnull align 512 %0, %"class.hls::stream<arpTableReply, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<arpTableReply, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<arpTableReply, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<arpTableReply, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<arpTableReply, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<arpTableReply, 0>", %"class.hls::stream<arpTableReply, 0>"* %2
  %8 = bitcast %"class.hls::stream<arpTableReply, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<arpTableReply, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ap_uint<32>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ap_uint<32>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* nonnull align 512 %0, %"class.hls::stream<ap_uint<32>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ap_uint<32>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ap_uint<32>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ap_uint<32>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ap_uint<32>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ap_uint<32>, 0>", %"class.hls::stream<ap_uint<32>, 0>"* %2
  %8 = bitcast %"class.hls::stream<ap_uint<32>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ap_uint<32>, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %2, %"class.hls::stream<arpTableReply, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %6, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %7)
  ret void
}

declare void @apatb_mac_ip_encode_top_hw(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %2, %"class.hls::stream<arpTableReply, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %6, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %7)
  ret void
}

define void @mac_ip_encode_top_hw_stub_wrapper(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*) #6 {
entry:
  call void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %3)
  call void @mac_ip_encode_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<arpTableReply, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ap_uint<32>, 0>"* %3, %"struct.ap_uint<48>"* %4, %"struct.ap_uint<32>"* %5, %"struct.ap_uint<32>"* %6)
  call void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %3)
  ret void
}

declare void @mac_ip_encode_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="32" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
