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
#define AUTOTB_TVIN_m_axis_listen_port "../tv/cdatafile/c.iperf_client.autotvin_m_axis_listen_port.dat"
#define AUTOTB_TVOUT_m_axis_listen_port "../tv/cdatafile/c.iperf_client.autotvout_m_axis_listen_port.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_listen_port "../tv/stream_size/stream_size_out_m_axis_listen_port.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_listen_port "../tv/stream_size/stream_egress_status_m_axis_listen_port.dat"
#define AUTOTB_TVIN_s_axis_listen_port_status "../tv/cdatafile/c.iperf_client.autotvin_s_axis_listen_port_status.dat"
#define AUTOTB_TVOUT_s_axis_listen_port_status "../tv/cdatafile/c.iperf_client.autotvout_s_axis_listen_port_status.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status "../tv/stream_size/stream_size_in_s_axis_listen_port_status.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status "../tv/stream_size/stream_ingress_status_s_axis_listen_port_status.dat"
#define AUTOTB_TVIN_s_axis_notifications "../tv/cdatafile/c.iperf_client.autotvin_s_axis_notifications.dat"
#define AUTOTB_TVOUT_s_axis_notifications "../tv/cdatafile/c.iperf_client.autotvout_s_axis_notifications.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_notifications "../tv/stream_size/stream_size_in_s_axis_notifications.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications "../tv/stream_size/stream_ingress_status_s_axis_notifications.dat"
#define AUTOTB_TVIN_m_axis_read_package "../tv/cdatafile/c.iperf_client.autotvin_m_axis_read_package.dat"
#define AUTOTB_TVOUT_m_axis_read_package "../tv/cdatafile/c.iperf_client.autotvout_m_axis_read_package.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_read_package "../tv/stream_size/stream_size_out_m_axis_read_package.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_read_package "../tv/stream_size/stream_egress_status_m_axis_read_package.dat"
#define AUTOTB_TVIN_s_axis_rx_metadata "../tv/cdatafile/c.iperf_client.autotvin_s_axis_rx_metadata.dat"
#define AUTOTB_TVOUT_s_axis_rx_metadata "../tv/cdatafile/c.iperf_client.autotvout_s_axis_rx_metadata.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata "../tv/stream_size/stream_size_in_s_axis_rx_metadata.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata "../tv/stream_size/stream_ingress_status_s_axis_rx_metadata.dat"
#define AUTOTB_TVIN_s_axis_rx_data "../tv/cdatafile/c.iperf_client.autotvin_s_axis_rx_data.dat"
#define AUTOTB_TVOUT_s_axis_rx_data "../tv/cdatafile/c.iperf_client.autotvout_s_axis_rx_data.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_rx_data "../tv/stream_size/stream_size_in_s_axis_rx_data.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data "../tv/stream_size/stream_ingress_status_s_axis_rx_data.dat"
#define AUTOTB_TVIN_m_axis_open_connection "../tv/cdatafile/c.iperf_client.autotvin_m_axis_open_connection.dat"
#define AUTOTB_TVOUT_m_axis_open_connection "../tv/cdatafile/c.iperf_client.autotvout_m_axis_open_connection.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_open_connection "../tv/stream_size/stream_size_out_m_axis_open_connection.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_open_connection "../tv/stream_size/stream_egress_status_m_axis_open_connection.dat"
#define AUTOTB_TVIN_s_axis_open_status "../tv/cdatafile/c.iperf_client.autotvin_s_axis_open_status.dat"
#define AUTOTB_TVOUT_s_axis_open_status "../tv/cdatafile/c.iperf_client.autotvout_s_axis_open_status.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_open_status "../tv/stream_size/stream_size_in_s_axis_open_status.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status "../tv/stream_size/stream_ingress_status_s_axis_open_status.dat"
#define AUTOTB_TVIN_m_axis_close_connection "../tv/cdatafile/c.iperf_client.autotvin_m_axis_close_connection.dat"
#define AUTOTB_TVOUT_m_axis_close_connection "../tv/cdatafile/c.iperf_client.autotvout_m_axis_close_connection.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_close_connection "../tv/stream_size/stream_size_out_m_axis_close_connection.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_close_connection "../tv/stream_size/stream_egress_status_m_axis_close_connection.dat"
#define AUTOTB_TVIN_m_axis_tx_metadata "../tv/cdatafile/c.iperf_client.autotvin_m_axis_tx_metadata.dat"
#define AUTOTB_TVOUT_m_axis_tx_metadata "../tv/cdatafile/c.iperf_client.autotvout_m_axis_tx_metadata.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata "../tv/stream_size/stream_size_out_m_axis_tx_metadata.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_metadata "../tv/stream_size/stream_egress_status_m_axis_tx_metadata.dat"
#define AUTOTB_TVIN_m_axis_tx_data "../tv/cdatafile/c.iperf_client.autotvin_m_axis_tx_data.dat"
#define AUTOTB_TVOUT_m_axis_tx_data "../tv/cdatafile/c.iperf_client.autotvout_m_axis_tx_data.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_tx_data "../tv/stream_size/stream_size_out_m_axis_tx_data.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_data "../tv/stream_size/stream_egress_status_m_axis_tx_data.dat"
#define AUTOTB_TVIN_s_axis_tx_status "../tv/cdatafile/c.iperf_client.autotvin_s_axis_tx_status.dat"
#define AUTOTB_TVOUT_s_axis_tx_status "../tv/cdatafile/c.iperf_client.autotvout_s_axis_tx_status.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_tx_status "../tv/stream_size/stream_size_in_s_axis_tx_status.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status "../tv/stream_size/stream_ingress_status_s_axis_tx_status.dat"
#define AUTOTB_TVIN_runExperiment "../tv/cdatafile/c.iperf_client.autotvin_runExperiment.dat"
#define AUTOTB_TVOUT_runExperiment "../tv/cdatafile/c.iperf_client.autotvout_runExperiment.dat"
#define AUTOTB_TVIN_dualModeEn "../tv/cdatafile/c.iperf_client.autotvin_dualModeEn.dat"
#define AUTOTB_TVOUT_dualModeEn "../tv/cdatafile/c.iperf_client.autotvout_dualModeEn.dat"
#define AUTOTB_TVIN_useConn "../tv/cdatafile/c.iperf_client.autotvin_useConn.dat"
#define AUTOTB_TVOUT_useConn "../tv/cdatafile/c.iperf_client.autotvout_useConn.dat"
#define AUTOTB_TVIN_pkgWordCount "../tv/cdatafile/c.iperf_client.autotvin_pkgWordCount.dat"
#define AUTOTB_TVOUT_pkgWordCount "../tv/cdatafile/c.iperf_client.autotvout_pkgWordCount.dat"
#define AUTOTB_TVIN_packetGap "../tv/cdatafile/c.iperf_client.autotvin_packetGap.dat"
#define AUTOTB_TVOUT_packetGap "../tv/cdatafile/c.iperf_client.autotvout_packetGap.dat"
#define AUTOTB_TVIN_timeInSeconds "../tv/cdatafile/c.iperf_client.autotvin_timeInSeconds.dat"
#define AUTOTB_TVOUT_timeInSeconds "../tv/cdatafile/c.iperf_client.autotvout_timeInSeconds.dat"
#define AUTOTB_TVIN_timeInCycles "../tv/cdatafile/c.iperf_client.autotvin_timeInCycles.dat"
#define AUTOTB_TVOUT_timeInCycles "../tv/cdatafile/c.iperf_client.autotvout_timeInCycles.dat"
#define AUTOTB_TVIN_useIpAddr "../tv/cdatafile/c.iperf_client.autotvin_useIpAddr.dat"
#define AUTOTB_TVOUT_useIpAddr "../tv/cdatafile/c.iperf_client.autotvout_useIpAddr.dat"
#define AUTOTB_TVIN_regBasePort "../tv/cdatafile/c.iperf_client.autotvin_regBasePort.dat"
#define AUTOTB_TVOUT_regBasePort "../tv/cdatafile/c.iperf_client.autotvout_regBasePort.dat"
#define AUTOTB_TVIN_regIpAddress0 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress0.dat"
#define AUTOTB_TVOUT_regIpAddress0 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress0.dat"
#define AUTOTB_TVIN_regIpAddress1 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress1.dat"
#define AUTOTB_TVOUT_regIpAddress1 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress1.dat"
#define AUTOTB_TVIN_regIpAddress2 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress2.dat"
#define AUTOTB_TVOUT_regIpAddress2 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress2.dat"
#define AUTOTB_TVIN_regIpAddress3 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress3.dat"
#define AUTOTB_TVOUT_regIpAddress3 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress3.dat"
#define AUTOTB_TVIN_regIpAddress4 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress4.dat"
#define AUTOTB_TVOUT_regIpAddress4 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress4.dat"
#define AUTOTB_TVIN_regIpAddress5 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress5.dat"
#define AUTOTB_TVOUT_regIpAddress5 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress5.dat"
#define AUTOTB_TVIN_regIpAddress6 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress6.dat"
#define AUTOTB_TVOUT_regIpAddress6 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress6.dat"
#define AUTOTB_TVIN_regIpAddress7 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress7.dat"
#define AUTOTB_TVOUT_regIpAddress7 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress7.dat"
#define AUTOTB_TVIN_regIpAddress8 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress8.dat"
#define AUTOTB_TVOUT_regIpAddress8 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress8.dat"
#define AUTOTB_TVIN_regIpAddress9 "../tv/cdatafile/c.iperf_client.autotvin_regIpAddress9.dat"
#define AUTOTB_TVOUT_regIpAddress9 "../tv/cdatafile/c.iperf_client.autotvout_regIpAddress9.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_m_axis_listen_port "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_listen_port.dat"
#define AUTOTB_TVOUT_PC_s_axis_listen_port_status "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_listen_port_status.dat"
#define AUTOTB_TVOUT_PC_s_axis_notifications "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_notifications.dat"
#define AUTOTB_TVOUT_PC_m_axis_read_package "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_read_package.dat"
#define AUTOTB_TVOUT_PC_s_axis_rx_metadata "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_rx_metadata.dat"
#define AUTOTB_TVOUT_PC_s_axis_rx_data "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_rx_data.dat"
#define AUTOTB_TVOUT_PC_m_axis_open_connection "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_open_connection.dat"
#define AUTOTB_TVOUT_PC_s_axis_open_status "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_open_status.dat"
#define AUTOTB_TVOUT_PC_m_axis_close_connection "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_close_connection.dat"
#define AUTOTB_TVOUT_PC_m_axis_tx_metadata "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_tx_metadata.dat"
#define AUTOTB_TVOUT_PC_m_axis_tx_data "../tv/rtldatafile/rtl.iperf_client.autotvout_m_axis_tx_data.dat"
#define AUTOTB_TVOUT_PC_s_axis_tx_status "../tv/rtldatafile/rtl.iperf_client.autotvout_s_axis_tx_status.dat"
#define AUTOTB_TVOUT_PC_runExperiment "../tv/rtldatafile/rtl.iperf_client.autotvout_runExperiment.dat"
#define AUTOTB_TVOUT_PC_dualModeEn "../tv/rtldatafile/rtl.iperf_client.autotvout_dualModeEn.dat"
#define AUTOTB_TVOUT_PC_useConn "../tv/rtldatafile/rtl.iperf_client.autotvout_useConn.dat"
#define AUTOTB_TVOUT_PC_pkgWordCount "../tv/rtldatafile/rtl.iperf_client.autotvout_pkgWordCount.dat"
#define AUTOTB_TVOUT_PC_packetGap "../tv/rtldatafile/rtl.iperf_client.autotvout_packetGap.dat"
#define AUTOTB_TVOUT_PC_timeInSeconds "../tv/rtldatafile/rtl.iperf_client.autotvout_timeInSeconds.dat"
#define AUTOTB_TVOUT_PC_timeInCycles "../tv/rtldatafile/rtl.iperf_client.autotvout_timeInCycles.dat"
#define AUTOTB_TVOUT_PC_useIpAddr "../tv/rtldatafile/rtl.iperf_client.autotvout_useIpAddr.dat"
#define AUTOTB_TVOUT_PC_regBasePort "../tv/rtldatafile/rtl.iperf_client.autotvout_regBasePort.dat"
#define AUTOTB_TVOUT_PC_regIpAddress0 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress0.dat"
#define AUTOTB_TVOUT_PC_regIpAddress1 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress1.dat"
#define AUTOTB_TVOUT_PC_regIpAddress2 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress2.dat"
#define AUTOTB_TVOUT_PC_regIpAddress3 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress3.dat"
#define AUTOTB_TVOUT_PC_regIpAddress4 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress4.dat"
#define AUTOTB_TVOUT_PC_regIpAddress5 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress5.dat"
#define AUTOTB_TVOUT_PC_regIpAddress6 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress6.dat"
#define AUTOTB_TVOUT_PC_regIpAddress7 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress7.dat"
#define AUTOTB_TVOUT_PC_regIpAddress8 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress8.dat"
#define AUTOTB_TVOUT_PC_regIpAddress9 "../tv/rtldatafile/rtl.iperf_client.autotvout_regIpAddress9.dat"


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
  m_axis_listen_port_depth = 0;
  s_axis_listen_port_status_depth = 0;
  s_axis_notifications_depth = 0;
  m_axis_read_package_depth = 0;
  s_axis_rx_metadata_depth = 0;
  s_axis_rx_data_depth = 0;
  m_axis_open_connection_depth = 0;
  s_axis_open_status_depth = 0;
  m_axis_close_connection_depth = 0;
  m_axis_tx_metadata_depth = 0;
  m_axis_tx_data_depth = 0;
  s_axis_tx_status_depth = 0;
  runExperiment_depth = 0;
  dualModeEn_depth = 0;
  useConn_depth = 0;
  pkgWordCount_depth = 0;
  packetGap_depth = 0;
  timeInSeconds_depth = 0;
  timeInCycles_depth = 0;
  useIpAddr_depth = 0;
  regBasePort_depth = 0;
  regIpAddress0_depth = 0;
  regIpAddress1_depth = 0;
  regIpAddress2_depth = 0;
  regIpAddress3_depth = 0;
  regIpAddress4_depth = 0;
  regIpAddress5_depth = 0;
  regIpAddress6_depth = 0;
  regIpAddress7_depth = 0;
  regIpAddress8_depth = 0;
  regIpAddress9_depth = 0;
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
  total_list << "{m_axis_listen_port " << m_axis_listen_port_depth << "}\n";
  total_list << "{s_axis_listen_port_status " << s_axis_listen_port_status_depth << "}\n";
  total_list << "{s_axis_notifications " << s_axis_notifications_depth << "}\n";
  total_list << "{m_axis_read_package " << m_axis_read_package_depth << "}\n";
  total_list << "{s_axis_rx_metadata " << s_axis_rx_metadata_depth << "}\n";
  total_list << "{s_axis_rx_data " << s_axis_rx_data_depth << "}\n";
  total_list << "{m_axis_open_connection " << m_axis_open_connection_depth << "}\n";
  total_list << "{s_axis_open_status " << s_axis_open_status_depth << "}\n";
  total_list << "{m_axis_close_connection " << m_axis_close_connection_depth << "}\n";
  total_list << "{m_axis_tx_metadata " << m_axis_tx_metadata_depth << "}\n";
  total_list << "{m_axis_tx_data " << m_axis_tx_data_depth << "}\n";
  total_list << "{s_axis_tx_status " << s_axis_tx_status_depth << "}\n";
  total_list << "{runExperiment " << runExperiment_depth << "}\n";
  total_list << "{dualModeEn " << dualModeEn_depth << "}\n";
  total_list << "{useConn " << useConn_depth << "}\n";
  total_list << "{pkgWordCount " << pkgWordCount_depth << "}\n";
  total_list << "{packetGap " << packetGap_depth << "}\n";
  total_list << "{timeInSeconds " << timeInSeconds_depth << "}\n";
  total_list << "{timeInCycles " << timeInCycles_depth << "}\n";
  total_list << "{useIpAddr " << useIpAddr_depth << "}\n";
  total_list << "{regBasePort " << regBasePort_depth << "}\n";
  total_list << "{regIpAddress0 " << regIpAddress0_depth << "}\n";
  total_list << "{regIpAddress1 " << regIpAddress1_depth << "}\n";
  total_list << "{regIpAddress2 " << regIpAddress2_depth << "}\n";
  total_list << "{regIpAddress3 " << regIpAddress3_depth << "}\n";
  total_list << "{regIpAddress4 " << regIpAddress4_depth << "}\n";
  total_list << "{regIpAddress5 " << regIpAddress5_depth << "}\n";
  total_list << "{regIpAddress6 " << regIpAddress6_depth << "}\n";
  total_list << "{regIpAddress7 " << regIpAddress7_depth << "}\n";
  total_list << "{regIpAddress8 " << regIpAddress8_depth << "}\n";
  total_list << "{regIpAddress9 " << regIpAddress9_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int m_axis_listen_port_depth;
    int s_axis_listen_port_status_depth;
    int s_axis_notifications_depth;
    int m_axis_read_package_depth;
    int s_axis_rx_metadata_depth;
    int s_axis_rx_data_depth;
    int m_axis_open_connection_depth;
    int s_axis_open_status_depth;
    int m_axis_close_connection_depth;
    int m_axis_tx_metadata_depth;
    int m_axis_tx_data_depth;
    int s_axis_tx_status_depth;
    int runExperiment_depth;
    int dualModeEn_depth;
    int useConn_depth;
    int pkgWordCount_depth;
    int packetGap_depth;
    int timeInSeconds_depth;
    int timeInCycles_depth;
    int useIpAddr_depth;
    int regBasePort_depth;
    int regIpAddress0_depth;
    int regIpAddress1_depth;
    int regIpAddress2_depth;
    int regIpAddress3_depth;
    int regIpAddress4_depth;
    int regIpAddress5_depth;
    int regIpAddress6_depth;
    int regIpAddress7_depth;
    int regIpAddress8_depth;
    int regIpAddress9_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s2__ { char data[2]; };
