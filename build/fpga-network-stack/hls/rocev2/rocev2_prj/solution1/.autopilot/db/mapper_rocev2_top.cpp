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
unsigned int ap_apatb_s_axis_rx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_data.dat");
unsigned int ap_apatb_s_axis_tx_meta_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tx_meta_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tx_meta.dat");
unsigned int ap_apatb_s_axis_tx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tx_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tx_data.dat");
unsigned int ap_apatb_m_axis_tx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_data.dat");
unsigned int ap_apatb_m_axis_mem_write_cmd_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_mem_write_cmd_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_mem_write_cmd.dat");
unsigned int ap_apatb_m_axis_mem_read_cmd_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_mem_read_cmd_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_mem_read_cmd.dat");
unsigned int ap_apatb_m_axis_mem_write_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_mem_write_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_mem_write_data.dat");
unsigned int ap_apatb_s_axis_mem_read_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_mem_read_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_mem_read_data.dat");
unsigned int ap_apatb_s_axis_qp_interface_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_qp_interface_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_qp_interface.dat");
unsigned int ap_apatb_s_axis_qp_conn_interface_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_qp_conn_interface_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_qp_conn_interface.dat");
struct __cosim_s128__ { char data[128]; };
struct __cosim_s32__ { char data[32]; };
struct __cosim_s24__ { char data[24]; };
struct __cosim_s48__ { char data[48]; };
struct __cosim_s16__ { char data[16]; };
struct __cosim_s64__ { char data[64]; };
extern "C" void rocev2_top(__cosim_s128__*, __cosim_s32__*, __cosim_s128__*, __cosim_s128__*, __cosim_s24__*, __cosim_s24__*, __cosim_s128__*, __cosim_s128__*, __cosim_s32__*, __cosim_s48__*, __cosim_s16__*, volatile void *, volatile void *);
extern "C" void apatb_rocev2_top_hw(volatile void * __xlx_apatb_param_s_axis_rx_data, volatile void * __xlx_apatb_param_s_axis_tx_meta, volatile void * __xlx_apatb_param_s_axis_tx_data, volatile void * __xlx_apatb_param_m_axis_tx_data, volatile void * __xlx_apatb_param_m_axis_mem_write_cmd, volatile void * __xlx_apatb_param_m_axis_mem_read_cmd, volatile void * __xlx_apatb_param_m_axis_mem_write_data, volatile void * __xlx_apatb_param_s_axis_mem_read_data, volatile void * __xlx_apatb_param_s_axis_qp_interface, volatile void * __xlx_apatb_param_s_axis_qp_conn_interface, __cosim_s16__* __xlx_apatb_param_local_ip_address, volatile void * __xlx_apatb_param_regCrcDropPkgCount, volatile void * __xlx_apatb_param_regInvalidPsnDropCount) {
auto* ss_axis_rx_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data);
auto* ss_axis_tx_meta = bcsim::createStream((hls::stream<__cosim_s32__>*)__xlx_apatb_param_s_axis_tx_meta);
auto* ss_axis_tx_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data);
  //Create input buffer for m_axis_tx_data
  ap_apatb_m_axis_tx_data_cap_bc = __xlx_m_axis_tx_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_tx_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_tx_data_cap_bc];
auto* sm_axis_tx_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data);
  //Create input buffer for m_axis_mem_write_cmd
  ap_apatb_m_axis_mem_write_cmd_cap_bc = __xlx_m_axis_mem_write_cmd_V_size_Reader.read_size();
  __cosim_s24__* __xlx_m_axis_mem_write_cmd_input_buffer= new __cosim_s24__[ap_apatb_m_axis_mem_write_cmd_cap_bc];
auto* sm_axis_mem_write_cmd = bcsim::createStream((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_mem_write_cmd);
  //Create input buffer for m_axis_mem_read_cmd
  ap_apatb_m_axis_mem_read_cmd_cap_bc = __xlx_m_axis_mem_read_cmd_V_size_Reader.read_size();
  __cosim_s24__* __xlx_m_axis_mem_read_cmd_input_buffer= new __cosim_s24__[ap_apatb_m_axis_mem_read_cmd_cap_bc];
auto* sm_axis_mem_read_cmd = bcsim::createStream((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_mem_read_cmd);
  //Create input buffer for m_axis_mem_write_data
  ap_apatb_m_axis_mem_write_data_cap_bc = __xlx_m_axis_mem_write_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_mem_write_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_mem_write_data_cap_bc];
auto* sm_axis_mem_write_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_mem_write_data);
auto* ss_axis_mem_read_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_mem_read_data);
auto* ss_axis_qp_interface = bcsim::createStream((hls::stream<__cosim_s32__>*)__xlx_apatb_param_s_axis_qp_interface);
auto* ss_axis_qp_conn_interface = bcsim::createStream((hls::stream<__cosim_s48__>*)__xlx_apatb_param_s_axis_qp_conn_interface);
  // DUT call
  rocev2_top(ss_axis_rx_data->data<__cosim_s128__>(), ss_axis_tx_meta->data<__cosim_s32__>(), ss_axis_tx_data->data<__cosim_s128__>(), sm_axis_tx_data->data<__cosim_s128__>(), sm_axis_mem_write_cmd->data<__cosim_s24__>(), sm_axis_mem_read_cmd->data<__cosim_s24__>(), sm_axis_mem_write_data->data<__cosim_s128__>(), ss_axis_mem_read_data->data<__cosim_s128__>(), ss_axis_qp_interface->data<__cosim_s32__>(), ss_axis_qp_conn_interface->data<__cosim_s48__>(), __xlx_apatb_param_local_ip_address, __xlx_apatb_param_regCrcDropPkgCount, __xlx_apatb_param_regInvalidPsnDropCount);
ss_axis_rx_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data);
ss_axis_tx_meta->transfer((hls::stream<__cosim_s32__>*)__xlx_apatb_param_s_axis_tx_meta);
ss_axis_tx_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_tx_data);
sm_axis_tx_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data);
sm_axis_mem_write_cmd->transfer((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_mem_write_cmd);
sm_axis_mem_read_cmd->transfer((hls::stream<__cosim_s24__>*)__xlx_apatb_param_m_axis_mem_read_cmd);
sm_axis_mem_write_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_mem_write_data);
ss_axis_mem_read_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_mem_read_data);
ss_axis_qp_interface->transfer((hls::stream<__cosim_s32__>*)__xlx_apatb_param_s_axis_qp_interface);
ss_axis_qp_conn_interface->transfer((hls::stream<__cosim_s48__>*)__xlx_apatb_param_s_axis_qp_conn_interface);
}
