#include <systemc>
#include <list>
#include <map>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;

namespace bcsim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(1<<10)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_s_axis_tcp_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tcp_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tcp_data.dat");
unsigned int ap_apatb_s_axis_txwrite_sts_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_txwrite_sts_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_txwrite_sts.dat");
unsigned int ap_apatb_s_axis_rxread_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rxread_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rxread_data.dat");
unsigned int ap_apatb_s_axis_txread_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_txread_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_txread_data.dat");
unsigned int ap_apatb_m_axis_tcp_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tcp_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tcp_data.dat");
unsigned int ap_apatb_m_axis_txwrite_cmd_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_txwrite_cmd_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_txwrite_cmd.dat");
unsigned int ap_apatb_m_axis_txread_cmd_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_txread_cmd_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_txread_cmd.dat");
unsigned int ap_apatb_m_axis_rxwrite_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_rxwrite_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_rxwrite_data.dat");
unsigned int ap_apatb_m_axis_txwrite_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_txwrite_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_txwrite_data.dat");
unsigned int ap_apatb_s_axis_session_lup_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_session_lup_rsp_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_session_lup_rsp.dat");
unsigned int ap_apatb_s_axis_session_upd_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_session_upd_rsp_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_session_upd_rsp.dat");
unsigned int ap_apatb_m_axis_session_lup_req_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_session_lup_req_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_session_lup_req.dat");
unsigned int ap_apatb_m_axis_session_upd_req_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_session_upd_req_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_session_upd_req.dat");
unsigned int ap_apatb_s_axis_listen_port_req_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_listen_port_req_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_listen_port_req.dat");
unsigned int ap_apatb_s_axis_rx_data_req_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_data_req_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_data_req.dat");
unsigned int ap_apatb_s_axis_open_conn_req_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_open_conn_req_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_open_conn_req.dat");
unsigned int ap_apatb_s_axis_close_conn_req_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_close_conn_req_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_close_conn_req.dat");
unsigned int ap_apatb_s_axis_tx_data_req_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tx_data_req_metadata_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tx_data_req_metadata.dat");
unsigned int ap_apatb_s_axis_tx_data_req_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tx_data_req_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tx_data_req.dat");
unsigned int ap_apatb_m_axis_listen_port_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_listen_port_rsp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_listen_port_rsp.dat");
unsigned int ap_apatb_m_axis_notification_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_notification_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_notification.dat");
unsigned int ap_apatb_m_axis_rx_data_rsp_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_rx_data_rsp_metadata_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_rx_data_rsp_metadata.dat");
unsigned int ap_apatb_m_axis_rx_data_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_rx_data_rsp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_rx_data_rsp.dat");
unsigned int ap_apatb_m_axis_open_conn_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_open_conn_rsp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_open_conn_rsp.dat");
unsigned int ap_apatb_m_axis_tx_data_rsp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_data_rsp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_data_rsp.dat");
struct __cosim_s128__ { char data[128]; };
struct __cosim_s5__ { char data[5]; };
struct __cosim_s16__ { char data[16]; };
struct __cosim_s20__ { char data[20]; };
struct __cosim_s12__ { char data[12]; };
struct __cosim_s2__ { char data[2]; };
struct __cosim_s4__ { char data[4]; };
struct __cosim_s8__ { char data[8]; };
struct __cosim_s1__ { char data[1]; };
struct __cosim_s32__ { char data[32]; };
extern "C" void toe_top(__cosim_s128__*, __cosim_s5__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s16__*, __cosim_s16__*, __cosim_s128__*, __cosim_s128__*, __cosim_s16__*, __cosim_s20__*, __cosim_s12__*, __cosim_s20__*, __cosim_s2__*, __cosim_s4__*, __cosim_s8__*, __cosim_s2__*, __cosim_s4__*, __cosim_s128__*, __cosim_s1__*, __cosim_s12__*, __cosim_s2__*, __cosim_s128__*, __cosim_s4__*, __cosim_s12__*, __cosim_s2__, __cosim_s2__, __cosim_s4__, volatile void *);
extern "C" void apatb_toe_top_hw(volatile void * __xlx_apatb_param_s_axis_tcp_data, volatile void * __xlx_apatb_param_s_axis_txwrite_sts, volatile void * __xlx_apatb_param_s_axis_rxread_data, volatile void * __xlx_apatb_param_s_axis_txread_data, volatile void * __xlx_apatb_param_m_axis_tcp_data, volatile void * __xlx_apatb_param_m_axis_txwrite_cmd, volatile void * __xlx_apatb_param_m_axis_txread_cmd, volatile void * __xlx_apatb_param_m_axis_rxwrite_data, volatile void * __xlx_apatb_param_m_axis_txwrite_data, volatile void * __xlx_apatb_param_s_axis_session_lup_rsp, volatile void * __xlx_apatb_param_s_axis_session_upd_rsp, volatile void * __xlx_apatb_param_m_axis_session_lup_req, volatile void * __xlx_apatb_param_m_axis_session_upd_req, volatile void * __xlx_apatb_param_s_axis_listen_port_req, volatile void * __xlx_apatb_param_s_axis_rx_data_req, volatile void * __xlx_apatb_param_s_axis_open_conn_req, volatile void * __xlx_apatb_param_s_axis_close_conn_req, volatile void * __xlx_apatb_param_s_axis_tx_data_req_metadata, volatile void * __xlx_apatb_param_s_axis_tx_data_req, volatile void * __xlx_apatb_param_m_axis_listen_port_rsp, volatile void * __xlx_apatb_param_m_axis_notification, volatile void * __xlx_apatb_param_m_axis_rx_data_rsp_metadata, volatile void * __xlx_apatb_param_m_axis_rx_data_rsp, volatile void * __xlx_apatb_param_m_axis_open_conn_rsp, volatile void * __xlx_apatb_param_m_axis_tx_data_rsp, __cosim_s2__* __xlx_apatb_param_axis_data_count, __cosim_s2__* __xlx_apatb_param_axis_max_data_count, __cosim_s4__* __xlx_apatb_param_myIpAddress, volatile void * __xlx_apatb_param_regSessionCount) {
auto* ss_axis_tcp_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data);
auto* ss_axis_txwrite_sts = bcsim::createStream((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts);
auto* ss_axis_rxread_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data);
auto* ss_axis_txread_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data);
  //Create input buffer for m_axis_tcp_data
  ap_apatb_m_axis_tcp_data_cap_bc = __xlx_m_axis_tcp_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_tcp_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_tcp_data_cap_bc];