struct __cosim_s1__ { char data[1]; };
struct __cosim_s12__ { char data[12]; };
struct __cosim_s4__ { char data[4]; };
struct __cosim_s128__ { char data[128]; };
struct __cosim_s8__ { char data[8]; };
extern "C" void iperf_client_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, __cosim_s1__*, __cosim_s1__*, __cosim_s2__*, __cosim_s1__*, __cosim_s1__*, __cosim_s4__*, __cosim_s8__*, __cosim_s2__*, __cosim_s2__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*, __cosim_s4__*);

extern "C" void apatb_iperf_client_hw(volatile void * __xlx_apatb_param_m_axis_listen_port, volatile void * __xlx_apatb_param_s_axis_listen_port_status, volatile void * __xlx_apatb_param_s_axis_notifications, volatile void * __xlx_apatb_param_m_axis_read_package, volatile void * __xlx_apatb_param_s_axis_rx_metadata, volatile void * __xlx_apatb_param_s_axis_rx_data, volatile void * __xlx_apatb_param_m_axis_open_connection, volatile void * __xlx_apatb_param_s_axis_open_status, volatile void * __xlx_apatb_param_m_axis_close_connection, volatile void * __xlx_apatb_param_m_axis_tx_metadata, volatile void * __xlx_apatb_param_m_axis_tx_data, volatile void * __xlx_apatb_param_s_axis_tx_status, __cosim_s1__* __xlx_apatb_param_runExperiment, __cosim_s1__* __xlx_apatb_param_dualModeEn, __cosim_s2__* __xlx_apatb_param_useConn, __cosim_s1__* __xlx_apatb_param_pkgWordCount, __cosim_s1__* __xlx_apatb_param_packetGap, __cosim_s4__* __xlx_apatb_param_timeInSeconds, __cosim_s8__* __xlx_apatb_param_timeInCycles, __cosim_s2__* __xlx_apatb_param_useIpAddr, __cosim_s2__* __xlx_apatb_param_regBasePort, __cosim_s4__* __xlx_apatb_param_regIpAddress0, __cosim_s4__* __xlx_apatb_param_regIpAddress1, __cosim_s4__* __xlx_apatb_param_regIpAddress2, __cosim_s4__* __xlx_apatb_param_regIpAddress3, __cosim_s4__* __xlx_apatb_param_regIpAddress4, __cosim_s4__* __xlx_apatb_param_regIpAddress5, __cosim_s4__* __xlx_apatb_param_regIpAddress6, __cosim_s4__* __xlx_apatb_param_regIpAddress7, __cosim_s4__* __xlx_apatb_param_regIpAddress8, __cosim_s4__* __xlx_apatb_param_regIpAddress9) {
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
long __xlx_apatb_param_m_axis_listen_port_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_listen_port_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_listen_port);
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
          std::vector<sc_bv<16> > m_axis_listen_port_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_listen_port_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_listen_port" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s2__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*2+0] = m_axis_listen_port_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*2+1] = m_axis_listen_port_pc_buffer[j].range(15, 8).to_int64();
