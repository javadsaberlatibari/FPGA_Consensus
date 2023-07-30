#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_s_axis_tcp_data "../tv/cdatafile/c.toe_top.autotvin_s_axis_tcp_data.dat"
#define AUTOTB_TVOUT_s_axis_tcp_data "../tv/cdatafile/c.toe_top.autotvout_s_axis_tcp_data.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_tcp_data "../tv/stream_size/stream_size_in_s_axis_tcp_data.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data "../tv/stream_size/stream_ingress_status_s_axis_tcp_data.dat"
#define AUTOTB_TVIN_s_axis_txwrite_sts "../tv/cdatafile/c.toe_top.autotvin_s_axis_txwrite_sts.dat"
#define AUTOTB_TVOUT_s_axis_txwrite_sts "../tv/cdatafile/c.toe_top.autotvout_s_axis_txwrite_sts.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts "../tv/stream_size/stream_size_in_s_axis_txwrite_sts.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts "../tv/stream_size/stream_ingress_status_s_axis_txwrite_sts.dat"
#define AUTOTB_TVIN_s_axis_rxread_data "../tv/cdatafile/c.toe_top.autotvin_s_axis_rxread_data.dat"
#define AUTOTB_TVOUT_s_axis_rxread_data "../tv/cdatafile/c.toe_top.autotvout_s_axis_rxread_data.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_rxread_data "../tv/stream_size/stream_size_in_s_axis_rxread_data.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data "../tv/stream_size/stream_ingress_status_s_axis_rxread_data.dat"
#define AUTOTB_TVIN_s_axis_txread_data "../tv/cdatafile/c.toe_top.autotvin_s_axis_txread_data.dat"
#define AUTOTB_TVOUT_s_axis_txread_data "../tv/cdatafile/c.toe_top.autotvout_s_axis_txread_data.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_txread_data "../tv/stream_size/stream_size_in_s_axis_txread_data.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data "../tv/stream_size/stream_ingress_status_s_axis_txread_data.dat"
#define AUTOTB_TVIN_m_axis_tcp_data "../tv/cdatafile/c.toe_top.autotvin_m_axis_tcp_data.dat"
#define AUTOTB_TVOUT_m_axis_tcp_data "../tv/cdatafile/c.toe_top.autotvout_m_axis_tcp_data.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data "../tv/stream_size/stream_size_out_m_axis_tcp_data.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_tcp_data "../tv/stream_size/stream_egress_status_m_axis_tcp_data.dat"
#define AUTOTB_TVIN_m_axis_txwrite_cmd "../tv/cdatafile/c.toe_top.autotvin_m_axis_txwrite_cmd.dat"
#define AUTOTB_TVOUT_m_axis_txwrite_cmd "../tv/cdatafile/c.toe_top.autotvout_m_axis_txwrite_cmd.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd "../tv/stream_size/stream_size_out_m_axis_txwrite_cmd.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_txwrite_cmd "../tv/stream_size/stream_egress_status_m_axis_txwrite_cmd.dat"
#define AUTOTB_TVIN_m_axis_txread_cmd "../tv/cdatafile/c.toe_top.autotvin_m_axis_txread_cmd.dat"
#define AUTOTB_TVOUT_m_axis_txread_cmd "../tv/cdatafile/c.toe_top.autotvout_m_axis_txread_cmd.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd "../tv/stream_size/stream_size_out_m_axis_txread_cmd.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_txread_cmd "../tv/stream_size/stream_egress_status_m_axis_txread_cmd.dat"
#define AUTOTB_TVIN_m_axis_rxwrite_data "../tv/cdatafile/c.toe_top.autotvin_m_axis_rxwrite_data.dat"
#define AUTOTB_TVOUT_m_axis_rxwrite_data "../tv/cdatafile/c.toe_top.autotvout_m_axis_rxwrite_data.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data "../tv/stream_size/stream_size_out_m_axis_rxwrite_data.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_rxwrite_data "../tv/stream_size/stream_egress_status_m_axis_rxwrite_data.dat"
#define AUTOTB_TVIN_m_axis_txwrite_data "../tv/cdatafile/c.toe_top.autotvin_m_axis_txwrite_data.dat"
#define AUTOTB_TVOUT_m_axis_txwrite_data "../tv/cdatafile/c.toe_top.autotvout_m_axis_txwrite_data.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data "../tv/stream_size/stream_size_out_m_axis_txwrite_data.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_txwrite_data "../tv/stream_size/stream_egress_status_m_axis_txwrite_data.dat"
#define AUTOTB_TVIN_s_axis_session_lup_rsp "../tv/cdatafile/c.toe_top.autotvin_s_axis_session_lup_rsp.dat"
#define AUTOTB_TVOUT_s_axis_session_lup_rsp "../tv/cdatafile/c.toe_top.autotvout_s_axis_session_lup_rsp.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp "../tv/stream_size/stream_size_in_s_axis_session_lup_rsp.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp "../tv/stream_size/stream_ingress_status_s_axis_session_lup_rsp.dat"
#define AUTOTB_TVIN_s_axis_session_upd_rsp "../tv/cdatafile/c.toe_top.autotvin_s_axis_session_upd_rsp.dat"
#define AUTOTB_TVOUT_s_axis_session_upd_rsp "../tv/cdatafile/c.toe_top.autotvout_s_axis_session_upd_rsp.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp "../tv/stream_size/stream_size_in_s_axis_session_upd_rsp.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp "../tv/stream_size/stream_ingress_status_s_axis_session_upd_rsp.dat"
#define AUTOTB_TVIN_m_axis_session_lup_req "../tv/cdatafile/c.toe_top.autotvin_m_axis_session_lup_req.dat"
#define AUTOTB_TVOUT_m_axis_session_lup_req "../tv/cdatafile/c.toe_top.autotvout_m_axis_session_lup_req.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req "../tv/stream_size/stream_size_out_m_axis_session_lup_req.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_session_lup_req "../tv/stream_size/stream_egress_status_m_axis_session_lup_req.dat"
#define AUTOTB_TVIN_m_axis_session_upd_req "../tv/cdatafile/c.toe_top.autotvin_m_axis_session_upd_req.dat"
#define AUTOTB_TVOUT_m_axis_session_upd_req "../tv/cdatafile/c.toe_top.autotvout_m_axis_session_upd_req.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req "../tv/stream_size/stream_size_out_m_axis_session_upd_req.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_session_upd_req "../tv/stream_size/stream_egress_status_m_axis_session_upd_req.dat"
#define AUTOTB_TVIN_s_axis_listen_port_req "../tv/cdatafile/c.toe_top.autotvin_s_axis_listen_port_req.dat"
#define AUTOTB_TVOUT_s_axis_listen_port_req "../tv/cdatafile/c.toe_top.autotvout_s_axis_listen_port_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req "../tv/stream_size/stream_size_in_s_axis_listen_port_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req "../tv/stream_size/stream_ingress_status_s_axis_listen_port_req.dat"
#define AUTOTB_TVIN_s_axis_rx_data_req "../tv/cdatafile/c.toe_top.autotvin_s_axis_rx_data_req.dat"
#define AUTOTB_TVOUT_s_axis_rx_data_req "../tv/cdatafile/c.toe_top.autotvout_s_axis_rx_data_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req "../tv/stream_size/stream_size_in_s_axis_rx_data_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req "../tv/stream_size/stream_ingress_status_s_axis_rx_data_req.dat"
#define AUTOTB_TVIN_s_axis_open_conn_req "../tv/cdatafile/c.toe_top.autotvin_s_axis_open_conn_req.dat"
#define AUTOTB_TVOUT_s_axis_open_conn_req "../tv/cdatafile/c.toe_top.autotvout_s_axis_open_conn_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req "../tv/stream_size/stream_size_in_s_axis_open_conn_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req "../tv/stream_size/stream_ingress_status_s_axis_open_conn_req.dat"
#define AUTOTB_TVIN_s_axis_close_conn_req "../tv/cdatafile/c.toe_top.autotvin_s_axis_close_conn_req.dat"
#define AUTOTB_TVOUT_s_axis_close_conn_req "../tv/cdatafile/c.toe_top.autotvout_s_axis_close_conn_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req "../tv/stream_size/stream_size_in_s_axis_close_conn_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req "../tv/stream_size/stream_ingress_status_s_axis_close_conn_req.dat"
#define AUTOTB_TVIN_s_axis_tx_data_req_metadata "../tv/cdatafile/c.toe_top.autotvin_s_axis_tx_data_req_metadata.dat"
#define AUTOTB_TVOUT_s_axis_tx_data_req_metadata "../tv/cdatafile/c.toe_top.autotvout_s_axis_tx_data_req_metadata.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata "../tv/stream_size/stream_size_in_s_axis_tx_data_req_metadata.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata "../tv/stream_size/stream_ingress_status_s_axis_tx_data_req_metadata.dat"
#define AUTOTB_TVIN_s_axis_tx_data_req "../tv/cdatafile/c.toe_top.autotvin_s_axis_tx_data_req.dat"
#define AUTOTB_TVOUT_s_axis_tx_data_req "../tv/cdatafile/c.toe_top.autotvout_s_axis_tx_data_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req "../tv/stream_size/stream_size_in_s_axis_tx_data_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req "../tv/stream_size/stream_ingress_status_s_axis_tx_data_req.dat"
#define AUTOTB_TVIN_m_axis_listen_port_rsp "../tv/cdatafile/c.toe_top.autotvin_m_axis_listen_port_rsp.dat"
#define AUTOTB_TVOUT_m_axis_listen_port_rsp "../tv/cdatafile/c.toe_top.autotvout_m_axis_listen_port_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp "../tv/stream_size/stream_size_out_m_axis_listen_port_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_listen_port_rsp "../tv/stream_size/stream_egress_status_m_axis_listen_port_rsp.dat"
#define AUTOTB_TVIN_m_axis_notification "../tv/cdatafile/c.toe_top.autotvin_m_axis_notification.dat"
#define AUTOTB_TVOUT_m_axis_notification "../tv/cdatafile/c.toe_top.autotvout_m_axis_notification.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_notification "../tv/stream_size/stream_size_out_m_axis_notification.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_notification "../tv/stream_size/stream_egress_status_m_axis_notification.dat"
#define AUTOTB_TVIN_m_axis_rx_data_rsp_metadata "../tv/cdatafile/c.toe_top.autotvin_m_axis_rx_data_rsp_metadata.dat"
#define AUTOTB_TVOUT_m_axis_rx_data_rsp_metadata "../tv/cdatafile/c.toe_top.autotvout_m_axis_rx_data_rsp_metadata.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata "../tv/stream_size/stream_size_out_m_axis_rx_data_rsp_metadata.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_rx_data_rsp_metadata "../tv/stream_size/stream_egress_status_m_axis_rx_data_rsp_metadata.dat"
#define AUTOTB_TVIN_m_axis_rx_data_rsp "../tv/cdatafile/c.toe_top.autotvin_m_axis_rx_data_rsp.dat"
#define AUTOTB_TVOUT_m_axis_rx_data_rsp "../tv/cdatafile/c.toe_top.autotvout_m_axis_rx_data_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp "../tv/stream_size/stream_size_out_m_axis_rx_data_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_rx_data_rsp "../tv/stream_size/stream_egress_status_m_axis_rx_data_rsp.dat"
#define AUTOTB_TVIN_m_axis_open_conn_rsp "../tv/cdatafile/c.toe_top.autotvin_m_axis_open_conn_rsp.dat"
#define AUTOTB_TVOUT_m_axis_open_conn_rsp "../tv/cdatafile/c.toe_top.autotvout_m_axis_open_conn_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp "../tv/stream_size/stream_size_out_m_axis_open_conn_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_open_conn_rsp "../tv/stream_size/stream_egress_status_m_axis_open_conn_rsp.dat"
#define AUTOTB_TVIN_m_axis_tx_data_rsp "../tv/cdatafile/c.toe_top.autotvin_m_axis_tx_data_rsp.dat"
#define AUTOTB_TVOUT_m_axis_tx_data_rsp "../tv/cdatafile/c.toe_top.autotvout_m_axis_tx_data_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp "../tv/stream_size/stream_size_out_m_axis_tx_data_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_data_rsp "../tv/stream_size/stream_egress_status_m_axis_tx_data_rsp.dat"
#define AUTOTB_TVIN_axis_data_count "../tv/cdatafile/c.toe_top.autotvin_axis_data_count.dat"
#define AUTOTB_TVOUT_axis_data_count "../tv/cdatafile/c.toe_top.autotvout_axis_data_count.dat"
#define AUTOTB_TVIN_axis_max_data_count "../tv/cdatafile/c.toe_top.autotvin_axis_max_data_count.dat"
#define AUTOTB_TVOUT_axis_max_data_count "../tv/cdatafile/c.toe_top.autotvout_axis_max_data_count.dat"
#define AUTOTB_TVIN_myIpAddress "../tv/cdatafile/c.toe_top.autotvin_myIpAddress.dat"
#define AUTOTB_TVOUT_myIpAddress "../tv/cdatafile/c.toe_top.autotvout_myIpAddress.dat"
#define AUTOTB_TVIN_regSessionCount "../tv/cdatafile/c.toe_top.autotvin_regSessionCount.dat"
#define AUTOTB_TVOUT_regSessionCount "../tv/cdatafile/c.toe_top.autotvout_regSessionCount.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_s_axis_tcp_data "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_tcp_data.dat"
#define AUTOTB_TVOUT_PC_s_axis_txwrite_sts "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_txwrite_sts.dat"
#define AUTOTB_TVOUT_PC_s_axis_rxread_data "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_rxread_data.dat"
#define AUTOTB_TVOUT_PC_s_axis_txread_data "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_txread_data.dat"
#define AUTOTB_TVOUT_PC_m_axis_tcp_data "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_tcp_data.dat"
#define AUTOTB_TVOUT_PC_m_axis_txwrite_cmd "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_txwrite_cmd.dat"
#define AUTOTB_TVOUT_PC_m_axis_txread_cmd "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_txread_cmd.dat"
#define AUTOTB_TVOUT_PC_m_axis_rxwrite_data "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_rxwrite_data.dat"
#define AUTOTB_TVOUT_PC_m_axis_txwrite_data "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_txwrite_data.dat"
#define AUTOTB_TVOUT_PC_s_axis_session_lup_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_session_lup_rsp.dat"
#define AUTOTB_TVOUT_PC_s_axis_session_upd_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_session_upd_rsp.dat"
#define AUTOTB_TVOUT_PC_m_axis_session_lup_req "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_session_lup_req.dat"
#define AUTOTB_TVOUT_PC_m_axis_session_upd_req "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_session_upd_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_listen_port_req "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_listen_port_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_rx_data_req "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_rx_data_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_open_conn_req "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_open_conn_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_close_conn_req "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_close_conn_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_tx_data_req_metadata "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_tx_data_req_metadata.dat"
#define AUTOTB_TVOUT_PC_s_axis_tx_data_req "../tv/rtldatafile/rtl.toe_top.autotvout_s_axis_tx_data_req.dat"
#define AUTOTB_TVOUT_PC_m_axis_listen_port_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_listen_port_rsp.dat"
#define AUTOTB_TVOUT_PC_m_axis_notification "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_notification.dat"
#define AUTOTB_TVOUT_PC_m_axis_rx_data_rsp_metadata "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_rx_data_rsp_metadata.dat"
#define AUTOTB_TVOUT_PC_m_axis_rx_data_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_rx_data_rsp.dat"
#define AUTOTB_TVOUT_PC_m_axis_open_conn_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_open_conn_rsp.dat"
#define AUTOTB_TVOUT_PC_m_axis_tx_data_rsp "../tv/rtldatafile/rtl.toe_top.autotvout_m_axis_tx_data_rsp.dat"
#define AUTOTB_TVOUT_PC_axis_data_count "../tv/rtldatafile/rtl.toe_top.autotvout_axis_data_count.dat"
#define AUTOTB_TVOUT_PC_axis_max_data_count "../tv/rtldatafile/rtl.toe_top.autotvout_axis_max_data_count.dat"
#define AUTOTB_TVOUT_PC_myIpAddress "../tv/rtldatafile/rtl.toe_top.autotvout_myIpAddress.dat"
#define AUTOTB_TVOUT_PC_regSessionCount "../tv/rtldatafile/rtl.toe_top.autotvout_regSessionCount.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  s_axis_tcp_data_depth = 0;
  s_axis_txwrite_sts_depth = 0;
  s_axis_rxread_data_depth = 0;
  s_axis_txread_data_depth = 0;
  m_axis_tcp_data_depth = 0;
  m_axis_txwrite_cmd_depth = 0;
  m_axis_txread_cmd_depth = 0;
  m_axis_rxwrite_data_depth = 0;
  m_axis_txwrite_data_depth = 0;
  s_axis_session_lup_rsp_depth = 0;
  s_axis_session_upd_rsp_depth = 0;
  m_axis_session_lup_req_depth = 0;
  m_axis_session_upd_req_depth = 0;
  s_axis_listen_port_req_depth = 0;
  s_axis_rx_data_req_depth = 0;
  s_axis_open_conn_req_depth = 0;
  s_axis_close_conn_req_depth = 0;
  s_axis_tx_data_req_metadata_depth = 0;
  s_axis_tx_data_req_depth = 0;
  m_axis_listen_port_rsp_depth = 0;
  m_axis_notification_depth = 0;
  m_axis_rx_data_rsp_metadata_depth = 0;
  m_axis_rx_data_rsp_depth = 0;
  m_axis_open_conn_rsp_depth = 0;
  m_axis_tx_data_rsp_depth = 0;
  axis_data_count_depth = 0;
  axis_max_data_count_depth = 0;
  myIpAddress_depth = 0;
  regSessionCount_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{s_axis_tcp_data " << s_axis_tcp_data_depth << "}\n";
  total_list << "{s_axis_txwrite_sts " << s_axis_txwrite_sts_depth << "}\n";
  total_list << "{s_axis_rxread_data " << s_axis_rxread_data_depth << "}\n";
  total_list << "{s_axis_txread_data " << s_axis_txread_data_depth << "}\n";
  total_list << "{m_axis_tcp_data " << m_axis_tcp_data_depth << "}\n";
  total_list << "{m_axis_txwrite_cmd " << m_axis_txwrite_cmd_depth << "}\n";
  total_list << "{m_axis_txread_cmd " << m_axis_txread_cmd_depth << "}\n";
  total_list << "{m_axis_rxwrite_data " << m_axis_rxwrite_data_depth << "}\n";
  total_list << "{m_axis_txwrite_data " << m_axis_txwrite_data_depth << "}\n";
  total_list << "{s_axis_session_lup_rsp " << s_axis_session_lup_rsp_depth << "}\n";
  total_list << "{s_axis_session_upd_rsp " << s_axis_session_upd_rsp_depth << "}\n";
  total_list << "{m_axis_session_lup_req " << m_axis_session_lup_req_depth << "}\n";
  total_list << "{m_axis_session_upd_req " << m_axis_session_upd_req_depth << "}\n";
  total_list << "{s_axis_listen_port_req " << s_axis_listen_port_req_depth << "}\n";
  total_list << "{s_axis_rx_data_req " << s_axis_rx_data_req_depth << "}\n";
  total_list << "{s_axis_open_conn_req " << s_axis_open_conn_req_depth << "}\n";
  total_list << "{s_axis_close_conn_req " << s_axis_close_conn_req_depth << "}\n";
  total_list << "{s_axis_tx_data_req_metadata " << s_axis_tx_data_req_metadata_depth << "}\n";
  total_list << "{s_axis_tx_data_req " << s_axis_tx_data_req_depth << "}\n";
  total_list << "{m_axis_listen_port_rsp " << m_axis_listen_port_rsp_depth << "}\n";
  total_list << "{m_axis_notification " << m_axis_notification_depth << "}\n";
  total_list << "{m_axis_rx_data_rsp_metadata " << m_axis_rx_data_rsp_metadata_depth << "}\n";
  total_list << "{m_axis_rx_data_rsp " << m_axis_rx_data_rsp_depth << "}\n";
  total_list << "{m_axis_open_conn_rsp " << m_axis_open_conn_rsp_depth << "}\n";
  total_list << "{m_axis_tx_data_rsp " << m_axis_tx_data_rsp_depth << "}\n";
  total_list << "{axis_data_count " << axis_data_count_depth << "}\n";
  total_list << "{axis_max_data_count " << axis_max_data_count_depth << "}\n";
  total_list << "{myIpAddress " << myIpAddress_depth << "}\n";
  total_list << "{regSessionCount " << regSessionCount_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int s_axis_tcp_data_depth;
    int s_axis_txwrite_sts_depth;
    int s_axis_rxread_data_depth;
    int s_axis_txread_data_depth;
    int m_axis_tcp_data_depth;
    int m_axis_txwrite_cmd_depth;
    int m_axis_txread_cmd_depth;
    int m_axis_rxwrite_data_depth;
    int m_axis_txwrite_data_depth;
    int s_axis_session_lup_rsp_depth;
    int s_axis_session_upd_rsp_depth;
    int m_axis_session_lup_req_depth;
    int m_axis_session_upd_req_depth;
    int s_axis_listen_port_req_depth;
    int s_axis_rx_data_req_depth;
    int s_axis_open_conn_req_depth;
    int s_axis_close_conn_req_depth;
    int s_axis_tx_data_req_metadata_depth;
    int s_axis_tx_data_req_depth;
    int m_axis_listen_port_rsp_depth;
    int m_axis_notification_depth;
    int m_axis_rx_data_rsp_metadata_depth;
    int m_axis_rx_data_rsp_depth;
    int m_axis_open_conn_rsp_depth;
    int m_axis_tx_data_rsp_depth;
    int axis_data_count_depth;
    int axis_max_data_count_depth;
    int myIpAddress_depth;
    int regSessionCount_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s128__ { char data[128]; };
