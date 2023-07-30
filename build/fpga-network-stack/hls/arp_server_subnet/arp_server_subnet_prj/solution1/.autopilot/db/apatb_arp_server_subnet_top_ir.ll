; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/arp_server_subnet/arp_server_subnet_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<ap_uint<32>, 0>" = type { %"struct.ap_uint<32>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
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
%"class.hls::stream<arpTableReply, 0>" = type { %struct.arpTableReply }
%struct.arpTableReply = type { %"struct.ap_uint<48>", i1 }
%"struct.ap_uint<48>" = type { %"struct.ap_int_base<48, false>" }
%"struct.ap_int_base<48, false>" = type { %"struct.ssdm_int<48, false>" }
%"struct.ssdm_int<48, false>" = type { i48 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_arp_server_subnet_top_ir(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %arpDataIn, %"class.hls::stream<ap_uint<32>, 0>"* noalias nocapture nonnull dereferenceable(4) %macIpEncode_req, %"class.hls::stream<ap_uint<32>, 0>"* noalias nocapture nonnull dereferenceable(4) %hostIpEncode_req, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %arpDataOut, %"class.hls::stream<arpTableReply, 0>"* noalias nocapture nonnull dereferenceable(16) %macIpEncode_rsp, %"class.hls::stream<arpTableReply, 0>"* noalias nocapture nonnull dereferenceable(16) %hostIpEncode_rsp, %"struct.ap_uint<48>"* nocapture readonly %myMacAddress, %"struct.ap_uint<32>"* nocapture readonly %myIpAddress, %"struct.ap_uint<16>"* noalias nocapture nonnull dereferenceable(2) %regRequestCount, %"struct.ap_uint<16>"* noalias nocapture nonnull dereferenceable(2) %regReplyCount) local_unnamed_addr #1 {
entry:
  %arpDataIn_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %arpDataIn_copy, i32 0) ]
  %macIpEncode_req_copy = alloca %"class.hls::stream<ap_uint<32>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<ap_uint<32>, 0>"* %macIpEncode_req_copy, i32 0) ]
  %hostIpEncode_req_copy = alloca %"class.hls::stream<ap_uint<32>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<ap_uint<32>, 0>"* %hostIpEncode_req_copy, i32 0) ]
  %arpDataOut_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %arpDataOut_copy, i32 0) ]
  %macIpEncode_rsp_copy = alloca %"class.hls::stream<arpTableReply, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<arpTableReply, 0>"* %macIpEncode_rsp_copy, i32 0) ]
  %hostIpEncode_rsp_copy = alloca %"class.hls::stream<arpTableReply, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<arpTableReply, 0>"* %hostIpEncode_rsp_copy, i32 0) ]
  %regRequestCount_copy = alloca i16, align 512
  %regReplyCount_copy = alloca i16, align 512
  call fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* nonnull %arpDataIn, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %arpDataIn_copy, %"class.hls::stream<ap_uint<32>, 0>"* nonnull %macIpEncode_req, %"class.hls::stream<ap_uint<32>, 0>"* nonnull align 512 %macIpEncode_req_copy, %"class.hls::stream<ap_uint<32>, 0>"* nonnull %hostIpEncode_req, %"class.hls::stream<ap_uint<32>, 0>"* nonnull align 512 %hostIpEncode_req_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %arpDataOut, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %arpDataOut_copy, %"class.hls::stream<arpTableReply, 0>"* nonnull %macIpEncode_rsp, %"class.hls::stream<arpTableReply, 0>"* nonnull align 512 %macIpEncode_rsp_copy, %"class.hls::stream<arpTableReply, 0>"* nonnull %hostIpEncode_rsp, %"class.hls::stream<arpTableReply, 0>"* nonnull align 512 %hostIpEncode_rsp_copy, %"struct.ap_uint<16>"* nonnull %regRequestCount, i16* nonnull align 512 %regRequestCount_copy, %"struct.ap_uint<16>"* nonnull %regReplyCount, i16* nonnull align 512 %regReplyCount_copy)
  call void @apatb_arp_server_subnet_top_hw(%"class.hls::stream<net_axis<512>, 0>"* %arpDataIn_copy, %"class.hls::stream<ap_uint<32>, 0>"* %macIpEncode_req_copy, %"class.hls::stream<ap_uint<32>, 0>"* %hostIpEncode_req_copy, %"class.hls::stream<net_axis<512>, 0>"* %arpDataOut_copy, %"class.hls::stream<arpTableReply, 0>"* %macIpEncode_rsp_copy, %"class.hls::stream<arpTableReply, 0>"* %hostIpEncode_rsp_copy, %"struct.ap_uint<48>"* %myMacAddress, %"struct.ap_uint<32>"* %myIpAddress, i16* %regRequestCount_copy, i16* %regReplyCount_copy)
  call void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* %arpDataIn, %"class.hls::stream<net_axis<512>, 0>"* %arpDataIn_copy, %"class.hls::stream<ap_uint<32>, 0>"* %macIpEncode_req, %"class.hls::stream<ap_uint<32>, 0>"* %macIpEncode_req_copy, %"class.hls::stream<ap_uint<32>, 0>"* %hostIpEncode_req, %"class.hls::stream<ap_uint<32>, 0>"* %hostIpEncode_req_copy, %"class.hls::stream<net_axis<512>, 0>"* %arpDataOut, %"class.hls::stream<net_axis<512>, 0>"* %arpDataOut_copy, %"class.hls::stream<arpTableReply, 0>"* %macIpEncode_rsp, %"class.hls::stream<arpTableReply, 0>"* %macIpEncode_rsp_copy, %"class.hls::stream<arpTableReply, 0>"* %hostIpEncode_rsp, %"class.hls::stream<arpTableReply, 0>"* %hostIpEncode_rsp_copy, %"struct.ap_uint<16>"* %regRequestCount, i16* %regRequestCount_copy, %"struct.ap_uint<16>"* %regReplyCount, i16* %regReplyCount_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias readonly, i16* noalias align 512, %"struct.ap_uint<16>"* noalias readonly, i16* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %1, %"class.hls::stream<net_axis<512>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* align 512 %3, %"class.hls::stream<ap_uint<32>, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* align 512 %5, %"class.hls::stream<ap_uint<32>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %7, %"class.hls::stream<net_axis<512>, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* align 512 %9, %"class.hls::stream<arpTableReply, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* align 512 %11, %"class.hls::stream<arpTableReply, 0>"* %10)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.540"(i16* align 512 %13, %"struct.ap_uint<16>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.540"(i16* align 512 %15, %"struct.ap_uint<16>"* %14)
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
  br label %empty, !llvm.loop !7

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
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512, %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %2, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %4, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %8, %"class.hls::stream<arpTableReply, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %10, %"class.hls::stream<arpTableReply, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(%"struct.ap_uint<16>"* %12, i16* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(%"struct.ap_uint<16>"* %14, i16* align 512 %15)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(%"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #6 {
entry:
  %2 = icmp eq %"struct.ap_uint<16>"* %0, null
  %3 = icmp eq i16* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<16>", %"struct.ap_uint<16>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = load i16, i16* %1, align 512
  store i16 %5, i16* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.540"(i16* noalias align 512, %"struct.ap_uint<16>"* noalias readonly) unnamed_addr #6 {
entry:
  %2 = icmp eq i16* %0, null
  %3 = icmp eq %"struct.ap_uint<16>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<16>", %"struct.ap_uint<16>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = load i16, i16* %.0.0.04, align 2
  store i16 %5, i16* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_arp_server_subnet_top_hw(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, i16*, i16*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<32>, 0>"* noalias, %"class.hls::stream<ap_uint<32>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<arpTableReply, 0>"* noalias, %"class.hls::stream<arpTableReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512, %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %2, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<32>, 0>"(%"class.hls::stream<ap_uint<32>, 0>"* %4, %"class.hls::stream<ap_uint<32>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %8, %"class.hls::stream<arpTableReply, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<arpTableReply, 0>"(%"class.hls::stream<arpTableReply, 0>"* %10, %"class.hls::stream<arpTableReply, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(%"struct.ap_uint<16>"* %12, i16* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(%"struct.ap_uint<16>"* %14, i16* align 512 %15)
  ret void
}

define void @arp_server_subnet_top_hw_stub_wrapper(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, i16*, i16*) #7 {
entry:
  %10 = alloca %"struct.ap_uint<16>"
  %11 = alloca %"struct.ap_uint<16>"
  call void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %1, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %4, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %5, %"struct.ap_uint<16>"* %10, i16* %8, %"struct.ap_uint<16>"* %11, i16* %9)
  call void @arp_server_subnet_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ap_uint<32>, 0>"* %1, %"class.hls::stream<ap_uint<32>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<arpTableReply, 0>"* %4, %"class.hls::stream<arpTableReply, 0>"* %5, %"struct.ap_uint<48>"* %6, %"struct.ap_uint<32>"* %7, %"struct.ap_uint<16>"* %10, %"struct.ap_uint<16>"* %11)
  call void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %1, %"class.hls::stream<ap_uint<32>, 0>"* null, %"class.hls::stream<ap_uint<32>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %4, %"class.hls::stream<arpTableReply, 0>"* null, %"class.hls::stream<arpTableReply, 0>"* %5, %"struct.ap_uint<16>"* %10, i16* %8, %"struct.ap_uint<16>"* %11, i16* %9)
  ret void
}

declare void @arp_server_subnet_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<ap_uint<32>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"class.hls::stream<arpTableReply, 0>"*, %"struct.ap_uint<48>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="32" }
attributes #10 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" }

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
