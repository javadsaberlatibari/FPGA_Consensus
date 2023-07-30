// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_valid_RAM_T2P_BRAM_1R1W (address0, ce0, d0, we0, q0,  reset,clk);

parameter DataWidth = 1;
parameter AddressWidth = 11;
parameter AddressRange = 2048;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

(* ram_style = "block" *)reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./rocev2_top_mq_meta_table_ap_uint_64_2048_s_meta_table_valid_RAM_T2P_BRAM_1R1W.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[address0] <= d0; 
        q0 <= ram[address0];
    end
end


endmodule

