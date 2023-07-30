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
unsigned int ap_apatb_s_axis_ip_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_ip_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_ip.dat");
unsigned int ap_apatb_s_axis_arp_lookup_reply_cap_bc;
static AESL_RUNTIME_BC __xlx_s_axis_arp_lookup_reply_V_size_Reader("../tv/stream_size/stream_size_in_s_axis_arp_lookup_reply.dat");
unsigned int ap_apatb_m_axis_ip_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_ip_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_ip.dat");
unsigned int ap_apatb_m_axis_arp_lookup_request_cap_bc;
static AESL_RUNTIME_BC __xlx_m_axis_arp_lookup_request_V_size_Reader("../tv/stream_size/stream_size_out_m_axis_arp_lookup_request.dat");
struct __cosim_s128__ { char data[128]; };
struct __cosim_s16__ { char data[16]; };
struct __cosim_s4__ { char data[4]; };
struct __cosim_s8__ { char data[8]; };
extern "C" void mac_ip_encode_top(__cosim_s128__*, __cosim_s16__*, __cosim_s128__*, __cosim_s4__*, __cosim_s8__, __cosim_s4__, __cosim_s4__);
extern "C" void apatb_mac_ip_encode_top_hw(volatile void * __xlx_apatb_param_s_axis_ip, volatile void * __xlx_apatb_param_s_axis_arp_lookup_reply, volatile void * __xlx_apatb_param_m_axis_ip, volatile void * __xlx_apatb_param_m_axis_arp_lookup_request, __cosim_s8__* __xlx_apatb_param_myMacAddress, __cosim_s4__* __xlx_apatb_param_regSubNetMask, __cosim_s4__* __xlx_apatb_param_regDefaultGateway) {
auto* ss_axis_ip = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_ip);
auto* ss_axis_arp_lookup_reply = bcsim::createStream((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_arp_lookup_reply);
  //Create input buffer for m_axis_ip
  ap_apatb_m_axis_ip_cap_bc = __xlx_m_axis_ip_V_size_Reader.read_size();
  __cosim_s128__* __xlx_m_axis_ip_input_buffer= new __cosim_s128__[ap_apatb_m_axis_ip_cap_bc];
auto* sm_axis_ip = bcsim::createStream((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_ip);
  //Create input buffer for m_axis_arp_lookup_request
  ap_apatb_m_axis_arp_lookup_request_cap_bc = __xlx_m_axis_arp_lookup_request_V_size_Reader.read_size();
  __cosim_s4__* __xlx_m_axis_arp_lookup_request_input_buffer= new __cosim_s4__[ap_apatb_m_axis_arp_lookup_request_cap_bc];
auto* sm_axis_arp_lookup_request = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_arp_lookup_request);
  // DUT call
  mac_ip_encode_top(ss_axis_ip->data<__cosim_s128__>(), ss_axis_arp_lookup_reply->data<__cosim_s16__>(), sm_axis_ip->data<__cosim_s128__>(), sm_axis_arp_lookup_request->data<__cosim_s4__>(), *__xlx_apatb_param_myMacAddress, *__xlx_apatb_param_regSubNetMask, *__xlx_apatb_param_regDefaultGateway);
ss_axis_ip->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_s_axis_ip);
ss_axis_arp_lookup_reply->transfer((hls::stream<__cosim_s16__>*)__xlx_apatb_param_s_axis_arp_lookup_reply);
sm_axis_ip->transfer((hls::stream<__cosim_s128__>*)__xlx_apatb_param_m_axis_ip);
sm_axis_arp_lookup_request->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_m_axis_arp_lookup_request);
}