auto* sm_axis_tcp_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data);
  //Create input buffer for m_axis_txwrite_cmd
  ap_apatb_m_axis_txwrite_cmd_cap_bc = __xlx_m_axis_txwrite_cmd_V_size_Reader.read_size();
  __cosim_s16__* __xlx_m_axis_txwrite_cmd_input_buffer= new __cosim_s16__[ap_apatb_m_axis_txwrite_cmd_cap_bc];
auto* sm_axis_txwrite_cmd = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd);
  //Create input buffer for m_axis_txread_cmd
  ap_apatb_m_axis_txread_cmd_cap_bc = __xlx_m_axis_txread_cmd_V_size_Reader.read_size();
  __cosim_s16__* __xlx_m_axis_txread_cmd_input_buffer= new __cosim_s16__[ap_apatb_m_axis_txread_cmd_cap_bc];
auto* sm_axis_txread_cmd = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd);
  //Create input buffer for m_axis_rxwrite_data
  ap_apatb_m_axis_rxwrite_data_cap_bc = __xlx_m_axis_rxwrite_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_rxwrite_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_rxwrite_data_cap_bc];
auto* sm_axis_rxwrite_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data);
  //Create input buffer for m_axis_txwrite_data
  ap_apatb_m_axis_txwrite_data_cap_bc = __xlx_m_axis_txwrite_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_txwrite_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_txwrite_data_cap_bc];
