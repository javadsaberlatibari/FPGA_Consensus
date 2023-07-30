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
unsigned int ap_apatb_m_axis_listen_port_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_listen_port_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_listen_port.dat");
unsigned int ap_apatb_s_axis_listen_port_status_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_listen_port_status_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_listen_port_status.dat");
unsigned int ap_apatb_s_axis_notifications_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_notifications_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_notifications.dat");
unsigned int ap_apatb_m_axis_read_package_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_read_package_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_read_package.dat");
unsigned int ap_apatb_s_axis_rx_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_metadata_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_metadata.dat");
unsigned int ap_apatb_s_axis_rx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_rx_data_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_rx_data.dat");
unsigned int ap_apatb_m_axis_open_connection_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_open_connection_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_open_connection.dat");
unsigned int ap_apatb_s_axis_open_status_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_open_status_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_open_status.dat");
unsigned int ap_apatb_m_axis_close_connection_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_close_connection_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_close_connection.dat");
unsigned int ap_apatb_m_axis_tx_metadata_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_metadata_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_metadata.dat");
unsigned int ap_apatb_m_axis_tx_data_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tx_data_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tx_data.dat");
unsigned int ap_apatb_s_axis_tx_status_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_tx_status_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_tx_status.dat");
struct __cosim_s2__ { char data[2]; };
struct __cosim_s1__ { char data[1]; };
struct __cosim_s12__ { char data[12]; };
struct __cosim_s4__ { char data[4]; };
struct __cosim_s128__ { char data[128]; };
struct __cosim_s8__ { char data[8]; };
struct __cosim_s16__ { char data[16]; };
extern "C" void iperf_client(__cosim_s2__*, __cosim_s1__*, __cosim_s12__*, __cosim_s4__*, __cosim_s2__*, __cosim_s128__*, __cosim_s8__*, __cosim_s4__*, __cosim_s2__*, __cosim_s4__*, __cosim_s128__*, __cosim_s12__*, __cosim_s1__, __cosim_s1__, __cosim_s2__, __cosim_s1__, __cosim_s1__, __cosim_s4__, __cosim_s8__, __cosim_s2__, __cosim_s2__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__, __cosim_s4__);
extern "C" void apatb_iperf_client_hw(volatile void * __xlx_apatb_param_m_axis_listen_port, volatile void * __xlx_apatb_param_s_axis_listen_port_status, volatile void * __xlx_apatb_param_s_axis_notifications, volatile void * __xlx_apatb_param_m_axis_read_package, volatile void * __xlx_apatb_param_s_axis_rx_metadata, volatile void * __xlx_apatb_param_s_axis_rx_data, volatile void * __xlx_apatb_param_m_axis_open_connection, volatile void * __xlx_apatb_param_s_axis_open_status, volatile void * __xlx_apatb_param_m_axis_close_connection, volatile void * __xlx_apatb_param_m_axis_tx_metadata, volatile void * __xlx_apatb_param_m_axis_tx_data, volatile void * __xlx_apatb_param_s_axis_tx_status, __cosim_s1__* __xlx_apatb_param_runExperiment, __cosim_s1__* __xlx_apatb_param_dualModeEn, __cosim_s2__* __xlx_apatb_param_useConn, __cosim_s1__* __xlx_apatb_param_pkgWordCount, __cosim_s1__* __xlx_apatb_param_packetGap, __cosim_s4__* __xlx_apatb_param_timeInSeconds, __cosim_s8__* __xlx_apatb_param_timeInCycles, __cosim_s2__* __xlx_apatb_param_useIpAddr, __cosim_s2__* __xlx_apatb_param_regBasePort, __cosim_s4__* __xlx_apatb_param_regIpAddress0, __cosim_s4__* __xlx_apatb_param_regIpAddress1, __cosim_s4__* __xlx_apatb_param_regIpAddress2, __cosim_s4__* __xlx_apatb_param_regIpAddress3, __cosim_s4__* __xlx_apatb_param_regIpAddress4, __cosim_s4__* __xlx_apatb_param_regIpAddress5, __cosim_s4__* __xlx_apatb_param_regIpAddress6, __cosim_s4__* __xlx_apatb_param_regIpAddress7, __cosim_s4__* __xlx_apatb_param_regIpAddress8, __cosim_s4__* __xlx_apatb_param_regIpAddress9) {
  //Create input buffer for m_axis_listen_port
  ap_apatb_m_axis_listen_port_cap_bc = __xlx_m_axis_listen_port_V_size_Reader.read_size();
  __cosim_s2__* __xlx_m_axis_listen_port_input_buffer= new __cosim_s2__[ap_apatb_m_axis_listen_port_cap_bc];
auto* sm_axis_listen_port = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port);
auto* ss_axis_listen_port_status = bcsim::createStream((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status);
auto* ss_axis_notifications = bcsim::createStream((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications);
  //Create input buffer for m_axis_read_package
  ap_apatb_m_axis_read_package_cap_bc = __xlx_m_axis_read_package_V_size_Reader.read_size();
  __cosim_s4__* __xlx_m_axis_read_package_input_buffer= new __cosim_s4__[ap_apatb_m_axis_read_package_cap_bc];
auto* sm_axis_read_package = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package);
auto* ss_axis_rx_metadata = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata);
auto* ss_axis_rx_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data);
  //Create input buffer for m_axis_open_connection
  ap_apatb_m_axis_open_connection_cap_bc = __xlx_m_axis_open_connection_V_size_Reader.read_size();
  __cosim_s8__* __xlx_m_axis_open_connection_input_buffer= new __cosim_s8__[ap_apatb_m_axis_open_connection_cap_bc];
