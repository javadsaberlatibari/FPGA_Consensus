#include <iostream>
#include "hls_stream.h"

using namespace std;

struct __cosim_T_8__ {char data[8];};
extern "C" void fpga_fifo_push_8(__cosim_T_8__* val, hls::stream<__cosim_T_8__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_8(__cosim_T_8__* val, hls::stream<__cosim_T_8__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_8(hls::stream<__cosim_T_8__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_8(hls::stream<__cosim_T_8__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_32__ {char data[32];};
extern "C" void fpga_fifo_push_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_32(hls::stream<__cosim_T_32__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_32(hls::stream<__cosim_T_32__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_128__ {char data[128];};
extern "C" void fpga_fifo_push_128(__cosim_T_128__* val, hls::stream<__cosim_T_128__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_128(__cosim_T_128__* val, hls::stream<__cosim_T_128__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_128(hls::stream<__cosim_T_128__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_128(hls::stream<__cosim_T_128__>* fifo) {
  return fifo->exist();
}
