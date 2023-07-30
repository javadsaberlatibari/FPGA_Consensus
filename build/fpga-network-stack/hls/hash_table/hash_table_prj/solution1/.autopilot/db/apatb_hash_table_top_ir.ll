; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/hash_table/hash_table_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<htLookupReq<64>, 0>" = type { %"struct.htLookupReq<64>" }
%"struct.htLookupReq<64>" = type { %"struct.ap_uint<64>", %"struct.ap_uint<1>" }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<htUpdateReq<64, 16>, 0>" = type { %"struct.htUpdateReq<64, 16>" }
%"struct.htUpdateReq<64, 16>" = type { i32, %"struct.ap_uint<64>", %"struct.ap_uint<16>", %"struct.ap_uint<1>" }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"class.hls::stream<htLookupResp<64, 16>, 0>" = type { %"struct.htLookupResp<64, 16>" }
%"struct.htLookupResp<64, 16>" = type { %"struct.ap_uint<64>", %"struct.ap_uint<16>", i1, %"struct.ap_uint<1>" }
%"class.hls::stream<htUpdateResp<64, 16>, 0>" = type { %"struct.htUpdateResp<64, 16>" }
%"struct.htUpdateResp<64, 16>" = type { i32, %"struct.ap_uint<64>", %"struct.ap_uint<16>", i1, %"struct.ap_uint<1>" }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_hash_table_top_ir(%"class.hls::stream<htLookupReq<64>, 0>"* noalias nocapture nonnull dereferenceable(16) %s_axis_lup_req, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias nocapture nonnull dereferenceable(24) %s_axis_upd_req, %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias nocapture nonnull dereferenceable(16) %m_axis_lup_rsp, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias nocapture nonnull dereferenceable(24) %m_axis_upd_rsp, %"struct.ap_uint<16>"* noalias nocapture nonnull dereferenceable(2) %regInsertFailureCount) local_unnamed_addr #1 {
entry:
  %s_axis_lup_req_copy = alloca %"class.hls::stream<htLookupReq<64>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<htLookupReq<64>, 0>"* %s_axis_lup_req_copy, i32 0) ]
  %s_axis_upd_req_copy = alloca %"class.hls::stream<htUpdateReq<64, 16>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* %s_axis_upd_req_copy, i32 0) ]
  %m_axis_lup_rsp_copy = alloca %"class.hls::stream<htLookupResp<64, 16>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* %m_axis_lup_rsp_copy, i32 0) ]
  %m_axis_upd_rsp_copy = alloca %"class.hls::stream<htUpdateResp<64, 16>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* %m_axis_upd_rsp_copy, i32 0) ]
  %regInsertFailureCount_copy = alloca i16, align 512
  call fastcc void @copy_in(%"class.hls::stream<htLookupReq<64>, 0>"* nonnull %s_axis_lup_req, %"class.hls::stream<htLookupReq<64>, 0>"* nonnull align 512 %s_axis_lup_req_copy, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* nonnull %s_axis_upd_req, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* nonnull align 512 %s_axis_upd_req_copy, %"class.hls::stream<htLookupResp<64, 16>, 0>"* nonnull %m_axis_lup_rsp, %"class.hls::stream<htLookupResp<64, 16>, 0>"* nonnull align 512 %m_axis_lup_rsp_copy, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* nonnull %m_axis_upd_rsp, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* nonnull align 512 %m_axis_upd_rsp_copy, %"struct.ap_uint<16>"* nonnull %regInsertFailureCount, i16* nonnull align 512 %regInsertFailureCount_copy)
  call void @apatb_hash_table_top_hw(%"class.hls::stream<htLookupReq<64>, 0>"* %s_axis_lup_req_copy, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %s_axis_upd_req_copy, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %m_axis_lup_rsp_copy, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %m_axis_upd_rsp_copy, i16* %regInsertFailureCount_copy)
  call void @copy_back(%"class.hls::stream<htLookupReq<64>, 0>"* %s_axis_lup_req, %"class.hls::stream<htLookupReq<64>, 0>"* %s_axis_lup_req_copy, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %s_axis_upd_req, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %s_axis_upd_req_copy, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %m_axis_lup_rsp, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %m_axis_lup_rsp_copy, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %m_axis_upd_rsp, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %m_axis_upd_rsp_copy, %"struct.ap_uint<16>"* %regInsertFailureCount, i16* %regInsertFailureCount_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<htLookupReq<64>, 0>"* noalias, %"class.hls::stream<htLookupReq<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias, %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias readonly, i16* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* align 512 %1, %"class.hls::stream<htLookupReq<64>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* align 512 %3, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* align 512 %5, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* align 512 %7, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(i16* align 512 %9, %"struct.ap_uint<16>"* %8)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupReq<64>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<htLookupReq<64>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<htLookupReq<64>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* nonnull align 512 %0, %"class.hls::stream<htLookupReq<64>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupReq<64>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<htLookupReq<64>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<htLookupReq<64>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<htLookupReq<64>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<htLookupReq<64>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<htLookupReq<64>, 0>", %"class.hls::stream<htLookupReq<64>, 0>"* %2
  %8 = bitcast %"class.hls::stream<htLookupReq<64>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<htLookupReq<64>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* nonnull align 512 %0, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<htUpdateReq<64, 16>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_24(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_24(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<htUpdateReq<64, 16>, 0>", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2
  %8 = bitcast %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %0 to i8*
  call void @fpga_fifo_push_24(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<htLookupResp<64, 16>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<htLookupResp<64, 16>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* nonnull align 512 %0, %"class.hls::stream<htLookupResp<64, 16>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<htLookupResp<64, 16>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<htLookupResp<64, 16>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<htLookupResp<64, 16>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<htLookupResp<64, 16>, 0>", %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2
  %8 = bitcast %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<htLookupResp<64, 16>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* nonnull align 512 %0, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<htUpdateResp<64, 16>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_24(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_24(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<htUpdateResp<64, 16>, 0>", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %2
  %8 = bitcast %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %0 to i8*
  call void @fpga_fifo_push_24(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(i16* noalias align 512, %"struct.ap_uint<16>"* noalias readonly) unnamed_addr #5 {
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

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<htLookupReq<64>, 0>"* noalias, %"class.hls::stream<htLookupReq<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias, %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* %0, %"class.hls::stream<htLookupReq<64>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* %4, %"class.hls::stream<htLookupResp<64, 16>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* %6, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.64"(%"struct.ap_uint<16>"* %8, i16* align 512 %9)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.64"(%"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #5 {
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

declare void @apatb_hash_table_top_hw(%"class.hls::stream<htLookupReq<64>, 0>"*, %"class.hls::stream<htUpdateReq<64, 16>, 0>"*, %"class.hls::stream<htLookupResp<64, 16>, 0>"*, %"class.hls::stream<htUpdateResp<64, 16>, 0>"*, i16*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<htLookupReq<64>, 0>"* noalias, %"class.hls::stream<htLookupReq<64>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias, %"class.hls::stream<htLookupResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupReq<64>, 0>"(%"class.hls::stream<htLookupReq<64>, 0>"* %0, %"class.hls::stream<htLookupReq<64>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateReq<64, 16>, 0>"(%"class.hls::stream<htUpdateReq<64, 16>, 0>"* %2, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htLookupResp<64, 16>, 0>"(%"class.hls::stream<htLookupResp<64, 16>, 0>"* %4, %"class.hls::stream<htLookupResp<64, 16>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<htUpdateResp<64, 16>, 0>"(%"class.hls::stream<htUpdateResp<64, 16>, 0>"* %6, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.64"(%"struct.ap_uint<16>"* %8, i16* align 512 %9)
  ret void
}

define void @hash_table_top_hw_stub_wrapper(%"class.hls::stream<htLookupReq<64>, 0>"*, %"class.hls::stream<htUpdateReq<64, 16>, 0>"*, %"class.hls::stream<htLookupResp<64, 16>, 0>"*, %"class.hls::stream<htUpdateResp<64, 16>, 0>"*, i16*) #7 {
entry:
  %5 = alloca %"struct.ap_uint<16>"
  call void @copy_out(%"class.hls::stream<htLookupReq<64>, 0>"* null, %"class.hls::stream<htLookupReq<64>, 0>"* %0, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* null, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1, %"class.hls::stream<htLookupResp<64, 16>, 0>"* null, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* null, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %3, %"struct.ap_uint<16>"* %5, i16* %4)
  call void @hash_table_top_hw_stub(%"class.hls::stream<htLookupReq<64>, 0>"* %0, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %3, %"struct.ap_uint<16>"* %5)
  call void @copy_in(%"class.hls::stream<htLookupReq<64>, 0>"* null, %"class.hls::stream<htLookupReq<64>, 0>"* %0, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* null, %"class.hls::stream<htUpdateReq<64, 16>, 0>"* %1, %"class.hls::stream<htLookupResp<64, 16>, 0>"* null, %"class.hls::stream<htLookupResp<64, 16>, 0>"* %2, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* null, %"class.hls::stream<htUpdateResp<64, 16>, 0>"* %3, %"struct.ap_uint<16>"* %5, i16* %4)
  ret void
}

declare void @hash_table_top_hw_stub(%"class.hls::stream<htLookupReq<64>, 0>"*, %"class.hls::stream<htUpdateReq<64, 16>, 0>"*, %"class.hls::stream<htLookupResp<64, 16>, 0>"*, %"class.hls::stream<htUpdateResp<64, 16>, 0>"*, %"struct.ap_uint<16>"*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_24(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_24(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_24(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="192" }

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