auto* sm_axis_txwrite_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data);
auto* ss_axis_session_lup_rsp = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp);
auto* ss_axis_session_upd_rsp = bcsim::createStream((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp);
  //Create input buffer for m_axis_session_lup_req
  ap_apatb_m_axis_session_lup_req_cap_bc = __xlx_m_axis_session_lup_req_V_size_Reader.read_size();
  __cosim_s12__* __xlx_m_axis_session_lup_req_input_buffer= new __cosim_s12__[ap_apatb_m_axis_session_lup_req_cap_bc];
auto* sm_axis_session_lup_req = bcsim::createStream((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req);
  //Create input buffer for m_axis_session_upd_req
  ap_apatb_m_axis_session_upd_req_cap_bc = __xlx_m_axis_session_upd_req_V_size_Reader.read_size();
  __cosim_s20__* __xlx_m_axis_session_upd_req_input_buffer= new __cosim_s20__[ap_apatb_m_axis_session_upd_req_cap_bc];
auto* sm_axis_session_upd_req = bcsim::createStream((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req);
auto* ss_axis_listen_port_req = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req);
auto* ss_axis_rx_data_req = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req);
auto* ss_axis_open_conn_req = bcsim::createStream((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req);
auto* ss_axis_close_conn_req = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req);
auto* ss_axis_tx_data_req_metadata = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata);
auto* ss_axis_tx_data_req = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req);
  //Create input buffer for m_axis_listen_port_rsp
  ap_apatb_m_axis_listen_port_rsp_cap_bc = __xlx_m_axis_listen_port_rsp_V_size_Reader.read_size();
  __cosim_s1__* __xlx_m_axis_listen_port_rsp_input_buffer= new __cosim_s1__[ap_apatb_m_axis_listen_port_rsp_cap_bc];
auto* sm_axis_listen_port_rsp = bcsim::createStream((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp);
  //Create input buffer for m_axis_notification
  ap_apatb_m_axis_notification_cap_bc = __xlx_m_axis_notification_V_size_Reader.read_size();
  __cosim_s12__* __xlx_m_axis_notification_input_buffer= new __cosim_s12__[ap_apatb_m_axis_notification_cap_bc];
auto* sm_axis_notification = bcsim::createStream((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification);
  //Create input buffer for m_axis_rx_data_rsp_metadata
  ap_apatb_m_axis_rx_data_rsp_metadata_cap_bc = __xlx_m_axis_rx_data_rsp_metadata_V_size_Reader.read_size();
  __cosim_s2__* __xlx_m_axis_rx_data_rsp_metadata_input_buffer= new __cosim_s2__[ap_apatb_m_axis_rx_data_rsp_metadata_cap_bc];
auto* sm_axis_rx_data_rsp_metadata = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata);
  //Create input buffer for m_axis_rx_data_rsp
  ap_apatb_m_axis_rx_data_rsp_cap_bc = __xlx_m_axis_rx_data_rsp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_rx_data_rsp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_rx_data_rsp_cap_bc];
auto* sm_axis_rx_data_rsp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp);
  //Create input buffer for m_axis_open_conn_rsp
  ap_apatb_m_axis_open_conn_rsp_cap_bc = __xlx_m_axis_open_conn_rsp_V_size_Reader.read_size();
  __cosim_s4__* __xlx_m_axis_open_conn_rsp_input_buffer= new __cosim_s4__[ap_apatb_m_axis_open_conn_rsp_cap_bc];
auto* sm_axis_open_conn_rsp = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp);
  //Create input buffer for m_axis_tx_data_rsp
  ap_apatb_m_axis_tx_data_rsp_cap_bc = __xlx_m_axis_tx_data_rsp_V_size_Reader.read_size();
  __cosim_s12__* __xlx_m_axis_tx_data_rsp_input_buffer= new __cosim_s12__[ap_apatb_m_axis_tx_data_rsp_cap_bc];