((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size; ++i)((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->read();
long __xlx_apatb_param_s_axis_notifications_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_notifications);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_notifications_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_notifications_stream_buf_final_size; ++i)((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->read();
long __xlx_apatb_param_m_axis_read_package_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_read_package);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_read_package_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_read_package);
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
          std::vector<sc_bv<32> > m_axis_read_package_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_read_package_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_read_package" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s4__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*4+0] = m_axis_read_package_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = m_axis_read_package_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = m_axis_read_package_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = m_axis_read_package_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size; ++i)((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->read();
long __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_rx_data);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_rx_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size; ++i)((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->read();
long __xlx_apatb_param_m_axis_open_connection_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_open_connection);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_open_connection_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_open_connection);
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
          std::vector<sc_bv<64> > m_axis_open_connection_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_open_connection_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_open_connection" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s8__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*8+0] = m_axis_open_connection_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*8+1] = m_axis_open_connection_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*8+2] = m_axis_open_connection_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*8+3] = m_axis_open_connection_pc_buffer[j].range(31, 24).to_int64();
((char*)&xlx_stream_elt)[0*8+4] = m_axis_open_connection_pc_buffer[j].range(39, 32).to_int64();
((char*)&xlx_stream_elt)[0*8+5] = m_axis_open_connection_pc_buffer[j].range(47, 40).to_int64();
((char*)&xlx_stream_elt)[0*8+6] = m_axis_open_connection_pc_buffer[j].range(55, 48).to_int64();
((char*)&xlx_stream_elt)[0*8+7] = m_axis_open_connection_pc_buffer[j].range(63, 56).to_int64();
((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_open_status_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_open_status);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_open_status_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_open_status_stream_buf_final_size; ++i)((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->read();
long __xlx_apatb_param_m_axis_close_connection_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_close_connection);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_close_connection_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_close_connection);
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
          std::vector<sc_bv<16> > m_axis_close_connection_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_close_connection_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_close_connection" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s2__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*2+0] = m_axis_close_connection_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*2+1] = m_axis_close_connection_pc_buffer[j].range(15, 8).to_int64();
