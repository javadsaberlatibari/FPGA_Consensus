; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/ipv4/ipv4_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<ipv4Meta, 0>" = type { %struct.ipv4Meta }
%struct.ipv4Meta = type { %"struct.ap_uint<32>", %"struct.ap_uint<16>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
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
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"class.std::ios_base::Init" }
%"class.std::ios_base::Init" = type { i8 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_ipv4_top_ir(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %s_axis_rx_data, %"class.hls::stream<ipv4Meta, 0>"* noalias nocapture nonnull dereferenceable(8) %m_axis_rx_meta, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %m_axis_rx_data, %"class.hls::stream<ipv4Meta, 0>"* noalias nocapture nonnull dereferenceable(8) %s_axis_tx_meta, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %m_axis_tx_data, %"struct.ap_uint<32>"* nocapture readonly %local_ipv4_address, %"struct.ap_uint<8>"* nocapture readonly %protocol) local_unnamed_addr #1 {
entry:
  %s_axis_rx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, i32 0) ]
  %m_axis_rx_meta_copy = alloca %"class.hls::stream<ipv4Meta, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ipv4Meta, 0>"* %m_axis_rx_meta_copy, i32 0) ]
  %m_axis_rx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %m_axis_rx_data_copy, i32 0) ]
  %s_axis_tx_meta_copy = alloca %"class.hls::stream<ipv4Meta, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ipv4Meta, 0>"* %s_axis_tx_meta_copy, i32 0) ]
  %s_axis_tx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, i32 0) ]
  %m_axis_tx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* nonnull %s_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %s_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* nonnull %m_axis_rx_meta, %"class.hls::stream<ipv4Meta, 0>"* nonnull align 512 %m_axis_rx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %m_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %m_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* nonnull %s_axis_tx_meta, %"class.hls::stream<ipv4Meta, 0>"* nonnull align 512 %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %m_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %m_axis_tx_data_copy)
  call void @apatb_ipv4_top_hw(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* %m_axis_rx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy, %"struct.ap_uint<32>"* %local_ipv4_address, %"struct.ap_uint<8>"* %protocol)
  call void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* %m_axis_rx_meta, %"class.hls::stream<ipv4Meta, 0>"* %m_axis_rx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_rx_data_copy, %"class.hls::stream<ipv4Meta, 0>"* %s_axis_tx_meta, %"class.hls::stream<ipv4Meta, 0>"* %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %1, %"class.hls::stream<net_axis<512>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* align 512 %3, %"class.hls::stream<ipv4Meta, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %5, %"class.hls::stream<net_axis<512>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* align 512 %7, %"class.hls::stream<ipv4Meta, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %9, %"class.hls::stream<net_axis<512>, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %11, %"class.hls::stream<net_axis<512>, 0>"* %10)
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
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ipv4Meta, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ipv4Meta, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* nonnull align 512 %0, %"class.hls::stream<ipv4Meta, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ipv4Meta, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ipv4Meta, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ipv4Meta, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ipv4Meta, 0>"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ipv4Meta, 0>", %"class.hls::stream<ipv4Meta, 0>"* %2
  %8 = bitcast %"class.hls::stream<ipv4Meta, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ipv4Meta, 0>"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* %2, %"class.hls::stream<ipv4Meta, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* %6, %"class.hls::stream<ipv4Meta, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<net_axis<512>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<net_axis<512>, 0>"* align 512 %11)
  ret void
}

declare void @apatb_ipv4_top_hw(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<8>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipv4Meta, 0>"* noalias, %"class.hls::stream<ipv4Meta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* %2, %"class.hls::stream<ipv4Meta, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipv4Meta, 0>"(%"class.hls::stream<ipv4Meta, 0>"* %6, %"class.hls::stream<ipv4Meta, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<net_axis<512>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<net_axis<512>, 0>"* align 512 %11)
  ret void
}

define void @ipv4_top_hw_stub_wrapper(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<8>"*) #6 {
entry:
  call void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ipv4Meta, 0>"* null, %"class.hls::stream<ipv4Meta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ipv4Meta, 0>"* null, %"class.hls::stream<ipv4Meta, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %5)
  call void @ipv4_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ipv4Meta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ipv4Meta, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* %5, %"struct.ap_uint<32>"* %6, %"struct.ap_uint<8>"* %7)
  call void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<ipv4Meta, 0>"* null, %"class.hls::stream<ipv4Meta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<ipv4Meta, 0>"* null, %"class.hls::stream<ipv4Meta, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %5)
  ret void
}

declare void @ipv4_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipv4Meta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<8>"*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="64" }

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
