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
#define AUTOTB_TVIN_s_axis_lup_req "../tv/cdatafile/c.hash_table_top.autotvin_s_axis_lup_req.dat"
#define AUTOTB_TVOUT_s_axis_lup_req "../tv/cdatafile/c.hash_table_top.autotvout_s_axis_lup_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_lup_req "../tv/stream_size/stream_size_in_s_axis_lup_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req "../tv/stream_size/stream_ingress_status_s_axis_lup_req.dat"
#define AUTOTB_TVIN_s_axis_upd_req "../tv/cdatafile/c.hash_table_top.autotvin_s_axis_upd_req.dat"
#define AUTOTB_TVOUT_s_axis_upd_req "../tv/cdatafile/c.hash_table_top.autotvout_s_axis_upd_req.dat"
#define WRAPC_STREAM_SIZE_IN_s_axis_upd_req "../tv/stream_size/stream_size_in_s_axis_upd_req.dat"
#define WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req "../tv/stream_size/stream_ingress_status_s_axis_upd_req.dat"
#define AUTOTB_TVIN_m_axis_lup_rsp "../tv/cdatafile/c.hash_table_top.autotvin_m_axis_lup_rsp.dat"
#define AUTOTB_TVOUT_m_axis_lup_rsp "../tv/cdatafile/c.hash_table_top.autotvout_m_axis_lup_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp "../tv/stream_size/stream_size_out_m_axis_lup_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_lup_rsp "../tv/stream_size/stream_egress_status_m_axis_lup_rsp.dat"
#define AUTOTB_TVIN_m_axis_upd_rsp "../tv/cdatafile/c.hash_table_top.autotvin_m_axis_upd_rsp.dat"
#define AUTOTB_TVOUT_m_axis_upd_rsp "../tv/cdatafile/c.hash_table_top.autotvout_m_axis_upd_rsp.dat"
#define WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp "../tv/stream_size/stream_size_out_m_axis_upd_rsp.dat"
#define WRAPC_STREAM_EGRESS_STATUS_m_axis_upd_rsp "../tv/stream_size/stream_egress_status_m_axis_upd_rsp.dat"
#define AUTOTB_TVIN_regInsertFailureCount "../tv/cdatafile/c.hash_table_top.autotvin_regInsertFailureCount.dat"
#define AUTOTB_TVOUT_regInsertFailureCount "../tv/cdatafile/c.hash_table_top.autotvout_regInsertFailureCount.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_s_axis_lup_req "../tv/rtldatafile/rtl.hash_table_top.autotvout_s_axis_lup_req.dat"
#define AUTOTB_TVOUT_PC_s_axis_upd_req "../tv/rtldatafile/rtl.hash_table_top.autotvout_s_axis_upd_req.dat"
#define AUTOTB_TVOUT_PC_m_axis_lup_rsp "../tv/rtldatafile/rtl.hash_table_top.autotvout_m_axis_lup_rsp.dat"
#define AUTOTB_TVOUT_PC_m_axis_upd_rsp "../tv/rtldatafile/rtl.hash_table_top.autotvout_m_axis_upd_rsp.dat"
#define AUTOTB_TVOUT_PC_regInsertFailureCount "../tv/rtldatafile/rtl.hash_table_top.autotvout_regInsertFailureCount.dat"


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
  s_axis_lup_req_depth = 0;
  s_axis_upd_req_depth = 0;
  m_axis_lup_rsp_depth = 0;
  m_axis_upd_rsp_depth = 0;
  regInsertFailureCount_depth = 0;
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
  total_list << "{s_axis_lup_req " << s_axis_lup_req_depth << "}\n";
  total_list << "{s_axis_upd_req " << s_axis_upd_req_depth << "}\n";
  total_list << "{m_axis_lup_rsp " << m_axis_lup_rsp_depth << "}\n";
  total_list << "{m_axis_upd_rsp " << m_axis_upd_rsp_depth << "}\n";
  total_list << "{regInsertFailureCount " << regInsertFailureCount_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int s_axis_lup_req_depth;
    int s_axis_upd_req_depth;
    int m_axis_lup_rsp_depth;
    int m_axis_upd_rsp_depth;
    int regInsertFailureCount_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s16__ { char data[16]; };