((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_tx_metadata);
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
          std::vector<sc_bv<32> > m_axis_tx_metadata_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_tx_metadata_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_tx_metadata" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s4__ xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*4+0] = m_axis_tx_metadata_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = m_axis_tx_metadata_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = m_axis_tx_metadata_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = m_axis_tx_metadata_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_tx_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_tx_data_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_tx_data);
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
          std::vector<sc_bv<1024> > m_axis_tx_data_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_tx_data_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_tx_data" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s128__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*16+0] = m_axis_tx_data_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*16+1] = m_axis_tx_data_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*16+2] = m_axis_tx_data_pc_buffer[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt)[0*16+3] = m_axis_tx_data_pc_buffer[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt)[0*16+4] = m_axis_tx_data_pc_buffer[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt)[0*16+5] = m_axis_tx_data_pc_buffer[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt)[0*16+6] = m_axis_tx_data_pc_buffer[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt)[0*16+7] = m_axis_tx_data_pc_buffer[j].range(511,448).to_int64();
((long long*)&xlx_stream_elt)[0*16+8] = m_axis_tx_data_pc_buffer[j].range(575,512).to_int64();
((long long*)&xlx_stream_elt)[0*16+9] = m_axis_tx_data_pc_buffer[j].range(639,576).to_int64();
((long long*)&xlx_stream_elt)[0*16+10] = m_axis_tx_data_pc_buffer[j].range(703,640).to_int64();
((long long*)&xlx_stream_elt)[0*16+11] = m_axis_tx_data_pc_buffer[j].range(767,704).to_int64();
((long long*)&xlx_stream_elt)[0*16+12] = m_axis_tx_data_pc_buffer[j].range(831,768).to_int64();
((long long*)&xlx_stream_elt)[0*16+13] = m_axis_tx_data_pc_buffer[j].range(895,832).to_int64();
((long long*)&xlx_stream_elt)[0*16+14] = m_axis_tx_data_pc_buffer[j].range(959,896).to_int64();
((long long*)&xlx_stream_elt)[0*16+15] = m_axis_tx_data_pc_buffer[j].range(1023,960).to_int64();
((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_tx_status);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_tx_status_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size; ++i)((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->read();

    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_listen_port);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_notifications);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_read_package);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_read_package);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_rx_data);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_open_connection);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_open_connection);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_open_status);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_close_connection);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_close_connection);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_metadata);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_tx_data);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_tx_status);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status);
