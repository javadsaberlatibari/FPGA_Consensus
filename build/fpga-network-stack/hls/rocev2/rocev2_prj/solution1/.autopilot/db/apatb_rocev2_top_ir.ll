; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/rocev2/rocev2_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<txMeta, 0>" = type { %struct.txMeta }
%struct.txMeta = type { i32, %"struct.ap_uint<24>", %"struct.ap_uint<48>", %"struct.ap_uint<48>", %"struct.ap_uint<32>" }
%"struct.ap_uint<24>" = type { %"struct.ap_int_base<24, false>" }
%"struct.ap_int_base<24, false>" = type { %"struct.ssdm_int<24, false>" }
%"struct.ssdm_int<24, false>" = type { i24 }
%"struct.ap_uint<48>" = type { %"struct.ap_int_base<48, false>" }
%"struct.ap_int_base<48, false>" = type { %"struct.ssdm_int<48, false>" }
%"struct.ssdm_int<48, false>" = type { i48 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"class.hls::stream<routedMemCmd, 0>" = type { %struct.routedMemCmd }
%struct.routedMemCmd = type { %struct.memCmd, %"struct.ap_uint<1>" }
%struct.memCmd = type { %"struct.ap_uint<64>", %"struct.ap_uint<32>" }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<routed_net_axis<512, 1>, 0>" = type { %"struct.routed_net_axis<512, 1>" }
%"struct.routed_net_axis<512, 1>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%"class.hls::stream<net_axis<512>, 0>" = type { %"struct.net_axis<512>" }
%"struct.net_axis<512>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<1>" }
%"class.hls::stream<qpContext, 0>" = type { %struct.qpContext }
%struct.qpContext = type { i32, %"struct.ap_uint<24>", %"struct.ap_uint<24>", %"struct.ap_uint<24>", %"struct.ap_uint<16>", %"struct.ap_uint<48>" }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"class.hls::stream<ifConnReq, 0>" = type { %struct.ifConnReq }
%struct.ifConnReq = type { %"struct.ap_uint<16>", %"struct.ap_uint<24>", %"struct.ap_uint<128>", %"struct.ap_uint<16>" }
%"struct.ap_uint<128>" = type { %"struct.ap_int_base<128, false>" }
%"struct.ap_int_base<128, false>" = type { %"struct.ssdm_int<128, false>" }
%"struct.ssdm_int<128, false>" = type { i128 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_rocev2_top_ir(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %s_axis_rx_data, %"class.hls::stream<txMeta, 0>"* noalias nocapture nonnull dereferenceable(32) %s_axis_tx_meta, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %m_axis_tx_data, %"class.hls::stream<routedMemCmd, 0>"* noalias nocapture nonnull dereferenceable(24) %m_axis_mem_write_cmd, %"class.hls::stream<routedMemCmd, 0>"* noalias nocapture nonnull dereferenceable(24) %m_axis_mem_read_cmd, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias nocapture nonnull dereferenceable(128) %m_axis_mem_write_data, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %s_axis_mem_read_data, %"class.hls::stream<qpContext, 0>"* noalias nocapture nonnull dereferenceable(32) %s_axis_qp_interface, %"class.hls::stream<ifConnReq, 0>"* noalias nocapture nonnull dereferenceable(48) %s_axis_qp_conn_interface, %"struct.ap_uint<128>"* nocapture readonly %local_ip_address, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %regCrcDropPkgCount, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %regInvalidPsnDropCount) local_unnamed_addr #1 {
entry:
  %s_axis_rx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, i32 0) ]
  %s_axis_tx_meta_copy = alloca %"class.hls::stream<txMeta, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<txMeta, 0>"* %s_axis_tx_meta_copy, i32 0) ]
  %s_axis_tx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, i32 0) ]
  %m_axis_tx_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy, i32 0) ]
  %m_axis_mem_write_cmd_copy = alloca %"class.hls::stream<routedMemCmd, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_write_cmd_copy, i32 0) ]
  %m_axis_mem_read_cmd_copy = alloca %"class.hls::stream<routedMemCmd, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_read_cmd_copy, i32 0) ]
  %m_axis_mem_write_data_copy = alloca %"class.hls::stream<routed_net_axis<512, 1>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* %m_axis_mem_write_data_copy, i32 0) ]
  %s_axis_mem_read_data_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_mem_read_data_copy, i32 0) ]
  %s_axis_qp_interface_copy = alloca %"class.hls::stream<qpContext, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<qpContext, 0>"* %s_axis_qp_interface_copy, i32 0) ]
  %s_axis_qp_conn_interface_copy = alloca %"class.hls::stream<ifConnReq, 0>", align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(%"class.hls::stream<ifConnReq, 0>"* %s_axis_qp_conn_interface_copy, i32 0) ]
  %regCrcDropPkgCount_copy = alloca i32, align 512
  %regInvalidPsnDropCount_copy = alloca i32, align 512
  call fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* nonnull %s_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %s_axis_rx_data_copy, %"class.hls::stream<txMeta, 0>"* nonnull %s_axis_tx_meta, %"class.hls::stream<txMeta, 0>"* nonnull align 512 %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %m_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %m_axis_tx_data_copy, %"class.hls::stream<routedMemCmd, 0>"* nonnull %m_axis_mem_write_cmd, %"class.hls::stream<routedMemCmd, 0>"* nonnull align 512 %m_axis_mem_write_cmd_copy, %"class.hls::stream<routedMemCmd, 0>"* nonnull %m_axis_mem_read_cmd, %"class.hls::stream<routedMemCmd, 0>"* nonnull align 512 %m_axis_mem_read_cmd_copy, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* nonnull %m_axis_mem_write_data, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* nonnull align 512 %m_axis_mem_write_data_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %s_axis_mem_read_data, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %s_axis_mem_read_data_copy, %"class.hls::stream<qpContext, 0>"* nonnull %s_axis_qp_interface, %"class.hls::stream<qpContext, 0>"* nonnull align 512 %s_axis_qp_interface_copy, %"class.hls::stream<ifConnReq, 0>"* nonnull %s_axis_qp_conn_interface, %"class.hls::stream<ifConnReq, 0>"* nonnull align 512 %s_axis_qp_conn_interface_copy, %"struct.ap_uint<32>"* nonnull %regCrcDropPkgCount, i32* nonnull align 512 %regCrcDropPkgCount_copy, %"struct.ap_uint<32>"* nonnull %regInvalidPsnDropCount, i32* nonnull align 512 %regInvalidPsnDropCount_copy)
  call void @apatb_rocev2_top_hw(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, %"class.hls::stream<txMeta, 0>"* %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_write_cmd_copy, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_read_cmd_copy, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %m_axis_mem_write_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_mem_read_data_copy, %"class.hls::stream<qpContext, 0>"* %s_axis_qp_interface_copy, %"class.hls::stream<ifConnReq, 0>"* %s_axis_qp_conn_interface_copy, %"struct.ap_uint<128>"* %local_ip_address, i32* %regCrcDropPkgCount_copy, i32* %regInvalidPsnDropCount_copy)
  call void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_rx_data_copy, %"class.hls::stream<txMeta, 0>"* %s_axis_tx_meta, %"class.hls::stream<txMeta, 0>"* %s_axis_tx_meta_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_tx_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data, %"class.hls::stream<net_axis<512>, 0>"* %m_axis_tx_data_copy, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_write_cmd, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_write_cmd_copy, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_read_cmd, %"class.hls::stream<routedMemCmd, 0>"* %m_axis_mem_read_cmd_copy, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %m_axis_mem_write_data, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %m_axis_mem_write_data_copy, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_mem_read_data, %"class.hls::stream<net_axis<512>, 0>"* %s_axis_mem_read_data_copy, %"class.hls::stream<qpContext, 0>"* %s_axis_qp_interface, %"class.hls::stream<qpContext, 0>"* %s_axis_qp_interface_copy, %"class.hls::stream<ifConnReq, 0>"* %s_axis_qp_conn_interface, %"class.hls::stream<ifConnReq, 0>"* %s_axis_qp_conn_interface_copy, %"struct.ap_uint<32>"* %regCrcDropPkgCount, i32* %regCrcDropPkgCount_copy, %"struct.ap_uint<32>"* %regInvalidPsnDropCount, i32* %regInvalidPsnDropCount_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<txMeta, 0>"* noalias, %"class.hls::stream<txMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<qpContext, 0>"* noalias, %"class.hls::stream<qpContext, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ifConnReq, 0>"* noalias, %"class.hls::stream<ifConnReq, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<32>"* noalias readonly, i32* noalias align 512, %"struct.ap_uint<32>"* noalias readonly, i32* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %1, %"class.hls::stream<net_axis<512>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* align 512 %3, %"class.hls::stream<txMeta, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %5, %"class.hls::stream<net_axis<512>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %7, %"class.hls::stream<net_axis<512>, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* align 512 %9, %"class.hls::stream<routedMemCmd, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* align 512 %11, %"class.hls::stream<routedMemCmd, 0>"* %10)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* align 512 %13, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %12)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %15, %"class.hls::stream<net_axis<512>, 0>"* %14)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* align 512 %17, %"class.hls::stream<qpContext, 0>"* %16)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* align 512 %19, %"class.hls::stream<ifConnReq, 0>"* %18)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.3934"(i32* align 512 %21, %"struct.ap_uint<32>"* %20)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.3934"(i32* align 512 %23, %"struct.ap_uint<32>"* %22)
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
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<txMeta, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<txMeta, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<txMeta, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* nonnull align 512 %0, %"class.hls::stream<txMeta, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<txMeta, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<txMeta, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<txMeta, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_32(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<txMeta, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<txMeta, 0>"* %1 to i8*
  call void @fpga_fifo_pop_32(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<txMeta, 0>", %"class.hls::stream<txMeta, 0>"* %2
  %8 = bitcast %"class.hls::stream<txMeta, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<txMeta, 0>"* %0 to i8*
  call void @fpga_fifo_push_32(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<routedMemCmd, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<routedMemCmd, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* nonnull align 512 %0, %"class.hls::stream<routedMemCmd, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<routedMemCmd, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<routedMemCmd, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_24(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<routedMemCmd, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<routedMemCmd, 0>"* %1 to i8*
  call void @fpga_fifo_pop_24(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<routedMemCmd, 0>", %"class.hls::stream<routedMemCmd, 0>"* %2
  %8 = bitcast %"class.hls::stream<routedMemCmd, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<routedMemCmd, 0>"* %0 to i8*
  call void @fpga_fifo_push_24(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* nonnull align 512 %0, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<routed_net_axis<512, 1>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_128(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_128(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<routed_net_axis<512, 1>, 0>", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %2
  %8 = bitcast %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %0 to i8*
  call void @fpga_fifo_push_128(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<qpContext, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<qpContext, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<qpContext, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* nonnull align 512 %0, %"class.hls::stream<qpContext, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<qpContext, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<qpContext, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<qpContext, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_32(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<qpContext, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<qpContext, 0>"* %1 to i8*
  call void @fpga_fifo_pop_32(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<qpContext, 0>", %"class.hls::stream<qpContext, 0>"* %2
  %8 = bitcast %"class.hls::stream<qpContext, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<qpContext, 0>"* %0 to i8*
  call void @fpga_fifo_push_32(i8* %8, i8* %9)
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ifConnReq, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ifConnReq, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ifConnReq, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* nonnull align 512 %0, %"class.hls::stream<ifConnReq, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ifConnReq, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ifConnReq, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ifConnReq, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_48(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ifConnReq, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ifConnReq, 0>"* %1 to i8*
  call void @fpga_fifo_pop_48(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ifConnReq, 0>", %"class.hls::stream<ifConnReq, 0>"* %2
  %8 = bitcast %"class.hls::stream<ifConnReq, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ifConnReq, 0>"* %0 to i8*
  call void @fpga_fifo_push_48(i8* %8, i8* %9)
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<txMeta, 0>"* noalias, %"class.hls::stream<txMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<qpContext, 0>"* noalias, %"class.hls::stream<qpContext, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ifConnReq, 0>"* noalias, %"class.hls::stream<ifConnReq, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* %2, %"class.hls::stream<txMeta, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* %8, %"class.hls::stream<routedMemCmd, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* %10, %"class.hls::stream<routedMemCmd, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* %12, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %14, %"class.hls::stream<net_axis<512>, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* %16, %"class.hls::stream<qpContext, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* %18, %"class.hls::stream<ifConnReq, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(%"struct.ap_uint<32>"* %20, i32* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(%"struct.ap_uint<32>"* %22, i32* align 512 %23)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(%"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512) unnamed_addr #6 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.3934"(i32* noalias align 512, %"struct.ap_uint<32>"* noalias readonly) unnamed_addr #6 {
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

declare void @apatb_rocev2_top_hw(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<txMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routed_net_axis<512, 1>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<qpContext, 0>"*, %"class.hls::stream<ifConnReq, 0>"*, %"struct.ap_uint<128>"*, i32*, i32*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<txMeta, 0>"* noalias, %"class.hls::stream<txMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routedMemCmd, 0>"* noalias, %"class.hls::stream<routedMemCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<qpContext, 0>"* noalias, %"class.hls::stream<qpContext, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ifConnReq, 0>"* noalias, %"class.hls::stream<ifConnReq, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512, %"struct.ap_uint<32>"* noalias, i32* noalias readonly align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<txMeta, 0>"(%"class.hls::stream<txMeta, 0>"* %2, %"class.hls::stream<txMeta, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* %8, %"class.hls::stream<routedMemCmd, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routedMemCmd, 0>"(%"class.hls::stream<routedMemCmd, 0>"* %10, %"class.hls::stream<routedMemCmd, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<routed_net_axis<512, 1>, 0>"(%"class.hls::stream<routed_net_axis<512, 1>, 0>"* %12, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %14, %"class.hls::stream<net_axis<512>, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qpContext, 0>"(%"class.hls::stream<qpContext, 0>"* %16, %"class.hls::stream<qpContext, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ifConnReq, 0>"(%"class.hls::stream<ifConnReq, 0>"* %18, %"class.hls::stream<ifConnReq, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(%"struct.ap_uint<32>"* %20, i32* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(%"struct.ap_uint<32>"* %22, i32* align 512 %23)
  ret void
}

define void @rocev2_top_hw_stub_wrapper(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<txMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routed_net_axis<512, 1>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<qpContext, 0>"*, %"class.hls::stream<ifConnReq, 0>"*, %"struct.ap_uint<128>"*, i32*, i32*) #7 {
entry:
  %13 = alloca %"struct.ap_uint<32>"
  %14 = alloca %"struct.ap_uint<32>"
  call void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<txMeta, 0>"* null, %"class.hls::stream<txMeta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<routedMemCmd, 0>"* null, %"class.hls::stream<routedMemCmd, 0>"* %4, %"class.hls::stream<routedMemCmd, 0>"* null, %"class.hls::stream<routedMemCmd, 0>"* %5, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* null, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<qpContext, 0>"* null, %"class.hls::stream<qpContext, 0>"* %8, %"class.hls::stream<ifConnReq, 0>"* null, %"class.hls::stream<ifConnReq, 0>"* %9, %"struct.ap_uint<32>"* %13, i32* %11, %"struct.ap_uint<32>"* %14, i32* %12)
  call void @rocev2_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<txMeta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<routedMemCmd, 0>"* %4, %"class.hls::stream<routedMemCmd, 0>"* %5, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<qpContext, 0>"* %8, %"class.hls::stream<ifConnReq, 0>"* %9, %"struct.ap_uint<128>"* %10, %"struct.ap_uint<32>"* %13, %"struct.ap_uint<32>"* %14)
  call void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<txMeta, 0>"* null, %"class.hls::stream<txMeta, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<routedMemCmd, 0>"* null, %"class.hls::stream<routedMemCmd, 0>"* %4, %"class.hls::stream<routedMemCmd, 0>"* null, %"class.hls::stream<routedMemCmd, 0>"* %5, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* null, %"class.hls::stream<routed_net_axis<512, 1>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<qpContext, 0>"* null, %"class.hls::stream<qpContext, 0>"* %8, %"class.hls::stream<ifConnReq, 0>"* null, %"class.hls::stream<ifConnReq, 0>"* %9, %"struct.ap_uint<32>"* %13, i32* %11, %"struct.ap_uint<32>"* %14, i32* %12)
  ret void
}

declare void @rocev2_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<txMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routedMemCmd, 0>"*, %"class.hls::stream<routed_net_axis<512, 1>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<qpContext, 0>"*, %"class.hls::stream<ifConnReq, 0>"*, %"struct.ap_uint<128>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_32(i8*)

declare i1 @fpga_fifo_not_empty_24(i8*)

declare i1 @fpga_fifo_not_empty_48(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_32(i8*, i8*)

declare void @fpga_fifo_pop_24(i8*, i8*)

declare void @fpga_fifo_pop_48(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_32(i8*, i8*)

declare void @fpga_fifo_push_24(i8*, i8*)

declare void @fpga_fifo_push_48(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="256" }
attributes #10 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="192" }
attributes #11 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="384" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