struct __cosim_s5__ { char data[5]; };
struct __cosim_s16__ { char data[16]; };
struct __cosim_s20__ { char data[20]; };
struct __cosim_s12__ { char data[12]; };
struct __cosim_s2__ { char data[2]; };
struct __cosim_s4__ { char data[4]; };
struct __cosim_s8__ { char data[8]; };
struct __cosim_s1__ { char data[1]; };
extern "C" void toe_top_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, __cosim_s2__*, __cosim_s2__*, __cosim_s4__*, volatile void *);

extern "C" void apatb_toe_top_hw(volatile void * __xlx_apatb_param_s_axis_tcp_data, volatile void * __xlx_apatb_param_s_axis_txwrite_sts, volatile void * __xlx_apatb_param_s_axis_rxread_data, volatile void * __xlx_apatb_param_s_axis_txread_data, volatile void * __xlx_apatb_param_m_axis_tcp_data, volatile void * __xlx_apatb_param_m_axis_txwrite_cmd, volatile void * __xlx_apatb_param_m_axis_txread_cmd, volatile void * __xlx_apatb_param_m_axis_rxwrite_data, volatile void * __xlx_apatb_param_m_axis_txwrite_data, volatile void * __xlx_apatb_param_s_axis_session_lup_rsp, volatile void * __xlx_apatb_param_s_axis_session_upd_rsp, volatile void * __xlx_apatb_param_m_axis_session_lup_req, volatile void * __xlx_apatb_param_m_axis_session_upd_req, volatile void * __xlx_apatb_param_s_axis_listen_port_req, volatile void * __xlx_apatb_param_s_axis_rx_data_req, volatile void * __xlx_apatb_param_s_axis_open_conn_req, volatile void * __xlx_apatb_param_s_axis_close_conn_req, volatile void * __xlx_apatb_param_s_axis_tx_data_req_metadata, volatile void * __xlx_apatb_param_s_axis_tx_data_req, volatile void * __xlx_apatb_param_m_axis_listen_port_rsp, volatile void * __xlx_apatb_param_m_axis_notification, volatile void * __xlx_apatb_param_m_axis_rx_data_rsp_metadata, volatile void * __xlx_apatb_param_m_axis_rx_data_rsp, volatile void * __xlx_apatb_param_m_axis_open_conn_rsp, volatile void * __xlx_apatb_param_m_axis_tx_data_rsp, __cosim_s2__* __xlx_apatb_param_axis_data_count, __cosim_s2__* __xlx_apatb_param_axis_max_data_count, __cosim_s4__* __xlx_apatb_param_myIpAddress, volatile void * __xlx_apatb_param_regSessionCount) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
long __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_tcp_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size; ++i)((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->read();
long __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size; ++i)((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->read();
long __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_rxread_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size; ++i)((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->read();
long __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_txread_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_txread_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size; ++i)((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->read();
long __xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_tcp_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<1024> > m_axis_tcp_data_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_tcp_data_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_tcp_data" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s128__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*16+0] = m_axis_tcp_data_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*16+1] = m_axis_tcp_data_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*16+2] = m_axis_tcp_data_pc_buffer[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt)[0*16+3] = m_axis_tcp_data_pc_buffer[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt)[0*16+4] = m_axis_tcp_data_pc_buffer[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt)[0*16+5] = m_axis_tcp_data_pc_buffer[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt)[0*16+6] = m_axis_tcp_data_pc_buffer[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt)[0*16+7] = m_axis_tcp_data_pc_buffer[j].range(511,448).to_int64();
((long long*)&xlx_stream_elt)[0*16+8] = m_axis_tcp_data_pc_buffer[j].range(575,512).to_int64();
((long long*)&xlx_stream_elt)[0*16+9] = m_axis_tcp_data_pc_buffer[j].range(639,576).to_int64();
((long long*)&xlx_stream_elt)[0*16+10] = m_axis_tcp_data_pc_buffer[j].range(703,640).to_int64();
((long long*)&xlx_stream_elt)[0*16+11] = m_axis_tcp_data_pc_buffer[j].range(767,704).to_int64();
((long long*)&xlx_stream_elt)[0*16+12] = m_axis_tcp_data_pc_buffer[j].range(831,768).to_int64();
((long long*)&xlx_stream_elt)[0*16+13] = m_axis_tcp_data_pc_buffer[j].range(895,832).to_int64();
((long long*)&xlx_stream_elt)[0*16+14] = m_axis_tcp_data_pc_buffer[j].range(959,896).to_int64();
((long long*)&xlx_stream_elt)[0*16+15] = m_axis_tcp_data_pc_buffer[j].range(1023,960).to_int64();
((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_txwrite_cmd);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > m_axis_txwrite_cmd_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_txwrite_cmd_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_txwrite_cmd" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s16__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*2+0] = m_axis_txwrite_cmd_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = m_axis_txwrite_cmd_pc_buffer[j].range(127,64).to_int64();
((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_txread_cmd);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > m_axis_txread_cmd_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_txread_cmd_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_txread_cmd" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s16__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*2+0] = m_axis_txread_cmd_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = m_axis_txread_cmd_pc_buffer[j].range(127,64).to_int64();
((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_rxwrite_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<1024> > m_axis_rxwrite_data_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_rxwrite_data_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_rxwrite_data" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s128__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*16+0] = m_axis_rxwrite_data_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*16+1] = m_axis_rxwrite_data_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*16+2] = m_axis_rxwrite_data_pc_buffer[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt)[0*16+3] = m_axis_rxwrite_data_pc_buffer[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt)[0*16+4] = m_axis_rxwrite_data_pc_buffer[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt)[0*16+5] = m_axis_rxwrite_data_pc_buffer[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt)[0*16+6] = m_axis_rxwrite_data_pc_buffer[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt)[0*16+7] = m_axis_rxwrite_data_pc_buffer[j].range(511,448).to_int64();
((long long*)&xlx_stream_elt)[0*16+8] = m_axis_rxwrite_data_pc_buffer[j].range(575,512).to_int64();
((long long*)&xlx_stream_elt)[0*16+9] = m_axis_rxwrite_data_pc_buffer[j].range(639,576).to_int64();
((long long*)&xlx_stream_elt)[0*16+10] = m_axis_rxwrite_data_pc_buffer[j].range(703,640).to_int64();
((long long*)&xlx_stream_elt)[0*16+11] = m_axis_rxwrite_data_pc_buffer[j].range(767,704).to_int64();
((long long*)&xlx_stream_elt)[0*16+12] = m_axis_rxwrite_data_pc_buffer[j].range(831,768).to_int64();
((long long*)&xlx_stream_elt)[0*16+13] = m_axis_rxwrite_data_pc_buffer[j].range(895,832).to_int64();
((long long*)&xlx_stream_elt)[0*16+14] = m_axis_rxwrite_data_pc_buffer[j].range(959,896).to_int64();
((long long*)&xlx_stream_elt)[0*16+15] = m_axis_rxwrite_data_pc_buffer[j].range(1023,960).to_int64();
((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_txwrite_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<1024> > m_axis_txwrite_data_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_txwrite_data_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_txwrite_data" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s128__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*16+0] = m_axis_txwrite_data_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*16+1] = m_axis_txwrite_data_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*16+2] = m_axis_txwrite_data_pc_buffer[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt)[0*16+3] = m_axis_txwrite_data_pc_buffer[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt)[0*16+4] = m_axis_txwrite_data_pc_buffer[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt)[0*16+5] = m_axis_txwrite_data_pc_buffer[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt)[0*16+6] = m_axis_txwrite_data_pc_buffer[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt)[0*16+7] = m_axis_txwrite_data_pc_buffer[j].range(511,448).to_int64();
((long long*)&xlx_stream_elt)[0*16+8] = m_axis_txwrite_data_pc_buffer[j].range(575,512).to_int64();
((long long*)&xlx_stream_elt)[0*16+9] = m_axis_txwrite_data_pc_buffer[j].range(639,576).to_int64();
((long long*)&xlx_stream_elt)[0*16+10] = m_axis_txwrite_data_pc_buffer[j].range(703,640).to_int64();
((long long*)&xlx_stream_elt)[0*16+11] = m_axis_txwrite_data_pc_buffer[j].range(767,704).to_int64();
((long long*)&xlx_stream_elt)[0*16+12] = m_axis_txwrite_data_pc_buffer[j].range(831,768).to_int64();
((long long*)&xlx_stream_elt)[0*16+13] = m_axis_txwrite_data_pc_buffer[j].range(895,832).to_int64();
((long long*)&xlx_stream_elt)[0*16+14] = m_axis_txwrite_data_pc_buffer[j].range(959,896).to_int64();
((long long*)&xlx_stream_elt)[0*16+15] = m_axis_txwrite_data_pc_buffer[j].range(1023,960).to_int64();
((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size; ++i)((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->read();
long __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size; ++i)((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->read();
long __xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_session_lup_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<96> > m_axis_session_lup_req_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_session_lup_req_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_session_lup_req" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s12__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*1+0] = m_axis_session_lup_req_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*1+1] = m_axis_session_lup_req_pc_buffer[j].range(95,64).to_int64();
((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_session_upd_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<160> > m_axis_session_upd_req_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_session_upd_req_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_session_upd_req" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s20__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*2+0] = m_axis_session_upd_req_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = m_axis_session_upd_req_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*2+2] = m_axis_session_upd_req_pc_buffer[j].range(159,128).to_int64();
((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->read();
long __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->read();
long __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->read();
long __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->read();
long __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size; ++i)((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->read();
long __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->read();
long __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_listen_port_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > m_axis_listen_port_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_listen_port_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_listen_port_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s1__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*1+0] = m_axis_listen_port_rsp_pc_buffer[j].range(7, 0).to_int64();
((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_notification_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_notification);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_notification_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_notification);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<96> > m_axis_notification_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_notification_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_notification" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s12__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*1+0] = m_axis_notification_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*1+1] = m_axis_notification_pc_buffer[j].range(95,64).to_int64();
((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_rx_data_rsp_metadata);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<16> > m_axis_rx_data_rsp_metadata_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_rx_data_rsp_metadata_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_rx_data_rsp_metadata" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s2__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*2+0] = m_axis_rx_data_rsp_metadata_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*2+1] = m_axis_rx_data_rsp_metadata_pc_buffer[j].range(15, 8).to_int64();
((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_rx_data_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<1024> > m_axis_rx_data_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_rx_data_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_rx_data_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s128__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*16+0] = m_axis_rx_data_rsp_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*16+1] = m_axis_rx_data_rsp_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*16+2] = m_axis_rx_data_rsp_pc_buffer[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt)[0*16+3] = m_axis_rx_data_rsp_pc_buffer[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt)[0*16+4] = m_axis_rx_data_rsp_pc_buffer[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt)[0*16+5] = m_axis_rx_data_rsp_pc_buffer[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt)[0*16+6] = m_axis_rx_data_rsp_pc_buffer[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt)[0*16+7] = m_axis_rx_data_rsp_pc_buffer[j].range(511,448).to_int64();
((long long*)&xlx_stream_elt)[0*16+8] = m_axis_rx_data_rsp_pc_buffer[j].range(575,512).to_int64();
((long long*)&xlx_stream_elt)[0*16+9] = m_axis_rx_data_rsp_pc_buffer[j].range(639,576).to_int64();
((long long*)&xlx_stream_elt)[0*16+10] = m_axis_rx_data_rsp_pc_buffer[j].range(703,640).to_int64();
((long long*)&xlx_stream_elt)[0*16+11] = m_axis_rx_data_rsp_pc_buffer[j].range(767,704).to_int64();
((long long*)&xlx_stream_elt)[0*16+12] = m_axis_rx_data_rsp_pc_buffer[j].range(831,768).to_int64();
((long long*)&xlx_stream_elt)[0*16+13] = m_axis_rx_data_rsp_pc_buffer[j].range(895,832).to_int64();
((long long*)&xlx_stream_elt)[0*16+14] = m_axis_rx_data_rsp_pc_buffer[j].range(959,896).to_int64();
((long long*)&xlx_stream_elt)[0*16+15] = m_axis_rx_data_rsp_pc_buffer[j].range(1023,960).to_int64();
((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_open_conn_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > m_axis_open_conn_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_open_conn_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_open_conn_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s4__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*4+0] = m_axis_open_conn_rsp_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = m_axis_open_conn_rsp_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = m_axis_open_conn_rsp_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = m_axis_open_conn_rsp_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_tx_data_rsp);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<96> > m_axis_tx_data_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_tx_data_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_tx_data_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s12__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*1+0] = m_axis_tx_data_rsp_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*1+1] = m_axis_tx_data_rsp_pc_buffer[j].range(95,64).to_int64();
((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_regSessionCount);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<16> > regSessionCount_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              regSessionCount_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "regSessionCount" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_regSessionCount)[0*2+0] = regSessionCount_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_regSessionCount)[0*2+1] = regSessionCount_pc_buffer[0].range(15, 8).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_tcp_data);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_rxread_data);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_txread_data);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_tcp_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_txwrite_cmd);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_txread_cmd);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_rxwrite_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_txwrite_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_session_lup_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_session_upd_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_listen_port_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_notification);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_notification);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_rx_data_rsp_metadata);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_rx_data_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_open_conn_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_data_rsp);
CodeState = DUMP_INPUTS;
std::vector<__cosim_s128__> __xlx_apatb_param_s_axis_tcp_data_stream_buf;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->empty())
    __xlx_apatb_param_s_axis_tcp_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_tcp_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->write(__xlx_apatb_param_s_axis_tcp_data_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_tcp_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->size();
std::vector<__cosim_s5__> __xlx_apatb_param_s_axis_txwrite_sts_stream_buf;
{
  while (!((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->empty())
    __xlx_apatb_param_s_axis_txwrite_sts_stream_buf.push_back(((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_txwrite_sts_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->write(__xlx_apatb_param_s_axis_txwrite_sts_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_size = ((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_s_axis_rxread_data_stream_buf;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->empty())
    __xlx_apatb_param_s_axis_rxread_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_rxread_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->write(__xlx_apatb_param_s_axis_rxread_data_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_rxread_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_s_axis_txread_data_stream_buf;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->empty())
    __xlx_apatb_param_s_axis_txread_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_txread_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->write(__xlx_apatb_param_s_axis_txread_data_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_txread_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_m_axis_tcp_data_stream_buf;
long __xlx_apatb_param_m_axis_tcp_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->size();
std::vector<__cosim_s16__> __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf;
long __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->size();
std::vector<__cosim_s16__> __xlx_apatb_param_m_axis_txread_cmd_stream_buf;
long __xlx_apatb_param_m_axis_txread_cmd_stream_buf_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_m_axis_rxwrite_data_stream_buf;
long __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_m_axis_txwrite_data_stream_buf;
long __xlx_apatb_param_m_axis_txwrite_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->size();
std::vector<__cosim_s16__> __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf;
{
  while (!((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->empty())
    __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf.push_back(((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->write(__xlx_apatb_param_s_axis_session_lup_rsp_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->size();
std::vector<__cosim_s20__> __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf;
{
  while (!((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->empty())
    __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf.push_back(((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->write(__xlx_apatb_param_s_axis_session_upd_rsp_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_size = ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->size();
std::vector<__cosim_s12__> __xlx_apatb_param_m_axis_session_lup_req_stream_buf;
long __xlx_apatb_param_m_axis_session_lup_req_stream_buf_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->size();
std::vector<__cosim_s20__> __xlx_apatb_param_m_axis_session_upd_req_stream_buf;
long __xlx_apatb_param_m_axis_session_upd_req_stream_buf_size = ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->size();
std::vector<__cosim_s2__> __xlx_apatb_param_s_axis_listen_port_req_stream_buf;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->empty())
    __xlx_apatb_param_s_axis_listen_port_req_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_listen_port_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->write(__xlx_apatb_param_s_axis_listen_port_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_listen_port_req_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_s_axis_rx_data_req_stream_buf;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->empty())
    __xlx_apatb_param_s_axis_rx_data_req_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_rx_data_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->write(__xlx_apatb_param_s_axis_rx_data_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_rx_data_req_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->size();
std::vector<__cosim_s8__> __xlx_apatb_param_s_axis_open_conn_req_stream_buf;
{
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->empty())
    __xlx_apatb_param_s_axis_open_conn_req_stream_buf.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_open_conn_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->write(__xlx_apatb_param_s_axis_open_conn_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_open_conn_req_stream_buf_size = ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->size();
std::vector<__cosim_s2__> __xlx_apatb_param_s_axis_close_conn_req_stream_buf;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->empty())
    __xlx_apatb_param_s_axis_close_conn_req_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_close_conn_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->write(__xlx_apatb_param_s_axis_close_conn_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_close_conn_req_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->empty())
    __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->write(__xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_s_axis_tx_data_req_stream_buf;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->empty())
    __xlx_apatb_param_s_axis_tx_data_req_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->write(__xlx_apatb_param_s_axis_tx_data_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_tx_data_req_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->size();
std::vector<__cosim_s1__> __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf;
long __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_size = ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->size();
std::vector<__cosim_s12__> __xlx_apatb_param_m_axis_notification_stream_buf;
long __xlx_apatb_param_m_axis_notification_stream_buf_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->size();
std::vector<__cosim_s2__> __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf;
long __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf;
long __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf;
long __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->size();
std::vector<__cosim_s12__> __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf;
long __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->size();
// print axis_data_count Transactions
{
aesl_fh.write(AUTOTB_TVIN_axis_data_count, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_axis_data_count;
aesl_fh.write(AUTOTB_TVIN_axis_data_count, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.axis_data_count_depth);
aesl_fh.write(AUTOTB_TVIN_axis_data_count, end_str());
}

// print axis_max_data_count Transactions
{
aesl_fh.write(AUTOTB_TVIN_axis_max_data_count, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_axis_max_data_count;
aesl_fh.write(AUTOTB_TVIN_axis_max_data_count, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.axis_max_data_count_depth);
aesl_fh.write(AUTOTB_TVIN_axis_max_data_count, end_str());
}

// print myIpAddress Transactions
{
aesl_fh.write(AUTOTB_TVIN_myIpAddress, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_myIpAddress;
aesl_fh.write(AUTOTB_TVIN_myIpAddress, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.myIpAddress_depth);
aesl_fh.write(AUTOTB_TVIN_myIpAddress, end_str());
}

// print regSessionCount Transactions
{
aesl_fh.write(AUTOTB_TVIN_regSessionCount, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regSessionCount;
aesl_fh.write(AUTOTB_TVIN_regSessionCount, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.regSessionCount_depth);
aesl_fh.write(AUTOTB_TVIN_regSessionCount, end_str());
}

CodeState = CALL_C_DUT;
toe_top_hw_stub_wrapper(__xlx_apatb_param_s_axis_tcp_data, __xlx_apatb_param_s_axis_txwrite_sts, __xlx_apatb_param_s_axis_rxread_data, __xlx_apatb_param_s_axis_txread_data, __xlx_apatb_param_m_axis_tcp_data, __xlx_apatb_param_m_axis_txwrite_cmd, __xlx_apatb_param_m_axis_txread_cmd, __xlx_apatb_param_m_axis_rxwrite_data, __xlx_apatb_param_m_axis_txwrite_data, __xlx_apatb_param_s_axis_session_lup_rsp, __xlx_apatb_param_s_axis_session_upd_rsp, __xlx_apatb_param_m_axis_session_lup_req, __xlx_apatb_param_m_axis_session_upd_req, __xlx_apatb_param_s_axis_listen_port_req, __xlx_apatb_param_s_axis_rx_data_req, __xlx_apatb_param_s_axis_open_conn_req, __xlx_apatb_param_s_axis_close_conn_req, __xlx_apatb_param_s_axis_tx_data_req_metadata, __xlx_apatb_param_s_axis_tx_data_req, __xlx_apatb_param_m_axis_listen_port_rsp, __xlx_apatb_param_m_axis_notification, __xlx_apatb_param_m_axis_rx_data_rsp_metadata, __xlx_apatb_param_m_axis_rx_data_rsp, __xlx_apatb_param_m_axis_open_conn_rsp, __xlx_apatb_param_m_axis_tx_data_rsp, __xlx_apatb_param_axis_data_count, __xlx_apatb_param_axis_max_data_count, __xlx_apatb_param_myIpAddress, __xlx_apatb_param_regSessionCount);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size = __xlx_apatb_param_s_axis_tcp_data_stream_buf_size - ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data)->size();
// print s_axis_tcp_data Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_tcp_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_tcp_data_stream_buf.data()+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVIN_s_axis_tcp_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size, &tcl_file.s_axis_tcp_data_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_tcp_data, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size > 0) {
  long s_axis_tcp_data_stream_ingress_size = __xlx_apatb_param_s_axis_tcp_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tcp_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size; j != e; j++) {
    s_axis_tcp_data_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tcp_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_tcp_data_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tcp_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tcp_data, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tcp_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_tcp_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tcp_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tcp_data, end_str());
}
long __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size = __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_size - ((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts)->size();
// print s_axis_txwrite_sts Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_txwrite_sts, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_txwrite_sts_stream_buf.data()+i);
std::string s(formatData(pos, 40));
aesl_fh.write(AUTOTB_TVIN_s_axis_txwrite_sts, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size, &tcl_file.s_axis_txwrite_sts_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_txwrite_sts, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size > 0) {
  long s_axis_txwrite_sts_stream_ingress_size = __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txwrite_sts_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size; j != e; j++) {
    s_axis_txwrite_sts_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txwrite_sts_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_txwrite_sts_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txwrite_sts_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txwrite_sts, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_txwrite_sts_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txwrite_sts, end_str());
}
long __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size = __xlx_apatb_param_s_axis_rxread_data_stream_buf_size - ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data)->size();
// print s_axis_rxread_data Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_rxread_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_rxread_data_stream_buf.data()+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVIN_s_axis_rxread_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size, &tcl_file.s_axis_rxread_data_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_rxread_data, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size > 0) {
  long s_axis_rxread_data_stream_ingress_size = __xlx_apatb_param_s_axis_rxread_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rxread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size; j != e; j++) {
    s_axis_rxread_data_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rxread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_rxread_data_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rxread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rxread_data, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rxread_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_rxread_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rxread_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rxread_data, end_str());
}
long __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size = __xlx_apatb_param_s_axis_txread_data_stream_buf_size - ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data)->size();
// print s_axis_txread_data Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_txread_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_txread_data_stream_buf.data()+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVIN_s_axis_txread_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_txread_data_stream_buf_final_size, &tcl_file.s_axis_txread_data_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_txread_data, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_txread_data_stream_buf_final_size > 0) {
  long s_axis_txread_data_stream_ingress_size = __xlx_apatb_param_s_axis_txread_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size; j != e; j++) {
    s_axis_txread_data_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_txread_data_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_txread_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_txread_data, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txread_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_txread_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txread_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_txread_data, end_str());
}
long __xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->size() - __xlx_apatb_param_m_axis_tcp_data_stream_buf_size;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->empty())
    __xlx_apatb_param_m_axis_tcp_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_tcp_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data)->write(__xlx_apatb_param_m_axis_tcp_data_stream_buf[i]);
  }
// print m_axis_tcp_data Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_tcp_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_tcp_data_stream_buf.data()+__xlx_apatb_param_m_axis_tcp_data_stream_buf_size+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVOUT_m_axis_tcp_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size, &tcl_file.m_axis_tcp_data_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_tcp_data, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_tcp_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tcp_data, end_str());
}
long __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->size() - __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_size;
{
  while (!((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->empty())
    __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf.push_back(((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd)->write(__xlx_apatb_param_m_axis_txwrite_cmd_stream_buf[i]);
  }
// print m_axis_txwrite_cmd Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_cmd, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_txwrite_cmd_stream_buf.data()+__xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_size+i);
std::string s(formatData(pos, 128));
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_cmd, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size, &tcl_file.m_axis_txwrite_cmd_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_cmd, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_txwrite_cmd_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_cmd, end_str());
}
long __xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->size() - __xlx_apatb_param_m_axis_txread_cmd_stream_buf_size;
{
  while (!((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->empty())
    __xlx_apatb_param_m_axis_txread_cmd_stream_buf.push_back(((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_txread_cmd_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd)->write(__xlx_apatb_param_m_axis_txread_cmd_stream_buf[i]);
  }
// print m_axis_txread_cmd Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_txread_cmd, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_txread_cmd_stream_buf.data()+__xlx_apatb_param_m_axis_txread_cmd_stream_buf_size+i);
std::string s(formatData(pos, 128));
aesl_fh.write(AUTOTB_TVOUT_m_axis_txread_cmd, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size, &tcl_file.m_axis_txread_cmd_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_txread_cmd, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_txread_cmd_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txread_cmd, end_str());
}
long __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->size() - __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_size;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->empty())
    __xlx_apatb_param_m_axis_rxwrite_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_rxwrite_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data)->write(__xlx_apatb_param_m_axis_rxwrite_data_stream_buf[i]);
  }
// print m_axis_rxwrite_data Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_rxwrite_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_rxwrite_data_stream_buf.data()+__xlx_apatb_param_m_axis_rxwrite_data_stream_buf_size+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVOUT_m_axis_rxwrite_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size, &tcl_file.m_axis_rxwrite_data_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_rxwrite_data, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_rxwrite_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rxwrite_data, end_str());
}
long __xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->size() - __xlx_apatb_param_m_axis_txwrite_data_stream_buf_size;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->empty())
    __xlx_apatb_param_m_axis_txwrite_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_txwrite_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data)->write(__xlx_apatb_param_m_axis_txwrite_data_stream_buf[i]);
  }
// print m_axis_txwrite_data Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_txwrite_data_stream_buf.data()+__xlx_apatb_param_m_axis_txwrite_data_stream_buf_size+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size, &tcl_file.m_axis_txwrite_data_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_txwrite_data, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_txwrite_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_txwrite_data, end_str());
}
long __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size = __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_size - ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp)->size();
// print s_axis_session_lup_rsp Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_session_lup_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_session_lup_rsp_stream_buf.data()+i);
std::string s(formatData(pos, 128));
aesl_fh.write(AUTOTB_TVIN_s_axis_session_lup_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size, &tcl_file.s_axis_session_lup_rsp_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_session_lup_rsp, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size > 0) {
  long s_axis_session_lup_rsp_stream_ingress_size = __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_lup_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size; j != e; j++) {
    s_axis_session_lup_rsp_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_lup_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_session_lup_rsp_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_lup_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_lup_rsp, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_session_lup_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_lup_rsp, end_str());
}
long __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size = __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_size - ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp)->size();
// print s_axis_session_upd_rsp Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_session_upd_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_session_upd_rsp_stream_buf.data()+i);
std::string s(formatData(pos, 160));
aesl_fh.write(AUTOTB_TVIN_s_axis_session_upd_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size, &tcl_file.s_axis_session_upd_rsp_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_session_upd_rsp, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size > 0) {
  long s_axis_session_upd_rsp_stream_ingress_size = __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_upd_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size; j != e; j++) {
    s_axis_session_upd_rsp_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_upd_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_session_upd_rsp_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_session_upd_rsp_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_session_upd_rsp, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_session_upd_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_session_upd_rsp, end_str());
}
long __xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->size() - __xlx_apatb_param_m_axis_session_lup_req_stream_buf_size;
{
  while (!((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->empty())
    __xlx_apatb_param_m_axis_session_lup_req_stream_buf.push_back(((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_session_lup_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req)->write(__xlx_apatb_param_m_axis_session_lup_req_stream_buf[i]);
  }
// print m_axis_session_lup_req Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_lup_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_session_lup_req_stream_buf.data()+__xlx_apatb_param_m_axis_session_lup_req_stream_buf_size+i);
std::string s(formatData(pos, 96));
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_lup_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size, &tcl_file.m_axis_session_lup_req_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_lup_req, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_session_lup_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_lup_req, end_str());
}
long __xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size = ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->size() - __xlx_apatb_param_m_axis_session_upd_req_stream_buf_size;
{
  while (!((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->empty())
    __xlx_apatb_param_m_axis_session_upd_req_stream_buf.push_back(((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_session_upd_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req)->write(__xlx_apatb_param_m_axis_session_upd_req_stream_buf[i]);
  }
// print m_axis_session_upd_req Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_upd_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_session_upd_req_stream_buf.data()+__xlx_apatb_param_m_axis_session_upd_req_stream_buf_size+i);
std::string s(formatData(pos, 160));
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_upd_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size, &tcl_file.m_axis_session_upd_req_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_session_upd_req, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_session_upd_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_session_upd_req, end_str());
}
long __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size = __xlx_apatb_param_s_axis_listen_port_req_stream_buf_size - ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req)->size();
// print s_axis_listen_port_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_listen_port_req_stream_buf.data()+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size, &tcl_file.s_axis_listen_port_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size > 0) {
  long s_axis_listen_port_req_stream_ingress_size = __xlx_apatb_param_s_axis_listen_port_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size; j != e; j++) {
    s_axis_listen_port_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_listen_port_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_listen_port_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_req, end_str());
}
long __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size = __xlx_apatb_param_s_axis_rx_data_req_stream_buf_size - ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req)->size();
// print s_axis_rx_data_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_rx_data_req_stream_buf.data()+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size, &tcl_file.s_axis_rx_data_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size > 0) {
  long s_axis_rx_data_req_stream_ingress_size = __xlx_apatb_param_s_axis_rx_data_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size; j != e; j++) {
    s_axis_rx_data_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_rx_data_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_rx_data_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data_req, end_str());
}
long __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size = __xlx_apatb_param_s_axis_open_conn_req_stream_buf_size - ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req)->size();
// print s_axis_open_conn_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_open_conn_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_open_conn_req_stream_buf.data()+i);
std::string s(formatData(pos, 64));
aesl_fh.write(AUTOTB_TVIN_s_axis_open_conn_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size, &tcl_file.s_axis_open_conn_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_open_conn_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size > 0) {
  long s_axis_open_conn_req_stream_ingress_size = __xlx_apatb_param_s_axis_open_conn_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size; j != e; j++) {
    s_axis_open_conn_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_open_conn_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_conn_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_open_conn_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_conn_req, end_str());
}
long __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size = __xlx_apatb_param_s_axis_close_conn_req_stream_buf_size - ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req)->size();
// print s_axis_close_conn_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_close_conn_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_close_conn_req_stream_buf.data()+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVIN_s_axis_close_conn_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size, &tcl_file.s_axis_close_conn_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_close_conn_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size > 0) {
  long s_axis_close_conn_req_stream_ingress_size = __xlx_apatb_param_s_axis_close_conn_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_close_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size; j != e; j++) {
    s_axis_close_conn_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_close_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_close_conn_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_close_conn_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_close_conn_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_close_conn_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_close_conn_req, end_str());
}
long __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size = __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_size - ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata)->size();
// print s_axis_tx_data_req_metadata Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req_metadata, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf.data()+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req_metadata, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size, &tcl_file.s_axis_tx_data_req_metadata_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req_metadata, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size > 0) {
  long s_axis_tx_data_req_metadata_stream_ingress_size = __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size; j != e; j++) {
    s_axis_tx_data_req_metadata_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_tx_data_req_metadata_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req_metadata, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_tx_data_req_metadata_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req_metadata, end_str());
}
long __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size = __xlx_apatb_param_s_axis_tx_data_req_stream_buf_size - ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req)->size();
// print s_axis_tx_data_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_tx_data_req_stream_buf.data()+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size, &tcl_file.s_axis_tx_data_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_data_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size > 0) {
  long s_axis_tx_data_req_stream_ingress_size = __xlx_apatb_param_s_axis_tx_data_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size; j != e; j++) {
    s_axis_tx_data_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_tx_data_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_data_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_data_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_tx_data_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_data_req, end_str());
}
long __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size = ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->size() - __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->empty())
    __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf.push_back(((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp)->write(__xlx_apatb_param_m_axis_listen_port_rsp_stream_buf[i]);
  }
// print m_axis_listen_port_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_listen_port_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_size+i);
std::string s(formatData(pos, 8));
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size, &tcl_file.m_axis_listen_port_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_listen_port_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port_rsp, end_str());
}
long __xlx_apatb_param_m_axis_notification_stream_buf_final_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->size() - __xlx_apatb_param_m_axis_notification_stream_buf_size;
{
  while (!((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->empty())
    __xlx_apatb_param_m_axis_notification_stream_buf.push_back(((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_notification_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification)->write(__xlx_apatb_param_m_axis_notification_stream_buf[i]);
  }
// print m_axis_notification Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_notification, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_notification_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_notification_stream_buf.data()+__xlx_apatb_param_m_axis_notification_stream_buf_size+i);
std::string s(formatData(pos, 96));
aesl_fh.write(AUTOTB_TVOUT_m_axis_notification, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_notification_stream_buf_final_size, &tcl_file.m_axis_notification_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_notification, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_notification, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_notification_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_notification, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_notification, end_str());
}
long __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->size() - __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_size;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->empty())
    __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata)->write(__xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf[i]);
  }
