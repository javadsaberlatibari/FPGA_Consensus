; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/kernel/user_krnl/iperf_krnl/src/hls/iperf_client_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<bool, 0>" = type { i1 }
%"class.hls::stream<appNotification, 0>" = type { %struct.appNotification }
%struct.appNotification = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<32>", %"struct.ap_uint<16>", i1 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"class.hls::stream<ipTuple, 0>" = type { %struct.ipTuple }
%struct.ipTuple = type { %"struct.ap_uint<32>", %"struct.ap_uint<16>" }
%"class.hls::stream<openStatus, 0>" = type { %struct.openStatus }
%struct.openStatus = type { %"struct.ap_uint<16>", i1 }
%"class.hls::stream<ap_uint<16>, 0>" = type { %"struct.ap_uint<16>" }
%"class.hls::stream<appTxMeta, 0>" = type { %struct.appTxMeta }
%struct.appTxMeta = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>" }
%"class.hls::stream<net_axis<512>, 0>" = type { %"struct.net_axis<512>" }
%"struct.net_axis<512>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<1>" }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"class.hls::stream<bool, 0>" }
%"class.hls::stream<appTxRsp, 0>" = type { %struct.appTxRsp }
%struct.appTxRsp = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<30>", %"struct.ap_uint<2>" }
%"struct.ap_uint<30>" = type { %"struct.ap_int_base<30, false>" }
%"struct.ap_int_base<30, false>" = type { %"struct.ssdm_int<30, false>" }
%"struct.ssdm_int<30, false>" = type { i30 }
%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%"struct.ap_uint<14>" = type { %"struct.ap_int_base<14, false>" }
%"struct.ap_int_base<14, false>" = type { %"struct.ssdm_int<14, false>" }
%"struct.ssdm_int<14, false>" = type { i14 }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.ssdm_int<8, false>" }
%"struct.ssdm_int<8, false>" = type { i8 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_iperf_client_ir(%"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %listenPort, %"class.hls::stream<bool, 0>"* noalias nocapture nonnull dereferenceable(1) %listenPortStatus, %"class.hls::stream<appNotification, 0>"* noalias nocapture nonnull dereferenceable(12) %notifications, %"class.hls::stream<appTxMeta, 0>"* noalias nocapture nonnull dereferenceable(4) %readRequest, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %rxMetaData, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %rxData, %"class.hls::stream<ipTuple, 0>"* noalias nocapture nonnull dereferenceable(8) %openConnection, %"class.hls::stream<openStatus, 0>"* noalias nocapture nonnull dereferenceable(4) %openConStatus, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %closeConnection, %"class.hls::stream<appTxMeta, 0>"* noalias nocapture nonnull dereferenceable(4) %txMetaData, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %txData, %"class.hls::stream<appTxRsp, 0>"* noalias nocapture nonnull dereferenceable(12) %txStatus, %"struct.ap_uint<1>"* nocapture readonly %runExperiment, %"struct.ap_uint<1>"* nocapture readonly %dualModeEn, %"struct.ap_uint<14>"* nocapture readonly %useConn, %"struct.ap_uint<8>"* nocapture readonly %pkgWordCount, %"struct.ap_uint<8>"* nocapture readonly %packetGap, %"struct.ap_uint<32>"* nocapture readonly %timeInSeconds, %"struct.ap_uint<64>"* nocapture readonly %timeInCycles, %"struct.ap_uint<16>"* nocapture readonly %useIpAddr, %"struct.ap_uint<16>"* nocapture readonly %regBasePort, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress0, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress1, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress2, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress3, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress4, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress5, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress6, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress7, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress8, %"struct.ap_uint<32>"* nocapture readonly %regIpAddress9) local_unnamed_addr #1 {
entry:
  %listenPort_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %listenPort_copy, i32 0) ]
  %listenPortStatus_copy = alloca %"class.hls::stream<bool, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<bool, 0>"* %listenPortStatus_copy, i32 0) ]
  %notifications_copy = alloca %"class.hls::stream<appNotification, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<appNotification, 0>"* %notifications_copy, i32 0) ]
  %readRequest_copy = alloca %"class.hls::stream<appTxMeta, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<appTxMeta, 0>"* %readRequest_copy, i32 0) ]
  %rxMetaData_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %rxMetaData_copy, i32 0) ]
  %rxData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %rxData_copy, i32 0) ]
  %openConnection_copy = alloca %"class.hls::stream<ipTuple, 0>", align 512
  call void @llvm.sideeffect() #12 [ "stream_interface"(%"class.hls::stream<ipTuple, 0>"* %openConnection_copy, i32 0) ]
  %openConStatus_copy = alloca %"class.hls::stream<openStatus, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<openStatus, 0>"* %openConStatus_copy, i32 0) ]
  %closeConnection_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %closeConnection_copy, i32 0) ]
  %txMetaData_copy = alloca %"class.hls::stream<appTxMeta, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<appTxMeta, 0>"* %txMetaData_copy, i32 0) ]
  %txData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %txData_copy, i32 0) ]
  %txStatus_copy = alloca %"class.hls::stream<appTxRsp, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<appTxRsp, 0>"* %txStatus_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* nonnull %listenPort, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %listenPort_copy, %"class.hls::stream<bool, 0>"* nonnull %listenPortStatus, %"class.hls::stream<bool, 0>"* nonnull align 512 %listenPortStatus_copy, %"class.hls::stream<appNotification, 0>"* nonnull %notifications, %"class.hls::stream<appNotification, 0>"* nonnull align 512 %notifications_copy, %"class.hls::stream<appTxMeta, 0>"* nonnull %readRequest, %"class.hls::stream<appTxMeta, 0>"* nonnull align 512 %readRequest_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %rxMetaData, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %rxMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %rxData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %rxData_copy, %"class.hls::stream<ipTuple, 0>"* nonnull %openConnection, %"class.hls::stream<ipTuple, 0>"* nonnull align 512 %openConnection_copy, %"class.hls::stream<openStatus, 0>"* nonnull %openConStatus, %"class.hls::stream<openStatus, 0>"* nonnull align 512 %openConStatus_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %closeConnection, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %closeConnection_copy, %"class.hls::stream<appTxMeta, 0>"* nonnull %txMetaData, %"class.hls::stream<appTxMeta, 0>"* nonnull align 512 %txMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %txData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %txData_copy, %"class.hls::stream<appTxRsp, 0>"* nonnull %txStatus, %"class.hls::stream<appTxRsp, 0>"* nonnull align 512 %txStatus_copy)
  call void @apatb_iperf_client_hw(%"class.hls::stream<ap_uint<16>, 0>"* %listenPort_copy, %"class.hls::stream<bool, 0>"* %listenPortStatus_copy, %"class.hls::stream<appNotification, 0>"* %notifications_copy, %"class.hls::stream<appTxMeta, 0>"* %readRequest_copy, %"class.hls::stream<ap_uint<16>, 0>"* %rxMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxData_copy, %"class.hls::stream<ipTuple, 0>"* %openConnection_copy, %"class.hls::stream<openStatus, 0>"* %openConStatus_copy, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnection_copy, %"class.hls::stream<appTxMeta, 0>"* %txMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txData_copy, %"class.hls::stream<appTxRsp, 0>"* %txStatus_copy, %"struct.ap_uint<1>"* %runExperiment, %"struct.ap_uint<1>"* %dualModeEn, %"struct.ap_uint<14>"* %useConn, %"struct.ap_uint<8>"* %pkgWordCount, %"struct.ap_uint<8>"* %packetGap, %"struct.ap_uint<32>"* %timeInSeconds, %"struct.ap_uint<64>"* %timeInCycles, %"struct.ap_uint<16>"* %useIpAddr, %"struct.ap_uint<16>"* %regBasePort, %"struct.ap_uint<32>"* %regIpAddress0, %"struct.ap_uint<32>"* %regIpAddress1, %"struct.ap_uint<32>"* %regIpAddress2, %"struct.ap_uint<32>"* %regIpAddress3, %"struct.ap_uint<32>"* %regIpAddress4, %"struct.ap_uint<32>"* %regIpAddress5, %"struct.ap_uint<32>"* %regIpAddress6, %"struct.ap_uint<32>"* %regIpAddress7, %"struct.ap_uint<32>"* %regIpAddress8, %"struct.ap_uint<32>"* %regIpAddress9)
  call void @copy_back(%"class.hls::stream<ap_uint<16>, 0>"* %listenPort, %"class.hls::stream<ap_uint<16>, 0>"* %listenPort_copy, %"class.hls::stream<bool, 0>"* %listenPortStatus, %"class.hls::stream<bool, 0>"* %listenPortStatus_copy, %"class.hls::stream<appNotification, 0>"* %notifications, %"class.hls::stream<appNotification, 0>"* %notifications_copy, %"class.hls::stream<appTxMeta, 0>"* %readRequest, %"class.hls::stream<appTxMeta, 0>"* %readRequest_copy, %"class.hls::stream<ap_uint<16>, 0>"* %rxMetaData, %"class.hls::stream<ap_uint<16>, 0>"* %rxMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxData, %"class.hls::stream<net_axis<512>, 0>"* %rxData_copy, %"class.hls::stream<ipTuple, 0>"* %openConnection, %"class.hls::stream<ipTuple, 0>"* %openConnection_copy, %"class.hls::stream<openStatus, 0>"* %openConStatus, %"class.hls::stream<openStatus, 0>"* %openConStatus_copy, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnection, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnection_copy, %"class.hls::stream<appTxMeta, 0>"* %txMetaData, %"class.hls::stream<appTxMeta, 0>"* %txMetaData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txData, %"class.hls::stream<net_axis<512>, 0>"* %txData_copy, %"class.hls::stream<appTxRsp, 0>"* %txStatus, %"class.hls::stream<appTxRsp, 0>"* %txStatus_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<openStatus, 0>"* noalias, %"class.hls::stream<openStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %1, %"class.hls::stream<ap_uint<16>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* align 512 %3, %"class.hls::stream<bool, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* align 512 %5, %"class.hls::stream<appNotification, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* align 512 %7, %"class.hls::stream<appTxMeta, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %9, %"class.hls::stream<ap_uint<16>, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %11, %"class.hls::stream<net_axis<512>, 0>"* %10)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* align 512 %13, %"class.hls::stream<ipTuple, 0>"* %12)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* align 512 %15, %"class.hls::stream<openStatus, 0>"* %14)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %17, %"class.hls::stream<ap_uint<16>, 0>"* %16)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* align 512 %19, %"class.hls::stream<appTxMeta, 0>"* %18)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %21, %"class.hls::stream<net_axis<512>, 0>"* %20)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* align 512 %23, %"class.hls::stream<appTxRsp, 0>"* %22)
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
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<appNotification, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<appNotification, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* nonnull align 512 %0, %"class.hls::stream<appNotification, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<appNotification, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<appNotification, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<appNotification, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<appNotification, 0>"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<appNotification, 0>", %"class.hls::stream<appNotification, 0>"* %2
  %8 = bitcast %"class.hls::stream<appNotification, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<appNotification, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<appTxMeta, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<appTxMeta, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* nonnull align 512 %0, %"class.hls::stream<appTxMeta, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<appTxMeta, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<appTxMeta, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<appTxMeta, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<appTxMeta, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<appTxMeta, 0>", %"class.hls::stream<appTxMeta, 0>"* %2
  %8 = bitcast %"class.hls::stream<appTxMeta, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<appTxMeta, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
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
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ipTuple, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ipTuple, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* nonnull align 512 %0, %"class.hls::stream<ipTuple, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ipTuple, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ipTuple, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ipTuple, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ipTuple, 0>"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ipTuple, 0>", %"class.hls::stream<ipTuple, 0>"* %2
  %8 = bitcast %"class.hls::stream<ipTuple, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ipTuple, 0>"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<openStatus, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<openStatus, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<openStatus, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* nonnull align 512 %0, %"class.hls::stream<openStatus, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<openStatus, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<openStatus, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<openStatus, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<openStatus, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<openStatus, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<openStatus, 0>", %"class.hls::stream<openStatus, 0>"* %2
  %8 = bitcast %"class.hls::stream<openStatus, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<openStatus, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !12

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<appTxRsp, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<appTxRsp, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* nonnull align 512 %0, %"class.hls::stream<appTxRsp, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<appTxRsp, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<appTxRsp, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<appTxRsp, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<appTxRsp, 0>"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<appTxRsp, 0>", %"class.hls::stream<appTxRsp, 0>"* %2
  %8 = bitcast %"class.hls::stream<appTxRsp, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<appTxRsp, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !13

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<openStatus, 0>"* noalias, %"class.hls::stream<openStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* %2, %"class.hls::stream<bool, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* %4, %"class.hls::stream<appNotification, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* %6, %"class.hls::stream<appTxMeta, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %8, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<net_axis<512>, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* %12, %"class.hls::stream<ipTuple, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* %14, %"class.hls::stream<openStatus, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %16, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* %18, %"class.hls::stream<appTxMeta, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %20, %"class.hls::stream<net_axis<512>, 0>"* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* %22, %"class.hls::stream<appTxRsp, 0>"* align 512 %23)
  ret void
}