auto* sm_axis_open_connection = bcsim::createStream((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection);
auto* ss_axis_open_status = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status);
  //Create input buffer for m_axis_close_connection
  ap_apatb_m_axis_close_connection_cap_bc = __xlx_m_axis_close_connection_V_size_Reader.read_size();
  __cosim_s2__* __xlx_m_axis_close_connection_input_buffer= new __cosim_s2__[ap_apatb_m_axis_close_connection_cap_bc];
auto* sm_axis_close_connection = bcsim::createStream((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection);
  //Create input buffer for m_axis_tx_metadata
  ap_apatb_m_axis_tx_metadata_cap_bc = __xlx_m_axis_tx_metadata_V_size_Reader.read_size();
  __cosim_s4__* __xlx_m_axis_tx_metadata_input_buffer= new __cosim_s4__[ap_apatb_m_axis_tx_metadata_cap_bc];
auto* sm_axis_tx_metadata = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata);
  //Create input buffer for m_axis_tx_data
  ap_apatb_m_axis_tx_data_cap_bc = __xlx_m_axis_tx_data_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_tx_data_input_buffer= new __cosim_s128__[ap_apatb_m_axis_tx_data_cap_bc];
auto* sm_axis_tx_data = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data);
auto* ss_axis_tx_status = bcsim::createStream((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status);
  // DUT call
  iperf_client(sm_axis_listen_port->data<__cosim_s2__>(), ss_axis_listen_port_status->data<__cosim_s1__>(), ss_axis_notifications->data<__cosim_s12__>(), sm_axis_read_package->data<__cosim_s4__>(), ss_axis_rx_metadata->data<__cosim_s2__>(), ss_axis_rx_data->data<__cosim_s128__>(), sm_axis_open_connection->data<__cosim_s8__>(), ss_axis_open_status->data<__cosim_s4__>(), sm_axis_close_connection->data<__cosim_s2__>(), sm_axis_tx_metadata->data<__cosim_s4__>(), sm_axis_tx_data->data<__cosim_s128__>(), ss_axis_tx_status->data<__cosim_s12__>(), *__xlx_apatb_param_runExperiment, *__xlx_apatb_param_dualModeEn, *__xlx_apatb_param_useConn, *__xlx_apatb_param_pkgWordCount, *__xlx_apatb_param_packetGap, *__xlx_apatb_param_timeInSeconds, *__xlx_apatb_param_timeInCycles, *__xlx_apatb_param_useIpAddr, *__xlx_apatb_param_regBasePort, *__xlx_apatb_param_regIpAddress0, *__xlx_apatb_param_regIpAddress1, *__xlx_apatb_param_regIpAddress2, *__xlx_apatb_param_regIpAddress3, *__xlx_apatb_param_regIpAddress4, *__xlx_apatb_param_regIpAddress5, *__xlx_apatb_param_regIpAddress6, *__xlx_apatb_param_regIpAddress7, *__xlx_apatb_param_regIpAddress8, *__xlx_apatb_param_regIpAddress9);
sm_axis_listen_port->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_listen_port);
ss_axis_listen_port_status->transfer((hls::stream<__cosim_s1__>*)__xlx_apatb_param_s_axis_listen_port_status);
ss_axis_notifications->transfer((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_notifications);
sm_axis_read_package->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_read_package);
ss_axis_rx_metadata->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_s_axis_rx_metadata);
ss_axis_rx_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_rx_data);
sm_axis_open_connection->transfer((hls::stream<__cosim_s8__>*)__xlx_apatb_param_m_axis_open_connection);
ss_axis_open_status->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_s_axis_open_status);
sm_axis_close_connection->transfer((hls::stream<__cosim_s2__>*)__xlx_apatb_param_m_axis_close_connection);
sm_axis_tx_metadata->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_tx_metadata);
sm_axis_tx_data->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tx_data);
ss_axis_tx_status->transfer((hls::stream<__cosim_s12__>*)__xlx_apatb_param_s_axis_tx_status);
}