auto* sm_axis_tx_data_rsp = bcsim::createStream((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp);
  // DUT call
  toe_top(ss_axis_tcp_data->data<__cosim_s128__>(), ss_axis_txwrite_sts->data<__cosim_s5__>(), ss_axis_rxread_data->data<__cosim_s128__>(), ss_axis_txread_data->data<__cosim_s128__>(), sm_axis_tcp_data->data<__cosim_s128__>(), sm_axis_txwrite_cmd->data<__cosim_s16__>(), sm_axis_txread_cmd->data<__cosim_s16__>(), sm_axis_rxwrite_data->data<__cosim_s128__>(), sm_axis_txwrite_data->data<__cosim_s128__>(), ss_axis_session_lup_rsp->data<__cosim_s16__>(), ss_axis_session_upd_rsp->data<__cosim_s20__>(), sm_axis_session_lup_req->data<__cosim_s12__>(), sm_axis_session_upd_req->data<__cosim_s20__>(), ss_axis_listen_port_req->data<__cosim_s2__>(), ss_axis_rx_data_req->data<__cosim_s4__>(), ss_axis_open_conn_req->data<__cosim_s8__>(), ss_axis_close_conn_req->data<__cosim_s2__>(), ss_axis_tx_data_req_metadata->data<__cosim_s4__>(), ss_axis_tx_data_req->data<__cosim_s128__>(), sm_axis_listen_port_rsp->data<__cosim_s1__>(), sm_axis_notification->data<__cosim_s12__>(), sm_axis_rx_data_rsp_metadata->data<__cosim_s2__>(), sm_axis_rx_data_rsp->data<__cosim_s128__>(), sm_axis_open_conn_rsp->data<__cosim_s4__>(), sm_axis_tx_data_rsp->data<__cosim_s12__>(), *__xlx_apatb_param_axis_data_count, *__xlx_apatb_param_axis_max_data_count, *__xlx_apatb_param_myIpAddress, __xlx_apatb_param_regSessionCount);
ss_axis_tcp_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tcp_data);
ss_axis_txwrite_sts->transfer((hls::stream<__cosim_s5__>*)__xlx_apatb_param_s_axis_txwrite_sts);
ss_axis_rxread_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rxread_data);
ss_axis_txread_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_txread_data);
sm_axis_tcp_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp_data);
sm_axis_txwrite_cmd->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txwrite_cmd);
sm_axis_txread_cmd->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_txread_cmd);
sm_axis_rxwrite_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rxwrite_data);
sm_axis_txwrite_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_txwrite_data);
ss_axis_session_lup_rsp->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_session_lup_rsp);
ss_axis_session_upd_rsp->transfer((hls::stream<__cosim_s20__>*)__xlx_apatb_param_s_axis_session_upd_rsp);
sm_axis_session_lup_req->transfer((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_session_lup_req);
sm_axis_session_upd_req->transfer((hls::stream<__cosim_s20__>*)__xlx_apatb_param_m_axis_session_upd_req);
ss_axis_listen_port_req->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_listen_port_req);
ss_axis_rx_data_req->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_rx_data_req);
ss_axis_open_conn_req->transfer((hls::stream<__cosim_s8__>*)__xlx_apatb_param_s_axis_open_conn_req);
ss_axis_close_conn_req->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_close_conn_req);
ss_axis_tx_data_req_metadata->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_tx_data_req_metadata);
ss_axis_tx_data_req->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data_req);
sm_axis_listen_port_rsp->transfer((hls::stream<__cosim_s1__>*)__xlx_apatb_param_m_axis_listen_port_rsp);
sm_axis_notification->transfer((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_notification);
sm_axis_rx_data_rsp_metadata->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_rx_data_rsp_metadata);
sm_axis_rx_data_rsp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_rx_data_rsp);
sm_axis_open_conn_rsp->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_open_conn_rsp);
sm_axis_tx_data_rsp->transfer((hls::stream<__cosim_s12__>*)__xlx_apatb_param_m_axis_tx_data_rsp);
}