CodeState = DUMP_INPUTS;
std::vector<__cosim_s2__> __xlx_apatb_param_m_axis_listen_port_stream_buf;
long __xlx_apatb_param_m_axis_listen_port_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->size();
std::vector<__cosim_s1__> __xlx_apatb_param_s_axis_listen_port_status_stream_buf;
{
  while (!((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->empty())
    __xlx_apatb_param_s_axis_listen_port_status_stream_buf.push_back(((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_listen_port_status_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->write(__xlx_apatb_param_s_axis_listen_port_status_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_listen_port_status_stream_buf_size = ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->size();
std::vector<__cosim_s12__> __xlx_apatb_param_s_axis_notifications_stream_buf;
{
  while (!((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->empty())
    __xlx_apatb_param_s_axis_notifications_stream_buf.push_back(((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_notifications_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->write(__xlx_apatb_param_s_axis_notifications_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_notifications_stream_buf_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_m_axis_read_package_stream_buf;
long __xlx_apatb_param_m_axis_read_package_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->size();
std::vector<__cosim_s2__> __xlx_apatb_param_s_axis_rx_metadata_stream_buf;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->empty())
    __xlx_apatb_param_s_axis_rx_metadata_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_rx_metadata_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->write(__xlx_apatb_param_s_axis_rx_metadata_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_rx_metadata_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_s_axis_rx_data_stream_buf;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->empty())
    __xlx_apatb_param_s_axis_rx_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_rx_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->write(__xlx_apatb_param_s_axis_rx_data_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_rx_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->size();
std::vector<__cosim_s8__> __xlx_apatb_param_m_axis_open_connection_stream_buf;
long __xlx_apatb_param_m_axis_open_connection_stream_buf_size = ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_s_axis_open_status_stream_buf;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->empty())
    __xlx_apatb_param_s_axis_open_status_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_open_status_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->write(__xlx_apatb_param_s_axis_open_status_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_open_status_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->size();
std::vector<__cosim_s2__> __xlx_apatb_param_m_axis_close_connection_stream_buf;
long __xlx_apatb_param_m_axis_close_connection_stream_buf_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->size();
std::vector<__cosim_s4__> __xlx_apatb_param_m_axis_tx_metadata_stream_buf;
long __xlx_apatb_param_m_axis_tx_metadata_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->size();
std::vector<__cosim_s128__> __xlx_apatb_param_m_axis_tx_data_stream_buf;
long __xlx_apatb_param_m_axis_tx_data_stream_buf_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->size();
std::vector<__cosim_s12__> __xlx_apatb_param_s_axis_tx_status_stream_buf;
{
  while (!((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->empty())
    __xlx_apatb_param_s_axis_tx_status_stream_buf.push_back(((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_tx_status_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->write(__xlx_apatb_param_s_axis_tx_status_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_tx_status_stream_buf_size = ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->size();
// print runExperiment Transactions
{
aesl_fh.write(AUTOTB_TVIN_runExperiment, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_runExperiment;
aesl_fh.write(AUTOTB_TVIN_runExperiment, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.runExperiment_depth);
aesl_fh.write(AUTOTB_TVIN_runExperiment, end_str());
}

// print dualModeEn Transactions
{
aesl_fh.write(AUTOTB_TVIN_dualModeEn, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_dualModeEn;
aesl_fh.write(AUTOTB_TVIN_dualModeEn, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.dualModeEn_depth);
aesl_fh.write(AUTOTB_TVIN_dualModeEn, end_str());
}

// print useConn Transactions
{
aesl_fh.write(AUTOTB_TVIN_useConn, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_useConn;
aesl_fh.write(AUTOTB_TVIN_useConn, formatData(pos, 14));
}
  tcl_file.set_num(1, &tcl_file.useConn_depth);
aesl_fh.write(AUTOTB_TVIN_useConn, end_str());
}

// print pkgWordCount Transactions
{
aesl_fh.write(AUTOTB_TVIN_pkgWordCount, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_pkgWordCount;
aesl_fh.write(AUTOTB_TVIN_pkgWordCount, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.pkgWordCount_depth);
aesl_fh.write(AUTOTB_TVIN_pkgWordCount, end_str());
}

// print packetGap Transactions
{
aesl_fh.write(AUTOTB_TVIN_packetGap, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_packetGap;
aesl_fh.write(AUTOTB_TVIN_packetGap, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.packetGap_depth);
aesl_fh.write(AUTOTB_TVIN_packetGap, end_str());
}

// print timeInSeconds Transactions
{
aesl_fh.write(AUTOTB_TVIN_timeInSeconds, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_timeInSeconds;
aesl_fh.write(AUTOTB_TVIN_timeInSeconds, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.timeInSeconds_depth);
aesl_fh.write(AUTOTB_TVIN_timeInSeconds, end_str());
}

// print timeInCycles Transactions
{
aesl_fh.write(AUTOTB_TVIN_timeInCycles, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_timeInCycles;
aesl_fh.write(AUTOTB_TVIN_timeInCycles, formatData(pos, 64));
}
  tcl_file.set_num(1, &tcl_file.timeInCycles_depth);
aesl_fh.write(AUTOTB_TVIN_timeInCycles, end_str());
}

// print useIpAddr Transactions
{
aesl_fh.write(AUTOTB_TVIN_useIpAddr, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_useIpAddr;
aesl_fh.write(AUTOTB_TVIN_useIpAddr, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.useIpAddr_depth);
aesl_fh.write(AUTOTB_TVIN_useIpAddr, end_str());
}

// print regBasePort Transactions
{
aesl_fh.write(AUTOTB_TVIN_regBasePort, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regBasePort;
aesl_fh.write(AUTOTB_TVIN_regBasePort, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.regBasePort_depth);
aesl_fh.write(AUTOTB_TVIN_regBasePort, end_str());
}

// print regIpAddress0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress0, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress0;
aesl_fh.write(AUTOTB_TVIN_regIpAddress0, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress0_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress0, end_str());
}

// print regIpAddress1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress1, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress1;
aesl_fh.write(AUTOTB_TVIN_regIpAddress1, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress1_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress1, end_str());
}

// print regIpAddress2 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress2, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress2;
aesl_fh.write(AUTOTB_TVIN_regIpAddress2, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress2_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress2, end_str());
}

// print regIpAddress3 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress3, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress3;
aesl_fh.write(AUTOTB_TVIN_regIpAddress3, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress3_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress3, end_str());
}

// print regIpAddress4 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress4, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress4;
aesl_fh.write(AUTOTB_TVIN_regIpAddress4, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress4_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress4, end_str());
}

// print regIpAddress5 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress5, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress5;
aesl_fh.write(AUTOTB_TVIN_regIpAddress5, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress5_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress5, end_str());
}

// print regIpAddress6 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress6, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress6;
aesl_fh.write(AUTOTB_TVIN_regIpAddress6, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress6_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress6, end_str());
}

// print regIpAddress7 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress7, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress7;
aesl_fh.write(AUTOTB_TVIN_regIpAddress7, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress7_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress7, end_str());
}

// print regIpAddress8 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress8, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress8;
aesl_fh.write(AUTOTB_TVIN_regIpAddress8, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress8_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress8, end_str());
}

// print regIpAddress9 Transactions
{
aesl_fh.write(AUTOTB_TVIN_regIpAddress9, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regIpAddress9;
aesl_fh.write(AUTOTB_TVIN_regIpAddress9, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.regIpAddress9_depth);
aesl_fh.write(AUTOTB_TVIN_regIpAddress9, end_str());
}

CodeState = CALL_C_DUT;
iperf_client_hw_stub_wrapper(__xlx_apatb_param_m_axis_listen_port, __xlx_apatb_param_s_axis_listen_port_status, __xlx_apatb_param_s_axis_notifications, __xlx_apatb_param_m_axis_read_package, __xlx_apatb_param_s_axis_rx_metadata, __xlx_apatb_param_s_axis_rx_data, __xlx_apatb_param_m_axis_open_connection, __xlx_apatb_param_s_axis_open_status, __xlx_apatb_param_m_axis_close_connection, __xlx_apatb_param_m_axis_tx_metadata, __xlx_apatb_param_m_axis_tx_data, __xlx_apatb_param_s_axis_tx_status, __xlx_apatb_param_runExperiment, __xlx_apatb_param_dualModeEn, __xlx_apatb_param_useConn, __xlx_apatb_param_pkgWordCount, __xlx_apatb_param_packetGap, __xlx_apatb_param_timeInSeconds, __xlx_apatb_param_timeInCycles, __xlx_apatb_param_useIpAddr, __xlx_apatb_param_regBasePort, __xlx_apatb_param_regIpAddress0, __xlx_apatb_param_regIpAddress1, __xlx_apatb_param_regIpAddress2, __xlx_apatb_param_regIpAddress3, __xlx_apatb_param_regIpAddress4, __xlx_apatb_param_regIpAddress5, __xlx_apatb_param_regIpAddress6, __xlx_apatb_param_regIpAddress7, __xlx_apatb_param_regIpAddress8, __xlx_apatb_param_regIpAddress9);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_m_axis_listen_port_stream_buf_final_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->size() - __xlx_apatb_param_m_axis_listen_port_stream_buf_size;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->empty())
    __xlx_apatb_param_m_axis_listen_port_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_listen_port_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port)->write(__xlx_apatb_param_m_axis_listen_port_stream_buf[i]);
  }
// print m_axis_listen_port Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_listen_port_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_listen_port_stream_buf.data()+__xlx_apatb_param_m_axis_listen_port_stream_buf_size+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_listen_port_stream_buf_final_size, &tcl_file.m_axis_listen_port_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_listen_port, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_listen_port_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_listen_port, end_str());
}
long __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size = __xlx_apatb_param_s_axis_listen_port_status_stream_buf_size - ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status)->size();
// print s_axis_listen_port_status Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_status, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_listen_port_status_stream_buf.data()+i);
std::string s(formatData(pos, 8));
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_status, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size, &tcl_file.s_axis_listen_port_status_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_listen_port_status, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size > 0) {
  long s_axis_listen_port_status_stream_ingress_size = __xlx_apatb_param_s_axis_listen_port_status_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size; j != e; j++) {
    s_axis_listen_port_status_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_listen_port_status_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_listen_port_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_listen_port_status, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_listen_port_status_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_listen_port_status, end_str());
}
long __xlx_apatb_param_s_axis_notifications_stream_buf_final_size = __xlx_apatb_param_s_axis_notifications_stream_buf_size - ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications)->size();
// print s_axis_notifications Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_notifications, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_notifications_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_notifications_stream_buf.data()+i);
std::string s(formatData(pos, 96));
aesl_fh.write(AUTOTB_TVIN_s_axis_notifications, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_notifications_stream_buf_final_size, &tcl_file.s_axis_notifications_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_notifications, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_notifications_stream_buf_final_size > 0) {
  long s_axis_notifications_stream_ingress_size = __xlx_apatb_param_s_axis_notifications_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_notifications_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_notifications_stream_buf_final_size; j != e; j++) {
    s_axis_notifications_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_notifications_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_notifications_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_notifications_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_notifications, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_notifications, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_notifications_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_notifications, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_notifications, end_str());
}
long __xlx_apatb_param_m_axis_read_package_stream_buf_final_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->size() - __xlx_apatb_param_m_axis_read_package_stream_buf_size;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->empty())
    __xlx_apatb_param_m_axis_read_package_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_read_package_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package)->write(__xlx_apatb_param_m_axis_read_package_stream_buf[i]);
  }
// print m_axis_read_package Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_read_package, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_read_package_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_read_package_stream_buf.data()+__xlx_apatb_param_m_axis_read_package_stream_buf_size+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVOUT_m_axis_read_package, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_read_package_stream_buf_final_size, &tcl_file.m_axis_read_package_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_read_package, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_read_package, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_read_package_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_read_package, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_read_package, end_str());
}
long __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size = __xlx_apatb_param_s_axis_rx_metadata_stream_buf_size - ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata)->size();
// print s_axis_rx_metadata Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_metadata, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_rx_metadata_stream_buf.data()+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_metadata, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size, &tcl_file.s_axis_rx_metadata_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_metadata, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size > 0) {
  long s_axis_rx_metadata_stream_ingress_size = __xlx_apatb_param_s_axis_rx_metadata_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size; j != e; j++) {
    s_axis_rx_metadata_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_rx_metadata_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_metadata_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_metadata, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_rx_metadata_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_metadata, end_str());
}
long __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size = __xlx_apatb_param_s_axis_rx_data_stream_buf_size - ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data)->size();
// print s_axis_rx_data Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_rx_data_stream_buf.data()+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_rx_data_stream_buf_final_size, &tcl_file.s_axis_rx_data_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_rx_data, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_rx_data_stream_buf_final_size > 0) {
  long s_axis_rx_data_stream_ingress_size = __xlx_apatb_param_s_axis_rx_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size; j != e; j++) {
    s_axis_rx_data_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_rx_data_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_rx_data_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_rx_data, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_rx_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_rx_data, end_str());
}
long __xlx_apatb_param_m_axis_open_connection_stream_buf_final_size = ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->size() - __xlx_apatb_param_m_axis_open_connection_stream_buf_size;
{
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->empty())
    __xlx_apatb_param_m_axis_open_connection_stream_buf.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_open_connection_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection)->write(__xlx_apatb_param_m_axis_open_connection_stream_buf[i]);
  }
