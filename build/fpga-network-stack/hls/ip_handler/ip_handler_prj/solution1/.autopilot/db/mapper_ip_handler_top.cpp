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
unsigned int ap_apatb_s_axis_raw_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_raw_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_raw.dat");
unsigned int ap_apatb_m_axis_arp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_arp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_arp.dat");
unsigned int ap_apatb_m_axis_icmpv6_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_icmpv6_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_icmpv6.dat");
unsigned int ap_apatb_m_axis_ipv6udp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_ipv6udp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_ipv6udp.dat");
unsigned int ap_apatb_m_axis_icmp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_icmp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_icmp.dat");
unsigned int ap_apatb_m_axis_udp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_udp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_udp.dat");
unsigned int ap_apatb_m_axis_tcp_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_tcp_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_tcp.dat");
unsigned int ap_apatb_m_axis_roce_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_roce_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_roce.dat");
struct __cosim_s128__ { char data[128]; };
struct __cosim_s4__ { char data[4]; };
extern "C" void ip_handler_top(__cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s128__*, __cosim_s4__);
extern "C" void apatb_ip_handler_top_hw(volatile void * __xlx_apatb_param_s_axis_raw, volatile void * __xlx_apatb_param_m_axis_arp, volatile void * __xlx_apatb_param_m_axis_icmpv6, volatile void * __xlx_apatb_param_m_axis_ipv6udp, volatile void * __xlx_apatb_param_m_axis_icmp, volatile void * __xlx_apatb_param_m_axis_udp, volatile void * __xlx_apatb_param_m_axis_tcp, volatile void * __xlx_apatb_param_m_axis_roce, __cosim_s4__* __xlx_apatb_param_myIpAddress) {
auto* ss_axis_raw = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_raw);
  //Create input buffer for m_axis_arp
  ap_apatb_m_axis_arp_cap_bc = __xlx_m_axis_arp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_arp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_arp_cap_bc];
auto* sm_axis_arp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_arp);
  //Create input buffer for m_axis_icmpv6
  ap_apatb_m_axis_icmpv6_cap_bc = __xlx_m_axis_icmpv6_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_icmpv6_input_buffer= new __cosim_s128__[ap_apatb_m_axis_icmpv6_cap_bc];
auto* sm_axis_icmpv6 = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_icmpv6);
  //Create input buffer for m_axis_ipv6udp
  ap_apatb_m_axis_ipv6udp_cap_bc = __xlx_m_axis_ipv6udp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_ipv6udp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_ipv6udp_cap_bc];
auto* sm_axis_ipv6udp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_ipv6udp);
  //Create input buffer for m_axis_icmp
  ap_apatb_m_axis_icmp_cap_bc = __xlx_m_axis_icmp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_icmp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_icmp_cap_bc];
auto* sm_axis_icmp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_icmp);
  //Create input buffer for m_axis_udp
  ap_apatb_m_axis_udp_cap_bc = __xlx_m_axis_udp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_udp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_udp_cap_bc];
auto* sm_axis_udp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_udp);
  //Create input buffer for m_axis_tcp
  ap_apatb_m_axis_tcp_cap_bc = __xlx_m_axis_tcp_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_tcp_input_buffer= new __cosim_s128__[ap_apatb_m_axis_tcp_cap_bc];
auto* sm_axis_tcp = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp);
  //Create input buffer for m_axis_roce
  ap_apatb_m_axis_roce_cap_bc = __xlx_m_axis_roce_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_roce_input_buffer= new __cosim_s128__[ap_apatb_m_axis_roce_cap_bc];
auto* sm_axis_roce = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_roce);
  // DUT call
  ip_handler_top(ss_axis_raw->data<__cosim_s128__>(), sm_axis_arp->data<__cosim_s128__>(), sm_axis_icmpv6->data<__cosim_s128__>(), sm_axis_ipv6udp->data<__cosim_s128__>(), sm_axis_icmp->data<__cosim_s128__>(), sm_axis_udp->data<__cosim_s128__>(), sm_axis_tcp->data<__cosim_s128__>(), sm_axis_roce->data<__cosim_s128__>(), *__xlx_apatb_param_myIpAddress);
ss_axis_raw->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_raw);
sm_axis_arp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_arp);
sm_axis_icmpv6->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_icmpv6);
sm_axis_ipv6udp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_ipv6udp);
sm_axis_icmp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_icmp);
sm_axis_udp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_udp);
sm_axis_tcp->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_tcp);
sm_axis_roce->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_roce);
}