declare void @apatb_iperf_client_hw(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<openStatus, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<14>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<64>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<bool, 0>"* noalias, %"class.hls::stream<bool, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<openStatus, 0>"* noalias, %"class.hls::stream<openStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxMeta, 0>"* noalias, %"class.hls::stream<appTxMeta, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<bool, 0>"(%"class.hls::stream<bool, 0>"* %2, %"class.hls::stream<bool, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* %4, %"class.hls::stream<appNotification, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* %6, %"class.hls::stream<appTxMeta, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %8, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<net_axis<512>, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* %12, %"class.hls::stream<ipTuple, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<openStatus, 0>"(%"class.hls::stream<openStatus, 0>"* %14, %"class.hls::stream<openStatus, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %16, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxMeta, 0>"(%"class.hls::stream<appTxMeta, 0>"* %18, %"class.hls::stream<appTxMeta, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %20, %"class.hls::stream<net_axis<512>, 0>"* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* %22, %"class.hls::stream<appTxRsp, 0>"* align 512 %23)
  ret void
}

define void @iperf_client_hw_stub_wrapper(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<openStatus, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<14>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<64>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*) #6 {
entry:
  call void @copy_out(%"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* null, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<appNotification, 0>"* null, %"class.hls::stream<appNotification, 0>"* %2, %"class.hls::stream<appTxMeta, 0>"* null, %"class.hls::stream<appTxMeta, 0>"* %3, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %5, %"class.hls::stream<ipTuple, 0>"* null, %"class.hls::stream<ipTuple, 0>"* %6, %"class.hls::stream<openStatus, 0>"* null, %"class.hls::stream<openStatus, 0>"* %7, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %8, %"class.hls::stream<appTxMeta, 0>"* null, %"class.hls::stream<appTxMeta, 0>"* %9, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<appTxRsp, 0>"* null, %"class.hls::stream<appTxRsp, 0>"* %11)
  call void @iperf_client_hw_stub(%"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<appNotification, 0>"* %2, %"class.hls::stream<appTxMeta, 0>"* %3, %"class.hls::stream<ap_uint<16>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* %5, %"class.hls::stream<ipTuple, 0>"* %6, %"class.hls::stream<openStatus, 0>"* %7, %"class.hls::stream<ap_uint<16>, 0>"* %8, %"class.hls::stream<appTxMeta, 0>"* %9, %"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<appTxRsp, 0>"* %11, %"struct.ap_uint<1>"* %12, %"struct.ap_uint<1>"* %13, %"struct.ap_uint<14>"* %14, %"struct.ap_uint<8>"* %15, %"struct.ap_uint<8>"* %16, %"struct.ap_uint<32>"* %17, %"struct.ap_uint<64>"* %18, %"struct.ap_uint<16>"* %19, %"struct.ap_uint<16>"* %20, %"struct.ap_uint<32>"* %21, %"struct.ap_uint<32>"* %22, %"struct.ap_uint<32>"* %23, %"struct.ap_uint<32>"* %24, %"struct.ap_uint<32>"* %25, %"struct.ap_uint<32>"* %26, %"struct.ap_uint<32>"* %27, %"struct.ap_uint<32>"* %28, %"struct.ap_uint<32>"* %29, %"struct.ap_uint<32>"* %30)
  call void @copy_in(%"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %0, %"class.hls::stream<bool, 0>"* null, %"class.hls::stream<bool, 0>"* %1, %"class.hls::stream<appNotification, 0>"* null, %"class.hls::stream<appNotification, 0>"* %2, %"class.hls::stream<appTxMeta, 0>"* null, %"class.hls::stream<appTxMeta, 0>"* %3, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %5, %"class.hls::stream<ipTuple, 0>"* null, %"class.hls::stream<ipTuple, 0>"* %6, %"class.hls::stream<openStatus, 0>"* null, %"class.hls::stream<openStatus, 0>"* %7, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %8, %"class.hls::stream<appTxMeta, 0>"* null, %"class.hls::stream<appTxMeta, 0>"* %9, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %10, %"class.hls::stream<appTxRsp, 0>"* null, %"class.hls::stream<appTxRsp, 0>"* %11)
  ret void
}

declare void @iperf_client_hw_stub(%"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<bool, 0>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<openStatus, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appTxMeta, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<14>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<64>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="16" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="8" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="96" }
attributes #10 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="32" }
attributes #11 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #12 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="64" }

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
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
