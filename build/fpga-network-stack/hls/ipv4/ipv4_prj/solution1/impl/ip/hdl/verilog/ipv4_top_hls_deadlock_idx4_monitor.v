`timescale 1 ns / 1 ps

module ipv4_top_hls_deadlock_idx4_monitor ( // for module ipv4_top_ipv4_top_inst.ipv4_generate_ipv4_512_U0
    input wire clock,
    input wire reset,
    input wire [5:0] axis_block_sigs,
    input wire [8:0] inst_idle_sigs,
    input wire [3:0] inst_block_sigs,
    output wire block
);

// signal declare
reg monitor_find_block;
wire pp_is_axis_block;

assign block = monitor_find_block;
assign pp_is_axis_block = 1'b0 | axis_block_sigs[4] | axis_block_sigs[5];

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_find_block <= 1'b0;
    else if (pp_is_axis_block == 1'b1)
        monitor_find_block <= 1'b1;
    else
        monitor_find_block <= 1'b0;
end


// instant sub module
endmodule