// print m_axis_open_connection Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_connection, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_open_connection_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_open_connection_stream_buf.data()+__xlx_apatb_param_m_axis_open_connection_stream_buf_size+i);
std::string s(formatData(pos, 64));
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_connection, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_open_connection_stream_buf_final_size, &tcl_file.m_axis_open_connection_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_open_connection, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_connection, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_open_connection_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_connection, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_open_connection, end_str());
}
long __xlx_apatb_param_s_axis_open_status_stream_buf_final_size = __xlx_apatb_param_s_axis_open_status_stream_buf_size - ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status)->size();
// print s_axis_open_status Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_open_status, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_open_status_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_open_status_stream_buf.data()+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVIN_s_axis_open_status, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_open_status_stream_buf_final_size, &tcl_file.s_axis_open_status_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_open_status, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_open_status_stream_buf_final_size > 0) {
  long s_axis_open_status_stream_ingress_size = __xlx_apatb_param_s_axis_open_status_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_open_status_stream_buf_final_size; j != e; j++) {
    s_axis_open_status_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_open_status_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_open_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_open_status, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_status, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_open_status_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_status, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_open_status, end_str());
}
long __xlx_apatb_param_m_axis_close_connection_stream_buf_final_size = ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->size() - __xlx_apatb_param_m_axis_close_connection_stream_buf_size;
{
  while (!((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->empty())
    __xlx_apatb_param_m_axis_close_connection_stream_buf.push_back(((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_close_connection_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection)->write(__xlx_apatb_param_m_axis_close_connection_stream_buf[i]);
  }
// print m_axis_close_connection Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_close_connection, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_close_connection_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_close_connection_stream_buf.data()+__xlx_apatb_param_m_axis_close_connection_stream_buf_size+i);
std::string s(formatData(pos, 16));
aesl_fh.write(AUTOTB_TVOUT_m_axis_close_connection, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_close_connection_stream_buf_final_size, &tcl_file.m_axis_close_connection_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_close_connection, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_close_connection, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_close_connection_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_close_connection, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_close_connection, end_str());
}
long __xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->size() - __xlx_apatb_param_m_axis_tx_metadata_stream_buf_size;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->empty())
    __xlx_apatb_param_m_axis_tx_metadata_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_tx_metadata_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata)->write(__xlx_apatb_param_m_axis_tx_metadata_stream_buf[i]);
  }
