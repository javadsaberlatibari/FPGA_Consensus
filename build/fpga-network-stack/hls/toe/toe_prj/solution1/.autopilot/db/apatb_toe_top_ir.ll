; ModuleID = '/pub/scratch/pyuvaraj/Vitis_RoCE_W/Vitis_RoCE/build/fpga-network-stack/hls/toe/toe_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<mmStatus, 0>" = type { %struct.mmStatus }
%struct.mmStatus = type { %"struct.ap_uint<4>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<mmCmd, 0>" = type { %struct.mmCmd }
%struct.mmCmd = type { %"struct.ap_uint<23>", %"struct.ap_uint<1>", %"struct.ap_uint<6>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<32>", %"struct.ap_uint<4>", %"struct.ap_uint<4>" }
%"struct.ap_uint<23>" = type { %"struct.ap_int_base<23, false>" }
%"struct.ap_int_base<23, false>" = type { %"struct.ssdm_int<23, false>" }
%"struct.ssdm_int<23, false>" = type { i23 }
%"struct.ap_uint<6>" = type { %"struct.ap_int_base<6, false>" }
%"struct.ap_int_base<6, false>" = type { %"struct.ssdm_int<6, false>" }
%"struct.ssdm_int<6, false>" = type { i6 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"class.hls::stream<rtlSessionLookupReply, 0>" = type { %struct.rtlSessionLookupReply }
%struct.rtlSessionLookupReply = type { %struct.threeTupleInternal, %"struct.ap_uint<16>", i1, i32 }
%struct.threeTupleInternal = type { %"struct.ap_uint<32>", %"struct.ap_uint<16>", %"struct.ap_uint<16>" }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"class.hls::stream<rtlSessionUpdateReply, 0>" = type { %struct.rtlSessionUpdateReply }
%struct.rtlSessionUpdateReply = type { i32, %struct.threeTupleInternal, %"struct.ap_uint<16>", i1, i32 }
%"class.hls::stream<rtlSessionLookupRequest, 0>" = type { %struct.rtlSessionLookupRequest }
%struct.rtlSessionLookupRequest = type { %struct.threeTupleInternal, i32 }
%"class.hls::stream<rtlSessionUpdateRequest, 0>" = type { %struct.rtlSessionUpdateRequest }
%struct.rtlSessionUpdateRequest = type { i32, %struct.threeTupleInternal, %"struct.ap_uint<16>", i32 }
%"class.hls::stream<ipTuple, 0>" = type { %struct.ipTuple }
%struct.ipTuple = type { %"struct.ap_uint<32>", %"struct.ap_uint<16>" }
%"class.hls::stream<appReadRequest, 0>" = type { %struct.appReadRequest }
%struct.appReadRequest = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>" }
%"class.hls::stream<appNotification, 0>" = type { %struct.appNotification }
%struct.appNotification = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<32>", %"struct.ap_uint<16>", i1 }
%"class.hls::stream<ap_uint<16>, 0>" = type { %"struct.ap_uint<16>" }
%"class.hls::stream<net_axis<512>, 0>" = type { %"struct.net_axis<512>" }
%"struct.net_axis<512>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<1>" }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"class.hls::stream<rxRetransmitTimerUpdate, 0>" = type { %struct.rxRetransmitTimerUpdate }
%struct.rxRetransmitTimerUpdate = type { %"struct.ap_uint<16>", i1 }
%"class.hls::stream<appTxRsp, 0>" = type { %struct.appTxRsp }
%struct.appTxRsp = type { %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<30>", %"struct.ap_uint<2>" }
%"struct.ap_uint<30>" = type { %"struct.ap_int_base<30, false>" }
%"struct.ap_int_base<30, false>" = type { %"struct.ssdm_int<30, false>" }
%"struct.ssdm_int<30, false>" = type { i30 }
%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_toe_top_ir(%"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %ipRxData, %"class.hls::stream<mmStatus, 0>"* noalias nocapture nonnull dereferenceable(5) %txBufferWriteStatus, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %rxBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %txBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %ipTxData, %"class.hls::stream<mmCmd, 0>"* noalias nocapture nonnull dereferenceable(16) %txBufferWriteCmd, %"class.hls::stream<mmCmd, 0>"* noalias nocapture nonnull dereferenceable(16) %txBufferReadCmd, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %rxBufferWriteData, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %txBufferWriteData, %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias nocapture nonnull dereferenceable(16) %sessionLookup_rsp, %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias nocapture nonnull dereferenceable(20) %sessionUpdate_rsp, %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias nocapture nonnull dereferenceable(12) %sessionLookup_req, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias nocapture nonnull dereferenceable(20) %sessionUpdate_req, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %listenPortReq, %"class.hls::stream<appReadRequest, 0>"* noalias nocapture nonnull dereferenceable(4) %rxDataReq, %"class.hls::stream<ipTuple, 0>"* noalias nocapture nonnull dereferenceable(8) %openConnReq, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %closeConnReq, %"class.hls::stream<appReadRequest, 0>"* noalias nocapture nonnull dereferenceable(4) %txDataReqMeta, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %txDataReq, %"struct.ssdm_int<1, false>"* noalias nocapture nonnull dereferenceable(1) %listenPortRsp, %"class.hls::stream<appNotification, 0>"* noalias nocapture nonnull dereferenceable(12) %notification, %"class.hls::stream<ap_uint<16>, 0>"* noalias nocapture nonnull dereferenceable(2) %rxDataRspMeta, %"class.hls::stream<net_axis<512>, 0>"* noalias nocapture nonnull dereferenceable(128) %rxDataRsp, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias nocapture nonnull dereferenceable(4) %openConnRsp, %"class.hls::stream<appTxRsp, 0>"* noalias nocapture nonnull dereferenceable(12) %txDataRsp, %"struct.ap_uint<16>"* nocapture readonly %axis_data_count, %"struct.ap_uint<16>"* nocapture readonly %axis_max_data_count, %"struct.ap_uint<32>"* nocapture readonly %myIpAddress, %"struct.ap_uint<16>"* noalias nocapture nonnull dereferenceable(2) %regSessionCount) local_unnamed_addr #1 {
entry:
  %ipRxData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %ipRxData_copy, i32 0) ]
  %txBufferWriteStatus_copy = alloca %"class.hls::stream<mmStatus, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<mmStatus, 0>"* %txBufferWriteStatus_copy, i32 0) ]
  %rxBufferReadData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %rxBufferReadData_copy, i32 0) ]
  %txBufferReadData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %txBufferReadData_copy, i32 0) ]
  %ipTxData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %ipTxData_copy, i32 0) ]
  %txBufferWriteCmd_copy = alloca %"class.hls::stream<mmCmd, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<mmCmd, 0>"* %txBufferWriteCmd_copy, i32 0) ]
  %txBufferReadCmd_copy = alloca %"class.hls::stream<mmCmd, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<mmCmd, 0>"* %txBufferReadCmd_copy, i32 0) ]
  %rxBufferWriteData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %rxBufferWriteData_copy, i32 0) ]
  %txBufferWriteData_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %txBufferWriteData_copy, i32 0) ]
  %sessionLookup_rsp_copy = alloca %"class.hls::stream<rtlSessionLookupReply, 0>", align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(%"class.hls::stream<rtlSessionLookupReply, 0>"* %sessionLookup_rsp_copy, i32 0) ]
  %sessionUpdate_rsp_copy = alloca %"class.hls::stream<rtlSessionUpdateReply, 0>", align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* %sessionUpdate_rsp_copy, i32 0) ]
  %sessionLookup_req_copy = alloca %"class.hls::stream<rtlSessionLookupRequest, 0>", align 512
  call void @llvm.sideeffect() #12 [ "stream_interface"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* %sessionLookup_req_copy, i32 0) ]
  %sessionUpdate_req_copy = alloca %"class.hls::stream<rtlSessionUpdateRequest, 0>", align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* %sessionUpdate_req_copy, i32 0) ]
  %listenPortReq_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #13 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %listenPortReq_copy, i32 0) ]
  %rxDataReq_copy = alloca %"class.hls::stream<appReadRequest, 0>", align 512
  call void @llvm.sideeffect() #14 [ "stream_interface"(%"class.hls::stream<appReadRequest, 0>"* %rxDataReq_copy, i32 0) ]
  %openConnReq_copy = alloca %"class.hls::stream<ipTuple, 0>", align 512
  call void @llvm.sideeffect() #15 [ "stream_interface"(%"class.hls::stream<ipTuple, 0>"* %openConnReq_copy, i32 0) ]
  %closeConnReq_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #13 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %closeConnReq_copy, i32 0) ]
  %txDataReqMeta_copy = alloca %"class.hls::stream<appReadRequest, 0>", align 512
  call void @llvm.sideeffect() #14 [ "stream_interface"(%"class.hls::stream<appReadRequest, 0>"* %txDataReqMeta_copy, i32 0) ]
  %txDataReq_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %txDataReq_copy, i32 0) ]
  %listenPortRsp_copy = alloca %"struct.ssdm_int<1, false>", align 512
  call void @llvm.sideeffect() #16 [ "stream_interface"(%"struct.ssdm_int<1, false>"* %listenPortRsp_copy, i32 0) ]
  %notification_copy = alloca %"class.hls::stream<appNotification, 0>", align 512
  call void @llvm.sideeffect() #12 [ "stream_interface"(%"class.hls::stream<appNotification, 0>"* %notification_copy, i32 0) ]
  %rxDataRspMeta_copy = alloca %"class.hls::stream<ap_uint<16>, 0>", align 512
  call void @llvm.sideeffect() #13 [ "stream_interface"(%"class.hls::stream<ap_uint<16>, 0>"* %rxDataRspMeta_copy, i32 0) ]
  %rxDataRsp_copy = alloca %"class.hls::stream<net_axis<512>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<net_axis<512>, 0>"* %rxDataRsp_copy, i32 0) ]
  %openConnRsp_copy = alloca %"class.hls::stream<rxRetransmitTimerUpdate, 0>", align 512
  call void @llvm.sideeffect() #14 [ "stream_interface"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %openConnRsp_copy, i32 0) ]
  %txDataRsp_copy = alloca %"class.hls::stream<appTxRsp, 0>", align 512
  call void @llvm.sideeffect() #12 [ "stream_interface"(%"class.hls::stream<appTxRsp, 0>"* %txDataRsp_copy, i32 0) ]
  %regSessionCount_copy = alloca i16, align 512
  call fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* nonnull %ipRxData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %ipRxData_copy, %"class.hls::stream<mmStatus, 0>"* nonnull %txBufferWriteStatus, %"class.hls::stream<mmStatus, 0>"* nonnull align 512 %txBufferWriteStatus_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %rxBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %rxBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %txBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %txBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %ipTxData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %ipTxData_copy, %"class.hls::stream<mmCmd, 0>"* nonnull %txBufferWriteCmd, %"class.hls::stream<mmCmd, 0>"* nonnull align 512 %txBufferWriteCmd_copy, %"class.hls::stream<mmCmd, 0>"* nonnull %txBufferReadCmd, %"class.hls::stream<mmCmd, 0>"* nonnull align 512 %txBufferReadCmd_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %rxBufferWriteData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %rxBufferWriteData_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %txBufferWriteData, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %txBufferWriteData_copy, %"class.hls::stream<rtlSessionLookupReply, 0>"* nonnull %sessionLookup_rsp, %"class.hls::stream<rtlSessionLookupReply, 0>"* nonnull align 512 %sessionLookup_rsp_copy, %"class.hls::stream<rtlSessionUpdateReply, 0>"* nonnull %sessionUpdate_rsp, %"class.hls::stream<rtlSessionUpdateReply, 0>"* nonnull align 512 %sessionUpdate_rsp_copy, %"class.hls::stream<rtlSessionLookupRequest, 0>"* nonnull %sessionLookup_req, %"class.hls::stream<rtlSessionLookupRequest, 0>"* nonnull align 512 %sessionLookup_req_copy, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* nonnull %sessionUpdate_req, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* nonnull align 512 %sessionUpdate_req_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %listenPortReq, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %listenPortReq_copy, %"class.hls::stream<appReadRequest, 0>"* nonnull %rxDataReq, %"class.hls::stream<appReadRequest, 0>"* nonnull align 512 %rxDataReq_copy, %"class.hls::stream<ipTuple, 0>"* nonnull %openConnReq, %"class.hls::stream<ipTuple, 0>"* nonnull align 512 %openConnReq_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %closeConnReq, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %closeConnReq_copy, %"class.hls::stream<appReadRequest, 0>"* nonnull %txDataReqMeta, %"class.hls::stream<appReadRequest, 0>"* nonnull align 512 %txDataReqMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %txDataReq, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %txDataReq_copy, %"struct.ssdm_int<1, false>"* nonnull %listenPortRsp, %"struct.ssdm_int<1, false>"* nonnull align 512 %listenPortRsp_copy, %"class.hls::stream<appNotification, 0>"* nonnull %notification, %"class.hls::stream<appNotification, 0>"* nonnull align 512 %notification_copy, %"class.hls::stream<ap_uint<16>, 0>"* nonnull %rxDataRspMeta, %"class.hls::stream<ap_uint<16>, 0>"* nonnull align 512 %rxDataRspMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* nonnull %rxDataRsp, %"class.hls::stream<net_axis<512>, 0>"* nonnull align 512 %rxDataRsp_copy, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* nonnull %openConnRsp, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* nonnull align 512 %openConnRsp_copy, %"class.hls::stream<appTxRsp, 0>"* nonnull %txDataRsp, %"class.hls::stream<appTxRsp, 0>"* nonnull align 512 %txDataRsp_copy, %"struct.ap_uint<16>"* nonnull %regSessionCount, i16* nonnull align 512 %regSessionCount_copy)
  call void @apatb_toe_top_hw(%"class.hls::stream<net_axis<512>, 0>"* %ipRxData_copy, %"class.hls::stream<mmStatus, 0>"* %txBufferWriteStatus_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* %ipTxData_copy, %"class.hls::stream<mmCmd, 0>"* %txBufferWriteCmd_copy, %"class.hls::stream<mmCmd, 0>"* %txBufferReadCmd_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferWriteData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txBufferWriteData_copy, %"class.hls::stream<rtlSessionLookupReply, 0>"* %sessionLookup_rsp_copy, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %sessionUpdate_rsp_copy, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %sessionLookup_req_copy, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %sessionUpdate_req_copy, %"class.hls::stream<ap_uint<16>, 0>"* %listenPortReq_copy, %"class.hls::stream<appReadRequest, 0>"* %rxDataReq_copy, %"class.hls::stream<ipTuple, 0>"* %openConnReq_copy, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnReq_copy, %"class.hls::stream<appReadRequest, 0>"* %txDataReqMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* %txDataReq_copy, %"struct.ssdm_int<1, false>"* %listenPortRsp_copy, %"class.hls::stream<appNotification, 0>"* %notification_copy, %"class.hls::stream<ap_uint<16>, 0>"* %rxDataRspMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxDataRsp_copy, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %openConnRsp_copy, %"class.hls::stream<appTxRsp, 0>"* %txDataRsp_copy, %"struct.ap_uint<16>"* %axis_data_count, %"struct.ap_uint<16>"* %axis_max_data_count, %"struct.ap_uint<32>"* %myIpAddress, i16* %regSessionCount_copy)
  call void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* %ipRxData, %"class.hls::stream<net_axis<512>, 0>"* %ipRxData_copy, %"class.hls::stream<mmStatus, 0>"* %txBufferWriteStatus, %"class.hls::stream<mmStatus, 0>"* %txBufferWriteStatus_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txBufferReadData, %"class.hls::stream<net_axis<512>, 0>"* %txBufferReadData_copy, %"class.hls::stream<net_axis<512>, 0>"* %ipTxData, %"class.hls::stream<net_axis<512>, 0>"* %ipTxData_copy, %"class.hls::stream<mmCmd, 0>"* %txBufferWriteCmd, %"class.hls::stream<mmCmd, 0>"* %txBufferWriteCmd_copy, %"class.hls::stream<mmCmd, 0>"* %txBufferReadCmd, %"class.hls::stream<mmCmd, 0>"* %txBufferReadCmd_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferWriteData, %"class.hls::stream<net_axis<512>, 0>"* %rxBufferWriteData_copy, %"class.hls::stream<net_axis<512>, 0>"* %txBufferWriteData, %"class.hls::stream<net_axis<512>, 0>"* %txBufferWriteData_copy, %"class.hls::stream<rtlSessionLookupReply, 0>"* %sessionLookup_rsp, %"class.hls::stream<rtlSessionLookupReply, 0>"* %sessionLookup_rsp_copy, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %sessionUpdate_rsp, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %sessionUpdate_rsp_copy, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %sessionLookup_req, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %sessionLookup_req_copy, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %sessionUpdate_req, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %sessionUpdate_req_copy, %"class.hls::stream<ap_uint<16>, 0>"* %listenPortReq, %"class.hls::stream<ap_uint<16>, 0>"* %listenPortReq_copy, %"class.hls::stream<appReadRequest, 0>"* %rxDataReq, %"class.hls::stream<appReadRequest, 0>"* %rxDataReq_copy, %"class.hls::stream<ipTuple, 0>"* %openConnReq, %"class.hls::stream<ipTuple, 0>"* %openConnReq_copy, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnReq, %"class.hls::stream<ap_uint<16>, 0>"* %closeConnReq_copy, %"class.hls::stream<appReadRequest, 0>"* %txDataReqMeta, %"class.hls::stream<appReadRequest, 0>"* %txDataReqMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* %txDataReq, %"class.hls::stream<net_axis<512>, 0>"* %txDataReq_copy, %"struct.ssdm_int<1, false>"* %listenPortRsp, %"struct.ssdm_int<1, false>"* %listenPortRsp_copy, %"class.hls::stream<appNotification, 0>"* %notification, %"class.hls::stream<appNotification, 0>"* %notification_copy, %"class.hls::stream<ap_uint<16>, 0>"* %rxDataRspMeta, %"class.hls::stream<ap_uint<16>, 0>"* %rxDataRspMeta_copy, %"class.hls::stream<net_axis<512>, 0>"* %rxDataRsp, %"class.hls::stream<net_axis<512>, 0>"* %rxDataRsp_copy, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %openConnRsp, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %openConnRsp_copy, %"class.hls::stream<appTxRsp, 0>"* %txDataRsp, %"class.hls::stream<appTxRsp, 0>"* %txDataRsp_copy, %"struct.ap_uint<16>"* %regSessionCount, i16* %regSessionCount_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmStatus, 0>"* noalias, %"class.hls::stream<mmStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias, %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias, %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ssdm_int<1, false>"* noalias, %"struct.ssdm_int<1, false>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias readonly, i16* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %1, %"class.hls::stream<net_axis<512>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* align 512 %3, %"class.hls::stream<mmStatus, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %5, %"class.hls::stream<net_axis<512>, 0>"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %7, %"class.hls::stream<net_axis<512>, 0>"* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %9, %"class.hls::stream<net_axis<512>, 0>"* %8)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* align 512 %11, %"class.hls::stream<mmCmd, 0>"* %10)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* align 512 %13, %"class.hls::stream<mmCmd, 0>"* %12)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %15, %"class.hls::stream<net_axis<512>, 0>"* %14)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %17, %"class.hls::stream<net_axis<512>, 0>"* %16)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* align 512 %19, %"class.hls::stream<rtlSessionLookupReply, 0>"* %18)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* align 512 %21, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %20)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* align 512 %23, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %22)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* align 512 %25, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %24)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %27, %"class.hls::stream<ap_uint<16>, 0>"* %26)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* align 512 %29, %"class.hls::stream<appReadRequest, 0>"* %28)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* align 512 %31, %"class.hls::stream<ipTuple, 0>"* %30)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %33, %"class.hls::stream<ap_uint<16>, 0>"* %32)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* align 512 %35, %"class.hls::stream<appReadRequest, 0>"* %34)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %37, %"class.hls::stream<net_axis<512>, 0>"* %36)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* align 512 %39, %"struct.ssdm_int<1, false>"* %38)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* align 512 %41, %"class.hls::stream<appNotification, 0>"* %40)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* align 512 %43, %"class.hls::stream<ap_uint<16>, 0>"* %42)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* align 512 %45, %"class.hls::stream<net_axis<512>, 0>"* %44)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* align 512 %47, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %46)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* align 512 %49, %"class.hls::stream<appTxRsp, 0>"* %48)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>"(i16* align 512 %51, %"struct.ap_uint<16>"* %50)
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
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmStatus, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<mmStatus, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<mmStatus, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* nonnull align 512 %0, %"class.hls::stream<mmStatus, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmStatus, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<mmStatus, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<mmStatus, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_5(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<mmStatus, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<mmStatus, 0>"* %1 to i8*
  call void @fpga_fifo_pop_5(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<mmStatus, 0>", %"class.hls::stream<mmStatus, 0>"* %2
  %8 = bitcast %"class.hls::stream<mmStatus, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<mmStatus, 0>"* %0 to i8*
  call void @fpga_fifo_push_5(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<mmCmd, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<mmCmd, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* nonnull align 512 %0, %"class.hls::stream<mmCmd, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<mmCmd, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<mmCmd, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<mmCmd, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<mmCmd, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<mmCmd, 0>", %"class.hls::stream<mmCmd, 0>"* %2
  %8 = bitcast %"class.hls::stream<mmCmd, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<mmCmd, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<rtlSessionLookupReply, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<rtlSessionLookupReply, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* nonnull align 512 %0, %"class.hls::stream<rtlSessionLookupReply, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<rtlSessionLookupReply, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<rtlSessionLookupReply, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<rtlSessionLookupReply, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<rtlSessionLookupReply, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<rtlSessionLookupReply, 0>", %"class.hls::stream<rtlSessionLookupReply, 0>"* %2
  %8 = bitcast %"class.hls::stream<rtlSessionLookupReply, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<rtlSessionLookupReply, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<rtlSessionUpdateReply, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<rtlSessionUpdateReply, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* nonnull align 512 %0, %"class.hls::stream<rtlSessionUpdateReply, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<rtlSessionUpdateReply, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<rtlSessionUpdateReply, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_20(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<rtlSessionUpdateReply, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<rtlSessionUpdateReply, 0>"* %1 to i8*
  call void @fpga_fifo_pop_20(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<rtlSessionUpdateReply, 0>", %"class.hls::stream<rtlSessionUpdateReply, 0>"* %2
  %8 = bitcast %"class.hls::stream<rtlSessionUpdateReply, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<rtlSessionUpdateReply, 0>"* %0 to i8*
  call void @fpga_fifo_push_20(i8* %8, i8* %9)
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<rtlSessionLookupRequest, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<rtlSessionLookupRequest, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* nonnull align 512 %0, %"class.hls::stream<rtlSessionLookupRequest, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<rtlSessionLookupRequest, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<rtlSessionLookupRequest, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<rtlSessionLookupRequest, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<rtlSessionLookupRequest, 0>"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<rtlSessionLookupRequest, 0>", %"class.hls::stream<rtlSessionLookupRequest, 0>"* %2
  %8 = bitcast %"class.hls::stream<rtlSessionLookupRequest, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<rtlSessionLookupRequest, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* nonnull align 512 %0, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<rtlSessionUpdateRequest, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_20(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %1 to i8*
  call void @fpga_fifo_pop_20(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<rtlSessionUpdateRequest, 0>", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %2
  %8 = bitcast %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %0 to i8*
  call void @fpga_fifo_push_20(i8* %8, i8* %9)
  br label %empty, !llvm.loop !12

ret:                                              ; preds = %empty
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
  br label %empty, !llvm.loop !13

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<appReadRequest, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<appReadRequest, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* nonnull align 512 %0, %"class.hls::stream<appReadRequest, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<appReadRequest, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<appReadRequest, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<appReadRequest, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<appReadRequest, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<appReadRequest, 0>", %"class.hls::stream<appReadRequest, 0>"* %2
  %8 = bitcast %"class.hls::stream<appReadRequest, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<appReadRequest, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !14

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
  br label %empty, !llvm.loop !15

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ssdm_int<1, false>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"struct.ssdm_int<1, false>"* %0, null
  %3 = icmp eq %"struct.ssdm_int<1, false>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* nonnull align 512 %0, %"struct.ssdm_int<1, false>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ssdm_int<1, false>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"struct.ssdm_int<1, false>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"struct.ssdm_int<1, false>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"struct.ssdm_int<1, false>"* %2 to i8*
  %6 = bitcast %"struct.ssdm_int<1, false>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %"struct.ssdm_int<1, false>", %"struct.ssdm_int<1, false>"* %2
  %8 = bitcast %"struct.ssdm_int<1, false>"* %2 to i8*
  %9 = bitcast %"struct.ssdm_int<1, false>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !16

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
  br label %empty, !llvm.loop !17

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* nonnull align 512 %0, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<rxRetransmitTimerUpdate, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<rxRetransmitTimerUpdate, 0>", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %2
  %8 = bitcast %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !18

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
  br label %empty, !llvm.loop !19

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
define internal fastcc void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmStatus, 0>"* noalias, %"class.hls::stream<mmStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias, %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias, %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ssdm_int<1, false>"* noalias, %"struct.ssdm_int<1, false>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* %2, %"class.hls::stream<mmStatus, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<net_axis<512>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* %10, %"class.hls::stream<mmCmd, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* %12, %"class.hls::stream<mmCmd, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %14, %"class.hls::stream<net_axis<512>, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %16, %"class.hls::stream<net_axis<512>, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* %18, %"class.hls::stream<rtlSessionLookupReply, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* %20, %"class.hls::stream<rtlSessionUpdateReply, 0>"* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* %22, %"class.hls::stream<rtlSessionLookupRequest, 0>"* align 512 %23)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* %24, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* align 512 %25)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %26, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %27)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* %28, %"class.hls::stream<appReadRequest, 0>"* align 512 %29)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* %30, %"class.hls::stream<ipTuple, 0>"* align 512 %31)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %32, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %33)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* %34, %"class.hls::stream<appReadRequest, 0>"* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %36, %"class.hls::stream<net_axis<512>, 0>"* align 512 %37)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* %38, %"struct.ssdm_int<1, false>"* align 512 %39)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* %40, %"class.hls::stream<appNotification, 0>"* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %42, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %44, %"class.hls::stream<net_axis<512>, 0>"* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %46, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* %48, %"class.hls::stream<appTxRsp, 0>"* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.6162"(%"struct.ap_uint<16>"* %50, i16* align 512 %51)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.6162"(%"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #5 {
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

declare void @apatb_toe_top_hw(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmStatus, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rtlSessionLookupReply, 0>"*, %"class.hls::stream<rtlSessionUpdateReply, 0>"*, %"class.hls::stream<rtlSessionLookupRequest, 0>"*, %"class.hls::stream<rtlSessionUpdateRequest, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ssdm_int<1, false>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, i16*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmStatus, 0>"* noalias, %"class.hls::stream<mmStatus, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<mmCmd, 0>"* noalias, %"class.hls::stream<mmCmd, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias, %"class.hls::stream<rtlSessionLookupReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateReply, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias, %"class.hls::stream<rtlSessionLookupRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ipTuple, 0>"* noalias, %"class.hls::stream<ipTuple, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appReadRequest, 0>"* noalias, %"class.hls::stream<appReadRequest, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ssdm_int<1, false>"* noalias, %"struct.ssdm_int<1, false>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appNotification, 0>"* noalias, %"class.hls::stream<appNotification, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<16>, 0>"* noalias, %"class.hls::stream<ap_uint<16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<net_axis<512>, 0>"* noalias, %"class.hls::stream<net_axis<512>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<appTxRsp, 0>"* noalias, %"class.hls::stream<appTxRsp, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"struct.ap_uint<16>"* noalias, i16* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<net_axis<512>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmStatus, 0>"(%"class.hls::stream<mmStatus, 0>"* %2, %"class.hls::stream<mmStatus, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<net_axis<512>, 0>"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<net_axis<512>, 0>"* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* %10, %"class.hls::stream<mmCmd, 0>"* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<mmCmd, 0>"(%"class.hls::stream<mmCmd, 0>"* %12, %"class.hls::stream<mmCmd, 0>"* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %14, %"class.hls::stream<net_axis<512>, 0>"* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %16, %"class.hls::stream<net_axis<512>, 0>"* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupReply, 0>"(%"class.hls::stream<rtlSessionLookupReply, 0>"* %18, %"class.hls::stream<rtlSessionLookupReply, 0>"* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateReply, 0>"(%"class.hls::stream<rtlSessionUpdateReply, 0>"* %20, %"class.hls::stream<rtlSessionUpdateReply, 0>"* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionLookupRequest, 0>"(%"class.hls::stream<rtlSessionLookupRequest, 0>"* %22, %"class.hls::stream<rtlSessionLookupRequest, 0>"* align 512 %23)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rtlSessionUpdateRequest, 0>"(%"class.hls::stream<rtlSessionUpdateRequest, 0>"* %24, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* align 512 %25)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %26, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %27)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* %28, %"class.hls::stream<appReadRequest, 0>"* align 512 %29)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ipTuple, 0>"(%"class.hls::stream<ipTuple, 0>"* %30, %"class.hls::stream<ipTuple, 0>"* align 512 %31)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %32, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %33)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appReadRequest, 0>"(%"class.hls::stream<appReadRequest, 0>"* %34, %"class.hls::stream<appReadRequest, 0>"* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %36, %"class.hls::stream<net_axis<512>, 0>"* align 512 %37)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<1, false>"(%"struct.ssdm_int<1, false>"* %38, %"struct.ssdm_int<1, false>"* align 512 %39)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appNotification, 0>"(%"class.hls::stream<appNotification, 0>"* %40, %"class.hls::stream<appNotification, 0>"* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<16>, 0>"(%"class.hls::stream<ap_uint<16>, 0>"* %42, %"class.hls::stream<ap_uint<16>, 0>"* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<net_axis<512>, 0>"(%"class.hls::stream<net_axis<512>, 0>"* %44, %"class.hls::stream<net_axis<512>, 0>"* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<rxRetransmitTimerUpdate, 0>"(%"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %46, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<appTxRsp, 0>"(%"class.hls::stream<appTxRsp, 0>"* %48, %"class.hls::stream<appTxRsp, 0>"* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<16>.6162"(%"struct.ap_uint<16>"* %50, i16* align 512 %51)
  ret void
}

define void @toe_top_hw_stub_wrapper(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmStatus, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rtlSessionLookupReply, 0>"*, %"class.hls::stream<rtlSessionUpdateReply, 0>"*, %"class.hls::stream<rtlSessionLookupRequest, 0>"*, %"class.hls::stream<rtlSessionUpdateRequest, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ssdm_int<1, false>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, i16*) #7 {
entry:
  %29 = alloca %"struct.ap_uint<16>"
  call void @copy_out(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<mmStatus, 0>"* null, %"class.hls::stream<mmStatus, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<mmCmd, 0>"* null, %"class.hls::stream<mmCmd, 0>"* %5, %"class.hls::stream<mmCmd, 0>"* null, %"class.hls::stream<mmCmd, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<rtlSessionLookupReply, 0>"* null, %"class.hls::stream<rtlSessionLookupReply, 0>"* %9, %"class.hls::stream<rtlSessionUpdateReply, 0>"* null, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %10, %"class.hls::stream<rtlSessionLookupRequest, 0>"* null, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %11, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* null, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %12, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %13, %"class.hls::stream<appReadRequest, 0>"* null, %"class.hls::stream<appReadRequest, 0>"* %14, %"class.hls::stream<ipTuple, 0>"* null, %"class.hls::stream<ipTuple, 0>"* %15, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %16, %"class.hls::stream<appReadRequest, 0>"* null, %"class.hls::stream<appReadRequest, 0>"* %17, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %18, %"struct.ssdm_int<1, false>"* null, %"struct.ssdm_int<1, false>"* %19, %"class.hls::stream<appNotification, 0>"* null, %"class.hls::stream<appNotification, 0>"* %20, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %21, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %22, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* null, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %23, %"class.hls::stream<appTxRsp, 0>"* null, %"class.hls::stream<appTxRsp, 0>"* %24, %"struct.ap_uint<16>"* %29, i16* %28)
  call void @toe_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<mmStatus, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<mmCmd, 0>"* %5, %"class.hls::stream<mmCmd, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<rtlSessionLookupReply, 0>"* %9, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %10, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %11, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %12, %"class.hls::stream<ap_uint<16>, 0>"* %13, %"class.hls::stream<appReadRequest, 0>"* %14, %"class.hls::stream<ipTuple, 0>"* %15, %"class.hls::stream<ap_uint<16>, 0>"* %16, %"class.hls::stream<appReadRequest, 0>"* %17, %"class.hls::stream<net_axis<512>, 0>"* %18, %"struct.ssdm_int<1, false>"* %19, %"class.hls::stream<appNotification, 0>"* %20, %"class.hls::stream<ap_uint<16>, 0>"* %21, %"class.hls::stream<net_axis<512>, 0>"* %22, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %23, %"class.hls::stream<appTxRsp, 0>"* %24, %"struct.ap_uint<16>"* %25, %"struct.ap_uint<16>"* %26, %"struct.ap_uint<32>"* %27, %"struct.ap_uint<16>"* %29)
  call void @copy_in(%"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %0, %"class.hls::stream<mmStatus, 0>"* null, %"class.hls::stream<mmStatus, 0>"* %1, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %2, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %3, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %4, %"class.hls::stream<mmCmd, 0>"* null, %"class.hls::stream<mmCmd, 0>"* %5, %"class.hls::stream<mmCmd, 0>"* null, %"class.hls::stream<mmCmd, 0>"* %6, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %7, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %8, %"class.hls::stream<rtlSessionLookupReply, 0>"* null, %"class.hls::stream<rtlSessionLookupReply, 0>"* %9, %"class.hls::stream<rtlSessionUpdateReply, 0>"* null, %"class.hls::stream<rtlSessionUpdateReply, 0>"* %10, %"class.hls::stream<rtlSessionLookupRequest, 0>"* null, %"class.hls::stream<rtlSessionLookupRequest, 0>"* %11, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* null, %"class.hls::stream<rtlSessionUpdateRequest, 0>"* %12, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %13, %"class.hls::stream<appReadRequest, 0>"* null, %"class.hls::stream<appReadRequest, 0>"* %14, %"class.hls::stream<ipTuple, 0>"* null, %"class.hls::stream<ipTuple, 0>"* %15, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %16, %"class.hls::stream<appReadRequest, 0>"* null, %"class.hls::stream<appReadRequest, 0>"* %17, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %18, %"struct.ssdm_int<1, false>"* null, %"struct.ssdm_int<1, false>"* %19, %"class.hls::stream<appNotification, 0>"* null, %"class.hls::stream<appNotification, 0>"* %20, %"class.hls::stream<ap_uint<16>, 0>"* null, %"class.hls::stream<ap_uint<16>, 0>"* %21, %"class.hls::stream<net_axis<512>, 0>"* null, %"class.hls::stream<net_axis<512>, 0>"* %22, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* null, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"* %23, %"class.hls::stream<appTxRsp, 0>"* null, %"class.hls::stream<appTxRsp, 0>"* %24, %"struct.ap_uint<16>"* %29, i16* %28)
  ret void
}

declare void @toe_top_hw_stub(%"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmStatus, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<mmCmd, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rtlSessionLookupReply, 0>"*, %"class.hls::stream<rtlSessionUpdateReply, 0>"*, %"class.hls::stream<rtlSessionLookupRequest, 0>"*, %"class.hls::stream<rtlSessionUpdateRequest, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<ipTuple, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<appReadRequest, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"struct.ssdm_int<1, false>"*, %"class.hls::stream<appNotification, 0>"*, %"class.hls::stream<ap_uint<16>, 0>"*, %"class.hls::stream<net_axis<512>, 0>"*, %"class.hls::stream<rxRetransmitTimerUpdate, 0>"*, %"class.hls::stream<appTxRsp, 0>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<16>"*, %"struct.ap_uint<32>"*, %"struct.ap_uint<16>"*)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_5(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_20(i8*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_5(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_20(i8*, i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_5(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_20(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="1024" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="40" }
attributes #10 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" }
attributes #11 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="160" }
attributes #12 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="96" }
attributes #13 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="16" }
attributes #14 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="32" }
attributes #15 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="64" }
attributes #16 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="8" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