struct __cosim_s24__ { char data[24]; };
extern "C" void hash_table_top_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_hash_table_top_hw(volatile void * __xlx_apatb_param_s_axis_lup_req, volatile void * __xlx_apatb_param_s_axis_upd_req, volatile void * __xlx_apatb_param_m_axis_lup_rsp, volatile void * __xlx_apatb_param_m_axis_upd_rsp, volatile void * __xlx_apatb_param_regInsertFailureCount) {
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
long __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_lup_req);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_lup_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->read();
long __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_s_axis_upd_req);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_s_axis_upd_req_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size; ++i)((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->read();
long __xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_lup_rsp);
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
          std::vector<sc_bv<128> > m_axis_lup_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_lup_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_lup_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s16__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*2+0] = m_axis_lup_rsp_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = m_axis_lup_rsp_pc_buffer[j].range(127,64).to_int64();
((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size = atoi(AESL_token.c_str());

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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m_axis_upd_rsp);
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
          std::vector<sc_bv<192> > m_axis_upd_rsp_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m_axis_upd_rsp_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m_axis_upd_rsp" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
__cosim_s24__ xlx_stream_elt __attribute__ ((aligned));
((long long*)&xlx_stream_elt)[0*3+0] = m_axis_upd_rsp_pc_buffer[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*3+1] = m_axis_upd_rsp_pc_buffer[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt)[0*3+2] = m_axis_upd_rsp_pc_buffer[j].range(191,128).to_int64();
((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_regInsertFailureCount);
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
          std::vector<sc_bv<16> > regInsertFailureCount_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              regInsertFailureCount_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "regInsertFailureCount" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_regInsertFailureCount)[0*2+0] = regInsertFailureCount_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_regInsertFailureCount)[0*2+1] = regInsertFailureCount_pc_buffer[0].range(15, 8).to_int64();
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
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_lup_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_s_axis_upd_req);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_lup_rsp);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_m_axis_upd_rsp);
CodeState = DUMP_INPUTS;
std::vector<__cosim_s16__> __xlx_apatb_param_s_axis_lup_req_stream_buf;
{
  while (!((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->empty())
    __xlx_apatb_param_s_axis_lup_req_stream_buf.push_back(((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_lup_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->write(__xlx_apatb_param_s_axis_lup_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_lup_req_stream_buf_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->size();
std::vector<__cosim_s24__> __xlx_apatb_param_s_axis_upd_req_stream_buf;
{
  while (!((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->empty())
    __xlx_apatb_param_s_axis_upd_req_stream_buf.push_back(((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->read());
  for (int i = 0; i < __xlx_apatb_param_s_axis_upd_req_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->write(__xlx_apatb_param_s_axis_upd_req_stream_buf[i]);
  }
long __xlx_apatb_param_s_axis_upd_req_stream_buf_size = ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->size();
std::vector<__cosim_s16__> __xlx_apatb_param_m_axis_lup_rsp_stream_buf;
long __xlx_apatb_param_m_axis_lup_rsp_stream_buf_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->size();
std::vector<__cosim_s24__> __xlx_apatb_param_m_axis_upd_rsp_stream_buf;
long __xlx_apatb_param_m_axis_upd_rsp_stream_buf_size = ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->size();
// print regInsertFailureCount Transactions
{
aesl_fh.write(AUTOTB_TVIN_regInsertFailureCount, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regInsertFailureCount;
aesl_fh.write(AUTOTB_TVIN_regInsertFailureCount, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.regInsertFailureCount_depth);
aesl_fh.write(AUTOTB_TVIN_regInsertFailureCount, end_str());
}

CodeState = CALL_C_DUT;
hash_table_top_hw_stub_wrapper(__xlx_apatb_param_s_axis_lup_req, __xlx_apatb_param_s_axis_upd_req, __xlx_apatb_param_m_axis_lup_rsp, __xlx_apatb_param_m_axis_upd_rsp, __xlx_apatb_param_regInsertFailureCount);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size = __xlx_apatb_param_s_axis_lup_req_stream_buf_size - ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_lup_req)->size();
// print s_axis_lup_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_lup_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_lup_req_stream_buf.data()+i);
std::string s(formatData(pos, 128));
aesl_fh.write(AUTOTB_TVIN_s_axis_lup_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_lup_req_stream_buf_final_size, &tcl_file.s_axis_lup_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_lup_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_lup_req_stream_buf_final_size > 0) {
  long s_axis_lup_req_stream_ingress_size = __xlx_apatb_param_s_axis_lup_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_lup_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size; j != e; j++) {
    s_axis_lup_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_lup_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_lup_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_lup_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_lup_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_lup_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_lup_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_lup_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_lup_req, end_str());
}
long __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size = __xlx_apatb_param_s_axis_upd_req_stream_buf_size - ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_s_axis_upd_req)->size();
// print s_axis_upd_req Transactions
{
aesl_fh.write(AUTOTB_TVIN_s_axis_upd_req, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_s_axis_upd_req_stream_buf.data()+i);
std::string s(formatData(pos, 192));
aesl_fh.write(AUTOTB_TVIN_s_axis_upd_req, s);
}

  tcl_file.set_num(__xlx_apatb_param_s_axis_upd_req_stream_buf_final_size, &tcl_file.s_axis_upd_req_depth);
aesl_fh.write(AUTOTB_TVIN_s_axis_upd_req, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req, begin_str(AESL_transaction));
if (__xlx_apatb_param_s_axis_upd_req_stream_buf_final_size > 0) {
  long s_axis_upd_req_stream_ingress_size = __xlx_apatb_param_s_axis_upd_req_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_upd_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size; j != e; j++) {
    s_axis_upd_req_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_upd_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req, __xlx_sprintf_buffer.data());
  }
} else {
  long s_axis_upd_req_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", s_axis_upd_req_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_s_axis_upd_req, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_upd_req, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_s_axis_upd_req_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_upd_req, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_s_axis_upd_req, end_str());
}
long __xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size = ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->size() - __xlx_apatb_param_m_axis_lup_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->empty())
    __xlx_apatb_param_m_axis_lup_rsp_stream_buf.push_back(((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_lup_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_lup_rsp)->write(__xlx_apatb_param_m_axis_lup_rsp_stream_buf[i]);
  }
// print m_axis_lup_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_lup_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_lup_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_lup_rsp_stream_buf_size+i);
std::string s(formatData(pos, 128));
aesl_fh.write(AUTOTB_TVOUT_m_axis_lup_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size, &tcl_file.m_axis_lup_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_lup_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_lup_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_lup_rsp, end_str());
}
long __xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size = ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->size() - __xlx_apatb_param_m_axis_upd_rsp_stream_buf_size;
{
  while (!((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->empty())
    __xlx_apatb_param_m_axis_upd_rsp_stream_buf.push_back(((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->read());
  for (int i = 0; i < __xlx_apatb_param_m_axis_upd_rsp_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_upd_rsp)->write(__xlx_apatb_param_m_axis_upd_rsp_stream_buf[i]);
  }
// print m_axis_upd_rsp Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m_axis_upd_rsp, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_m_axis_upd_rsp_stream_buf.data()+__xlx_apatb_param_m_axis_upd_rsp_stream_buf_size+i);
std::string s(formatData(pos, 192));
aesl_fh.write(AUTOTB_TVOUT_m_axis_upd_rsp, s);
}

  tcl_file.set_num(__xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size, &tcl_file.m_axis_upd_rsp_depth);
aesl_fh.write(AUTOTB_TVOUT_m_axis_upd_rsp, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_m_axis_upd_rsp_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_m_axis_upd_rsp, end_str());
}
// print regInsertFailureCount Transactions
{
aesl_fh.write(AUTOTB_TVOUT_regInsertFailureCount, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_regInsertFailureCount;
aesl_fh.write(AUTOTB_TVOUT_regInsertFailureCount, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.regInsertFailureCount_depth);
aesl_fh.write(AUTOTB_TVOUT_regInsertFailureCount, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