// print m_axis_tx_metadata Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_metadata, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_tx_metadata_stream_buf.data()+__xlx_apatb_param_m_axis_tx_metadata_stream_buf_size+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_metadata, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size, &tcl_file.m_axis_tx_metadata_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_metadata, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_tx_metadata_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_metadata, end_str());
}
long __xlx_apatb_param_m_axis_tx_data_stream_buf_final_size = ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->size() - __xlx_apatb_param_m_axis_tx_data_stream_buf_size;
{
  while (!((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->empty())
    __xlx_apatb_param_m_axis_tx_data_stream_buf.push_back(((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_tx_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data)->write(__xlx_apatb_param_m_axis_tx_data_stream_buf[i]);
  }
// print m_axis_tx_data Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_tx_data_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_tx_data_stream_buf.data()+__xlx_apatb_param_m_axis_tx_data_stream_buf_size+i);
std::string s(formatData(pos, 1024));
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_tx_data_stream_buf_final_size, &tcl_file.m_axis_tx_data_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_tx_data, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_tx_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_tx_data, end_str());
}
long __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size = __xlx_apatb_param_s_axis_tx_status_stream_buf_size - ((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status)->size();
// print s_axis_tx_status Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_status, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_tx_status_stream_buf.data()+i);
std::string s(formatData(pos, 96));
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_status, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_tx_status_stream_buf_final_size, &tcl_file.s_axis_tx_status_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_tx_status, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_tx_status_stream_buf_final_size > 0) {
  long s_axis_tx_status_stream_ingress_size = __xlx_apatb_param_s_axis_tx_status_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size; j != e; j++) {
    s_axis_tx_status_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_tx_status_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_tx_status_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_tx_status, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_status, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_tx_status_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_status, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_tx_status, end_str());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