// print m_axis_rx_data_rsp_metadata Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp_metadata, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf.data()+__xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_size+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp_metadata, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size, &tcl_file.m_axis_rx_data_rsp_metadata_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp_metadata, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_rx_data_rsp_metadata_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp_metadata, end_str());
}
long __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->size() - __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->empty())
    __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp)->write(__xlx_apatb_param_m_axis_rx_data_rsp_stream_buf[i]);
  }
// print m_axis_rx_data_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_rx_data_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_size+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size, &tcl_file.m_axis_rx_data_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_rx_data_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_rx_data_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_rx_data_rsp, end_str());
}
long __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->size() - __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->empty())
    __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp)->write(__xlx_apatb_param_m_axis_open_conn_rsp_stream_buf[i]);
  }
// print m_axis_open_conn_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_conn_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_open_conn_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_size+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_conn_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size, &tcl_file.m_axis_open_conn_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_conn_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_open_conn_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_conn_rsp, end_str());
}
long __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->size() - __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->empty())
    __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf.push_back(((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp)->write(__xlx_apatb_param_m_axis_tx_data_rsp_stream_buf[i]);
  }
// print m_axis_tx_data_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_tx_data_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_size+i);
std::string s(formatData(pos, 96));
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size, &tcl_file.m_axis_tx_data_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_tx_data_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data_rsp, end_str());
}
// print regSessionCount Transactions
{
aesl_fh.write(AUTOTB_TVOUT_regSessionCount, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regSessionCount;
aesl_fh.write(AUTOTB_TVOUT_regSessionCount, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.regSessionCount_depth);
aesl_fh.write(AUTOTB_TVOUT_regSessionCount, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
