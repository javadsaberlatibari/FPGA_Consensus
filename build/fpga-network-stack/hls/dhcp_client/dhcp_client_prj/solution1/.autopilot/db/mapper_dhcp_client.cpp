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
unsigned int ap_apatb_m_axis_open_port_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_open_port_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_open_port.dat");
unsigned int ap_apatb_s_axis_open_port_status_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_open_port_status_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_open_port_status.dat");
unsigned int ap_apatb_s_axis_rx_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_metadata_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_metadata.dat");
unsigned int ap_apatb_s_axis_rx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_data.dat");
unsigned int ap_apatb_m_axis_tx_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_metadata_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_metadata.dat");
unsigned int ap_apatb_m_axis_tx_length_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_length_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_length.dat");
unsigned int ap_apatb_m_axis_tx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_data.dat");
struct __cosim_s2__ { char data[2]; };
struct __cosim_s1__ { char data[1]; };
struct __cosim_s16__ { char data[16]; };
extern "C" void dhcp_client(__cosim_s2__*, __cosim_s1__*, __cosim_s16__*, __cosim_s16__*, __cosim_s16__*, __cosim_s2__*, __cosim_s16__*, volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_dhcp_client_hw(volatile void * __xlx_apatb_param_m_axis_open_port, volatile void * __xlx_apatb_param_s_axis_open_port_status, volatile void * __xlx_apatb_param_s_axis_rx_metadata, volatile void * __xlx_apatb_param_s_axis_rx_data, volatile void * __xlx_apatb_param_m_axis_tx_metadata, volatile void * __xlx_apatb_param_m_axis_tx_length, volatile void * __xlx_apatb_param_m_axis_tx_data, volatile void * __xlx_apatb_param_dhcpEnable, volatile void * __xlx_apatb_param_inputIpAddress, volatile void * __xlx_apatb_param_dhcpIpAddressOut, volatile void * __xlx_apatb_param_myMacAddress) {
  //Create input buffer for m_axis_open_port
  ap_apatb_m_axis_open_port_cap_bc = __xlx_m_axis_open_port_V_size_Reader.read_size();
  __cosim_s2__* __xlx_m_axis_open_port_input_buffer= new __cosim_s2__[ap_apatb_m_axis_open_port_cap_bc];
auto* sm_axis_open_port = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_open_port);
auto* ss_axis_open_port_status = bcsim::createStream((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_open_port_status);
auto* ss_axis_rx_metadata = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_rx_metadata);
auto* ss_axis_rx_data = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_rx_data);
  //Create input buffer for m_axis_tx_metadata
  ap_apatb_m_axis_tx_metadata_cap_bc = __xlx_m_axis_tx_metadata_V_size_Reader.read_size();
  __cosim_s16__* __xlx_m_axis_tx_metadata_input_buffer= new __cosim_s16__[ap_apatb_m_axis_tx_metadata_cap_bc];
auto* sm_axis_tx_metadata = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_tx_metadata);
  //Create input buffer for m_axis_tx_length
  ap_apatb_m_axis_tx_length_cap_bc = __xlx_m_axis_tx_length_V_size_Reader.read_size();
  __cosim_s2__* __xlx_m_axis_tx_length_input_buffer= new __cosim_s2__[ap_apatb_m_axis_tx_length_cap_bc];
auto* sm_axis_tx_length = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_tx_length);
  //Create input buffer for m_axis_tx_data
  ap_apatb_m_axis_tx_data_cap_bc = __xlx_m_axis_tx_data_V_size_Reader.read_size();
  __cosim_s16__* __xlx_m_axis_tx_data_input_buffer= new __cosim_s16__[ap_apatb_m_axis_tx_data_cap_bc];
auto* sm_axis_tx_data = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_tx_data);
  // DUT call
  dhcp_client(sm_axis_open_port->data<__cosim_s2__>(), ss_axis_open_port_status->data<__cosim_s1__>(), ss_axis_rx_metadata->data<__cosim_s16__>(), ss_axis_rx_data->data<__cosim_s16__>(), sm_axis_tx_metadata->data<__cosim_s16__>(), sm_axis_tx_length->data<__cosim_s2__>(), sm_axis_tx_data->data<__cosim_s16__>(), __xlx_apatb_param_dhcpEnable, __xlx_apatb_param_inputIpAddress, __xlx_apatb_param_dhcpIpAddressOut, __xlx_apatb_param_myMacAddress);
sm_axis_open_port->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_open_port);
ss_axis_open_port_status->transfer((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_open_port_status);
ss_axis_rx_metadata->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_rx_metadata);
ss_axis_rx_data->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_rx_data);
sm_axis_tx_metadata->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_tx_metadata);
sm_axis_tx_length->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_tx_length);
sm_axis_tx_data->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_m_axis_tx_data);
}
