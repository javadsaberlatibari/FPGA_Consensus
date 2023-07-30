// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_H__
#define __rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 24;
  static const unsigned AddressRange = 500;
  static const unsigned AddressWidth = 9;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in <sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> we1;
sc_core::sc_in<sc_lv<DataWidth> > d1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_ram) {
        for (unsigned i = 0; i < 500; i = i + 1) {
            ram[i] = 0;
        }
   }


}; //endmodule


SC_MODULE(rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W) {


static const unsigned DataWidth = 24;
static const unsigned AddressRange = 500;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in<sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> we1;
sc_core::sc_in<sc_lv<DataWidth> > d1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_ram* meminst;


SC_CTOR(rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W) {
meminst = new rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_ram("rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W_ram");

meminst->address1(address1);
meminst->ce1(ce1);
meminst->q1(q1);
meminst->we1(we1);
meminst->d1(d1);

meminst->reset(reset);
meminst->clk(clk);
}
~rocev2_top_state_table_state_table_req_old_unack_V_RAM_2P_BRAM_1R1W() {
    delete meminst;
}


};//endmodule
#endif
