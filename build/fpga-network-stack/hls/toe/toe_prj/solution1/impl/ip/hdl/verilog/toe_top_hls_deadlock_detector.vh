
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [1:0] proc_0_data_FIFO_blk;
    wire [1:0] proc_0_data_PIPO_blk;
    wire [1:0] proc_0_start_FIFO_blk;
    wire [1:0] proc_0_TLF_FIFO_blk;
    wire [1:0] proc_0_input_sync_blk;
    wire [1:0] proc_0_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_0;
    reg [1:0] proc_dep_vld_vec_0_reg;
    wire [1:0] in_chan_dep_vld_vec_0;
    wire [119:0] in_chan_dep_data_vec_0;
    wire [1:0] token_in_vec_0;
    wire [1:0] out_chan_dep_vld_vec_0;
    wire [59:0] out_chan_dep_data_0;
    wire [1:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [59:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [59:0] dep_chan_data_2_0;
    wire token_2_0;
    wire [5:0] proc_1_data_FIFO_blk;
    wire [5:0] proc_1_data_PIPO_blk;
    wire [5:0] proc_1_start_FIFO_blk;
    wire [5:0] proc_1_TLF_FIFO_blk;
    wire [5:0] proc_1_input_sync_blk;
    wire [5:0] proc_1_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_1;
    reg [5:0] proc_dep_vld_vec_1_reg;
    wire [5:0] in_chan_dep_vld_vec_1;
    wire [359:0] in_chan_dep_data_vec_1;
    wire [5:0] token_in_vec_1;
    wire [5:0] out_chan_dep_vld_vec_1;
    wire [59:0] out_chan_dep_data_1;
    wire [5:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [59:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_2_1;
    wire [59:0] dep_chan_data_2_1;
    wire token_2_1;
    wire dep_chan_vld_3_1;
    wire [59:0] dep_chan_data_3_1;
    wire token_3_1;
    wire dep_chan_vld_4_1;
    wire [59:0] dep_chan_data_4_1;
    wire token_4_1;
    wire dep_chan_vld_31_1;
    wire [59:0] dep_chan_data_31_1;
    wire token_31_1;
    wire dep_chan_vld_58_1;
    wire [59:0] dep_chan_data_58_1;
    wire token_58_1;
    wire [2:0] proc_2_data_FIFO_blk;
    wire [2:0] proc_2_data_PIPO_blk;
    wire [2:0] proc_2_start_FIFO_blk;
    wire [2:0] proc_2_TLF_FIFO_blk;
    wire [2:0] proc_2_input_sync_blk;
    wire [2:0] proc_2_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_2;
    reg [2:0] proc_dep_vld_vec_2_reg;
    wire [2:0] in_chan_dep_vld_vec_2;
    wire [179:0] in_chan_dep_data_vec_2;
    wire [2:0] token_in_vec_2;
    wire [2:0] out_chan_dep_vld_vec_2;
    wire [59:0] out_chan_dep_data_2;
    wire [2:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [59:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_1_2;
    wire [59:0] dep_chan_data_1_2;
    wire token_1_2;
    wire dep_chan_vld_4_2;
    wire [59:0] dep_chan_data_4_2;
    wire token_4_2;
    wire [0:0] proc_3_data_FIFO_blk;
    wire [0:0] proc_3_data_PIPO_blk;
    wire [0:0] proc_3_start_FIFO_blk;
    wire [0:0] proc_3_TLF_FIFO_blk;
    wire [0:0] proc_3_input_sync_blk;
    wire [0:0] proc_3_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_3;
    reg [0:0] proc_dep_vld_vec_3_reg;
    wire [0:0] in_chan_dep_vld_vec_3;
    wire [59:0] in_chan_dep_data_vec_3;
    wire [0:0] token_in_vec_3;
    wire [0:0] out_chan_dep_vld_vec_3;
    wire [59:0] out_chan_dep_data_3;
    wire [0:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_1_3;
    wire [59:0] dep_chan_data_1_3;
    wire token_1_3;
    wire [5:0] proc_4_data_FIFO_blk;
    wire [5:0] proc_4_data_PIPO_blk;
    wire [5:0] proc_4_start_FIFO_blk;
    wire [5:0] proc_4_TLF_FIFO_blk;
    wire [5:0] proc_4_input_sync_blk;
    wire [5:0] proc_4_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_4;
    reg [5:0] proc_dep_vld_vec_4_reg;
    wire [5:0] in_chan_dep_vld_vec_4;
    wire [359:0] in_chan_dep_data_vec_4;
    wire [5:0] token_in_vec_4;
    wire [5:0] out_chan_dep_vld_vec_4;
    wire [59:0] out_chan_dep_data_4;
    wire [5:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_1_4;
    wire [59:0] dep_chan_data_1_4;
    wire token_1_4;
    wire dep_chan_vld_2_4;
    wire [59:0] dep_chan_data_2_4;
    wire token_2_4;
    wire dep_chan_vld_5_4;
    wire [59:0] dep_chan_data_5_4;
    wire token_5_4;
    wire dep_chan_vld_9_4;
    wire [59:0] dep_chan_data_9_4;
    wire token_9_4;
    wire dep_chan_vld_35_4;
    wire [59:0] dep_chan_data_35_4;
    wire token_35_4;
    wire dep_chan_vld_37_4;
    wire [59:0] dep_chan_data_37_4;
    wire token_37_4;
    wire [4:0] proc_5_data_FIFO_blk;
    wire [4:0] proc_5_data_PIPO_blk;
    wire [4:0] proc_5_start_FIFO_blk;
    wire [4:0] proc_5_TLF_FIFO_blk;
    wire [4:0] proc_5_input_sync_blk;
    wire [4:0] proc_5_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_5;
    reg [4:0] proc_dep_vld_vec_5_reg;
    wire [4:0] in_chan_dep_vld_vec_5;
    wire [299:0] in_chan_dep_data_vec_5;
    wire [4:0] token_in_vec_5;
    wire [4:0] out_chan_dep_vld_vec_5;
    wire [59:0] out_chan_dep_data_5;
    wire [4:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_4_5;
    wire [59:0] dep_chan_data_4_5;
    wire token_4_5;
    wire dep_chan_vld_16_5;
    wire [59:0] dep_chan_data_16_5;
    wire token_16_5;
    wire dep_chan_vld_32_5;
    wire [59:0] dep_chan_data_32_5;
    wire token_32_5;
    wire dep_chan_vld_55_5;
    wire [59:0] dep_chan_data_55_5;
    wire token_55_5;
    wire dep_chan_vld_58_5;
    wire [59:0] dep_chan_data_58_5;
    wire token_58_5;
    wire [2:0] proc_6_data_FIFO_blk;
    wire [2:0] proc_6_data_PIPO_blk;
    wire [2:0] proc_6_start_FIFO_blk;
    wire [2:0] proc_6_TLF_FIFO_blk;
    wire [2:0] proc_6_input_sync_blk;
    wire [2:0] proc_6_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_6;
    reg [2:0] proc_dep_vld_vec_6_reg;
    wire [2:0] in_chan_dep_vld_vec_6;
    wire [179:0] in_chan_dep_data_vec_6;
    wire [2:0] token_in_vec_6;
    wire [2:0] out_chan_dep_vld_vec_6;
    wire [59:0] out_chan_dep_data_6;
    wire [2:0] token_out_vec_6;
    wire dl_detect_out_6;
    wire dep_chan_vld_32_6;
    wire [59:0] dep_chan_data_32_6;
    wire token_32_6;
    wire dep_chan_vld_35_6;
    wire [59:0] dep_chan_data_35_6;
    wire token_35_6;
    wire dep_chan_vld_49_6;
    wire [59:0] dep_chan_data_49_6;
    wire token_49_6;
    wire [3:0] proc_7_data_FIFO_blk;
    wire [3:0] proc_7_data_PIPO_blk;
    wire [3:0] proc_7_start_FIFO_blk;
    wire [3:0] proc_7_TLF_FIFO_blk;
    wire [3:0] proc_7_input_sync_blk;
    wire [3:0] proc_7_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_7;
    reg [3:0] proc_dep_vld_vec_7_reg;
    wire [3:0] in_chan_dep_vld_vec_7;
    wire [239:0] in_chan_dep_data_vec_7;
    wire [3:0] token_in_vec_7;
    wire [3:0] out_chan_dep_vld_vec_7;
    wire [59:0] out_chan_dep_data_7;
    wire [3:0] token_out_vec_7;
    wire dl_detect_out_7;
    wire dep_chan_vld_32_7;
    wire [59:0] dep_chan_data_32_7;
    wire token_32_7;
    wire dep_chan_vld_35_7;
    wire [59:0] dep_chan_data_35_7;
    wire token_35_7;
    wire dep_chan_vld_54_7;
    wire [59:0] dep_chan_data_54_7;
    wire token_54_7;
    wire dep_chan_vld_59_7;
    wire [59:0] dep_chan_data_59_7;
    wire token_59_7;
    wire [2:0] proc_8_data_FIFO_blk;
    wire [2:0] proc_8_data_PIPO_blk;
    wire [2:0] proc_8_start_FIFO_blk;
    wire [2:0] proc_8_TLF_FIFO_blk;
    wire [2:0] proc_8_input_sync_blk;
    wire [2:0] proc_8_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_8;
    reg [2:0] proc_dep_vld_vec_8_reg;
    wire [2:0] in_chan_dep_vld_vec_8;
    wire [179:0] in_chan_dep_data_vec_8;
    wire [2:0] token_in_vec_8;
    wire [2:0] out_chan_dep_vld_vec_8;
    wire [59:0] out_chan_dep_data_8;
    wire [2:0] token_out_vec_8;
    wire dl_detect_out_8;
    wire dep_chan_vld_10_8;
    wire [59:0] dep_chan_data_10_8;
    wire token_10_8;
    wire dep_chan_vld_11_8;
    wire [59:0] dep_chan_data_11_8;
    wire token_11_8;
    wire dep_chan_vld_51_8;
    wire [59:0] dep_chan_data_51_8;
    wire token_51_8;
    wire [3:0] proc_9_data_FIFO_blk;
    wire [3:0] proc_9_data_PIPO_blk;
    wire [3:0] proc_9_start_FIFO_blk;
    wire [3:0] proc_9_TLF_FIFO_blk;
    wire [3:0] proc_9_input_sync_blk;
    wire [3:0] proc_9_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_9;
    reg [3:0] proc_dep_vld_vec_9_reg;
    wire [3:0] in_chan_dep_vld_vec_9;
    wire [239:0] in_chan_dep_data_vec_9;
    wire [3:0] token_in_vec_9;
    wire [3:0] out_chan_dep_vld_vec_9;
    wire [59:0] out_chan_dep_data_9;
    wire [3:0] token_out_vec_9;
    wire dl_detect_out_9;
    wire dep_chan_vld_4_9;
    wire [59:0] dep_chan_data_4_9;
    wire token_4_9;
    wire dep_chan_vld_10_9;
    wire [59:0] dep_chan_data_10_9;
    wire token_10_9;
    wire dep_chan_vld_11_9;
    wire [59:0] dep_chan_data_11_9;
    wire token_11_9;
    wire dep_chan_vld_58_9;
    wire [59:0] dep_chan_data_58_9;
    wire token_58_9;
    wire [3:0] proc_10_data_FIFO_blk;
    wire [3:0] proc_10_data_PIPO_blk;
    wire [3:0] proc_10_start_FIFO_blk;
    wire [3:0] proc_10_TLF_FIFO_blk;
    wire [3:0] proc_10_input_sync_blk;
    wire [3:0] proc_10_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_10;
    reg [3:0] proc_dep_vld_vec_10_reg;
    wire [3:0] in_chan_dep_vld_vec_10;
    wire [239:0] in_chan_dep_data_vec_10;
    wire [3:0] token_in_vec_10;
    wire [3:0] out_chan_dep_vld_vec_10;
    wire [59:0] out_chan_dep_data_10;
    wire [3:0] token_out_vec_10;
    wire dl_detect_out_10;
    wire dep_chan_vld_8_10;
    wire [59:0] dep_chan_data_8_10;
    wire token_8_10;
    wire dep_chan_vld_9_10;
    wire [59:0] dep_chan_data_9_10;
    wire token_9_10;
    wire dep_chan_vld_11_10;
    wire [59:0] dep_chan_data_11_10;
    wire token_11_10;
    wire dep_chan_vld_26_10;
    wire [59:0] dep_chan_data_26_10;
    wire token_26_10;
    wire [3:0] proc_11_data_FIFO_blk;
    wire [3:0] proc_11_data_PIPO_blk;
    wire [3:0] proc_11_start_FIFO_blk;
    wire [3:0] proc_11_TLF_FIFO_blk;
    wire [3:0] proc_11_input_sync_blk;
    wire [3:0] proc_11_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_11;
    reg [3:0] proc_dep_vld_vec_11_reg;
    wire [3:0] in_chan_dep_vld_vec_11;
    wire [239:0] in_chan_dep_data_vec_11;
    wire [3:0] token_in_vec_11;
    wire [3:0] out_chan_dep_vld_vec_11;
    wire [59:0] out_chan_dep_data_11;
    wire [3:0] token_out_vec_11;
    wire dl_detect_out_11;
    wire dep_chan_vld_8_11;
    wire [59:0] dep_chan_data_8_11;
    wire token_8_11;
    wire dep_chan_vld_9_11;
    wire [59:0] dep_chan_data_9_11;
    wire token_9_11;
    wire dep_chan_vld_10_11;
    wire [59:0] dep_chan_data_10_11;
    wire token_10_11;
    wire dep_chan_vld_31_11;
    wire [59:0] dep_chan_data_31_11;
    wire token_31_11;
    wire [2:0] proc_12_data_FIFO_blk;
    wire [2:0] proc_12_data_PIPO_blk;
    wire [2:0] proc_12_start_FIFO_blk;
    wire [2:0] proc_12_TLF_FIFO_blk;
    wire [2:0] proc_12_input_sync_blk;
    wire [2:0] proc_12_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_12;
    reg [2:0] proc_dep_vld_vec_12_reg;
    wire [2:0] in_chan_dep_vld_vec_12;
    wire [179:0] in_chan_dep_data_vec_12;
    wire [2:0] token_in_vec_12;
    wire [2:0] out_chan_dep_vld_vec_12;
    wire [59:0] out_chan_dep_data_12;
    wire [2:0] token_out_vec_12;
    wire dl_detect_out_12;
    wire dep_chan_vld_13_12;
    wire [59:0] dep_chan_data_13_12;
    wire token_13_12;
    wire dep_chan_vld_14_12;
    wire [59:0] dep_chan_data_14_12;
    wire token_14_12;
    wire dep_chan_vld_17_12;
    wire [59:0] dep_chan_data_17_12;
    wire token_17_12;
    wire [5:0] proc_13_data_FIFO_blk;
    wire [5:0] proc_13_data_PIPO_blk;
    wire [5:0] proc_13_start_FIFO_blk;
    wire [5:0] proc_13_TLF_FIFO_blk;
    wire [5:0] proc_13_input_sync_blk;
    wire [5:0] proc_13_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_13;
    reg [5:0] proc_dep_vld_vec_13_reg;
    wire [5:0] in_chan_dep_vld_vec_13;
    wire [359:0] in_chan_dep_data_vec_13;
    wire [5:0] token_in_vec_13;
    wire [5:0] out_chan_dep_vld_vec_13;
    wire [59:0] out_chan_dep_data_13;
    wire [5:0] token_out_vec_13;
    wire dl_detect_out_13;
    wire dep_chan_vld_12_13;
    wire [59:0] dep_chan_data_12_13;
    wire token_12_13;
    wire dep_chan_vld_16_13;
    wire [59:0] dep_chan_data_16_13;
    wire token_16_13;
    wire dep_chan_vld_32_13;
    wire [59:0] dep_chan_data_32_13;
    wire token_32_13;
    wire dep_chan_vld_35_13;
    wire [59:0] dep_chan_data_35_13;
    wire token_35_13;
    wire dep_chan_vld_52_13;
    wire [59:0] dep_chan_data_52_13;
    wire token_52_13;
    wire dep_chan_vld_58_13;
    wire [59:0] dep_chan_data_58_13;
    wire token_58_13;
    wire [2:0] proc_14_data_FIFO_blk;
    wire [2:0] proc_14_data_PIPO_blk;
    wire [2:0] proc_14_start_FIFO_blk;
    wire [2:0] proc_14_TLF_FIFO_blk;
    wire [2:0] proc_14_input_sync_blk;
    wire [2:0] proc_14_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_14;
    reg [2:0] proc_dep_vld_vec_14_reg;
    wire [2:0] in_chan_dep_vld_vec_14;
    wire [179:0] in_chan_dep_data_vec_14;
    wire [2:0] token_in_vec_14;
    wire [2:0] out_chan_dep_vld_vec_14;
    wire [59:0] out_chan_dep_data_14;
    wire [2:0] token_out_vec_14;
    wire dl_detect_out_14;
    wire dep_chan_vld_12_14;
    wire [59:0] dep_chan_data_12_14;
    wire token_12_14;
    wire dep_chan_vld_32_14;
    wire [59:0] dep_chan_data_32_14;
    wire token_32_14;
    wire dep_chan_vld_35_14;
    wire [59:0] dep_chan_data_35_14;
    wire token_35_14;
    wire [1:0] proc_15_data_FIFO_blk;
    wire [1:0] proc_15_data_PIPO_blk;
    wire [1:0] proc_15_start_FIFO_blk;
    wire [1:0] proc_15_TLF_FIFO_blk;
    wire [1:0] proc_15_input_sync_blk;
    wire [1:0] proc_15_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_15;
    reg [1:0] proc_dep_vld_vec_15_reg;
    wire [1:0] in_chan_dep_vld_vec_15;
    wire [119:0] in_chan_dep_data_vec_15;
    wire [1:0] token_in_vec_15;
    wire [1:0] out_chan_dep_vld_vec_15;
    wire [59:0] out_chan_dep_data_15;
    wire [1:0] token_out_vec_15;
    wire dl_detect_out_15;
    wire dep_chan_vld_16_15;
    wire [59:0] dep_chan_data_16_15;
    wire token_16_15;
    wire dep_chan_vld_32_15;
    wire [59:0] dep_chan_data_32_15;
    wire token_32_15;
    wire [2:0] proc_16_data_FIFO_blk;
    wire [2:0] proc_16_data_PIPO_blk;
    wire [2:0] proc_16_start_FIFO_blk;
    wire [2:0] proc_16_TLF_FIFO_blk;
    wire [2:0] proc_16_input_sync_blk;
    wire [2:0] proc_16_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_16;
    reg [2:0] proc_dep_vld_vec_16_reg;
    wire [2:0] in_chan_dep_vld_vec_16;
    wire [179:0] in_chan_dep_data_vec_16;
    wire [2:0] token_in_vec_16;
    wire [2:0] out_chan_dep_vld_vec_16;
    wire [59:0] out_chan_dep_data_16;
    wire [2:0] token_out_vec_16;
    wire dl_detect_out_16;
    wire dep_chan_vld_5_16;
    wire [59:0] dep_chan_data_5_16;
    wire token_5_16;
    wire dep_chan_vld_13_16;
    wire [59:0] dep_chan_data_13_16;
    wire token_13_16;
    wire dep_chan_vld_15_16;
    wire [59:0] dep_chan_data_15_16;
    wire token_15_16;
    wire [4:0] proc_17_data_FIFO_blk;
    wire [4:0] proc_17_data_PIPO_blk;
    wire [4:0] proc_17_start_FIFO_blk;
    wire [4:0] proc_17_TLF_FIFO_blk;
    wire [4:0] proc_17_input_sync_blk;
    wire [4:0] proc_17_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_17;
    reg [4:0] proc_dep_vld_vec_17_reg;
    wire [4:0] in_chan_dep_vld_vec_17;
    wire [299:0] in_chan_dep_data_vec_17;
    wire [4:0] token_in_vec_17;
    wire [4:0] out_chan_dep_vld_vec_17;
    wire [59:0] out_chan_dep_data_17;
    wire [4:0] token_out_vec_17;
    wire dl_detect_out_17;
    wire dep_chan_vld_12_17;
    wire [59:0] dep_chan_data_12_17;
    wire token_12_17;
    wire dep_chan_vld_18_17;
    wire [59:0] dep_chan_data_18_17;
    wire token_18_17;
    wire dep_chan_vld_34_17;
    wire [59:0] dep_chan_data_34_17;
    wire token_34_17;
    wire dep_chan_vld_35_17;
    wire [59:0] dep_chan_data_35_17;
    wire token_35_17;
    wire dep_chan_vld_53_17;
    wire [59:0] dep_chan_data_53_17;
    wire token_53_17;
    wire [1:0] proc_18_data_FIFO_blk;
    wire [1:0] proc_18_data_PIPO_blk;
    wire [1:0] proc_18_start_FIFO_blk;
    wire [1:0] proc_18_TLF_FIFO_blk;
    wire [1:0] proc_18_input_sync_blk;
    wire [1:0] proc_18_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_18;
    reg [1:0] proc_dep_vld_vec_18_reg;
    wire [1:0] in_chan_dep_vld_vec_18;
    wire [119:0] in_chan_dep_data_vec_18;
    wire [1:0] token_in_vec_18;
    wire [1:0] out_chan_dep_vld_vec_18;
    wire [59:0] out_chan_dep_data_18;
    wire [1:0] token_out_vec_18;
    wire dl_detect_out_18;
    wire dep_chan_vld_17_18;
    wire [59:0] dep_chan_data_17_18;
    wire token_17_18;
    wire dep_chan_vld_35_18;
    wire [59:0] dep_chan_data_35_18;
    wire token_35_18;
    wire [1:0] proc_19_data_FIFO_blk;
    wire [1:0] proc_19_data_PIPO_blk;
    wire [1:0] proc_19_start_FIFO_blk;
    wire [1:0] proc_19_TLF_FIFO_blk;
    wire [1:0] proc_19_input_sync_blk;
    wire [1:0] proc_19_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_19;
    reg [1:0] proc_dep_vld_vec_19_reg;
    wire [1:0] in_chan_dep_vld_vec_19;
    wire [119:0] in_chan_dep_data_vec_19;
    wire [1:0] token_in_vec_19;
    wire [1:0] out_chan_dep_vld_vec_19;
    wire [59:0] out_chan_dep_data_19;
    wire [1:0] token_out_vec_19;
    wire dl_detect_out_19;
    wire dep_chan_vld_20_19;
    wire [59:0] dep_chan_data_20_19;
    wire token_20_19;
    wire dep_chan_vld_22_19;
    wire [59:0] dep_chan_data_22_19;
    wire token_22_19;
    wire [1:0] proc_20_data_FIFO_blk;
    wire [1:0] proc_20_data_PIPO_blk;
    wire [1:0] proc_20_start_FIFO_blk;
    wire [1:0] proc_20_TLF_FIFO_blk;
    wire [1:0] proc_20_input_sync_blk;
    wire [1:0] proc_20_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_20;
    reg [1:0] proc_dep_vld_vec_20_reg;
    wire [1:0] in_chan_dep_vld_vec_20;
    wire [119:0] in_chan_dep_data_vec_20;
    wire [1:0] token_in_vec_20;
    wire [1:0] out_chan_dep_vld_vec_20;
    wire [59:0] out_chan_dep_data_20;
    wire [1:0] token_out_vec_20;
    wire dl_detect_out_20;
    wire dep_chan_vld_19_20;
    wire [59:0] dep_chan_data_19_20;
    wire token_19_20;
    wire dep_chan_vld_21_20;
    wire [59:0] dep_chan_data_21_20;
    wire token_21_20;
    wire [1:0] proc_21_data_FIFO_blk;
    wire [1:0] proc_21_data_PIPO_blk;
    wire [1:0] proc_21_start_FIFO_blk;
    wire [1:0] proc_21_TLF_FIFO_blk;
    wire [1:0] proc_21_input_sync_blk;
    wire [1:0] proc_21_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_21;
    reg [1:0] proc_dep_vld_vec_21_reg;
    wire [1:0] in_chan_dep_vld_vec_21;
    wire [119:0] in_chan_dep_data_vec_21;
    wire [1:0] token_in_vec_21;
    wire [1:0] out_chan_dep_vld_vec_21;
    wire [59:0] out_chan_dep_data_21;
    wire [1:0] token_out_vec_21;
    wire dl_detect_out_21;
    wire dep_chan_vld_20_21;
    wire [59:0] dep_chan_data_20_21;
    wire token_20_21;
    wire dep_chan_vld_23_21;
    wire [59:0] dep_chan_data_23_21;
    wire token_23_21;
    wire [1:0] proc_22_data_FIFO_blk;
    wire [1:0] proc_22_data_PIPO_blk;
    wire [1:0] proc_22_start_FIFO_blk;
    wire [1:0] proc_22_TLF_FIFO_blk;
    wire [1:0] proc_22_input_sync_blk;
    wire [1:0] proc_22_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_22;
    reg [1:0] proc_dep_vld_vec_22_reg;
    wire [1:0] in_chan_dep_vld_vec_22;
    wire [119:0] in_chan_dep_data_vec_22;
    wire [1:0] token_in_vec_22;
    wire [1:0] out_chan_dep_vld_vec_22;
    wire [59:0] out_chan_dep_data_22;
    wire [1:0] token_out_vec_22;
    wire dl_detect_out_22;
    wire dep_chan_vld_19_22;
    wire [59:0] dep_chan_data_19_22;
    wire token_19_22;
    wire dep_chan_vld_23_22;
    wire [59:0] dep_chan_data_23_22;
    wire token_23_22;
    wire [2:0] proc_23_data_FIFO_blk;
    wire [2:0] proc_23_data_PIPO_blk;
    wire [2:0] proc_23_start_FIFO_blk;
    wire [2:0] proc_23_TLF_FIFO_blk;
    wire [2:0] proc_23_input_sync_blk;
    wire [2:0] proc_23_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_23;
    reg [2:0] proc_dep_vld_vec_23_reg;
    wire [2:0] in_chan_dep_vld_vec_23;
    wire [179:0] in_chan_dep_data_vec_23;
    wire [2:0] token_in_vec_23;
    wire [2:0] out_chan_dep_vld_vec_23;
    wire [59:0] out_chan_dep_data_23;
    wire [2:0] token_out_vec_23;
    wire dl_detect_out_23;
    wire dep_chan_vld_21_23;
    wire [59:0] dep_chan_data_21_23;
    wire token_21_23;
    wire dep_chan_vld_22_23;
    wire [59:0] dep_chan_data_22_23;
    wire token_22_23;
    wire dep_chan_vld_24_23;
    wire [59:0] dep_chan_data_24_23;
    wire token_24_23;
    wire [2:0] proc_24_data_FIFO_blk;
    wire [2:0] proc_24_data_PIPO_blk;
    wire [2:0] proc_24_start_FIFO_blk;
    wire [2:0] proc_24_TLF_FIFO_blk;
    wire [2:0] proc_24_input_sync_blk;
    wire [2:0] proc_24_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_24;
    reg [2:0] proc_dep_vld_vec_24_reg;
    wire [2:0] in_chan_dep_vld_vec_24;
    wire [179:0] in_chan_dep_data_vec_24;
    wire [2:0] token_in_vec_24;
    wire [2:0] out_chan_dep_vld_vec_24;
    wire [59:0] out_chan_dep_data_24;
    wire [2:0] token_out_vec_24;
    wire dl_detect_out_24;
    wire dep_chan_vld_23_24;
    wire [59:0] dep_chan_data_23_24;
    wire token_23_24;
    wire dep_chan_vld_25_24;
    wire [59:0] dep_chan_data_25_24;
    wire token_25_24;
    wire dep_chan_vld_26_24;
    wire [59:0] dep_chan_data_26_24;
    wire token_26_24;
    wire [1:0] proc_25_data_FIFO_blk;
    wire [1:0] proc_25_data_PIPO_blk;
    wire [1:0] proc_25_start_FIFO_blk;
    wire [1:0] proc_25_TLF_FIFO_blk;
    wire [1:0] proc_25_input_sync_blk;
    wire [1:0] proc_25_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_25;
    reg [1:0] proc_dep_vld_vec_25_reg;
    wire [1:0] in_chan_dep_vld_vec_25;
    wire [119:0] in_chan_dep_data_vec_25;
    wire [1:0] token_in_vec_25;
    wire [1:0] out_chan_dep_vld_vec_25;
    wire [59:0] out_chan_dep_data_25;
    wire [1:0] token_out_vec_25;
    wire dl_detect_out_25;
    wire dep_chan_vld_24_25;
    wire [59:0] dep_chan_data_24_25;
    wire token_24_25;
    wire dep_chan_vld_26_25;
    wire [59:0] dep_chan_data_26_25;
    wire token_26_25;
    wire [6:0] proc_26_data_FIFO_blk;
    wire [6:0] proc_26_data_PIPO_blk;
    wire [6:0] proc_26_start_FIFO_blk;
    wire [6:0] proc_26_TLF_FIFO_blk;
    wire [6:0] proc_26_input_sync_blk;
    wire [6:0] proc_26_output_sync_blk;
    wire [6:0] proc_dep_vld_vec_26;
    reg [6:0] proc_dep_vld_vec_26_reg;
    wire [6:0] in_chan_dep_vld_vec_26;
    wire [419:0] in_chan_dep_data_vec_26;
    wire [6:0] token_in_vec_26;
    wire [6:0] out_chan_dep_vld_vec_26;
    wire [59:0] out_chan_dep_data_26;
    wire [6:0] token_out_vec_26;
    wire dl_detect_out_26;
    wire dep_chan_vld_10_26;
    wire [59:0] dep_chan_data_10_26;
    wire token_10_26;
    wire dep_chan_vld_24_26;
    wire [59:0] dep_chan_data_24_26;
    wire token_24_26;
    wire dep_chan_vld_25_26;
    wire [59:0] dep_chan_data_25_26;
    wire token_25_26;
    wire dep_chan_vld_27_26;
    wire [59:0] dep_chan_data_27_26;
    wire token_27_26;
    wire dep_chan_vld_28_26;
    wire [59:0] dep_chan_data_28_26;
    wire token_28_26;
    wire dep_chan_vld_30_26;
    wire [59:0] dep_chan_data_30_26;
    wire token_30_26;
    wire dep_chan_vld_31_26;
    wire [59:0] dep_chan_data_31_26;
    wire token_31_26;
    wire [1:0] proc_27_data_FIFO_blk;
    wire [1:0] proc_27_data_PIPO_blk;
    wire [1:0] proc_27_start_FIFO_blk;
    wire [1:0] proc_27_TLF_FIFO_blk;
    wire [1:0] proc_27_input_sync_blk;
    wire [1:0] proc_27_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_27;
    reg [1:0] proc_dep_vld_vec_27_reg;
    wire [1:0] in_chan_dep_vld_vec_27;
    wire [119:0] in_chan_dep_data_vec_27;
    wire [1:0] token_in_vec_27;
    wire [1:0] out_chan_dep_vld_vec_27;
    wire [59:0] out_chan_dep_data_27;
    wire [1:0] token_out_vec_27;
    wire dl_detect_out_27;
    wire dep_chan_vld_26_27;
    wire [59:0] dep_chan_data_26_27;
    wire token_26_27;
    wire dep_chan_vld_28_27;
    wire [59:0] dep_chan_data_28_27;
    wire token_28_27;
    wire [3:0] proc_28_data_FIFO_blk;
    wire [3:0] proc_28_data_PIPO_blk;
    wire [3:0] proc_28_start_FIFO_blk;
    wire [3:0] proc_28_TLF_FIFO_blk;
    wire [3:0] proc_28_input_sync_blk;
    wire [3:0] proc_28_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_28;
    reg [3:0] proc_dep_vld_vec_28_reg;
    wire [3:0] in_chan_dep_vld_vec_28;
    wire [239:0] in_chan_dep_data_vec_28;
    wire [3:0] token_in_vec_28;
    wire [3:0] out_chan_dep_vld_vec_28;
    wire [59:0] out_chan_dep_data_28;
    wire [3:0] token_out_vec_28;
    wire dl_detect_out_28;
    wire dep_chan_vld_26_28;
    wire [59:0] dep_chan_data_26_28;
    wire token_26_28;
    wire dep_chan_vld_27_28;
    wire [59:0] dep_chan_data_27_28;
    wire token_27_28;
    wire dep_chan_vld_29_28;
    wire [59:0] dep_chan_data_29_28;
    wire token_29_28;
    wire dep_chan_vld_33_28;
    wire [59:0] dep_chan_data_33_28;
    wire token_33_28;
    wire [1:0] proc_29_data_FIFO_blk;
    wire [1:0] proc_29_data_PIPO_blk;
    wire [1:0] proc_29_start_FIFO_blk;
    wire [1:0] proc_29_TLF_FIFO_blk;
    wire [1:0] proc_29_input_sync_blk;
    wire [1:0] proc_29_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_29;
    reg [1:0] proc_dep_vld_vec_29_reg;
    wire [1:0] in_chan_dep_vld_vec_29;
    wire [119:0] in_chan_dep_data_vec_29;
    wire [1:0] token_in_vec_29;
    wire [1:0] out_chan_dep_vld_vec_29;
    wire [59:0] out_chan_dep_data_29;
    wire [1:0] token_out_vec_29;
    wire dl_detect_out_29;
    wire dep_chan_vld_28_29;
    wire [59:0] dep_chan_data_28_29;
    wire token_28_29;
    wire dep_chan_vld_30_29;
    wire [59:0] dep_chan_data_30_29;
    wire token_30_29;
    wire [2:0] proc_30_data_FIFO_blk;
    wire [2:0] proc_30_data_PIPO_blk;
    wire [2:0] proc_30_start_FIFO_blk;
    wire [2:0] proc_30_TLF_FIFO_blk;
    wire [2:0] proc_30_input_sync_blk;
    wire [2:0] proc_30_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_30;
    reg [2:0] proc_dep_vld_vec_30_reg;
    wire [2:0] in_chan_dep_vld_vec_30;
    wire [179:0] in_chan_dep_data_vec_30;
    wire [2:0] token_in_vec_30;
    wire [2:0] out_chan_dep_vld_vec_30;
    wire [59:0] out_chan_dep_data_30;
    wire [2:0] token_out_vec_30;
    wire dl_detect_out_30;
    wire dep_chan_vld_26_30;
    wire [59:0] dep_chan_data_26_30;
    wire token_26_30;
    wire dep_chan_vld_29_30;
    wire [59:0] dep_chan_data_29_30;
    wire token_29_30;
    wire dep_chan_vld_31_30;
    wire [59:0] dep_chan_data_31_30;
    wire token_31_30;
    wire [6:0] proc_31_data_FIFO_blk;
    wire [6:0] proc_31_data_PIPO_blk;
    wire [6:0] proc_31_start_FIFO_blk;
    wire [6:0] proc_31_TLF_FIFO_blk;
    wire [6:0] proc_31_input_sync_blk;
    wire [6:0] proc_31_output_sync_blk;
    wire [6:0] proc_dep_vld_vec_31;
    reg [6:0] proc_dep_vld_vec_31_reg;
    wire [6:0] in_chan_dep_vld_vec_31;
    wire [419:0] in_chan_dep_data_vec_31;
    wire [6:0] token_in_vec_31;
    wire [6:0] out_chan_dep_vld_vec_31;
    wire [59:0] out_chan_dep_data_31;
    wire [6:0] token_out_vec_31;
    wire dl_detect_out_31;
    wire dep_chan_vld_1_31;
    wire [59:0] dep_chan_data_1_31;
    wire token_1_31;
    wire dep_chan_vld_11_31;
    wire [59:0] dep_chan_data_11_31;
    wire token_11_31;
    wire dep_chan_vld_26_31;
    wire [59:0] dep_chan_data_26_31;
    wire token_26_31;
    wire dep_chan_vld_30_31;
    wire [59:0] dep_chan_data_30_31;
    wire token_30_31;
    wire dep_chan_vld_32_31;
    wire [59:0] dep_chan_data_32_31;
    wire token_32_31;
    wire dep_chan_vld_33_31;
    wire [59:0] dep_chan_data_33_31;
    wire token_33_31;
    wire dep_chan_vld_34_31;
    wire [59:0] dep_chan_data_34_31;
    wire token_34_31;
    wire [10:0] proc_32_data_FIFO_blk;
    wire [10:0] proc_32_data_PIPO_blk;
    wire [10:0] proc_32_start_FIFO_blk;
    wire [10:0] proc_32_TLF_FIFO_blk;
    wire [10:0] proc_32_input_sync_blk;
    wire [10:0] proc_32_output_sync_blk;
    wire [10:0] proc_dep_vld_vec_32;
    reg [10:0] proc_dep_vld_vec_32_reg;
    wire [10:0] in_chan_dep_vld_vec_32;
    wire [659:0] in_chan_dep_data_vec_32;
    wire [10:0] token_in_vec_32;
    wire [10:0] out_chan_dep_vld_vec_32;
    wire [59:0] out_chan_dep_data_32;
    wire [10:0] token_out_vec_32;
    wire dl_detect_out_32;
    wire dep_chan_vld_5_32;
    wire [59:0] dep_chan_data_5_32;
    wire token_5_32;
    wire dep_chan_vld_6_32;
    wire [59:0] dep_chan_data_6_32;
    wire token_6_32;
    wire dep_chan_vld_7_32;
    wire [59:0] dep_chan_data_7_32;
    wire token_7_32;
    wire dep_chan_vld_13_32;
    wire [59:0] dep_chan_data_13_32;
    wire token_13_32;
    wire dep_chan_vld_14_32;
    wire [59:0] dep_chan_data_14_32;
    wire token_14_32;
    wire dep_chan_vld_15_32;
    wire [59:0] dep_chan_data_15_32;
    wire token_15_32;
    wire dep_chan_vld_31_32;
    wire [59:0] dep_chan_data_31_32;
    wire token_31_32;
    wire dep_chan_vld_33_32;
    wire [59:0] dep_chan_data_33_32;
    wire token_33_32;
    wire dep_chan_vld_34_32;
    wire [59:0] dep_chan_data_34_32;
    wire token_34_32;
    wire dep_chan_vld_52_32;
    wire [59:0] dep_chan_data_52_32;
    wire token_52_32;
    wire dep_chan_vld_58_32;
    wire [59:0] dep_chan_data_58_32;
    wire token_58_32;
    wire [2:0] proc_33_data_FIFO_blk;
    wire [2:0] proc_33_data_PIPO_blk;
    wire [2:0] proc_33_start_FIFO_blk;
    wire [2:0] proc_33_TLF_FIFO_blk;
    wire [2:0] proc_33_input_sync_blk;
    wire [2:0] proc_33_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_33;
    reg [2:0] proc_dep_vld_vec_33_reg;
    wire [2:0] in_chan_dep_vld_vec_33;
    wire [179:0] in_chan_dep_data_vec_33;
    wire [2:0] token_in_vec_33;
    wire [2:0] out_chan_dep_vld_vec_33;
    wire [59:0] out_chan_dep_data_33;
    wire [2:0] token_out_vec_33;
    wire dl_detect_out_33;
    wire dep_chan_vld_28_33;
    wire [59:0] dep_chan_data_28_33;
    wire token_28_33;
    wire dep_chan_vld_31_33;
    wire [59:0] dep_chan_data_31_33;
    wire token_31_33;
    wire dep_chan_vld_32_33;
    wire [59:0] dep_chan_data_32_33;
    wire token_32_33;
    wire [2:0] proc_34_data_FIFO_blk;
    wire [2:0] proc_34_data_PIPO_blk;
    wire [2:0] proc_34_start_FIFO_blk;
    wire [2:0] proc_34_TLF_FIFO_blk;
    wire [2:0] proc_34_input_sync_blk;
    wire [2:0] proc_34_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_34;
    reg [2:0] proc_dep_vld_vec_34_reg;
    wire [2:0] in_chan_dep_vld_vec_34;
    wire [179:0] in_chan_dep_data_vec_34;
    wire [2:0] token_in_vec_34;
    wire [2:0] out_chan_dep_vld_vec_34;
    wire [59:0] out_chan_dep_data_34;
    wire [2:0] token_out_vec_34;
    wire dl_detect_out_34;
    wire dep_chan_vld_17_34;
    wire [59:0] dep_chan_data_17_34;
    wire token_17_34;
    wire dep_chan_vld_31_34;
    wire [59:0] dep_chan_data_31_34;
    wire token_31_34;
    wire dep_chan_vld_32_34;
    wire [59:0] dep_chan_data_32_34;
    wire token_32_34;
    wire [11:0] proc_35_data_FIFO_blk;
    wire [11:0] proc_35_data_PIPO_blk;
    wire [11:0] proc_35_start_FIFO_blk;
    wire [11:0] proc_35_TLF_FIFO_blk;
    wire [11:0] proc_35_input_sync_blk;
    wire [11:0] proc_35_output_sync_blk;
    wire [11:0] proc_dep_vld_vec_35;
    reg [11:0] proc_dep_vld_vec_35_reg;
    wire [11:0] in_chan_dep_vld_vec_35;
    wire [719:0] in_chan_dep_data_vec_35;
    wire [11:0] token_in_vec_35;
    wire [11:0] out_chan_dep_vld_vec_35;
    wire [59:0] out_chan_dep_data_35;
    wire [11:0] token_out_vec_35;
    wire dl_detect_out_35;
    wire dep_chan_vld_4_35;
    wire [59:0] dep_chan_data_4_35;
    wire token_4_35;
    wire dep_chan_vld_6_35;
    wire [59:0] dep_chan_data_6_35;
    wire token_6_35;
    wire dep_chan_vld_7_35;
    wire [59:0] dep_chan_data_7_35;
    wire token_7_35;
    wire dep_chan_vld_13_35;
    wire [59:0] dep_chan_data_13_35;
    wire token_13_35;
    wire dep_chan_vld_14_35;
    wire [59:0] dep_chan_data_14_35;
    wire token_14_35;
    wire dep_chan_vld_17_35;
    wire [59:0] dep_chan_data_17_35;
    wire token_17_35;
    wire dep_chan_vld_18_35;
    wire [59:0] dep_chan_data_18_35;
    wire token_18_35;
    wire dep_chan_vld_36_35;
    wire [59:0] dep_chan_data_36_35;
    wire token_36_35;
    wire dep_chan_vld_37_35;
    wire [59:0] dep_chan_data_37_35;
    wire token_37_35;
    wire dep_chan_vld_39_35;
    wire [59:0] dep_chan_data_39_35;
    wire token_39_35;
    wire dep_chan_vld_41_35;
    wire [59:0] dep_chan_data_41_35;
    wire token_41_35;
    wire dep_chan_vld_48_35;
    wire [59:0] dep_chan_data_48_35;
    wire token_48_35;
    wire [1:0] proc_36_data_FIFO_blk;
    wire [1:0] proc_36_data_PIPO_blk;
    wire [1:0] proc_36_start_FIFO_blk;
    wire [1:0] proc_36_TLF_FIFO_blk;
    wire [1:0] proc_36_input_sync_blk;
    wire [1:0] proc_36_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_36;
    reg [1:0] proc_dep_vld_vec_36_reg;
    wire [1:0] in_chan_dep_vld_vec_36;
    wire [119:0] in_chan_dep_data_vec_36;
    wire [1:0] token_in_vec_36;
    wire [1:0] out_chan_dep_vld_vec_36;
    wire [59:0] out_chan_dep_data_36;
    wire [1:0] token_out_vec_36;
    wire dl_detect_out_36;
    wire dep_chan_vld_35_36;
    wire [59:0] dep_chan_data_35_36;
    wire token_35_36;
    wire dep_chan_vld_38_36;
    wire [59:0] dep_chan_data_38_36;
    wire token_38_36;
    wire [3:0] proc_37_data_FIFO_blk;
    wire [3:0] proc_37_data_PIPO_blk;
    wire [3:0] proc_37_start_FIFO_blk;
    wire [3:0] proc_37_TLF_FIFO_blk;
    wire [3:0] proc_37_input_sync_blk;
    wire [3:0] proc_37_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_37;
    reg [3:0] proc_dep_vld_vec_37_reg;
    wire [3:0] in_chan_dep_vld_vec_37;
    wire [239:0] in_chan_dep_data_vec_37;
    wire [3:0] token_in_vec_37;
    wire [3:0] out_chan_dep_vld_vec_37;
    wire [59:0] out_chan_dep_data_37;
    wire [3:0] token_out_vec_37;
    wire dl_detect_out_37;
    wire dep_chan_vld_4_37;
    wire [59:0] dep_chan_data_4_37;
    wire token_4_37;
    wire dep_chan_vld_35_37;
    wire [59:0] dep_chan_data_35_37;
    wire token_35_37;
    wire dep_chan_vld_41_37;
    wire [59:0] dep_chan_data_41_37;
    wire token_41_37;
    wire dep_chan_vld_48_37;
    wire [59:0] dep_chan_data_48_37;
    wire token_48_37;
    wire [1:0] proc_38_data_FIFO_blk;
    wire [1:0] proc_38_data_PIPO_blk;
    wire [1:0] proc_38_start_FIFO_blk;
    wire [1:0] proc_38_TLF_FIFO_blk;
    wire [1:0] proc_38_input_sync_blk;
    wire [1:0] proc_38_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_38;
    reg [1:0] proc_dep_vld_vec_38_reg;
    wire [1:0] in_chan_dep_vld_vec_38;
    wire [119:0] in_chan_dep_data_vec_38;
    wire [1:0] token_in_vec_38;
    wire [1:0] out_chan_dep_vld_vec_38;
    wire [59:0] out_chan_dep_data_38;
    wire [1:0] token_out_vec_38;
    wire dl_detect_out_38;
    wire dep_chan_vld_36_38;
    wire [59:0] dep_chan_data_36_38;
    wire token_36_38;
    wire dep_chan_vld_39_38;
    wire [59:0] dep_chan_data_39_38;
    wire token_39_38;
    wire [3:0] proc_39_data_FIFO_blk;
    wire [3:0] proc_39_data_PIPO_blk;
    wire [3:0] proc_39_start_FIFO_blk;
    wire [3:0] proc_39_TLF_FIFO_blk;
    wire [3:0] proc_39_input_sync_blk;
    wire [3:0] proc_39_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_39;
    reg [3:0] proc_dep_vld_vec_39_reg;
    wire [3:0] in_chan_dep_vld_vec_39;
    wire [239:0] in_chan_dep_data_vec_39;
    wire [3:0] token_in_vec_39;
    wire [3:0] out_chan_dep_vld_vec_39;
    wire [59:0] out_chan_dep_data_39;
    wire [3:0] token_out_vec_39;
    wire dl_detect_out_39;
    wire dep_chan_vld_35_39;
    wire [59:0] dep_chan_data_35_39;
    wire token_35_39;
    wire dep_chan_vld_38_39;
    wire [59:0] dep_chan_data_38_39;
    wire token_38_39;
    wire dep_chan_vld_40_39;
    wire [59:0] dep_chan_data_40_39;
    wire token_40_39;
    wire dep_chan_vld_56_39;
    wire [59:0] dep_chan_data_56_39;
    wire token_56_39;
    wire [1:0] proc_40_data_FIFO_blk;
    wire [1:0] proc_40_data_PIPO_blk;
    wire [1:0] proc_40_start_FIFO_blk;
    wire [1:0] proc_40_TLF_FIFO_blk;
    wire [1:0] proc_40_input_sync_blk;
    wire [1:0] proc_40_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_40;
    reg [1:0] proc_dep_vld_vec_40_reg;
    wire [1:0] in_chan_dep_vld_vec_40;
    wire [119:0] in_chan_dep_data_vec_40;
    wire [1:0] token_in_vec_40;
    wire [1:0] out_chan_dep_vld_vec_40;
    wire [59:0] out_chan_dep_data_40;
    wire [1:0] token_out_vec_40;
    wire dl_detect_out_40;
    wire dep_chan_vld_39_40;
    wire [59:0] dep_chan_data_39_40;
    wire token_39_40;
    wire dep_chan_vld_41_40;
    wire [59:0] dep_chan_data_41_40;
    wire token_41_40;
    wire [3:0] proc_41_data_FIFO_blk;
    wire [3:0] proc_41_data_PIPO_blk;
    wire [3:0] proc_41_start_FIFO_blk;
    wire [3:0] proc_41_TLF_FIFO_blk;
    wire [3:0] proc_41_input_sync_blk;
    wire [3:0] proc_41_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_41;
    reg [3:0] proc_dep_vld_vec_41_reg;
    wire [3:0] in_chan_dep_vld_vec_41;
    wire [239:0] in_chan_dep_data_vec_41;
    wire [3:0] token_in_vec_41;
    wire [3:0] out_chan_dep_vld_vec_41;
    wire [59:0] out_chan_dep_data_41;
    wire [3:0] token_out_vec_41;
    wire dl_detect_out_41;
    wire dep_chan_vld_35_41;
    wire [59:0] dep_chan_data_35_41;
    wire token_35_41;
    wire dep_chan_vld_37_41;
    wire [59:0] dep_chan_data_37_41;
    wire token_37_41;
    wire dep_chan_vld_40_41;
    wire [59:0] dep_chan_data_40_41;
    wire token_40_41;
    wire dep_chan_vld_42_41;
    wire [59:0] dep_chan_data_42_41;
    wire token_42_41;
    wire [2:0] proc_42_data_FIFO_blk;
    wire [2:0] proc_42_data_PIPO_blk;
    wire [2:0] proc_42_start_FIFO_blk;
    wire [2:0] proc_42_TLF_FIFO_blk;
    wire [2:0] proc_42_input_sync_blk;
    wire [2:0] proc_42_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_42;
    reg [2:0] proc_dep_vld_vec_42_reg;
    wire [2:0] in_chan_dep_vld_vec_42;
    wire [179:0] in_chan_dep_data_vec_42;
    wire [2:0] token_in_vec_42;
    wire [2:0] out_chan_dep_vld_vec_42;
    wire [59:0] out_chan_dep_data_42;
    wire [2:0] token_out_vec_42;
    wire dl_detect_out_42;
    wire dep_chan_vld_41_42;
    wire [59:0] dep_chan_data_41_42;
    wire token_41_42;
    wire dep_chan_vld_43_42;
    wire [59:0] dep_chan_data_43_42;
    wire token_43_42;
    wire dep_chan_vld_44_42;
    wire [59:0] dep_chan_data_44_42;
    wire token_44_42;
    wire [1:0] proc_43_data_FIFO_blk;
    wire [1:0] proc_43_data_PIPO_blk;
    wire [1:0] proc_43_start_FIFO_blk;
    wire [1:0] proc_43_TLF_FIFO_blk;
    wire [1:0] proc_43_input_sync_blk;
    wire [1:0] proc_43_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_43;
    reg [1:0] proc_dep_vld_vec_43_reg;
    wire [1:0] in_chan_dep_vld_vec_43;
    wire [119:0] in_chan_dep_data_vec_43;
    wire [1:0] token_in_vec_43;
    wire [1:0] out_chan_dep_vld_vec_43;
    wire [59:0] out_chan_dep_data_43;
    wire [1:0] token_out_vec_43;
    wire dl_detect_out_43;
    wire dep_chan_vld_42_43;
    wire [59:0] dep_chan_data_42_43;
    wire token_42_43;
    wire dep_chan_vld_46_43;
    wire [59:0] dep_chan_data_46_43;
    wire token_46_43;
    wire [1:0] proc_44_data_FIFO_blk;
    wire [1:0] proc_44_data_PIPO_blk;
    wire [1:0] proc_44_start_FIFO_blk;
    wire [1:0] proc_44_TLF_FIFO_blk;
    wire [1:0] proc_44_input_sync_blk;
    wire [1:0] proc_44_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_44;
    reg [1:0] proc_dep_vld_vec_44_reg;
    wire [1:0] in_chan_dep_vld_vec_44;
    wire [119:0] in_chan_dep_data_vec_44;
    wire [1:0] token_in_vec_44;
    wire [1:0] out_chan_dep_vld_vec_44;
    wire [59:0] out_chan_dep_data_44;
    wire [1:0] token_out_vec_44;
    wire dl_detect_out_44;
    wire dep_chan_vld_42_44;
    wire [59:0] dep_chan_data_42_44;
    wire token_42_44;
    wire dep_chan_vld_45_44;
    wire [59:0] dep_chan_data_45_44;
    wire token_45_44;
    wire [1:0] proc_45_data_FIFO_blk;
    wire [1:0] proc_45_data_PIPO_blk;
    wire [1:0] proc_45_start_FIFO_blk;
    wire [1:0] proc_45_TLF_FIFO_blk;
    wire [1:0] proc_45_input_sync_blk;
    wire [1:0] proc_45_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_45;
    reg [1:0] proc_dep_vld_vec_45_reg;
    wire [1:0] in_chan_dep_vld_vec_45;
    wire [119:0] in_chan_dep_data_vec_45;
    wire [1:0] token_in_vec_45;
    wire [1:0] out_chan_dep_vld_vec_45;
    wire [59:0] out_chan_dep_data_45;
    wire [1:0] token_out_vec_45;
    wire dl_detect_out_45;
    wire dep_chan_vld_44_45;
    wire [59:0] dep_chan_data_44_45;
    wire token_44_45;
    wire dep_chan_vld_46_45;
    wire [59:0] dep_chan_data_46_45;
    wire token_46_45;
    wire [2:0] proc_46_data_FIFO_blk;
    wire [2:0] proc_46_data_PIPO_blk;
    wire [2:0] proc_46_start_FIFO_blk;
    wire [2:0] proc_46_TLF_FIFO_blk;
    wire [2:0] proc_46_input_sync_blk;
    wire [2:0] proc_46_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_46;
    reg [2:0] proc_dep_vld_vec_46_reg;
    wire [2:0] in_chan_dep_vld_vec_46;
    wire [179:0] in_chan_dep_data_vec_46;
    wire [2:0] token_in_vec_46;
    wire [2:0] out_chan_dep_vld_vec_46;
    wire [59:0] out_chan_dep_data_46;
    wire [2:0] token_out_vec_46;
    wire dl_detect_out_46;
    wire dep_chan_vld_43_46;
    wire [59:0] dep_chan_data_43_46;
    wire token_43_46;
    wire dep_chan_vld_45_46;
    wire [59:0] dep_chan_data_45_46;
    wire token_45_46;
    wire dep_chan_vld_47_46;
    wire [59:0] dep_chan_data_47_46;
    wire token_47_46;
    wire [1:0] proc_47_data_FIFO_blk;
    wire [1:0] proc_47_data_PIPO_blk;
    wire [1:0] proc_47_start_FIFO_blk;
    wire [1:0] proc_47_TLF_FIFO_blk;
    wire [1:0] proc_47_input_sync_blk;
    wire [1:0] proc_47_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_47;
    reg [1:0] proc_dep_vld_vec_47_reg;
    wire [1:0] in_chan_dep_vld_vec_47;
    wire [119:0] in_chan_dep_data_vec_47;
    wire [1:0] token_in_vec_47;
    wire [1:0] out_chan_dep_vld_vec_47;
    wire [59:0] out_chan_dep_data_47;
    wire [1:0] token_out_vec_47;
    wire dl_detect_out_47;
    wire dep_chan_vld_46_47;
    wire [59:0] dep_chan_data_46_47;
    wire token_46_47;
    wire dep_chan_vld_48_47;
    wire [59:0] dep_chan_data_48_47;
    wire token_48_47;
    wire [2:0] proc_48_data_FIFO_blk;
    wire [2:0] proc_48_data_PIPO_blk;
    wire [2:0] proc_48_start_FIFO_blk;
    wire [2:0] proc_48_TLF_FIFO_blk;
    wire [2:0] proc_48_input_sync_blk;
    wire [2:0] proc_48_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_48;
    reg [2:0] proc_dep_vld_vec_48_reg;
    wire [2:0] in_chan_dep_vld_vec_48;
    wire [179:0] in_chan_dep_data_vec_48;
    wire [2:0] token_in_vec_48;
    wire [2:0] out_chan_dep_vld_vec_48;
    wire [59:0] out_chan_dep_data_48;
    wire [2:0] token_out_vec_48;
    wire dl_detect_out_48;
    wire dep_chan_vld_35_48;
    wire [59:0] dep_chan_data_35_48;
    wire token_35_48;
    wire dep_chan_vld_37_48;
    wire [59:0] dep_chan_data_37_48;
    wire token_37_48;
    wire dep_chan_vld_47_48;
    wire [59:0] dep_chan_data_47_48;
    wire token_47_48;
    wire [1:0] proc_49_data_FIFO_blk;
    wire [1:0] proc_49_data_PIPO_blk;
    wire [1:0] proc_49_start_FIFO_blk;
    wire [1:0] proc_49_TLF_FIFO_blk;
    wire [1:0] proc_49_input_sync_blk;
    wire [1:0] proc_49_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_49;
    reg [1:0] proc_dep_vld_vec_49_reg;
    wire [1:0] in_chan_dep_vld_vec_49;
    wire [119:0] in_chan_dep_data_vec_49;
    wire [1:0] token_in_vec_49;
    wire [1:0] out_chan_dep_vld_vec_49;
    wire [59:0] out_chan_dep_data_49;
    wire [1:0] token_out_vec_49;
    wire dl_detect_out_49;
    wire dep_chan_vld_6_49;
    wire [59:0] dep_chan_data_6_49;
    wire token_6_49;
    wire dep_chan_vld_50_49;
    wire [59:0] dep_chan_data_50_49;
    wire token_50_49;
    wire [0:0] proc_50_data_FIFO_blk;
    wire [0:0] proc_50_data_PIPO_blk;
    wire [0:0] proc_50_start_FIFO_blk;
    wire [0:0] proc_50_TLF_FIFO_blk;
    wire [0:0] proc_50_input_sync_blk;
    wire [0:0] proc_50_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_50;
    reg [0:0] proc_dep_vld_vec_50_reg;
    wire [0:0] in_chan_dep_vld_vec_50;
    wire [59:0] in_chan_dep_data_vec_50;
    wire [0:0] token_in_vec_50;
    wire [0:0] out_chan_dep_vld_vec_50;
    wire [59:0] out_chan_dep_data_50;
    wire [0:0] token_out_vec_50;
    wire dl_detect_out_50;
    wire dep_chan_vld_49_50;
    wire [59:0] dep_chan_data_49_50;
    wire token_49_50;
    wire [0:0] proc_51_data_FIFO_blk;
    wire [0:0] proc_51_data_PIPO_blk;
    wire [0:0] proc_51_start_FIFO_blk;
    wire [0:0] proc_51_TLF_FIFO_blk;
    wire [0:0] proc_51_input_sync_blk;
    wire [0:0] proc_51_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_51;
    reg [0:0] proc_dep_vld_vec_51_reg;
    wire [0:0] in_chan_dep_vld_vec_51;
    wire [59:0] in_chan_dep_data_vec_51;
    wire [0:0] token_in_vec_51;
    wire [0:0] out_chan_dep_vld_vec_51;
    wire [59:0] out_chan_dep_data_51;
    wire [0:0] token_out_vec_51;
    wire dl_detect_out_51;
    wire dep_chan_vld_8_51;
    wire [59:0] dep_chan_data_8_51;
    wire token_8_51;
    wire [1:0] proc_52_data_FIFO_blk;
    wire [1:0] proc_52_data_PIPO_blk;
    wire [1:0] proc_52_start_FIFO_blk;
    wire [1:0] proc_52_TLF_FIFO_blk;
    wire [1:0] proc_52_input_sync_blk;
    wire [1:0] proc_52_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_52;
    reg [1:0] proc_dep_vld_vec_52_reg;
    wire [1:0] in_chan_dep_vld_vec_52;
    wire [119:0] in_chan_dep_data_vec_52;
    wire [1:0] token_in_vec_52;
    wire [1:0] out_chan_dep_vld_vec_52;
    wire [59:0] out_chan_dep_data_52;
    wire [1:0] token_out_vec_52;
    wire dl_detect_out_52;
    wire dep_chan_vld_13_52;
    wire [59:0] dep_chan_data_13_52;
    wire token_13_52;
    wire dep_chan_vld_32_52;
    wire [59:0] dep_chan_data_32_52;
    wire token_32_52;
    wire [3:0] proc_53_data_FIFO_blk;
    wire [3:0] proc_53_data_PIPO_blk;
    wire [3:0] proc_53_start_FIFO_blk;
    wire [3:0] proc_53_TLF_FIFO_blk;
    wire [3:0] proc_53_input_sync_blk;
    wire [3:0] proc_53_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_53;
    reg [3:0] proc_dep_vld_vec_53_reg;
    wire [3:0] in_chan_dep_vld_vec_53;
    wire [239:0] in_chan_dep_data_vec_53;
    wire [3:0] token_in_vec_53;
    wire [3:0] out_chan_dep_vld_vec_53;
    wire [59:0] out_chan_dep_data_53;
    wire [3:0] token_out_vec_53;
    wire dl_detect_out_53;
    wire dep_chan_vld_17_53;
    wire [59:0] dep_chan_data_17_53;
    wire token_17_53;
    wire dep_chan_vld_54_53;
    wire [59:0] dep_chan_data_54_53;
    wire token_54_53;
    wire dep_chan_vld_55_53;
    wire [59:0] dep_chan_data_55_53;
    wire token_55_53;
    wire dep_chan_vld_58_53;
    wire [59:0] dep_chan_data_58_53;
    wire token_58_53;
    wire [1:0] proc_54_data_FIFO_blk;
    wire [1:0] proc_54_data_PIPO_blk;
    wire [1:0] proc_54_start_FIFO_blk;
    wire [1:0] proc_54_TLF_FIFO_blk;
    wire [1:0] proc_54_input_sync_blk;
    wire [1:0] proc_54_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_54;
    reg [1:0] proc_dep_vld_vec_54_reg;
    wire [1:0] in_chan_dep_vld_vec_54;
    wire [119:0] in_chan_dep_data_vec_54;
    wire [1:0] token_in_vec_54;
    wire [1:0] out_chan_dep_vld_vec_54;
    wire [59:0] out_chan_dep_data_54;
    wire [1:0] token_out_vec_54;
    wire dl_detect_out_54;
    wire dep_chan_vld_7_54;
    wire [59:0] dep_chan_data_7_54;
    wire token_7_54;
    wire dep_chan_vld_53_54;
    wire [59:0] dep_chan_data_53_54;
    wire token_53_54;
    wire [3:0] proc_55_data_FIFO_blk;
    wire [3:0] proc_55_data_PIPO_blk;
    wire [3:0] proc_55_start_FIFO_blk;
    wire [3:0] proc_55_TLF_FIFO_blk;
    wire [3:0] proc_55_input_sync_blk;
    wire [3:0] proc_55_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_55;
    reg [3:0] proc_dep_vld_vec_55_reg;
    wire [3:0] in_chan_dep_vld_vec_55;
    wire [239:0] in_chan_dep_data_vec_55;
    wire [3:0] token_in_vec_55;
    wire [3:0] out_chan_dep_vld_vec_55;
    wire [59:0] out_chan_dep_data_55;
    wire [3:0] token_out_vec_55;
    wire dl_detect_out_55;
    wire dep_chan_vld_5_55;
    wire [59:0] dep_chan_data_5_55;
    wire token_5_55;
    wire dep_chan_vld_53_55;
    wire [59:0] dep_chan_data_53_55;
    wire token_53_55;
    wire dep_chan_vld_57_55;
    wire [59:0] dep_chan_data_57_55;
    wire token_57_55;
    wire dep_chan_vld_59_55;
    wire [59:0] dep_chan_data_59_55;
    wire token_59_55;
    wire [1:0] proc_56_data_FIFO_blk;
    wire [1:0] proc_56_data_PIPO_blk;
    wire [1:0] proc_56_start_FIFO_blk;
    wire [1:0] proc_56_TLF_FIFO_blk;
    wire [1:0] proc_56_input_sync_blk;
    wire [1:0] proc_56_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_56;
    reg [1:0] proc_dep_vld_vec_56_reg;
    wire [1:0] in_chan_dep_vld_vec_56;
    wire [119:0] in_chan_dep_data_vec_56;
    wire [1:0] token_in_vec_56;
    wire [1:0] out_chan_dep_vld_vec_56;
    wire [59:0] out_chan_dep_data_56;
    wire [1:0] token_out_vec_56;
    wire dl_detect_out_56;
    wire dep_chan_vld_39_56;
    wire [59:0] dep_chan_data_39_56;
    wire token_39_56;
    wire dep_chan_vld_57_56;
    wire [59:0] dep_chan_data_57_56;
    wire token_57_56;
    wire [1:0] proc_57_data_FIFO_blk;
    wire [1:0] proc_57_data_PIPO_blk;
    wire [1:0] proc_57_start_FIFO_blk;
    wire [1:0] proc_57_TLF_FIFO_blk;
    wire [1:0] proc_57_input_sync_blk;
    wire [1:0] proc_57_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_57;
    reg [1:0] proc_dep_vld_vec_57_reg;
    wire [1:0] in_chan_dep_vld_vec_57;
    wire [119:0] in_chan_dep_data_vec_57;
    wire [1:0] token_in_vec_57;
    wire [1:0] out_chan_dep_vld_vec_57;
    wire [59:0] out_chan_dep_data_57;
    wire [1:0] token_out_vec_57;
    wire dl_detect_out_57;
    wire dep_chan_vld_55_57;
    wire [59:0] dep_chan_data_55_57;
    wire token_55_57;
    wire dep_chan_vld_56_57;
    wire [59:0] dep_chan_data_56_57;
    wire token_56_57;
    wire [5:0] proc_58_data_FIFO_blk;
    wire [5:0] proc_58_data_PIPO_blk;
    wire [5:0] proc_58_start_FIFO_blk;
    wire [5:0] proc_58_TLF_FIFO_blk;
    wire [5:0] proc_58_input_sync_blk;
    wire [5:0] proc_58_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_58;
    reg [5:0] proc_dep_vld_vec_58_reg;
    wire [5:0] in_chan_dep_vld_vec_58;
    wire [359:0] in_chan_dep_data_vec_58;
    wire [5:0] token_in_vec_58;
    wire [5:0] out_chan_dep_vld_vec_58;
    wire [59:0] out_chan_dep_data_58;
    wire [5:0] token_out_vec_58;
    wire dl_detect_out_58;
    wire dep_chan_vld_1_58;
    wire [59:0] dep_chan_data_1_58;
    wire token_1_58;
    wire dep_chan_vld_5_58;
    wire [59:0] dep_chan_data_5_58;
    wire token_5_58;
    wire dep_chan_vld_9_58;
    wire [59:0] dep_chan_data_9_58;
    wire token_9_58;
    wire dep_chan_vld_13_58;
    wire [59:0] dep_chan_data_13_58;
    wire token_13_58;
    wire dep_chan_vld_32_58;
    wire [59:0] dep_chan_data_32_58;
    wire token_32_58;
    wire dep_chan_vld_53_58;
    wire [59:0] dep_chan_data_53_58;
    wire token_53_58;
    wire [1:0] proc_59_data_FIFO_blk;
    wire [1:0] proc_59_data_PIPO_blk;
    wire [1:0] proc_59_start_FIFO_blk;
    wire [1:0] proc_59_TLF_FIFO_blk;
    wire [1:0] proc_59_input_sync_blk;
    wire [1:0] proc_59_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_59;
    reg [1:0] proc_dep_vld_vec_59_reg;
    wire [1:0] in_chan_dep_vld_vec_59;
    wire [119:0] in_chan_dep_data_vec_59;
    wire [1:0] token_in_vec_59;
    wire [1:0] out_chan_dep_vld_vec_59;
    wire [59:0] out_chan_dep_data_59;
    wire [1:0] token_out_vec_59;
    wire dl_detect_out_59;
    wire dep_chan_vld_7_59;
    wire [59:0] dep_chan_data_7_59;
    wire token_7_59;
    wire dep_chan_vld_55_59;
    wire [59:0] dep_chan_data_55_59;
    wire token_55_59;
    wire [59:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [59:0] origin;

    // Process: sessionIdManager_U0
    toe_top_hls_deadlock_detect_unit #(60, 0, 2, 2) toe_top_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~sessionIdManager_U0.slc_sessionIdFinFifo_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0 | (~sessionIdManager_U0.slc_sessionIdFreeList_blk_n);
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0;
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0;
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[59 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[119 : 60] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[0];
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[1];

    // Process: lookupReplyHandler_U0
    toe_top_hls_deadlock_detect_unit #(60, 1, 6, 6) toe_top_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0 | (~lookupReplyHandler_U0.txApp2sLookup_req_blk_n) | (~lookupReplyHandler_U0.sLookup2txApp_rsp_blk_n);
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0;
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0 | (~lookupReplyHandler_U0.rxEng2sLookup_req_blk_n) | (~lookupReplyHandler_U0.sLookup2rxEng_rsp_blk_n);
    assign proc_1_data_PIPO_blk[1] = 1'b0;
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0;
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0 | (~lookupReplyHandler_U0.slc_sessionIdFreeList_blk_n);
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0;
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    assign proc_1_data_FIFO_blk[3] = 1'b0 | (~lookupReplyHandler_U0.sessionInsert_req_blk_n);
    assign proc_1_data_PIPO_blk[3] = 1'b0;
    assign proc_1_start_FIFO_blk[3] = 1'b0;
    assign proc_1_TLF_FIFO_blk[3] = 1'b0;
    assign proc_1_input_sync_blk[3] = 1'b0;
    assign proc_1_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_1[3] = dl_detect_out ? proc_dep_vld_vec_1_reg[3] : (proc_1_data_FIFO_blk[3] | proc_1_data_PIPO_blk[3] | proc_1_start_FIFO_blk[3] | proc_1_TLF_FIFO_blk[3] | proc_1_input_sync_blk[3] | proc_1_output_sync_blk[3]);
    assign proc_1_data_FIFO_blk[4] = 1'b0 | (~lookupReplyHandler_U0.slc_sessionInsert_rsp_blk_n);
    assign proc_1_data_PIPO_blk[4] = 1'b0;
    assign proc_1_start_FIFO_blk[4] = 1'b0;
    assign proc_1_TLF_FIFO_blk[4] = 1'b0;
    assign proc_1_input_sync_blk[4] = 1'b0;
    assign proc_1_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_1[4] = dl_detect_out ? proc_dep_vld_vec_1_reg[4] : (proc_1_data_FIFO_blk[4] | proc_1_data_PIPO_blk[4] | proc_1_start_FIFO_blk[4] | proc_1_TLF_FIFO_blk[4] | proc_1_input_sync_blk[4] | proc_1_output_sync_blk[4]);
    assign proc_1_data_FIFO_blk[5] = 1'b0 | (~lookupReplyHandler_U0.reverseLupInsertFifo_blk_n);
    assign proc_1_data_PIPO_blk[5] = 1'b0;
    assign proc_1_start_FIFO_blk[5] = 1'b0;
    assign proc_1_TLF_FIFO_blk[5] = 1'b0;
    assign proc_1_input_sync_blk[5] = 1'b0;
    assign proc_1_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_1[5] = dl_detect_out ? proc_dep_vld_vec_1_reg[5] : (proc_1_data_FIFO_blk[5] | proc_1_data_PIPO_blk[5] | proc_1_start_FIFO_blk[5] | proc_1_TLF_FIFO_blk[5] | proc_1_input_sync_blk[5] | proc_1_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[59 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[119 : 60] = dep_chan_data_2_1;
    assign token_in_vec_1[1] = token_2_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_3_1;
    assign in_chan_dep_data_vec_1[179 : 120] = dep_chan_data_3_1;
    assign token_in_vec_1[2] = token_3_1;
    assign in_chan_dep_vld_vec_1[3] = dep_chan_vld_4_1;
    assign in_chan_dep_data_vec_1[239 : 180] = dep_chan_data_4_1;
    assign token_in_vec_1[3] = token_4_1;
    assign in_chan_dep_vld_vec_1[4] = dep_chan_vld_31_1;
    assign in_chan_dep_data_vec_1[299 : 240] = dep_chan_data_31_1;
    assign token_in_vec_1[4] = token_31_1;
    assign in_chan_dep_vld_vec_1[5] = dep_chan_vld_58_1;
    assign in_chan_dep_data_vec_1[359 : 300] = dep_chan_data_58_1;
    assign token_in_vec_1[5] = token_58_1;
    assign dep_chan_vld_1_58 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_58 = out_chan_dep_data_1;
    assign token_1_58 = token_out_vec_1[0];
    assign dep_chan_vld_1_31 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_31 = out_chan_dep_data_1;
    assign token_1_31 = token_out_vec_1[1];
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[2];
    assign dep_chan_vld_1_2 = out_chan_dep_vld_vec_1[3];
    assign dep_chan_data_1_2 = out_chan_dep_data_1;
    assign token_1_2 = token_out_vec_1[3];
    assign dep_chan_vld_1_3 = out_chan_dep_vld_vec_1[4];
    assign dep_chan_data_1_3 = out_chan_dep_data_1;
    assign token_1_3 = token_out_vec_1[4];
    assign dep_chan_vld_1_4 = out_chan_dep_vld_vec_1[5];
    assign dep_chan_data_1_4 = out_chan_dep_data_1;
    assign token_1_4 = token_out_vec_1[5];

    // Process: updateRequestSender_U0
    toe_top_hls_deadlock_detect_unit #(60, 2, 3, 3) toe_top_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0 | (~updateRequestSender_U0.sessionInsert_req_blk_n);
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0;
    assign proc_2_input_sync_blk[0] = 1'b0;
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0 | (~updateRequestSender_U0.sessionDelete_req_blk_n);
    assign proc_2_data_PIPO_blk[1] = 1'b0;
    assign proc_2_start_FIFO_blk[1] = 1'b0;
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0;
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    assign proc_2_data_FIFO_blk[2] = 1'b0 | (~updateRequestSender_U0.slc_sessionIdFinFifo_blk_n);
    assign proc_2_data_PIPO_blk[2] = 1'b0;
    assign proc_2_start_FIFO_blk[2] = 1'b0;
    assign proc_2_TLF_FIFO_blk[2] = 1'b0;
    assign proc_2_input_sync_blk[2] = 1'b0;
    assign proc_2_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (proc_2_data_FIFO_blk[2] | proc_2_data_PIPO_blk[2] | proc_2_start_FIFO_blk[2] | proc_2_TLF_FIFO_blk[2] | proc_2_input_sync_blk[2] | proc_2_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[59 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_1_2;
    assign in_chan_dep_data_vec_2[119 : 60] = dep_chan_data_1_2;
    assign token_in_vec_2[1] = token_1_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_4_2;
    assign in_chan_dep_data_vec_2[179 : 120] = dep_chan_data_4_2;
    assign token_in_vec_2[2] = token_4_2;
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[0];
    assign dep_chan_vld_2_4 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_4 = out_chan_dep_data_2;
    assign token_2_4 = token_out_vec_2[1];
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[2];

    // Process: updateReplyHandler_U0
    toe_top_hls_deadlock_detect_unit #(60, 3, 1, 1) toe_top_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~updateReplyHandler_U0.slc_sessionInsert_rsp_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0;
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_1_3;
    assign in_chan_dep_data_vec_3[59 : 0] = dep_chan_data_1_3;
    assign token_in_vec_3[0] = token_1_3;
    assign dep_chan_vld_3_1 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_1 = out_chan_dep_data_3;
    assign token_3_1 = token_out_vec_3[0];

    // Process: reverseLookupTableInterface_U0
    toe_top_hls_deadlock_detect_unit #(60, 4, 6, 6) toe_top_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0 | (~reverseLookupTableInterface_U0.reverseLupInsertFifo_blk_n);
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0;
    assign proc_4_TLF_FIFO_blk[0] = 1'b0;
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~reverseLookupTableInterface_U0.stateTable2sLookup_releaseSession_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    assign proc_4_data_FIFO_blk[2] = 1'b0 | (~reverseLookupTableInterface_U0.sLookup2portTable_releasePort_blk_n);
    assign proc_4_data_PIPO_blk[2] = 1'b0;
    assign proc_4_start_FIFO_blk[2] = 1'b0;
    assign proc_4_TLF_FIFO_blk[2] = 1'b0;
    assign proc_4_input_sync_blk[2] = 1'b0;
    assign proc_4_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_4[2] = dl_detect_out ? proc_dep_vld_vec_4_reg[2] : (proc_4_data_FIFO_blk[2] | proc_4_data_PIPO_blk[2] | proc_4_start_FIFO_blk[2] | proc_4_TLF_FIFO_blk[2] | proc_4_input_sync_blk[2] | proc_4_output_sync_blk[2]);
    assign proc_4_data_FIFO_blk[3] = 1'b0 | (~reverseLookupTableInterface_U0.sessionDelete_req_blk_n);
    assign proc_4_data_PIPO_blk[3] = 1'b0;
    assign proc_4_start_FIFO_blk[3] = 1'b0;
    assign proc_4_TLF_FIFO_blk[3] = 1'b0;
    assign proc_4_input_sync_blk[3] = 1'b0;
    assign proc_4_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_4[3] = dl_detect_out ? proc_dep_vld_vec_4_reg[3] : (proc_4_data_FIFO_blk[3] | proc_4_data_PIPO_blk[3] | proc_4_start_FIFO_blk[3] | proc_4_TLF_FIFO_blk[3] | proc_4_input_sync_blk[3] | proc_4_output_sync_blk[3]);
    assign proc_4_data_FIFO_blk[4] = 1'b0 | (~reverseLookupTableInterface_U0.txEng2sLookup_rev_req_blk_n);
    assign proc_4_data_PIPO_blk[4] = 1'b0;
    assign proc_4_start_FIFO_blk[4] = 1'b0;
    assign proc_4_TLF_FIFO_blk[4] = 1'b0;
    assign proc_4_input_sync_blk[4] = 1'b0;
    assign proc_4_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_4[4] = dl_detect_out ? proc_dep_vld_vec_4_reg[4] : (proc_4_data_FIFO_blk[4] | proc_4_data_PIPO_blk[4] | proc_4_start_FIFO_blk[4] | proc_4_TLF_FIFO_blk[4] | proc_4_input_sync_blk[4] | proc_4_output_sync_blk[4]);
    assign proc_4_data_FIFO_blk[5] = 1'b0 | (~reverseLookupTableInterface_U0.sLookup2txEng_rev_rsp_blk_n);
    assign proc_4_data_PIPO_blk[5] = 1'b0;
    assign proc_4_start_FIFO_blk[5] = 1'b0;
    assign proc_4_TLF_FIFO_blk[5] = 1'b0;
    assign proc_4_input_sync_blk[5] = 1'b0;
    assign proc_4_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_4[5] = dl_detect_out ? proc_dep_vld_vec_4_reg[5] : (proc_4_data_FIFO_blk[5] | proc_4_data_PIPO_blk[5] | proc_4_start_FIFO_blk[5] | proc_4_TLF_FIFO_blk[5] | proc_4_input_sync_blk[5] | proc_4_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_1_4;
    assign in_chan_dep_data_vec_4[59 : 0] = dep_chan_data_1_4;
    assign token_in_vec_4[0] = token_1_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_2_4;
    assign in_chan_dep_data_vec_4[119 : 60] = dep_chan_data_2_4;
    assign token_in_vec_4[1] = token_2_4;
    assign in_chan_dep_vld_vec_4[2] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[179 : 120] = dep_chan_data_5_4;
    assign token_in_vec_4[2] = token_5_4;
    assign in_chan_dep_vld_vec_4[3] = dep_chan_vld_9_4;
    assign in_chan_dep_data_vec_4[239 : 180] = dep_chan_data_9_4;
    assign token_in_vec_4[3] = token_9_4;
    assign in_chan_dep_vld_vec_4[4] = dep_chan_vld_35_4;
    assign in_chan_dep_data_vec_4[299 : 240] = dep_chan_data_35_4;
    assign token_in_vec_4[4] = token_35_4;
    assign in_chan_dep_vld_vec_4[5] = dep_chan_vld_37_4;
    assign in_chan_dep_data_vec_4[359 : 300] = dep_chan_data_37_4;
    assign token_in_vec_4[5] = token_37_4;
    assign dep_chan_vld_4_1 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_1 = out_chan_dep_data_4;
    assign token_4_1 = token_out_vec_4[0];
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[1];
    assign dep_chan_vld_4_9 = out_chan_dep_vld_vec_4[2];
    assign dep_chan_data_4_9 = out_chan_dep_data_4;
    assign token_4_9 = token_out_vec_4[2];
    assign dep_chan_vld_4_2 = out_chan_dep_vld_vec_4[3];
    assign dep_chan_data_4_2 = out_chan_dep_data_4;
    assign token_4_2 = token_out_vec_4[3];
    assign dep_chan_vld_4_35 = out_chan_dep_vld_vec_4[4];
    assign dep_chan_data_4_35 = out_chan_dep_data_4;
    assign token_4_35 = token_out_vec_4[4];
    assign dep_chan_vld_4_37 = out_chan_dep_vld_vec_4[5];
    assign dep_chan_data_4_37 = out_chan_dep_data_4;
    assign token_4_37 = token_out_vec_4[5];

    // Process: state_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 5, 5, 5) toe_top_hls_deadlock_detect_unit_5 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_5_data_FIFO_blk[0] = 1'b0 | (~state_table_U0.txApp2stateTable_upd_req_blk_n) | (~state_table_U0.stateTable2txApp_upd_rsp_blk_n);
    assign proc_5_data_PIPO_blk[0] = 1'b0;
    assign proc_5_start_FIFO_blk[0] = 1'b0;
    assign proc_5_TLF_FIFO_blk[0] = 1'b0;
    assign proc_5_input_sync_blk[0] = 1'b0;
    assign proc_5_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (proc_5_data_FIFO_blk[0] | proc_5_data_PIPO_blk[0] | proc_5_start_FIFO_blk[0] | proc_5_TLF_FIFO_blk[0] | proc_5_input_sync_blk[0] | proc_5_output_sync_blk[0]);
    assign proc_5_data_FIFO_blk[1] = 1'b0 | (~state_table_U0.txApp2stateTable_req_blk_n) | (~state_table_U0.stateTable2txApp_rsp_blk_n);
    assign proc_5_data_PIPO_blk[1] = 1'b0;
    assign proc_5_start_FIFO_blk[1] = 1'b0;
    assign proc_5_TLF_FIFO_blk[1] = 1'b0;
    assign proc_5_input_sync_blk[1] = 1'b0;
    assign proc_5_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (proc_5_data_FIFO_blk[1] | proc_5_data_PIPO_blk[1] | proc_5_start_FIFO_blk[1] | proc_5_TLF_FIFO_blk[1] | proc_5_input_sync_blk[1] | proc_5_output_sync_blk[1]);
    assign proc_5_data_FIFO_blk[2] = 1'b0 | (~state_table_U0.rxEng2stateTable_upd_req_blk_n) | (~state_table_U0.stateTable2rxEng_upd_rsp_blk_n);
    assign proc_5_data_PIPO_blk[2] = 1'b0;
    assign proc_5_start_FIFO_blk[2] = 1'b0;
    assign proc_5_TLF_FIFO_blk[2] = 1'b0;
    assign proc_5_input_sync_blk[2] = 1'b0;
    assign proc_5_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_5[2] = dl_detect_out ? proc_dep_vld_vec_5_reg[2] : (proc_5_data_FIFO_blk[2] | proc_5_data_PIPO_blk[2] | proc_5_start_FIFO_blk[2] | proc_5_TLF_FIFO_blk[2] | proc_5_input_sync_blk[2] | proc_5_output_sync_blk[2]);
    assign proc_5_data_FIFO_blk[3] = 1'b0 | (~state_table_U0.stateTable2sLookup_releaseSession_blk_n);
    assign proc_5_data_PIPO_blk[3] = 1'b0;
    assign proc_5_start_FIFO_blk[3] = 1'b0;
    assign proc_5_TLF_FIFO_blk[3] = 1'b0;
    assign proc_5_input_sync_blk[3] = 1'b0;
    assign proc_5_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_5[3] = dl_detect_out ? proc_dep_vld_vec_5_reg[3] : (proc_5_data_FIFO_blk[3] | proc_5_data_PIPO_blk[3] | proc_5_start_FIFO_blk[3] | proc_5_TLF_FIFO_blk[3] | proc_5_input_sync_blk[3] | proc_5_output_sync_blk[3]);
    assign proc_5_data_FIFO_blk[4] = 1'b0 | (~state_table_U0.timer2stateTable_releaseState_blk_n);
    assign proc_5_data_PIPO_blk[4] = 1'b0;
    assign proc_5_start_FIFO_blk[4] = 1'b0;
    assign proc_5_TLF_FIFO_blk[4] = 1'b0;
    assign proc_5_input_sync_blk[4] = 1'b0;
    assign proc_5_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_5[4] = dl_detect_out ? proc_dep_vld_vec_5_reg[4] : (proc_5_data_FIFO_blk[4] | proc_5_data_PIPO_blk[4] | proc_5_start_FIFO_blk[4] | proc_5_TLF_FIFO_blk[4] | proc_5_input_sync_blk[4] | proc_5_output_sync_blk[4]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[59 : 0] = dep_chan_data_4_5;
    assign token_in_vec_5[0] = token_4_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_16_5;
    assign in_chan_dep_data_vec_5[119 : 60] = dep_chan_data_16_5;
    assign token_in_vec_5[1] = token_16_5;
    assign in_chan_dep_vld_vec_5[2] = dep_chan_vld_32_5;
    assign in_chan_dep_data_vec_5[179 : 120] = dep_chan_data_32_5;
    assign token_in_vec_5[2] = token_32_5;
    assign in_chan_dep_vld_vec_5[3] = dep_chan_vld_55_5;
    assign in_chan_dep_data_vec_5[239 : 180] = dep_chan_data_55_5;
    assign token_in_vec_5[3] = token_55_5;
    assign in_chan_dep_vld_vec_5[4] = dep_chan_vld_58_5;
    assign in_chan_dep_data_vec_5[299 : 240] = dep_chan_data_58_5;
    assign token_in_vec_5[4] = token_58_5;
    assign dep_chan_vld_5_58 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_58 = out_chan_dep_data_5;
    assign token_5_58 = token_out_vec_5[0];
    assign dep_chan_vld_5_55 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_55 = out_chan_dep_data_5;
    assign token_5_55 = token_out_vec_5[1];
    assign dep_chan_vld_5_32 = out_chan_dep_vld_vec_5[2];
    assign dep_chan_data_5_32 = out_chan_dep_data_5;
    assign token_5_32 = token_out_vec_5[2];
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[3];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[3];
    assign dep_chan_vld_5_16 = out_chan_dep_vld_vec_5[4];
    assign dep_chan_data_5_16 = out_chan_dep_data_5;
    assign token_5_16 = token_out_vec_5[4];

    // Process: rx_sar_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 6, 3, 3) toe_top_hls_deadlock_detect_unit_6 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_6),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_6),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_6),
        .token_in_vec(token_in_vec_6),
        .dl_detect_in(dl_detect_out),
        .origin(origin[6]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_6),
        .out_chan_dep_data(out_chan_dep_data_6),
        .token_out_vec(token_out_vec_6),
        .dl_detect_out(dl_in_vec[6]));

    assign proc_6_data_FIFO_blk[0] = 1'b0 | (~rx_sar_table_U0.txEng2rxSar_req_blk_n) | (~rx_sar_table_U0.rxSar2txEng_rsp_blk_n);
    assign proc_6_data_PIPO_blk[0] = 1'b0;
    assign proc_6_start_FIFO_blk[0] = 1'b0;
    assign proc_6_TLF_FIFO_blk[0] = 1'b0;
    assign proc_6_input_sync_blk[0] = 1'b0;
    assign proc_6_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_6[0] = dl_detect_out ? proc_dep_vld_vec_6_reg[0] : (proc_6_data_FIFO_blk[0] | proc_6_data_PIPO_blk[0] | proc_6_start_FIFO_blk[0] | proc_6_TLF_FIFO_blk[0] | proc_6_input_sync_blk[0] | proc_6_output_sync_blk[0]);
    assign proc_6_data_FIFO_blk[1] = 1'b0 | (~rx_sar_table_U0.rxApp2rxSar_upd_req_blk_n) | (~rx_sar_table_U0.rxSar2rxApp_upd_rsp_blk_n);
    assign proc_6_data_PIPO_blk[1] = 1'b0;
    assign proc_6_start_FIFO_blk[1] = 1'b0;
    assign proc_6_TLF_FIFO_blk[1] = 1'b0;
    assign proc_6_input_sync_blk[1] = 1'b0;
    assign proc_6_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_6[1] = dl_detect_out ? proc_dep_vld_vec_6_reg[1] : (proc_6_data_FIFO_blk[1] | proc_6_data_PIPO_blk[1] | proc_6_start_FIFO_blk[1] | proc_6_TLF_FIFO_blk[1] | proc_6_input_sync_blk[1] | proc_6_output_sync_blk[1]);
    assign proc_6_data_FIFO_blk[2] = 1'b0 | (~rx_sar_table_U0.rxEng2rxSar_upd_req_blk_n) | (~rx_sar_table_U0.rxSar2rxEng_upd_rsp_blk_n);
    assign proc_6_data_PIPO_blk[2] = 1'b0;
    assign proc_6_start_FIFO_blk[2] = 1'b0;
    assign proc_6_TLF_FIFO_blk[2] = 1'b0;
    assign proc_6_input_sync_blk[2] = 1'b0;
    assign proc_6_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_6[2] = dl_detect_out ? proc_dep_vld_vec_6_reg[2] : (proc_6_data_FIFO_blk[2] | proc_6_data_PIPO_blk[2] | proc_6_start_FIFO_blk[2] | proc_6_TLF_FIFO_blk[2] | proc_6_input_sync_blk[2] | proc_6_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_6_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_6_reg <= proc_dep_vld_vec_6;
        end
    end
    assign in_chan_dep_vld_vec_6[0] = dep_chan_vld_32_6;
    assign in_chan_dep_data_vec_6[59 : 0] = dep_chan_data_32_6;
    assign token_in_vec_6[0] = token_32_6;
    assign in_chan_dep_vld_vec_6[1] = dep_chan_vld_35_6;
    assign in_chan_dep_data_vec_6[119 : 60] = dep_chan_data_35_6;
    assign token_in_vec_6[1] = token_35_6;
    assign in_chan_dep_vld_vec_6[2] = dep_chan_vld_49_6;
    assign in_chan_dep_data_vec_6[179 : 120] = dep_chan_data_49_6;
    assign token_in_vec_6[2] = token_49_6;
    assign dep_chan_vld_6_35 = out_chan_dep_vld_vec_6[0];
    assign dep_chan_data_6_35 = out_chan_dep_data_6;
    assign token_6_35 = token_out_vec_6[0];
    assign dep_chan_vld_6_49 = out_chan_dep_vld_vec_6[1];
    assign dep_chan_data_6_49 = out_chan_dep_data_6;
    assign token_6_49 = token_out_vec_6[1];
    assign dep_chan_vld_6_32 = out_chan_dep_vld_vec_6[2];
    assign dep_chan_data_6_32 = out_chan_dep_data_6;
    assign token_6_32 = token_out_vec_6[2];

    // Process: tx_sar_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 7, 4, 4) toe_top_hls_deadlock_detect_unit_7 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_7),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_7),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_7),
        .token_in_vec(token_in_vec_7),
        .dl_detect_in(dl_detect_out),
        .origin(origin[7]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_7),
        .out_chan_dep_data(out_chan_dep_data_7),
        .token_out_vec(token_out_vec_7),
        .dl_detect_out(dl_in_vec[7]));

    assign proc_7_data_FIFO_blk[0] = 1'b0 | (~tx_sar_table_U0.txEng2txSar_upd_req_blk_n) | (~tx_sar_table_U0.txSar2txEng_upd_rsp_blk_n);
    assign proc_7_data_PIPO_blk[0] = 1'b0;
    assign proc_7_start_FIFO_blk[0] = 1'b0;
    assign proc_7_TLF_FIFO_blk[0] = 1'b0;
    assign proc_7_input_sync_blk[0] = 1'b0;
    assign proc_7_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_7[0] = dl_detect_out ? proc_dep_vld_vec_7_reg[0] : (proc_7_data_FIFO_blk[0] | proc_7_data_PIPO_blk[0] | proc_7_start_FIFO_blk[0] | proc_7_TLF_FIFO_blk[0] | proc_7_input_sync_blk[0] | proc_7_output_sync_blk[0]);
    assign proc_7_data_FIFO_blk[1] = 1'b0 | (~tx_sar_table_U0.txSar2txApp_ack_push_blk_n);
    assign proc_7_data_PIPO_blk[1] = 1'b0;
    assign proc_7_start_FIFO_blk[1] = 1'b0;
    assign proc_7_TLF_FIFO_blk[1] = 1'b0;
    assign proc_7_input_sync_blk[1] = 1'b0;
    assign proc_7_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_7[1] = dl_detect_out ? proc_dep_vld_vec_7_reg[1] : (proc_7_data_FIFO_blk[1] | proc_7_data_PIPO_blk[1] | proc_7_start_FIFO_blk[1] | proc_7_TLF_FIFO_blk[1] | proc_7_input_sync_blk[1] | proc_7_output_sync_blk[1]);
    assign proc_7_data_FIFO_blk[2] = 1'b0 | (~tx_sar_table_U0.txApp2txSar_push_blk_n);
    assign proc_7_data_PIPO_blk[2] = 1'b0;
    assign proc_7_start_FIFO_blk[2] = 1'b0;
    assign proc_7_TLF_FIFO_blk[2] = 1'b0;
    assign proc_7_input_sync_blk[2] = 1'b0;
    assign proc_7_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_7[2] = dl_detect_out ? proc_dep_vld_vec_7_reg[2] : (proc_7_data_FIFO_blk[2] | proc_7_data_PIPO_blk[2] | proc_7_start_FIFO_blk[2] | proc_7_TLF_FIFO_blk[2] | proc_7_input_sync_blk[2] | proc_7_output_sync_blk[2]);
    assign proc_7_data_FIFO_blk[3] = 1'b0 | (~tx_sar_table_U0.rxEng2txSar_upd_req_blk_n) | (~tx_sar_table_U0.txSar2rxEng_upd_rsp_blk_n);
    assign proc_7_data_PIPO_blk[3] = 1'b0;
    assign proc_7_start_FIFO_blk[3] = 1'b0;
    assign proc_7_TLF_FIFO_blk[3] = 1'b0;
    assign proc_7_input_sync_blk[3] = 1'b0;
    assign proc_7_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_7[3] = dl_detect_out ? proc_dep_vld_vec_7_reg[3] : (proc_7_data_FIFO_blk[3] | proc_7_data_PIPO_blk[3] | proc_7_start_FIFO_blk[3] | proc_7_TLF_FIFO_blk[3] | proc_7_input_sync_blk[3] | proc_7_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_7_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_7_reg <= proc_dep_vld_vec_7;
        end
    end
    assign in_chan_dep_vld_vec_7[0] = dep_chan_vld_32_7;
    assign in_chan_dep_data_vec_7[59 : 0] = dep_chan_data_32_7;
    assign token_in_vec_7[0] = token_32_7;
    assign in_chan_dep_vld_vec_7[1] = dep_chan_vld_35_7;
    assign in_chan_dep_data_vec_7[119 : 60] = dep_chan_data_35_7;
    assign token_in_vec_7[1] = token_35_7;
    assign in_chan_dep_vld_vec_7[2] = dep_chan_vld_54_7;
    assign in_chan_dep_data_vec_7[179 : 120] = dep_chan_data_54_7;
    assign token_in_vec_7[2] = token_54_7;
    assign in_chan_dep_vld_vec_7[3] = dep_chan_vld_59_7;
    assign in_chan_dep_data_vec_7[239 : 180] = dep_chan_data_59_7;
    assign token_in_vec_7[3] = token_59_7;
    assign dep_chan_vld_7_35 = out_chan_dep_vld_vec_7[0];
    assign dep_chan_data_7_35 = out_chan_dep_data_7;
    assign token_7_35 = token_out_vec_7[0];
    assign dep_chan_vld_7_59 = out_chan_dep_vld_vec_7[1];
    assign dep_chan_data_7_59 = out_chan_dep_data_7;
    assign token_7_59 = token_out_vec_7[1];
    assign dep_chan_vld_7_54 = out_chan_dep_vld_vec_7[2];
    assign dep_chan_data_7_54 = out_chan_dep_data_7;
    assign token_7_54 = token_out_vec_7[2];
    assign dep_chan_vld_7_32 = out_chan_dep_vld_vec_7[3];
    assign dep_chan_data_7_32 = out_chan_dep_data_7;
    assign token_7_32 = token_out_vec_7[3];

    // Process: listening_port_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 8, 3, 3) toe_top_hls_deadlock_detect_unit_8 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_8),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_8),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_8),
        .token_in_vec(token_in_vec_8),
        .dl_detect_in(dl_detect_out),
        .origin(origin[8]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_8),
        .out_chan_dep_data(out_chan_dep_data_8),
        .token_out_vec(token_out_vec_8),
        .dl_detect_out(dl_in_vec[8]));

    assign proc_8_data_FIFO_blk[0] = 1'b0 | (~listening_port_table_U0.rxApp2portTable_listen_req_blk_n) | (~listening_port_table_U0.portTable2rxApp_listen_rsp_blk_n);
    assign proc_8_data_PIPO_blk[0] = 1'b0;
    assign proc_8_start_FIFO_blk[0] = 1'b0;
    assign proc_8_TLF_FIFO_blk[0] = 1'b0;
    assign proc_8_input_sync_blk[0] = 1'b0;
    assign proc_8_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_8[0] = dl_detect_out ? proc_dep_vld_vec_8_reg[0] : (proc_8_data_FIFO_blk[0] | proc_8_data_PIPO_blk[0] | proc_8_start_FIFO_blk[0] | proc_8_TLF_FIFO_blk[0] | proc_8_input_sync_blk[0] | proc_8_output_sync_blk[0]);
    assign proc_8_data_FIFO_blk[1] = 1'b0 | (~listening_port_table_U0.pt_portCheckListening_req_fifo_blk_n);
    assign proc_8_data_PIPO_blk[1] = 1'b0;
    assign proc_8_start_FIFO_blk[1] = 1'b0;
    assign proc_8_TLF_FIFO_blk[1] = 1'b0;
    assign proc_8_input_sync_blk[1] = 1'b0;
    assign proc_8_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_8[1] = dl_detect_out ? proc_dep_vld_vec_8_reg[1] : (proc_8_data_FIFO_blk[1] | proc_8_data_PIPO_blk[1] | proc_8_start_FIFO_blk[1] | proc_8_TLF_FIFO_blk[1] | proc_8_input_sync_blk[1] | proc_8_output_sync_blk[1]);
    assign proc_8_data_FIFO_blk[2] = 1'b0 | (~listening_port_table_U0.pt_portCheckListening_rsp_fifo_blk_n);
    assign proc_8_data_PIPO_blk[2] = 1'b0;
    assign proc_8_start_FIFO_blk[2] = 1'b0;
    assign proc_8_TLF_FIFO_blk[2] = 1'b0;
    assign proc_8_input_sync_blk[2] = 1'b0;
    assign proc_8_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_8[2] = dl_detect_out ? proc_dep_vld_vec_8_reg[2] : (proc_8_data_FIFO_blk[2] | proc_8_data_PIPO_blk[2] | proc_8_start_FIFO_blk[2] | proc_8_TLF_FIFO_blk[2] | proc_8_input_sync_blk[2] | proc_8_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_8_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_8_reg <= proc_dep_vld_vec_8;
        end
    end
    assign in_chan_dep_vld_vec_8[0] = dep_chan_vld_10_8;
    assign in_chan_dep_data_vec_8[59 : 0] = dep_chan_data_10_8;
    assign token_in_vec_8[0] = token_10_8;
    assign in_chan_dep_vld_vec_8[1] = dep_chan_vld_11_8;
    assign in_chan_dep_data_vec_8[119 : 60] = dep_chan_data_11_8;
    assign token_in_vec_8[1] = token_11_8;
    assign in_chan_dep_vld_vec_8[2] = dep_chan_vld_51_8;
    assign in_chan_dep_data_vec_8[179 : 120] = dep_chan_data_51_8;
    assign token_in_vec_8[2] = token_51_8;
    assign dep_chan_vld_8_51 = out_chan_dep_vld_vec_8[0];
    assign dep_chan_data_8_51 = out_chan_dep_data_8;
    assign token_8_51 = token_out_vec_8[0];
    assign dep_chan_vld_8_10 = out_chan_dep_vld_vec_8[1];
    assign dep_chan_data_8_10 = out_chan_dep_data_8;
    assign token_8_10 = token_out_vec_8[1];
    assign dep_chan_vld_8_11 = out_chan_dep_vld_vec_8[2];
    assign dep_chan_data_8_11 = out_chan_dep_data_8;
    assign token_8_11 = token_out_vec_8[2];

    // Process: free_port_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 9, 4, 4) toe_top_hls_deadlock_detect_unit_9 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_9),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_9),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_9),
        .token_in_vec(token_in_vec_9),
        .dl_detect_in(dl_detect_out),
        .origin(origin[9]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_9),
        .out_chan_dep_data(out_chan_dep_data_9),
        .token_out_vec(token_out_vec_9),
        .dl_detect_out(dl_in_vec[9]));

    assign proc_9_data_FIFO_blk[0] = 1'b0 | (~free_port_table_U0.sLookup2portTable_releasePort_blk_n);
    assign proc_9_data_PIPO_blk[0] = 1'b0;
    assign proc_9_start_FIFO_blk[0] = 1'b0;
    assign proc_9_TLF_FIFO_blk[0] = 1'b0;
    assign proc_9_input_sync_blk[0] = 1'b0;
    assign proc_9_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_9[0] = dl_detect_out ? proc_dep_vld_vec_9_reg[0] : (proc_9_data_FIFO_blk[0] | proc_9_data_PIPO_blk[0] | proc_9_start_FIFO_blk[0] | proc_9_TLF_FIFO_blk[0] | proc_9_input_sync_blk[0] | proc_9_output_sync_blk[0]);
    assign proc_9_data_FIFO_blk[1] = 1'b0 | (~free_port_table_U0.pt_portCheckUsed_req_fifo_blk_n);
    assign proc_9_data_PIPO_blk[1] = 1'b0;
    assign proc_9_start_FIFO_blk[1] = 1'b0;
    assign proc_9_TLF_FIFO_blk[1] = 1'b0;
    assign proc_9_input_sync_blk[1] = 1'b0;
    assign proc_9_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_9[1] = dl_detect_out ? proc_dep_vld_vec_9_reg[1] : (proc_9_data_FIFO_blk[1] | proc_9_data_PIPO_blk[1] | proc_9_start_FIFO_blk[1] | proc_9_TLF_FIFO_blk[1] | proc_9_input_sync_blk[1] | proc_9_output_sync_blk[1]);
    assign proc_9_data_FIFO_blk[2] = 1'b0 | (~free_port_table_U0.pt_portCheckUsed_rsp_fifo_blk_n);
    assign proc_9_data_PIPO_blk[2] = 1'b0;
    assign proc_9_start_FIFO_blk[2] = 1'b0;
    assign proc_9_TLF_FIFO_blk[2] = 1'b0;
    assign proc_9_input_sync_blk[2] = 1'b0;
    assign proc_9_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_9[2] = dl_detect_out ? proc_dep_vld_vec_9_reg[2] : (proc_9_data_FIFO_blk[2] | proc_9_data_PIPO_blk[2] | proc_9_start_FIFO_blk[2] | proc_9_TLF_FIFO_blk[2] | proc_9_input_sync_blk[2] | proc_9_output_sync_blk[2]);
    assign proc_9_data_FIFO_blk[3] = 1'b0 | (~free_port_table_U0.portTable2txApp_port_rsp_blk_n);
    assign proc_9_data_PIPO_blk[3] = 1'b0;
    assign proc_9_start_FIFO_blk[3] = 1'b0;
    assign proc_9_TLF_FIFO_blk[3] = 1'b0;
    assign proc_9_input_sync_blk[3] = 1'b0;
    assign proc_9_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_9[3] = dl_detect_out ? proc_dep_vld_vec_9_reg[3] : (proc_9_data_FIFO_blk[3] | proc_9_data_PIPO_blk[3] | proc_9_start_FIFO_blk[3] | proc_9_TLF_FIFO_blk[3] | proc_9_input_sync_blk[3] | proc_9_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_9_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_9_reg <= proc_dep_vld_vec_9;
        end
    end
    assign in_chan_dep_vld_vec_9[0] = dep_chan_vld_4_9;
    assign in_chan_dep_data_vec_9[59 : 0] = dep_chan_data_4_9;
    assign token_in_vec_9[0] = token_4_9;
    assign in_chan_dep_vld_vec_9[1] = dep_chan_vld_10_9;
    assign in_chan_dep_data_vec_9[119 : 60] = dep_chan_data_10_9;
    assign token_in_vec_9[1] = token_10_9;
    assign in_chan_dep_vld_vec_9[2] = dep_chan_vld_11_9;
    assign in_chan_dep_data_vec_9[179 : 120] = dep_chan_data_11_9;
    assign token_in_vec_9[2] = token_11_9;
    assign in_chan_dep_vld_vec_9[3] = dep_chan_vld_58_9;
    assign in_chan_dep_data_vec_9[239 : 180] = dep_chan_data_58_9;
    assign token_in_vec_9[3] = token_58_9;
    assign dep_chan_vld_9_4 = out_chan_dep_vld_vec_9[0];
    assign dep_chan_data_9_4 = out_chan_dep_data_9;
    assign token_9_4 = token_out_vec_9[0];
    assign dep_chan_vld_9_10 = out_chan_dep_vld_vec_9[1];
    assign dep_chan_data_9_10 = out_chan_dep_data_9;
    assign token_9_10 = token_out_vec_9[1];
    assign dep_chan_vld_9_11 = out_chan_dep_vld_vec_9[2];
    assign dep_chan_data_9_11 = out_chan_dep_data_9;
    assign token_9_11 = token_out_vec_9[2];
    assign dep_chan_vld_9_58 = out_chan_dep_vld_vec_9[3];
    assign dep_chan_data_9_58 = out_chan_dep_data_9;
    assign token_9_58 = token_out_vec_9[3];

    // Process: check_in_multiplexer_U0
    toe_top_hls_deadlock_detect_unit #(60, 10, 4, 4) toe_top_hls_deadlock_detect_unit_10 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_10),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_10),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_10),
        .token_in_vec(token_in_vec_10),
        .dl_detect_in(dl_detect_out),
        .origin(origin[10]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_10),
        .out_chan_dep_data(out_chan_dep_data_10),
        .token_out_vec(token_out_vec_10),
        .dl_detect_out(dl_in_vec[10]));

    assign proc_10_data_FIFO_blk[0] = 1'b0 | (~check_in_multiplexer_U0.rxEng2portTable_check_req_blk_n);
    assign proc_10_data_PIPO_blk[0] = 1'b0;
    assign proc_10_start_FIFO_blk[0] = 1'b0;
    assign proc_10_TLF_FIFO_blk[0] = 1'b0;
    assign proc_10_input_sync_blk[0] = 1'b0;
    assign proc_10_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_10[0] = dl_detect_out ? proc_dep_vld_vec_10_reg[0] : (proc_10_data_FIFO_blk[0] | proc_10_data_PIPO_blk[0] | proc_10_start_FIFO_blk[0] | proc_10_TLF_FIFO_blk[0] | proc_10_input_sync_blk[0] | proc_10_output_sync_blk[0]);
    assign proc_10_data_FIFO_blk[1] = 1'b0 | (~check_in_multiplexer_U0.pt_portCheckListening_req_fifo_blk_n);
    assign proc_10_data_PIPO_blk[1] = 1'b0;
    assign proc_10_start_FIFO_blk[1] = 1'b0;
    assign proc_10_TLF_FIFO_blk[1] = 1'b0;
    assign proc_10_input_sync_blk[1] = 1'b0;
    assign proc_10_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_10[1] = dl_detect_out ? proc_dep_vld_vec_10_reg[1] : (proc_10_data_FIFO_blk[1] | proc_10_data_PIPO_blk[1] | proc_10_start_FIFO_blk[1] | proc_10_TLF_FIFO_blk[1] | proc_10_input_sync_blk[1] | proc_10_output_sync_blk[1]);
    assign proc_10_data_FIFO_blk[2] = 1'b0 | (~check_in_multiplexer_U0.pt_dstFifo_blk_n);
    assign proc_10_data_PIPO_blk[2] = 1'b0;
    assign proc_10_start_FIFO_blk[2] = 1'b0;
    assign proc_10_TLF_FIFO_blk[2] = 1'b0;
    assign proc_10_input_sync_blk[2] = 1'b0;
    assign proc_10_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_10[2] = dl_detect_out ? proc_dep_vld_vec_10_reg[2] : (proc_10_data_FIFO_blk[2] | proc_10_data_PIPO_blk[2] | proc_10_start_FIFO_blk[2] | proc_10_TLF_FIFO_blk[2] | proc_10_input_sync_blk[2] | proc_10_output_sync_blk[2]);
    assign proc_10_data_FIFO_blk[3] = 1'b0 | (~check_in_multiplexer_U0.pt_portCheckUsed_req_fifo_blk_n);
    assign proc_10_data_PIPO_blk[3] = 1'b0;
    assign proc_10_start_FIFO_blk[3] = 1'b0;
    assign proc_10_TLF_FIFO_blk[3] = 1'b0;
    assign proc_10_input_sync_blk[3] = 1'b0;
    assign proc_10_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_10[3] = dl_detect_out ? proc_dep_vld_vec_10_reg[3] : (proc_10_data_FIFO_blk[3] | proc_10_data_PIPO_blk[3] | proc_10_start_FIFO_blk[3] | proc_10_TLF_FIFO_blk[3] | proc_10_input_sync_blk[3] | proc_10_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_10_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_10_reg <= proc_dep_vld_vec_10;
        end
    end
    assign in_chan_dep_vld_vec_10[0] = dep_chan_vld_8_10;
    assign in_chan_dep_data_vec_10[59 : 0] = dep_chan_data_8_10;
    assign token_in_vec_10[0] = token_8_10;
    assign in_chan_dep_vld_vec_10[1] = dep_chan_vld_9_10;
    assign in_chan_dep_data_vec_10[119 : 60] = dep_chan_data_9_10;
    assign token_in_vec_10[1] = token_9_10;
    assign in_chan_dep_vld_vec_10[2] = dep_chan_vld_11_10;
    assign in_chan_dep_data_vec_10[179 : 120] = dep_chan_data_11_10;
    assign token_in_vec_10[2] = token_11_10;
    assign in_chan_dep_vld_vec_10[3] = dep_chan_vld_26_10;
    assign in_chan_dep_data_vec_10[239 : 180] = dep_chan_data_26_10;
    assign token_in_vec_10[3] = token_26_10;
    assign dep_chan_vld_10_26 = out_chan_dep_vld_vec_10[0];
    assign dep_chan_data_10_26 = out_chan_dep_data_10;
    assign token_10_26 = token_out_vec_10[0];
    assign dep_chan_vld_10_8 = out_chan_dep_vld_vec_10[1];
    assign dep_chan_data_10_8 = out_chan_dep_data_10;
    assign token_10_8 = token_out_vec_10[1];
    assign dep_chan_vld_10_11 = out_chan_dep_vld_vec_10[2];
    assign dep_chan_data_10_11 = out_chan_dep_data_10;
    assign token_10_11 = token_out_vec_10[2];
    assign dep_chan_vld_10_9 = out_chan_dep_vld_vec_10[3];
    assign dep_chan_data_10_9 = out_chan_dep_data_10;
    assign token_10_9 = token_out_vec_10[3];

    // Process: check_out_multiplexer_U0
    toe_top_hls_deadlock_detect_unit #(60, 11, 4, 4) toe_top_hls_deadlock_detect_unit_11 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_11),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_11),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_11),
        .token_in_vec(token_in_vec_11),
        .dl_detect_in(dl_detect_out),
        .origin(origin[11]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_11),
        .out_chan_dep_data(out_chan_dep_data_11),
        .token_out_vec(token_out_vec_11),
        .dl_detect_out(dl_in_vec[11]));

    assign proc_11_data_FIFO_blk[0] = 1'b0 | (~check_out_multiplexer_U0.pt_dstFifo_blk_n);
    assign proc_11_data_PIPO_blk[0] = 1'b0;
    assign proc_11_start_FIFO_blk[0] = 1'b0;
    assign proc_11_TLF_FIFO_blk[0] = 1'b0;
    assign proc_11_input_sync_blk[0] = 1'b0;
    assign proc_11_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_11[0] = dl_detect_out ? proc_dep_vld_vec_11_reg[0] : (proc_11_data_FIFO_blk[0] | proc_11_data_PIPO_blk[0] | proc_11_start_FIFO_blk[0] | proc_11_TLF_FIFO_blk[0] | proc_11_input_sync_blk[0] | proc_11_output_sync_blk[0]);
    assign proc_11_data_FIFO_blk[1] = 1'b0 | (~check_out_multiplexer_U0.pt_portCheckListening_rsp_fifo_blk_n);
    assign proc_11_data_PIPO_blk[1] = 1'b0;
    assign proc_11_start_FIFO_blk[1] = 1'b0;
    assign proc_11_TLF_FIFO_blk[1] = 1'b0;
    assign proc_11_input_sync_blk[1] = 1'b0;
    assign proc_11_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_11[1] = dl_detect_out ? proc_dep_vld_vec_11_reg[1] : (proc_11_data_FIFO_blk[1] | proc_11_data_PIPO_blk[1] | proc_11_start_FIFO_blk[1] | proc_11_TLF_FIFO_blk[1] | proc_11_input_sync_blk[1] | proc_11_output_sync_blk[1]);
    assign proc_11_data_FIFO_blk[2] = 1'b0 | (~check_out_multiplexer_U0.portTable2rxEng_check_rsp_blk_n);
    assign proc_11_data_PIPO_blk[2] = 1'b0;
    assign proc_11_start_FIFO_blk[2] = 1'b0;
    assign proc_11_TLF_FIFO_blk[2] = 1'b0;
    assign proc_11_input_sync_blk[2] = 1'b0;
    assign proc_11_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_11[2] = dl_detect_out ? proc_dep_vld_vec_11_reg[2] : (proc_11_data_FIFO_blk[2] | proc_11_data_PIPO_blk[2] | proc_11_start_FIFO_blk[2] | proc_11_TLF_FIFO_blk[2] | proc_11_input_sync_blk[2] | proc_11_output_sync_blk[2]);
    assign proc_11_data_FIFO_blk[3] = 1'b0 | (~check_out_multiplexer_U0.pt_portCheckUsed_rsp_fifo_blk_n);
    assign proc_11_data_PIPO_blk[3] = 1'b0;
    assign proc_11_start_FIFO_blk[3] = 1'b0;
    assign proc_11_TLF_FIFO_blk[3] = 1'b0;
    assign proc_11_input_sync_blk[3] = 1'b0;
    assign proc_11_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_11[3] = dl_detect_out ? proc_dep_vld_vec_11_reg[3] : (proc_11_data_FIFO_blk[3] | proc_11_data_PIPO_blk[3] | proc_11_start_FIFO_blk[3] | proc_11_TLF_FIFO_blk[3] | proc_11_input_sync_blk[3] | proc_11_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_11_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_11_reg <= proc_dep_vld_vec_11;
        end
    end
    assign in_chan_dep_vld_vec_11[0] = dep_chan_vld_8_11;
    assign in_chan_dep_data_vec_11[59 : 0] = dep_chan_data_8_11;
    assign token_in_vec_11[0] = token_8_11;
    assign in_chan_dep_vld_vec_11[1] = dep_chan_vld_9_11;
    assign in_chan_dep_data_vec_11[119 : 60] = dep_chan_data_9_11;
    assign token_in_vec_11[1] = token_9_11;
    assign in_chan_dep_vld_vec_11[2] = dep_chan_vld_10_11;
    assign in_chan_dep_data_vec_11[179 : 120] = dep_chan_data_10_11;
    assign token_in_vec_11[2] = token_10_11;
    assign in_chan_dep_vld_vec_11[3] = dep_chan_vld_31_11;
    assign in_chan_dep_data_vec_11[239 : 180] = dep_chan_data_31_11;
    assign token_in_vec_11[3] = token_31_11;
    assign dep_chan_vld_11_10 = out_chan_dep_vld_vec_11[0];
    assign dep_chan_data_11_10 = out_chan_dep_data_11;
    assign token_11_10 = token_out_vec_11[0];
    assign dep_chan_vld_11_8 = out_chan_dep_vld_vec_11[1];
    assign dep_chan_data_11_8 = out_chan_dep_data_11;
    assign token_11_8 = token_out_vec_11[1];
    assign dep_chan_vld_11_31 = out_chan_dep_vld_vec_11[2];
    assign dep_chan_data_11_31 = out_chan_dep_data_11;
    assign token_11_31 = token_out_vec_11[2];
    assign dep_chan_vld_11_9 = out_chan_dep_vld_vec_11[3];
    assign dep_chan_data_11_9 = out_chan_dep_data_11;
    assign token_11_9 = token_out_vec_11[3];

    // Process: stream_merger_event_U0
    toe_top_hls_deadlock_detect_unit #(60, 12, 3, 3) toe_top_hls_deadlock_detect_unit_12 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_12),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_12),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_12),
        .token_in_vec(token_in_vec_12),
        .dl_detect_in(dl_detect_out),
        .origin(origin[12]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_12),
        .out_chan_dep_data(out_chan_dep_data_12),
        .token_out_vec(token_out_vec_12),
        .dl_detect_out(dl_in_vec[12]));

    assign proc_12_data_FIFO_blk[0] = 1'b0 | (~stream_merger_event_U0.rtTimer2eventEng_setEvent_blk_n);
    assign proc_12_data_PIPO_blk[0] = 1'b0;
    assign proc_12_start_FIFO_blk[0] = 1'b0;
    assign proc_12_TLF_FIFO_blk[0] = 1'b0;
    assign proc_12_input_sync_blk[0] = 1'b0;
    assign proc_12_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_12[0] = dl_detect_out ? proc_dep_vld_vec_12_reg[0] : (proc_12_data_FIFO_blk[0] | proc_12_data_PIPO_blk[0] | proc_12_start_FIFO_blk[0] | proc_12_TLF_FIFO_blk[0] | proc_12_input_sync_blk[0] | proc_12_output_sync_blk[0]);
    assign proc_12_data_FIFO_blk[1] = 1'b0 | (~stream_merger_event_U0.timer2eventEng_setEvent_blk_n);
    assign proc_12_data_PIPO_blk[1] = 1'b0;
    assign proc_12_start_FIFO_blk[1] = 1'b0;
    assign proc_12_TLF_FIFO_blk[1] = 1'b0;
    assign proc_12_input_sync_blk[1] = 1'b0;
    assign proc_12_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_12[1] = dl_detect_out ? proc_dep_vld_vec_12_reg[1] : (proc_12_data_FIFO_blk[1] | proc_12_data_PIPO_blk[1] | proc_12_start_FIFO_blk[1] | proc_12_TLF_FIFO_blk[1] | proc_12_input_sync_blk[1] | proc_12_output_sync_blk[1]);
    assign proc_12_data_FIFO_blk[2] = 1'b0 | (~stream_merger_event_U0.probeTimer2eventEng_setEvent_blk_n);
    assign proc_12_data_PIPO_blk[2] = 1'b0;
    assign proc_12_start_FIFO_blk[2] = 1'b0;
    assign proc_12_TLF_FIFO_blk[2] = 1'b0;
    assign proc_12_input_sync_blk[2] = 1'b0;
    assign proc_12_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_12[2] = dl_detect_out ? proc_dep_vld_vec_12_reg[2] : (proc_12_data_FIFO_blk[2] | proc_12_data_PIPO_blk[2] | proc_12_start_FIFO_blk[2] | proc_12_TLF_FIFO_blk[2] | proc_12_input_sync_blk[2] | proc_12_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_12_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_12_reg <= proc_dep_vld_vec_12;
        end
    end
    assign in_chan_dep_vld_vec_12[0] = dep_chan_vld_13_12;
    assign in_chan_dep_data_vec_12[59 : 0] = dep_chan_data_13_12;
    assign token_in_vec_12[0] = token_13_12;
    assign in_chan_dep_vld_vec_12[1] = dep_chan_vld_14_12;
    assign in_chan_dep_data_vec_12[119 : 60] = dep_chan_data_14_12;
    assign token_in_vec_12[1] = token_14_12;
    assign in_chan_dep_vld_vec_12[2] = dep_chan_vld_17_12;
    assign in_chan_dep_data_vec_12[179 : 120] = dep_chan_data_17_12;
    assign token_in_vec_12[2] = token_17_12;
    assign dep_chan_vld_12_13 = out_chan_dep_vld_vec_12[0];
    assign dep_chan_data_12_13 = out_chan_dep_data_12;
    assign token_12_13 = token_out_vec_12[0];
    assign dep_chan_vld_12_17 = out_chan_dep_vld_vec_12[1];
    assign dep_chan_data_12_17 = out_chan_dep_data_12;
    assign token_12_17 = token_out_vec_12[1];
    assign dep_chan_vld_12_14 = out_chan_dep_vld_vec_12[2];
    assign dep_chan_data_12_14 = out_chan_dep_data_12;
    assign token_12_14 = token_out_vec_12[2];

    // Process: retransmit_timer_U0
    toe_top_hls_deadlock_detect_unit #(60, 13, 6, 6) toe_top_hls_deadlock_detect_unit_13 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_13),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_13),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_13),
        .token_in_vec(token_in_vec_13),
        .dl_detect_in(dl_detect_out),
        .origin(origin[13]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_13),
        .out_chan_dep_data(out_chan_dep_data_13),
        .token_out_vec(token_out_vec_13),
        .dl_detect_out(dl_in_vec[13]));

    assign proc_13_data_FIFO_blk[0] = 1'b0 | (~retransmit_timer_U0.rxEng2timer_clearRetransmitTimer_blk_n);
    assign proc_13_data_PIPO_blk[0] = 1'b0;
    assign proc_13_start_FIFO_blk[0] = 1'b0;
    assign proc_13_TLF_FIFO_blk[0] = 1'b0;
    assign proc_13_input_sync_blk[0] = 1'b0;
    assign proc_13_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_13[0] = dl_detect_out ? proc_dep_vld_vec_13_reg[0] : (proc_13_data_FIFO_blk[0] | proc_13_data_PIPO_blk[0] | proc_13_start_FIFO_blk[0] | proc_13_TLF_FIFO_blk[0] | proc_13_input_sync_blk[0] | proc_13_output_sync_blk[0]);
    assign proc_13_data_FIFO_blk[1] = 1'b0 | (~retransmit_timer_U0.txEng2timer_setRetransmitTimer_blk_n);
    assign proc_13_data_PIPO_blk[1] = 1'b0;
    assign proc_13_start_FIFO_blk[1] = 1'b0;
    assign proc_13_TLF_FIFO_blk[1] = 1'b0;
    assign proc_13_input_sync_blk[1] = 1'b0;
    assign proc_13_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_13[1] = dl_detect_out ? proc_dep_vld_vec_13_reg[1] : (proc_13_data_FIFO_blk[1] | proc_13_data_PIPO_blk[1] | proc_13_start_FIFO_blk[1] | proc_13_TLF_FIFO_blk[1] | proc_13_input_sync_blk[1] | proc_13_output_sync_blk[1]);
    assign proc_13_data_FIFO_blk[2] = 1'b0 | (~retransmit_timer_U0.rtTimer2eventEng_setEvent_blk_n);
    assign proc_13_data_PIPO_blk[2] = 1'b0;
    assign proc_13_start_FIFO_blk[2] = 1'b0;
    assign proc_13_TLF_FIFO_blk[2] = 1'b0;
    assign proc_13_input_sync_blk[2] = 1'b0;
    assign proc_13_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_13[2] = dl_detect_out ? proc_dep_vld_vec_13_reg[2] : (proc_13_data_FIFO_blk[2] | proc_13_data_PIPO_blk[2] | proc_13_start_FIFO_blk[2] | proc_13_TLF_FIFO_blk[2] | proc_13_input_sync_blk[2] | proc_13_output_sync_blk[2]);
    assign proc_13_data_FIFO_blk[3] = 1'b0 | (~retransmit_timer_U0.rtTimer2stateTable_releaseState_blk_n);
    assign proc_13_data_PIPO_blk[3] = 1'b0;
    assign proc_13_start_FIFO_blk[3] = 1'b0;
    assign proc_13_TLF_FIFO_blk[3] = 1'b0;
    assign proc_13_input_sync_blk[3] = 1'b0;
    assign proc_13_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_13[3] = dl_detect_out ? proc_dep_vld_vec_13_reg[3] : (proc_13_data_FIFO_blk[3] | proc_13_data_PIPO_blk[3] | proc_13_start_FIFO_blk[3] | proc_13_TLF_FIFO_blk[3] | proc_13_input_sync_blk[3] | proc_13_output_sync_blk[3]);
    assign proc_13_data_FIFO_blk[4] = 1'b0 | (~retransmit_timer_U0.timer2txApp_notification_blk_n);
    assign proc_13_data_PIPO_blk[4] = 1'b0;
    assign proc_13_start_FIFO_blk[4] = 1'b0;
    assign proc_13_TLF_FIFO_blk[4] = 1'b0;
    assign proc_13_input_sync_blk[4] = 1'b0;
    assign proc_13_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_13[4] = dl_detect_out ? proc_dep_vld_vec_13_reg[4] : (proc_13_data_FIFO_blk[4] | proc_13_data_PIPO_blk[4] | proc_13_start_FIFO_blk[4] | proc_13_TLF_FIFO_blk[4] | proc_13_input_sync_blk[4] | proc_13_output_sync_blk[4]);
    assign proc_13_data_FIFO_blk[5] = 1'b0 | (~retransmit_timer_U0.timer2rxApp_notification_blk_n);
    assign proc_13_data_PIPO_blk[5] = 1'b0;
    assign proc_13_start_FIFO_blk[5] = 1'b0;
    assign proc_13_TLF_FIFO_blk[5] = 1'b0;
    assign proc_13_input_sync_blk[5] = 1'b0;
    assign proc_13_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_13[5] = dl_detect_out ? proc_dep_vld_vec_13_reg[5] : (proc_13_data_FIFO_blk[5] | proc_13_data_PIPO_blk[5] | proc_13_start_FIFO_blk[5] | proc_13_TLF_FIFO_blk[5] | proc_13_input_sync_blk[5] | proc_13_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_13_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_13_reg <= proc_dep_vld_vec_13;
        end
    end
    assign in_chan_dep_vld_vec_13[0] = dep_chan_vld_12_13;
    assign in_chan_dep_data_vec_13[59 : 0] = dep_chan_data_12_13;
    assign token_in_vec_13[0] = token_12_13;
    assign in_chan_dep_vld_vec_13[1] = dep_chan_vld_16_13;
    assign in_chan_dep_data_vec_13[119 : 60] = dep_chan_data_16_13;
    assign token_in_vec_13[1] = token_16_13;
    assign in_chan_dep_vld_vec_13[2] = dep_chan_vld_32_13;
    assign in_chan_dep_data_vec_13[179 : 120] = dep_chan_data_32_13;
    assign token_in_vec_13[2] = token_32_13;
    assign in_chan_dep_vld_vec_13[3] = dep_chan_vld_35_13;
    assign in_chan_dep_data_vec_13[239 : 180] = dep_chan_data_35_13;
    assign token_in_vec_13[3] = token_35_13;
    assign in_chan_dep_vld_vec_13[4] = dep_chan_vld_52_13;
    assign in_chan_dep_data_vec_13[299 : 240] = dep_chan_data_52_13;
    assign token_in_vec_13[4] = token_52_13;
    assign in_chan_dep_vld_vec_13[5] = dep_chan_vld_58_13;
    assign in_chan_dep_data_vec_13[359 : 300] = dep_chan_data_58_13;
    assign token_in_vec_13[5] = token_58_13;
    assign dep_chan_vld_13_32 = out_chan_dep_vld_vec_13[0];
    assign dep_chan_data_13_32 = out_chan_dep_data_13;
    assign token_13_32 = token_out_vec_13[0];
    assign dep_chan_vld_13_35 = out_chan_dep_vld_vec_13[1];
    assign dep_chan_data_13_35 = out_chan_dep_data_13;
    assign token_13_35 = token_out_vec_13[1];
    assign dep_chan_vld_13_12 = out_chan_dep_vld_vec_13[2];
    assign dep_chan_data_13_12 = out_chan_dep_data_13;
    assign token_13_12 = token_out_vec_13[2];
    assign dep_chan_vld_13_16 = out_chan_dep_vld_vec_13[3];
    assign dep_chan_data_13_16 = out_chan_dep_data_13;
    assign token_13_16 = token_out_vec_13[3];
    assign dep_chan_vld_13_58 = out_chan_dep_vld_vec_13[4];
    assign dep_chan_data_13_58 = out_chan_dep_data_13;
    assign token_13_58 = token_out_vec_13[4];
    assign dep_chan_vld_13_52 = out_chan_dep_vld_vec_13[5];
    assign dep_chan_data_13_52 = out_chan_dep_data_13;
    assign token_13_52 = token_out_vec_13[5];

    // Process: probe_timer_U0
    toe_top_hls_deadlock_detect_unit #(60, 14, 3, 3) toe_top_hls_deadlock_detect_unit_14 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_14),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_14),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_14),
        .token_in_vec(token_in_vec_14),
        .dl_detect_in(dl_detect_out),
        .origin(origin[14]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_14),
        .out_chan_dep_data(out_chan_dep_data_14),
        .token_out_vec(token_out_vec_14),
        .dl_detect_out(dl_in_vec[14]));

    assign proc_14_data_FIFO_blk[0] = 1'b0 | (~probe_timer_U0.txEng2timer_setProbeTimer_blk_n);
    assign proc_14_data_PIPO_blk[0] = 1'b0;
    assign proc_14_start_FIFO_blk[0] = 1'b0;
    assign proc_14_TLF_FIFO_blk[0] = 1'b0;
    assign proc_14_input_sync_blk[0] = 1'b0;
    assign proc_14_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_14[0] = dl_detect_out ? proc_dep_vld_vec_14_reg[0] : (proc_14_data_FIFO_blk[0] | proc_14_data_PIPO_blk[0] | proc_14_start_FIFO_blk[0] | proc_14_TLF_FIFO_blk[0] | proc_14_input_sync_blk[0] | proc_14_output_sync_blk[0]);
    assign proc_14_data_FIFO_blk[1] = 1'b0 | (~probe_timer_U0.rxEng2timer_clearProbeTimer_blk_n);
    assign proc_14_data_PIPO_blk[1] = 1'b0;
    assign proc_14_start_FIFO_blk[1] = 1'b0;
    assign proc_14_TLF_FIFO_blk[1] = 1'b0;
    assign proc_14_input_sync_blk[1] = 1'b0;
    assign proc_14_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_14[1] = dl_detect_out ? proc_dep_vld_vec_14_reg[1] : (proc_14_data_FIFO_blk[1] | proc_14_data_PIPO_blk[1] | proc_14_start_FIFO_blk[1] | proc_14_TLF_FIFO_blk[1] | proc_14_input_sync_blk[1] | proc_14_output_sync_blk[1]);
    assign proc_14_data_FIFO_blk[2] = 1'b0 | (~probe_timer_U0.probeTimer2eventEng_setEvent_blk_n);
    assign proc_14_data_PIPO_blk[2] = 1'b0;
    assign proc_14_start_FIFO_blk[2] = 1'b0;
    assign proc_14_TLF_FIFO_blk[2] = 1'b0;
    assign proc_14_input_sync_blk[2] = 1'b0;
    assign proc_14_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_14[2] = dl_detect_out ? proc_dep_vld_vec_14_reg[2] : (proc_14_data_FIFO_blk[2] | proc_14_data_PIPO_blk[2] | proc_14_start_FIFO_blk[2] | proc_14_TLF_FIFO_blk[2] | proc_14_input_sync_blk[2] | proc_14_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_14_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_14_reg <= proc_dep_vld_vec_14;
        end
    end
    assign in_chan_dep_vld_vec_14[0] = dep_chan_vld_12_14;
    assign in_chan_dep_data_vec_14[59 : 0] = dep_chan_data_12_14;
    assign token_in_vec_14[0] = token_12_14;
    assign in_chan_dep_vld_vec_14[1] = dep_chan_vld_32_14;
    assign in_chan_dep_data_vec_14[119 : 60] = dep_chan_data_32_14;
    assign token_in_vec_14[1] = token_32_14;
    assign in_chan_dep_vld_vec_14[2] = dep_chan_vld_35_14;
    assign in_chan_dep_data_vec_14[179 : 120] = dep_chan_data_35_14;
    assign token_in_vec_14[2] = token_35_14;
    assign dep_chan_vld_14_35 = out_chan_dep_vld_vec_14[0];
    assign dep_chan_data_14_35 = out_chan_dep_data_14;
    assign token_14_35 = token_out_vec_14[0];
    assign dep_chan_vld_14_32 = out_chan_dep_vld_vec_14[1];
    assign dep_chan_data_14_32 = out_chan_dep_data_14;
    assign token_14_32 = token_out_vec_14[1];
    assign dep_chan_vld_14_12 = out_chan_dep_vld_vec_14[2];
    assign dep_chan_data_14_12 = out_chan_dep_data_14;
    assign token_14_12 = token_out_vec_14[2];

    // Process: close_timer_U0
    toe_top_hls_deadlock_detect_unit #(60, 15, 2, 2) toe_top_hls_deadlock_detect_unit_15 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_15),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_15),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_15),
        .token_in_vec(token_in_vec_15),
        .dl_detect_in(dl_detect_out),
        .origin(origin[15]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_15),
        .out_chan_dep_data(out_chan_dep_data_15),
        .token_out_vec(token_out_vec_15),
        .dl_detect_out(dl_in_vec[15]));

    assign proc_15_data_FIFO_blk[0] = 1'b0 | (~close_timer_U0.rxEng2timer_setCloseTimer_blk_n);
    assign proc_15_data_PIPO_blk[0] = 1'b0;
    assign proc_15_start_FIFO_blk[0] = 1'b0;
    assign proc_15_TLF_FIFO_blk[0] = 1'b0;
    assign proc_15_input_sync_blk[0] = 1'b0;
    assign proc_15_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_15[0] = dl_detect_out ? proc_dep_vld_vec_15_reg[0] : (proc_15_data_FIFO_blk[0] | proc_15_data_PIPO_blk[0] | proc_15_start_FIFO_blk[0] | proc_15_TLF_FIFO_blk[0] | proc_15_input_sync_blk[0] | proc_15_output_sync_blk[0]);
    assign proc_15_data_FIFO_blk[1] = 1'b0 | (~close_timer_U0.closeTimer2stateTable_releaseState_blk_n);
    assign proc_15_data_PIPO_blk[1] = 1'b0;
    assign proc_15_start_FIFO_blk[1] = 1'b0;
    assign proc_15_TLF_FIFO_blk[1] = 1'b0;
    assign proc_15_input_sync_blk[1] = 1'b0;
    assign proc_15_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_15[1] = dl_detect_out ? proc_dep_vld_vec_15_reg[1] : (proc_15_data_FIFO_blk[1] | proc_15_data_PIPO_blk[1] | proc_15_start_FIFO_blk[1] | proc_15_TLF_FIFO_blk[1] | proc_15_input_sync_blk[1] | proc_15_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_15_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_15_reg <= proc_dep_vld_vec_15;
        end
    end
    assign in_chan_dep_vld_vec_15[0] = dep_chan_vld_16_15;
    assign in_chan_dep_data_vec_15[59 : 0] = dep_chan_data_16_15;
    assign token_in_vec_15[0] = token_16_15;
    assign in_chan_dep_vld_vec_15[1] = dep_chan_vld_32_15;
    assign in_chan_dep_data_vec_15[119 : 60] = dep_chan_data_32_15;
    assign token_in_vec_15[1] = token_32_15;
    assign dep_chan_vld_15_32 = out_chan_dep_vld_vec_15[0];
    assign dep_chan_data_15_32 = out_chan_dep_data_15;
    assign token_15_32 = token_out_vec_15[0];
    assign dep_chan_vld_15_16 = out_chan_dep_vld_vec_15[1];
    assign dep_chan_data_15_16 = out_chan_dep_data_15;
    assign token_15_16 = token_out_vec_15[1];

    // Process: stream_merger_ap_uint_16_U0
    toe_top_hls_deadlock_detect_unit #(60, 16, 3, 3) toe_top_hls_deadlock_detect_unit_16 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_16),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_16),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_16),
        .token_in_vec(token_in_vec_16),
        .dl_detect_in(dl_detect_out),
        .origin(origin[16]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_16),
        .out_chan_dep_data(out_chan_dep_data_16),
        .token_out_vec(token_out_vec_16),
        .dl_detect_out(dl_in_vec[16]));

    assign proc_16_data_FIFO_blk[0] = 1'b0 | (~stream_merger_ap_uint_16_U0.closeTimer2stateTable_releaseState_blk_n);
    assign proc_16_data_PIPO_blk[0] = 1'b0;
    assign proc_16_start_FIFO_blk[0] = 1'b0;
    assign proc_16_TLF_FIFO_blk[0] = 1'b0;
    assign proc_16_input_sync_blk[0] = 1'b0;
    assign proc_16_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_16[0] = dl_detect_out ? proc_dep_vld_vec_16_reg[0] : (proc_16_data_FIFO_blk[0] | proc_16_data_PIPO_blk[0] | proc_16_start_FIFO_blk[0] | proc_16_TLF_FIFO_blk[0] | proc_16_input_sync_blk[0] | proc_16_output_sync_blk[0]);
    assign proc_16_data_FIFO_blk[1] = 1'b0 | (~stream_merger_ap_uint_16_U0.timer2stateTable_releaseState_blk_n);
    assign proc_16_data_PIPO_blk[1] = 1'b0;
    assign proc_16_start_FIFO_blk[1] = 1'b0;
    assign proc_16_TLF_FIFO_blk[1] = 1'b0;
    assign proc_16_input_sync_blk[1] = 1'b0;
    assign proc_16_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_16[1] = dl_detect_out ? proc_dep_vld_vec_16_reg[1] : (proc_16_data_FIFO_blk[1] | proc_16_data_PIPO_blk[1] | proc_16_start_FIFO_blk[1] | proc_16_TLF_FIFO_blk[1] | proc_16_input_sync_blk[1] | proc_16_output_sync_blk[1]);
    assign proc_16_data_FIFO_blk[2] = 1'b0 | (~stream_merger_ap_uint_16_U0.rtTimer2stateTable_releaseState_blk_n);
    assign proc_16_data_PIPO_blk[2] = 1'b0;
    assign proc_16_start_FIFO_blk[2] = 1'b0;
    assign proc_16_TLF_FIFO_blk[2] = 1'b0;
    assign proc_16_input_sync_blk[2] = 1'b0;
    assign proc_16_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_16[2] = dl_detect_out ? proc_dep_vld_vec_16_reg[2] : (proc_16_data_FIFO_blk[2] | proc_16_data_PIPO_blk[2] | proc_16_start_FIFO_blk[2] | proc_16_TLF_FIFO_blk[2] | proc_16_input_sync_blk[2] | proc_16_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_16_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_16_reg <= proc_dep_vld_vec_16;
        end
    end
    assign in_chan_dep_vld_vec_16[0] = dep_chan_vld_5_16;
    assign in_chan_dep_data_vec_16[59 : 0] = dep_chan_data_5_16;
    assign token_in_vec_16[0] = token_5_16;
    assign in_chan_dep_vld_vec_16[1] = dep_chan_vld_13_16;
    assign in_chan_dep_data_vec_16[119 : 60] = dep_chan_data_13_16;
    assign token_in_vec_16[1] = token_13_16;
    assign in_chan_dep_vld_vec_16[2] = dep_chan_vld_15_16;
    assign in_chan_dep_data_vec_16[179 : 120] = dep_chan_data_15_16;
    assign token_in_vec_16[2] = token_15_16;
    assign dep_chan_vld_16_15 = out_chan_dep_vld_vec_16[0];
    assign dep_chan_data_16_15 = out_chan_dep_data_16;
    assign token_16_15 = token_out_vec_16[0];
    assign dep_chan_vld_16_5 = out_chan_dep_vld_vec_16[1];
    assign dep_chan_data_16_5 = out_chan_dep_data_16;
    assign token_16_5 = token_out_vec_16[1];
    assign dep_chan_vld_16_13 = out_chan_dep_vld_vec_16[2];
    assign dep_chan_data_16_13 = out_chan_dep_data_16;
    assign token_16_13 = token_out_vec_16[2];

    // Process: event_engine_U0
    toe_top_hls_deadlock_detect_unit #(60, 17, 5, 5) toe_top_hls_deadlock_detect_unit_17 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_17),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_17),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_17),
        .token_in_vec(token_in_vec_17),
        .dl_detect_in(dl_detect_out),
        .origin(origin[17]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_17),
        .out_chan_dep_data(out_chan_dep_data_17),
        .token_out_vec(token_out_vec_17),
        .dl_detect_out(dl_in_vec[17]));

    assign proc_17_data_FIFO_blk[0] = 1'b0 | (~event_engine_U0.rxEng2eventEng_setEvent_blk_n);
    assign proc_17_data_PIPO_blk[0] = 1'b0;
    assign proc_17_start_FIFO_blk[0] = 1'b0;
    assign proc_17_TLF_FIFO_blk[0] = 1'b0;
    assign proc_17_input_sync_blk[0] = 1'b0;
    assign proc_17_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_17[0] = dl_detect_out ? proc_dep_vld_vec_17_reg[0] : (proc_17_data_FIFO_blk[0] | proc_17_data_PIPO_blk[0] | proc_17_start_FIFO_blk[0] | proc_17_TLF_FIFO_blk[0] | proc_17_input_sync_blk[0] | proc_17_output_sync_blk[0]);
    assign proc_17_data_FIFO_blk[1] = 1'b0 | (~event_engine_U0.eventEng2ackDelay_event_blk_n) | (~event_engine_U0.ackDelayFifoReadCount_blk_n) | (~event_engine_U0.ackDelayFifoWriteCount_blk_n);
    assign proc_17_data_PIPO_blk[1] = 1'b0;
    assign proc_17_start_FIFO_blk[1] = 1'b0;
    assign proc_17_TLF_FIFO_blk[1] = 1'b0;
    assign proc_17_input_sync_blk[1] = 1'b0;
    assign proc_17_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_17[1] = dl_detect_out ? proc_dep_vld_vec_17_reg[1] : (proc_17_data_FIFO_blk[1] | proc_17_data_PIPO_blk[1] | proc_17_start_FIFO_blk[1] | proc_17_TLF_FIFO_blk[1] | proc_17_input_sync_blk[1] | proc_17_output_sync_blk[1]);
    assign proc_17_data_FIFO_blk[2] = 1'b0 | (~event_engine_U0.timer2eventEng_setEvent_blk_n);
    assign proc_17_data_PIPO_blk[2] = 1'b0;
    assign proc_17_start_FIFO_blk[2] = 1'b0;
    assign proc_17_TLF_FIFO_blk[2] = 1'b0;
    assign proc_17_input_sync_blk[2] = 1'b0;
    assign proc_17_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_17[2] = dl_detect_out ? proc_dep_vld_vec_17_reg[2] : (proc_17_data_FIFO_blk[2] | proc_17_data_PIPO_blk[2] | proc_17_start_FIFO_blk[2] | proc_17_TLF_FIFO_blk[2] | proc_17_input_sync_blk[2] | proc_17_output_sync_blk[2]);
    assign proc_17_data_FIFO_blk[3] = 1'b0 | (~event_engine_U0.txApp2eventEng_setEvent_blk_n);
    assign proc_17_data_PIPO_blk[3] = 1'b0;
    assign proc_17_start_FIFO_blk[3] = 1'b0;
    assign proc_17_TLF_FIFO_blk[3] = 1'b0;
    assign proc_17_input_sync_blk[3] = 1'b0;
    assign proc_17_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_17[3] = dl_detect_out ? proc_dep_vld_vec_17_reg[3] : (proc_17_data_FIFO_blk[3] | proc_17_data_PIPO_blk[3] | proc_17_start_FIFO_blk[3] | proc_17_TLF_FIFO_blk[3] | proc_17_input_sync_blk[3] | proc_17_output_sync_blk[3]);
    assign proc_17_data_FIFO_blk[4] = 1'b0 | (~event_engine_U0.txEngFifoReadCount_blk_n);
    assign proc_17_data_PIPO_blk[4] = 1'b0;
    assign proc_17_start_FIFO_blk[4] = 1'b0;
    assign proc_17_TLF_FIFO_blk[4] = 1'b0;
    assign proc_17_input_sync_blk[4] = 1'b0;
    assign proc_17_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_17[4] = dl_detect_out ? proc_dep_vld_vec_17_reg[4] : (proc_17_data_FIFO_blk[4] | proc_17_data_PIPO_blk[4] | proc_17_start_FIFO_blk[4] | proc_17_TLF_FIFO_blk[4] | proc_17_input_sync_blk[4] | proc_17_output_sync_blk[4]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_17_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_17_reg <= proc_dep_vld_vec_17;
        end
    end
    assign in_chan_dep_vld_vec_17[0] = dep_chan_vld_12_17;
    assign in_chan_dep_data_vec_17[59 : 0] = dep_chan_data_12_17;
    assign token_in_vec_17[0] = token_12_17;
    assign in_chan_dep_vld_vec_17[1] = dep_chan_vld_18_17;
    assign in_chan_dep_data_vec_17[119 : 60] = dep_chan_data_18_17;
    assign token_in_vec_17[1] = token_18_17;
    assign in_chan_dep_vld_vec_17[2] = dep_chan_vld_34_17;
    assign in_chan_dep_data_vec_17[179 : 120] = dep_chan_data_34_17;
    assign token_in_vec_17[2] = token_34_17;
    assign in_chan_dep_vld_vec_17[3] = dep_chan_vld_35_17;
    assign in_chan_dep_data_vec_17[239 : 180] = dep_chan_data_35_17;
    assign token_in_vec_17[3] = token_35_17;
    assign in_chan_dep_vld_vec_17[4] = dep_chan_vld_53_17;
    assign in_chan_dep_data_vec_17[299 : 240] = dep_chan_data_53_17;
    assign token_in_vec_17[4] = token_53_17;
    assign dep_chan_vld_17_34 = out_chan_dep_vld_vec_17[0];
    assign dep_chan_data_17_34 = out_chan_dep_data_17;
    assign token_17_34 = token_out_vec_17[0];
    assign dep_chan_vld_17_18 = out_chan_dep_vld_vec_17[1];
    assign dep_chan_data_17_18 = out_chan_dep_data_17;
    assign token_17_18 = token_out_vec_17[1];
    assign dep_chan_vld_17_12 = out_chan_dep_vld_vec_17[2];
    assign dep_chan_data_17_12 = out_chan_dep_data_17;
    assign token_17_12 = token_out_vec_17[2];
    assign dep_chan_vld_17_53 = out_chan_dep_vld_vec_17[3];
    assign dep_chan_data_17_53 = out_chan_dep_data_17;
    assign token_17_53 = token_out_vec_17[3];
    assign dep_chan_vld_17_35 = out_chan_dep_vld_vec_17[4];
    assign dep_chan_data_17_35 = out_chan_dep_data_17;
    assign token_17_35 = token_out_vec_17[4];

    // Process: ack_delay_U0
    toe_top_hls_deadlock_detect_unit #(60, 18, 2, 2) toe_top_hls_deadlock_detect_unit_18 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_18),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_18),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_18),
        .token_in_vec(token_in_vec_18),
        .dl_detect_in(dl_detect_out),
        .origin(origin[18]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_18),
        .out_chan_dep_data(out_chan_dep_data_18),
        .token_out_vec(token_out_vec_18),
        .dl_detect_out(dl_in_vec[18]));

    assign proc_18_data_FIFO_blk[0] = 1'b0 | (~ack_delay_U0.eventEng2ackDelay_event_blk_n) | (~ack_delay_U0.ackDelayFifoReadCount_blk_n) | (~ack_delay_U0.ackDelayFifoWriteCount_blk_n);
    assign proc_18_data_PIPO_blk[0] = 1'b0;
    assign proc_18_start_FIFO_blk[0] = 1'b0;
    assign proc_18_TLF_FIFO_blk[0] = 1'b0;
    assign proc_18_input_sync_blk[0] = 1'b0;
    assign proc_18_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_18[0] = dl_detect_out ? proc_dep_vld_vec_18_reg[0] : (proc_18_data_FIFO_blk[0] | proc_18_data_PIPO_blk[0] | proc_18_start_FIFO_blk[0] | proc_18_TLF_FIFO_blk[0] | proc_18_input_sync_blk[0] | proc_18_output_sync_blk[0]);
    assign proc_18_data_FIFO_blk[1] = 1'b0 | (~ack_delay_U0.eventEng2txEng_event_blk_n);
    assign proc_18_data_PIPO_blk[1] = 1'b0;
    assign proc_18_start_FIFO_blk[1] = 1'b0;
    assign proc_18_TLF_FIFO_blk[1] = 1'b0;
    assign proc_18_input_sync_blk[1] = 1'b0;
    assign proc_18_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_18[1] = dl_detect_out ? proc_dep_vld_vec_18_reg[1] : (proc_18_data_FIFO_blk[1] | proc_18_data_PIPO_blk[1] | proc_18_start_FIFO_blk[1] | proc_18_TLF_FIFO_blk[1] | proc_18_input_sync_blk[1] | proc_18_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_18_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_18_reg <= proc_dep_vld_vec_18;
        end
    end
    assign in_chan_dep_vld_vec_18[0] = dep_chan_vld_17_18;
    assign in_chan_dep_data_vec_18[59 : 0] = dep_chan_data_17_18;
    assign token_in_vec_18[0] = token_17_18;
    assign in_chan_dep_vld_vec_18[1] = dep_chan_vld_35_18;
    assign in_chan_dep_data_vec_18[119 : 60] = dep_chan_data_35_18;
    assign token_in_vec_18[1] = token_35_18;
    assign dep_chan_vld_18_17 = out_chan_dep_vld_vec_18[0];
    assign dep_chan_data_18_17 = out_chan_dep_data_18;
    assign token_18_17 = token_out_vec_18[0];
    assign dep_chan_vld_18_35 = out_chan_dep_vld_vec_18[1];
    assign dep_chan_data_18_35 = out_chan_dep_data_18;
    assign token_18_35 = token_out_vec_18[1];

    // Process: toe_process_ipv4_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 19, 2, 2) toe_top_hls_deadlock_detect_unit_19 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_19),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_19),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_19),
        .token_in_vec(token_in_vec_19),
        .dl_detect_in(dl_detect_out),
        .origin(origin[19]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_19),
        .out_chan_dep_data(out_chan_dep_data_19),
        .token_out_vec(token_out_vec_19),
        .dl_detect_out(dl_in_vec[19]));

    assign proc_19_data_FIFO_blk[0] = 1'b0 | (~toe_process_ipv4_512_U0.rxEng_dataBuffer0_blk_n) | (~toe_process_ipv4_512_U0.rx_process2dropLengthFifo_blk_n);
    assign proc_19_data_PIPO_blk[0] = 1'b0;
    assign proc_19_start_FIFO_blk[0] = 1'b0;
    assign proc_19_TLF_FIFO_blk[0] = 1'b0;
    assign proc_19_input_sync_blk[0] = 1'b0;
    assign proc_19_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_19[0] = dl_detect_out ? proc_dep_vld_vec_19_reg[0] : (proc_19_data_FIFO_blk[0] | proc_19_data_PIPO_blk[0] | proc_19_start_FIFO_blk[0] | proc_19_TLF_FIFO_blk[0] | proc_19_input_sync_blk[0] | proc_19_output_sync_blk[0]);
    assign proc_19_data_FIFO_blk[1] = 1'b0 | (~toe_process_ipv4_512_U0.rxEng_ipMetaFifo_blk_n);
    assign proc_19_data_PIPO_blk[1] = 1'b0;
    assign proc_19_start_FIFO_blk[1] = 1'b0;
    assign proc_19_TLF_FIFO_blk[1] = 1'b0;
    assign proc_19_input_sync_blk[1] = 1'b0;
    assign proc_19_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_19[1] = dl_detect_out ? proc_dep_vld_vec_19_reg[1] : (proc_19_data_FIFO_blk[1] | proc_19_data_PIPO_blk[1] | proc_19_start_FIFO_blk[1] | proc_19_TLF_FIFO_blk[1] | proc_19_input_sync_blk[1] | proc_19_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_19_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_19_reg <= proc_dep_vld_vec_19;
        end
    end
    assign in_chan_dep_vld_vec_19[0] = dep_chan_vld_20_19;
    assign in_chan_dep_data_vec_19[59 : 0] = dep_chan_data_20_19;
    assign token_in_vec_19[0] = token_20_19;
    assign in_chan_dep_vld_vec_19[1] = dep_chan_vld_22_19;
    assign in_chan_dep_data_vec_19[119 : 60] = dep_chan_data_22_19;
    assign token_in_vec_19[1] = token_22_19;
    assign dep_chan_vld_19_20 = out_chan_dep_vld_vec_19[0];
    assign dep_chan_data_19_20 = out_chan_dep_data_19;
    assign token_19_20 = token_out_vec_19[0];
    assign dep_chan_vld_19_22 = out_chan_dep_vld_vec_19[1];
    assign dep_chan_data_19_22 = out_chan_dep_data_19;
    assign token_19_22 = token_out_vec_19[1];

    // Process: drop_optional_ip_header_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 20, 2, 2) toe_top_hls_deadlock_detect_unit_20 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_20),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_20),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_20),
        .token_in_vec(token_in_vec_20),
        .dl_detect_in(dl_detect_out),
        .origin(origin[20]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_20),
        .out_chan_dep_data(out_chan_dep_data_20),
        .token_out_vec(token_out_vec_20),
        .dl_detect_out(dl_in_vec[20]));

    assign proc_20_data_FIFO_blk[0] = 1'b0 | (~drop_optional_ip_header_512_U0.rx_process2dropLengthFifo_blk_n) | (~drop_optional_ip_header_512_U0.rxEng_dataBuffer0_blk_n);
    assign proc_20_data_PIPO_blk[0] = 1'b0;
    assign proc_20_start_FIFO_blk[0] = 1'b0;
    assign proc_20_TLF_FIFO_blk[0] = 1'b0;
    assign proc_20_input_sync_blk[0] = 1'b0;
    assign proc_20_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_20[0] = dl_detect_out ? proc_dep_vld_vec_20_reg[0] : (proc_20_data_FIFO_blk[0] | proc_20_data_PIPO_blk[0] | proc_20_start_FIFO_blk[0] | proc_20_TLF_FIFO_blk[0] | proc_20_input_sync_blk[0] | proc_20_output_sync_blk[0]);
    assign proc_20_data_FIFO_blk[1] = 1'b0 | (~drop_optional_ip_header_512_U0.rxEng_dataBuffer4_blk_n);
    assign proc_20_data_PIPO_blk[1] = 1'b0;
    assign proc_20_start_FIFO_blk[1] = 1'b0;
    assign proc_20_TLF_FIFO_blk[1] = 1'b0;
    assign proc_20_input_sync_blk[1] = 1'b0;
    assign proc_20_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_20[1] = dl_detect_out ? proc_dep_vld_vec_20_reg[1] : (proc_20_data_FIFO_blk[1] | proc_20_data_PIPO_blk[1] | proc_20_start_FIFO_blk[1] | proc_20_TLF_FIFO_blk[1] | proc_20_input_sync_blk[1] | proc_20_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_20_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_20_reg <= proc_dep_vld_vec_20;
        end
    end
    assign in_chan_dep_vld_vec_20[0] = dep_chan_vld_19_20;
    assign in_chan_dep_data_vec_20[59 : 0] = dep_chan_data_19_20;
    assign token_in_vec_20[0] = token_19_20;
    assign in_chan_dep_vld_vec_20[1] = dep_chan_vld_21_20;
    assign in_chan_dep_data_vec_20[119 : 60] = dep_chan_data_21_20;
    assign token_in_vec_20[1] = token_21_20;
    assign dep_chan_vld_20_19 = out_chan_dep_vld_vec_20[0];
    assign dep_chan_data_20_19 = out_chan_dep_data_20;
    assign token_20_19 = token_out_vec_20[0];
    assign dep_chan_vld_20_21 = out_chan_dep_vld_vec_20[1];
    assign dep_chan_data_20_21 = out_chan_dep_data_20;
    assign token_20_21 = token_out_vec_20[1];

    // Process: lshiftWordByOctet_512_2_U0
    toe_top_hls_deadlock_detect_unit #(60, 21, 2, 2) toe_top_hls_deadlock_detect_unit_21 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_21),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_21),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_21),
        .token_in_vec(token_in_vec_21),
        .dl_detect_in(dl_detect_out),
        .origin(origin[21]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_21),
        .out_chan_dep_data(out_chan_dep_data_21),
        .token_out_vec(token_out_vec_21),
        .dl_detect_out(dl_in_vec[21]));

    assign proc_21_data_FIFO_blk[0] = 1'b0 | (~lshiftWordByOctet_512_2_U0.rxEng_dataBuffer5_blk_n);
    assign proc_21_data_PIPO_blk[0] = 1'b0;
    assign proc_21_start_FIFO_blk[0] = 1'b0;
    assign proc_21_TLF_FIFO_blk[0] = 1'b0;
    assign proc_21_input_sync_blk[0] = 1'b0;
    assign proc_21_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_21[0] = dl_detect_out ? proc_dep_vld_vec_21_reg[0] : (proc_21_data_FIFO_blk[0] | proc_21_data_PIPO_blk[0] | proc_21_start_FIFO_blk[0] | proc_21_TLF_FIFO_blk[0] | proc_21_input_sync_blk[0] | proc_21_output_sync_blk[0]);
    assign proc_21_data_FIFO_blk[1] = 1'b0 | (~lshiftWordByOctet_512_2_U0.rxEng_dataBuffer4_blk_n);
    assign proc_21_data_PIPO_blk[1] = 1'b0;
    assign proc_21_start_FIFO_blk[1] = 1'b0;
    assign proc_21_TLF_FIFO_blk[1] = 1'b0;
    assign proc_21_input_sync_blk[1] = 1'b0;
    assign proc_21_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_21[1] = dl_detect_out ? proc_dep_vld_vec_21_reg[1] : (proc_21_data_FIFO_blk[1] | proc_21_data_PIPO_blk[1] | proc_21_start_FIFO_blk[1] | proc_21_TLF_FIFO_blk[1] | proc_21_input_sync_blk[1] | proc_21_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_21_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_21_reg <= proc_dep_vld_vec_21;
        end
    end
    assign in_chan_dep_vld_vec_21[0] = dep_chan_vld_20_21;
    assign in_chan_dep_data_vec_21[59 : 0] = dep_chan_data_20_21;
    assign token_in_vec_21[0] = token_20_21;
    assign in_chan_dep_vld_vec_21[1] = dep_chan_vld_23_21;
    assign in_chan_dep_data_vec_21[119 : 60] = dep_chan_data_23_21;
    assign token_in_vec_21[1] = token_23_21;
    assign dep_chan_vld_21_23 = out_chan_dep_vld_vec_21[0];
    assign dep_chan_data_21_23 = out_chan_dep_data_21;
    assign token_21_23 = token_out_vec_21[0];
    assign dep_chan_vld_21_20 = out_chan_dep_vld_vec_21[1];
    assign dep_chan_data_21_20 = out_chan_dep_data_21;
    assign token_21_20 = token_out_vec_21[1];

    // Process: constructPseudoHeader_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 22, 2, 2) toe_top_hls_deadlock_detect_unit_22 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_22),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_22),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_22),
        .token_in_vec(token_in_vec_22),
        .dl_detect_in(dl_detect_out),
        .origin(origin[22]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_22),
        .out_chan_dep_data(out_chan_dep_data_22),
        .token_out_vec(token_out_vec_22),
        .dl_detect_out(dl_in_vec[22]));

    assign proc_22_data_FIFO_blk[0] = 1'b0 | (~constructPseudoHeader_512_U0.rxEng_ipMetaFifo_blk_n);
    assign proc_22_data_PIPO_blk[0] = 1'b0;
    assign proc_22_start_FIFO_blk[0] = 1'b0;
    assign proc_22_TLF_FIFO_blk[0] = 1'b0;
    assign proc_22_input_sync_blk[0] = 1'b0;
    assign proc_22_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_22[0] = dl_detect_out ? proc_dep_vld_vec_22_reg[0] : (proc_22_data_FIFO_blk[0] | proc_22_data_PIPO_blk[0] | proc_22_start_FIFO_blk[0] | proc_22_TLF_FIFO_blk[0] | proc_22_input_sync_blk[0] | proc_22_output_sync_blk[0]);
    assign proc_22_data_FIFO_blk[1] = 1'b0 | (~constructPseudoHeader_512_U0.rxEng_pseudoHeaderFifo_blk_n);
    assign proc_22_data_PIPO_blk[1] = 1'b0;
    assign proc_22_start_FIFO_blk[1] = 1'b0;
    assign proc_22_TLF_FIFO_blk[1] = 1'b0;
    assign proc_22_input_sync_blk[1] = 1'b0;
    assign proc_22_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_22[1] = dl_detect_out ? proc_dep_vld_vec_22_reg[1] : (proc_22_data_FIFO_blk[1] | proc_22_data_PIPO_blk[1] | proc_22_start_FIFO_blk[1] | proc_22_TLF_FIFO_blk[1] | proc_22_input_sync_blk[1] | proc_22_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_22_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_22_reg <= proc_dep_vld_vec_22;
        end
    end
    assign in_chan_dep_vld_vec_22[0] = dep_chan_vld_19_22;
    assign in_chan_dep_data_vec_22[59 : 0] = dep_chan_data_19_22;
    assign token_in_vec_22[0] = token_19_22;
    assign in_chan_dep_vld_vec_22[1] = dep_chan_vld_23_22;
    assign in_chan_dep_data_vec_22[119 : 60] = dep_chan_data_23_22;
    assign token_in_vec_22[1] = token_23_22;
    assign dep_chan_vld_22_19 = out_chan_dep_vld_vec_22[0];
    assign dep_chan_data_22_19 = out_chan_dep_data_22;
    assign token_22_19 = token_out_vec_22[0];
    assign dep_chan_vld_22_23 = out_chan_dep_vld_vec_22[1];
    assign dep_chan_data_22_23 = out_chan_dep_data_22;
    assign token_22_23 = token_out_vec_22[1];

    // Process: prependPseudoHeader_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 23, 3, 3) toe_top_hls_deadlock_detect_unit_23 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_23),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_23),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_23),
        .token_in_vec(token_in_vec_23),
        .dl_detect_in(dl_detect_out),
        .origin(origin[23]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_23),
        .out_chan_dep_data(out_chan_dep_data_23),
        .token_out_vec(token_out_vec_23),
        .dl_detect_out(dl_in_vec[23]));

    assign proc_23_data_FIFO_blk[0] = 1'b0 | (~prependPseudoHeader_512_U0.rxEng_pseudoHeaderFifo_blk_n);
    assign proc_23_data_PIPO_blk[0] = 1'b0;
    assign proc_23_start_FIFO_blk[0] = 1'b0;
    assign proc_23_TLF_FIFO_blk[0] = 1'b0;
    assign proc_23_input_sync_blk[0] = 1'b0;
    assign proc_23_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_23[0] = dl_detect_out ? proc_dep_vld_vec_23_reg[0] : (proc_23_data_FIFO_blk[0] | proc_23_data_PIPO_blk[0] | proc_23_start_FIFO_blk[0] | proc_23_TLF_FIFO_blk[0] | proc_23_input_sync_blk[0] | proc_23_output_sync_blk[0]);
    assign proc_23_data_FIFO_blk[1] = 1'b0 | (~prependPseudoHeader_512_U0.rxEng_dataBuffer1_blk_n);
    assign proc_23_data_PIPO_blk[1] = 1'b0;
    assign proc_23_start_FIFO_blk[1] = 1'b0;
    assign proc_23_TLF_FIFO_blk[1] = 1'b0;
    assign proc_23_input_sync_blk[1] = 1'b0;
    assign proc_23_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_23[1] = dl_detect_out ? proc_dep_vld_vec_23_reg[1] : (proc_23_data_FIFO_blk[1] | proc_23_data_PIPO_blk[1] | proc_23_start_FIFO_blk[1] | proc_23_TLF_FIFO_blk[1] | proc_23_input_sync_blk[1] | proc_23_output_sync_blk[1]);
    assign proc_23_data_FIFO_blk[2] = 1'b0 | (~prependPseudoHeader_512_U0.rxEng_dataBuffer5_blk_n);
    assign proc_23_data_PIPO_blk[2] = 1'b0;
    assign proc_23_start_FIFO_blk[2] = 1'b0;
    assign proc_23_TLF_FIFO_blk[2] = 1'b0;
    assign proc_23_input_sync_blk[2] = 1'b0;
    assign proc_23_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_23[2] = dl_detect_out ? proc_dep_vld_vec_23_reg[2] : (proc_23_data_FIFO_blk[2] | proc_23_data_PIPO_blk[2] | proc_23_start_FIFO_blk[2] | proc_23_TLF_FIFO_blk[2] | proc_23_input_sync_blk[2] | proc_23_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_23_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_23_reg <= proc_dep_vld_vec_23;
        end
    end
    assign in_chan_dep_vld_vec_23[0] = dep_chan_vld_21_23;
    assign in_chan_dep_data_vec_23[59 : 0] = dep_chan_data_21_23;
    assign token_in_vec_23[0] = token_21_23;
    assign in_chan_dep_vld_vec_23[1] = dep_chan_vld_22_23;
    assign in_chan_dep_data_vec_23[119 : 60] = dep_chan_data_22_23;
    assign token_in_vec_23[1] = token_22_23;
    assign in_chan_dep_vld_vec_23[2] = dep_chan_vld_24_23;
    assign in_chan_dep_data_vec_23[179 : 120] = dep_chan_data_24_23;
    assign token_in_vec_23[2] = token_24_23;
    assign dep_chan_vld_23_22 = out_chan_dep_vld_vec_23[0];
    assign dep_chan_data_23_22 = out_chan_dep_data_23;
    assign token_23_22 = token_out_vec_23[0];
    assign dep_chan_vld_23_24 = out_chan_dep_vld_vec_23[1];
    assign dep_chan_data_23_24 = out_chan_dep_data_23;
    assign token_23_24 = token_out_vec_23[1];
    assign dep_chan_vld_23_21 = out_chan_dep_vld_vec_23[2];
    assign dep_chan_data_23_21 = out_chan_dep_data_23;
    assign token_23_21 = token_out_vec_23[2];

    // Process: two_complement_subchecksums_512_11_U0
    toe_top_hls_deadlock_detect_unit #(60, 24, 3, 3) toe_top_hls_deadlock_detect_unit_24 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_24),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_24),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_24),
        .token_in_vec(token_in_vec_24),
        .dl_detect_in(dl_detect_out),
        .origin(origin[24]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_24),
        .out_chan_dep_data(out_chan_dep_data_24),
        .token_out_vec(token_out_vec_24),
        .dl_detect_out(dl_in_vec[24]));

    assign proc_24_data_FIFO_blk[0] = 1'b0 | (~two_complement_subchecksums_512_11_U0.rxEng_dataBuffer1_blk_n);
    assign proc_24_data_PIPO_blk[0] = 1'b0;
    assign proc_24_start_FIFO_blk[0] = 1'b0;
    assign proc_24_TLF_FIFO_blk[0] = 1'b0;
    assign proc_24_input_sync_blk[0] = 1'b0;
    assign proc_24_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_24[0] = dl_detect_out ? proc_dep_vld_vec_24_reg[0] : (proc_24_data_FIFO_blk[0] | proc_24_data_PIPO_blk[0] | proc_24_start_FIFO_blk[0] | proc_24_TLF_FIFO_blk[0] | proc_24_input_sync_blk[0] | proc_24_output_sync_blk[0]);
    assign proc_24_data_FIFO_blk[1] = 1'b0 | (~two_complement_subchecksums_512_11_U0.rxEng_dataBuffer2_blk_n);
    assign proc_24_data_PIPO_blk[1] = 1'b0;
    assign proc_24_start_FIFO_blk[1] = 1'b0;
    assign proc_24_TLF_FIFO_blk[1] = 1'b0;
    assign proc_24_input_sync_blk[1] = 1'b0;
    assign proc_24_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_24[1] = dl_detect_out ? proc_dep_vld_vec_24_reg[1] : (proc_24_data_FIFO_blk[1] | proc_24_data_PIPO_blk[1] | proc_24_start_FIFO_blk[1] | proc_24_TLF_FIFO_blk[1] | proc_24_input_sync_blk[1] | proc_24_output_sync_blk[1]);
    assign proc_24_data_FIFO_blk[2] = 1'b0 | (~two_complement_subchecksums_512_11_U0.subSumFifo_blk_n);
    assign proc_24_data_PIPO_blk[2] = 1'b0;
    assign proc_24_start_FIFO_blk[2] = 1'b0;
    assign proc_24_TLF_FIFO_blk[2] = 1'b0;
    assign proc_24_input_sync_blk[2] = 1'b0;
    assign proc_24_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_24[2] = dl_detect_out ? proc_dep_vld_vec_24_reg[2] : (proc_24_data_FIFO_blk[2] | proc_24_data_PIPO_blk[2] | proc_24_start_FIFO_blk[2] | proc_24_TLF_FIFO_blk[2] | proc_24_input_sync_blk[2] | proc_24_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_24_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_24_reg <= proc_dep_vld_vec_24;
        end
    end
    assign in_chan_dep_vld_vec_24[0] = dep_chan_vld_23_24;
    assign in_chan_dep_data_vec_24[59 : 0] = dep_chan_data_23_24;
    assign token_in_vec_24[0] = token_23_24;
    assign in_chan_dep_vld_vec_24[1] = dep_chan_vld_25_24;
    assign in_chan_dep_data_vec_24[119 : 60] = dep_chan_data_25_24;
    assign token_in_vec_24[1] = token_25_24;
    assign in_chan_dep_vld_vec_24[2] = dep_chan_vld_26_24;
    assign in_chan_dep_data_vec_24[179 : 120] = dep_chan_data_26_24;
    assign token_in_vec_24[2] = token_26_24;
    assign dep_chan_vld_24_23 = out_chan_dep_vld_vec_24[0];
    assign dep_chan_data_24_23 = out_chan_dep_data_24;
    assign token_24_23 = token_out_vec_24[0];
    assign dep_chan_vld_24_26 = out_chan_dep_vld_vec_24[1];
    assign dep_chan_data_24_26 = out_chan_dep_data_24;
    assign token_24_26 = token_out_vec_24[1];
    assign dep_chan_vld_24_25 = out_chan_dep_vld_vec_24[2];
    assign dep_chan_data_24_25 = out_chan_dep_data_24;
    assign token_24_25 = token_out_vec_24[2];

    // Process: toe_check_ipv4_checksum_32_U0
    toe_top_hls_deadlock_detect_unit #(60, 25, 2, 2) toe_top_hls_deadlock_detect_unit_25 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_25),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_25),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_25),
        .token_in_vec(token_in_vec_25),
        .dl_detect_in(dl_detect_out),
        .origin(origin[25]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_25),
        .out_chan_dep_data(out_chan_dep_data_25),
        .token_out_vec(token_out_vec_25),
        .dl_detect_out(dl_in_vec[25]));

    assign proc_25_data_FIFO_blk[0] = 1'b0 | (~toe_check_ipv4_checksum_32_U0.subSumFifo_blk_n);
    assign proc_25_data_PIPO_blk[0] = 1'b0;
    assign proc_25_start_FIFO_blk[0] = 1'b0;
    assign proc_25_TLF_FIFO_blk[0] = 1'b0;
    assign proc_25_input_sync_blk[0] = 1'b0;
    assign proc_25_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_25[0] = dl_detect_out ? proc_dep_vld_vec_25_reg[0] : (proc_25_data_FIFO_blk[0] | proc_25_data_PIPO_blk[0] | proc_25_start_FIFO_blk[0] | proc_25_TLF_FIFO_blk[0] | proc_25_input_sync_blk[0] | proc_25_output_sync_blk[0]);
    assign proc_25_data_FIFO_blk[1] = 1'b0 | (~toe_check_ipv4_checksum_32_U0.rxEng_checksumValidFifo_blk_n);
    assign proc_25_data_PIPO_blk[1] = 1'b0;
    assign proc_25_start_FIFO_blk[1] = 1'b0;
    assign proc_25_TLF_FIFO_blk[1] = 1'b0;
    assign proc_25_input_sync_blk[1] = 1'b0;
    assign proc_25_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_25[1] = dl_detect_out ? proc_dep_vld_vec_25_reg[1] : (proc_25_data_FIFO_blk[1] | proc_25_data_PIPO_blk[1] | proc_25_start_FIFO_blk[1] | proc_25_TLF_FIFO_blk[1] | proc_25_input_sync_blk[1] | proc_25_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_25_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_25_reg <= proc_dep_vld_vec_25;
        end
    end
    assign in_chan_dep_vld_vec_25[0] = dep_chan_vld_24_25;
    assign in_chan_dep_data_vec_25[59 : 0] = dep_chan_data_24_25;
    assign token_in_vec_25[0] = token_24_25;
    assign in_chan_dep_vld_vec_25[1] = dep_chan_vld_26_25;
    assign in_chan_dep_data_vec_25[119 : 60] = dep_chan_data_26_25;
    assign token_in_vec_25[1] = token_26_25;
    assign dep_chan_vld_25_24 = out_chan_dep_vld_vec_25[0];
    assign dep_chan_data_25_24 = out_chan_dep_data_25;
    assign token_25_24 = token_out_vec_25[0];
    assign dep_chan_vld_25_26 = out_chan_dep_vld_vec_25[1];
    assign dep_chan_data_25_26 = out_chan_dep_data_25;
    assign token_25_26 = token_out_vec_25[1];

    // Process: processPseudoHeader_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 26, 7, 7) toe_top_hls_deadlock_detect_unit_26 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_26),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_26),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_26),
        .token_in_vec(token_in_vec_26),
        .dl_detect_in(dl_detect_out),
        .origin(origin[26]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_26),
        .out_chan_dep_data(out_chan_dep_data_26),
        .token_out_vec(token_out_vec_26),
        .dl_detect_out(dl_in_vec[26]));

    assign proc_26_data_FIFO_blk[0] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_dataBuffer2_blk_n);
    assign proc_26_data_PIPO_blk[0] = 1'b0;
    assign proc_26_start_FIFO_blk[0] = 1'b0;
    assign proc_26_TLF_FIFO_blk[0] = 1'b0;
    assign proc_26_input_sync_blk[0] = 1'b0;
    assign proc_26_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_26[0] = dl_detect_out ? proc_dep_vld_vec_26_reg[0] : (proc_26_data_FIFO_blk[0] | proc_26_data_PIPO_blk[0] | proc_26_start_FIFO_blk[0] | proc_26_TLF_FIFO_blk[0] | proc_26_input_sync_blk[0] | proc_26_output_sync_blk[0]);
    assign proc_26_data_FIFO_blk[1] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_checksumValidFifo_blk_n);
    assign proc_26_data_PIPO_blk[1] = 1'b0;
    assign proc_26_start_FIFO_blk[1] = 1'b0;
    assign proc_26_TLF_FIFO_blk[1] = 1'b0;
    assign proc_26_input_sync_blk[1] = 1'b0;
    assign proc_26_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_26[1] = dl_detect_out ? proc_dep_vld_vec_26_reg[1] : (proc_26_data_FIFO_blk[1] | proc_26_data_PIPO_blk[1] | proc_26_start_FIFO_blk[1] | proc_26_TLF_FIFO_blk[1] | proc_26_input_sync_blk[1] | proc_26_output_sync_blk[1]);
    assign proc_26_data_FIFO_blk[2] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_dataBuffer3a_blk_n);
    assign proc_26_data_PIPO_blk[2] = 1'b0;
    assign proc_26_start_FIFO_blk[2] = 1'b0;
    assign proc_26_TLF_FIFO_blk[2] = 1'b0;
    assign proc_26_input_sync_blk[2] = 1'b0;
    assign proc_26_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_26[2] = dl_detect_out ? proc_dep_vld_vec_26_reg[2] : (proc_26_data_FIFO_blk[2] | proc_26_data_PIPO_blk[2] | proc_26_start_FIFO_blk[2] | proc_26_TLF_FIFO_blk[2] | proc_26_input_sync_blk[2] | proc_26_output_sync_blk[2]);
    assign proc_26_data_FIFO_blk[3] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_headerMetaFifo_blk_n);
    assign proc_26_data_PIPO_blk[3] = 1'b0;
    assign proc_26_start_FIFO_blk[3] = 1'b0;
    assign proc_26_TLF_FIFO_blk[3] = 1'b0;
    assign proc_26_input_sync_blk[3] = 1'b0;
    assign proc_26_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_26[3] = dl_detect_out ? proc_dep_vld_vec_26_reg[3] : (proc_26_data_FIFO_blk[3] | proc_26_data_PIPO_blk[3] | proc_26_start_FIFO_blk[3] | proc_26_TLF_FIFO_blk[3] | proc_26_input_sync_blk[3] | proc_26_output_sync_blk[3]);
    assign proc_26_data_FIFO_blk[4] = 1'b0 | (~processPseudoHeader_512_U0.rxEng2portTable_check_req_blk_n);
    assign proc_26_data_PIPO_blk[4] = 1'b0;
    assign proc_26_start_FIFO_blk[4] = 1'b0;
    assign proc_26_TLF_FIFO_blk[4] = 1'b0;
    assign proc_26_input_sync_blk[4] = 1'b0;
    assign proc_26_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_26[4] = dl_detect_out ? proc_dep_vld_vec_26_reg[4] : (proc_26_data_FIFO_blk[4] | proc_26_data_PIPO_blk[4] | proc_26_start_FIFO_blk[4] | proc_26_TLF_FIFO_blk[4] | proc_26_input_sync_blk[4] | proc_26_output_sync_blk[4]);
    assign proc_26_data_FIFO_blk[5] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_tupleBuffer_blk_n);
    assign proc_26_data_PIPO_blk[5] = 1'b0;
    assign proc_26_start_FIFO_blk[5] = 1'b0;
    assign proc_26_TLF_FIFO_blk[5] = 1'b0;
    assign proc_26_input_sync_blk[5] = 1'b0;
    assign proc_26_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_26[5] = dl_detect_out ? proc_dep_vld_vec_26_reg[5] : (proc_26_data_FIFO_blk[5] | proc_26_data_PIPO_blk[5] | proc_26_start_FIFO_blk[5] | proc_26_TLF_FIFO_blk[5] | proc_26_input_sync_blk[5] | proc_26_output_sync_blk[5]);
    assign proc_26_data_FIFO_blk[6] = 1'b0 | (~processPseudoHeader_512_U0.rxEng_optionalFieldsMetaFifo_blk_n);
    assign proc_26_data_PIPO_blk[6] = 1'b0;
    assign proc_26_start_FIFO_blk[6] = 1'b0;
    assign proc_26_TLF_FIFO_blk[6] = 1'b0;
    assign proc_26_input_sync_blk[6] = 1'b0;
    assign proc_26_output_sync_blk[6] = 1'b0;
    assign proc_dep_vld_vec_26[6] = dl_detect_out ? proc_dep_vld_vec_26_reg[6] : (proc_26_data_FIFO_blk[6] | proc_26_data_PIPO_blk[6] | proc_26_start_FIFO_blk[6] | proc_26_TLF_FIFO_blk[6] | proc_26_input_sync_blk[6] | proc_26_output_sync_blk[6]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_26_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_26_reg <= proc_dep_vld_vec_26;
        end
    end
    assign in_chan_dep_vld_vec_26[0] = dep_chan_vld_10_26;
    assign in_chan_dep_data_vec_26[59 : 0] = dep_chan_data_10_26;
    assign token_in_vec_26[0] = token_10_26;
    assign in_chan_dep_vld_vec_26[1] = dep_chan_vld_24_26;
    assign in_chan_dep_data_vec_26[119 : 60] = dep_chan_data_24_26;
    assign token_in_vec_26[1] = token_24_26;
    assign in_chan_dep_vld_vec_26[2] = dep_chan_vld_25_26;
    assign in_chan_dep_data_vec_26[179 : 120] = dep_chan_data_25_26;
    assign token_in_vec_26[2] = token_25_26;
    assign in_chan_dep_vld_vec_26[3] = dep_chan_vld_27_26;
    assign in_chan_dep_data_vec_26[239 : 180] = dep_chan_data_27_26;
    assign token_in_vec_26[3] = token_27_26;
    assign in_chan_dep_vld_vec_26[4] = dep_chan_vld_28_26;
    assign in_chan_dep_data_vec_26[299 : 240] = dep_chan_data_28_26;
    assign token_in_vec_26[4] = token_28_26;
    assign in_chan_dep_vld_vec_26[5] = dep_chan_vld_30_26;
    assign in_chan_dep_data_vec_26[359 : 300] = dep_chan_data_30_26;
    assign token_in_vec_26[5] = token_30_26;
    assign in_chan_dep_vld_vec_26[6] = dep_chan_vld_31_26;
    assign in_chan_dep_data_vec_26[419 : 360] = dep_chan_data_31_26;
    assign token_in_vec_26[6] = token_31_26;
    assign dep_chan_vld_26_24 = out_chan_dep_vld_vec_26[0];
    assign dep_chan_data_26_24 = out_chan_dep_data_26;
    assign token_26_24 = token_out_vec_26[0];
    assign dep_chan_vld_26_25 = out_chan_dep_vld_vec_26[1];
    assign dep_chan_data_26_25 = out_chan_dep_data_26;
    assign token_26_25 = token_out_vec_26[1];
    assign dep_chan_vld_26_27 = out_chan_dep_vld_vec_26[2];
    assign dep_chan_data_26_27 = out_chan_dep_data_26;
    assign token_26_27 = token_out_vec_26[2];
    assign dep_chan_vld_26_30 = out_chan_dep_vld_vec_26[3];
    assign dep_chan_data_26_30 = out_chan_dep_data_26;
    assign token_26_30 = token_out_vec_26[3];
    assign dep_chan_vld_26_10 = out_chan_dep_vld_vec_26[4];
    assign dep_chan_data_26_10 = out_chan_dep_data_26;
    assign token_26_10 = token_out_vec_26[4];
    assign dep_chan_vld_26_31 = out_chan_dep_vld_vec_26[5];
    assign dep_chan_data_26_31 = out_chan_dep_data_26;
    assign token_26_31 = token_out_vec_26[5];
    assign dep_chan_vld_26_28 = out_chan_dep_vld_vec_26[6];
    assign dep_chan_data_26_28 = out_chan_dep_data_26;
    assign token_26_28 = token_out_vec_26[6];

    // Process: rshiftWordByOctet_net_axis_512_512_3_U0
    toe_top_hls_deadlock_detect_unit #(60, 27, 2, 2) toe_top_hls_deadlock_detect_unit_27 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_27),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_27),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_27),
        .token_in_vec(token_in_vec_27),
        .dl_detect_in(dl_detect_out),
        .origin(origin[27]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_27),
        .out_chan_dep_data(out_chan_dep_data_27),
        .token_out_vec(token_out_vec_27),
        .dl_detect_out(dl_in_vec[27]));

    assign proc_27_data_FIFO_blk[0] = 1'b0 | (~rshiftWordByOctet_net_axis_512_512_3_U0.rxEng_dataBuffer3a_blk_n);
    assign proc_27_data_PIPO_blk[0] = 1'b0;
    assign proc_27_start_FIFO_blk[0] = 1'b0;
    assign proc_27_TLF_FIFO_blk[0] = 1'b0;
    assign proc_27_input_sync_blk[0] = 1'b0;
    assign proc_27_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_27[0] = dl_detect_out ? proc_dep_vld_vec_27_reg[0] : (proc_27_data_FIFO_blk[0] | proc_27_data_PIPO_blk[0] | proc_27_start_FIFO_blk[0] | proc_27_TLF_FIFO_blk[0] | proc_27_input_sync_blk[0] | proc_27_output_sync_blk[0]);
    assign proc_27_data_FIFO_blk[1] = 1'b0 | (~rshiftWordByOctet_net_axis_512_512_3_U0.rxEng_dataBuffer3b_blk_n);
    assign proc_27_data_PIPO_blk[1] = 1'b0;
    assign proc_27_start_FIFO_blk[1] = 1'b0;
    assign proc_27_TLF_FIFO_blk[1] = 1'b0;
    assign proc_27_input_sync_blk[1] = 1'b0;
    assign proc_27_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_27[1] = dl_detect_out ? proc_dep_vld_vec_27_reg[1] : (proc_27_data_FIFO_blk[1] | proc_27_data_PIPO_blk[1] | proc_27_start_FIFO_blk[1] | proc_27_TLF_FIFO_blk[1] | proc_27_input_sync_blk[1] | proc_27_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_27_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_27_reg <= proc_dep_vld_vec_27;
        end
    end
    assign in_chan_dep_vld_vec_27[0] = dep_chan_vld_26_27;
    assign in_chan_dep_data_vec_27[59 : 0] = dep_chan_data_26_27;
    assign token_in_vec_27[0] = token_26_27;
    assign in_chan_dep_vld_vec_27[1] = dep_chan_vld_28_27;
    assign in_chan_dep_data_vec_27[119 : 60] = dep_chan_data_28_27;
    assign token_in_vec_27[1] = token_28_27;
    assign dep_chan_vld_27_26 = out_chan_dep_vld_vec_27[0];
    assign dep_chan_data_27_26 = out_chan_dep_data_27;
    assign token_27_26 = token_out_vec_27[0];
    assign dep_chan_vld_27_28 = out_chan_dep_vld_vec_27[1];
    assign dep_chan_data_27_28 = out_chan_dep_data_27;
    assign token_27_28 = token_out_vec_27[1];

    // Process: drop_optional_header_fields_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 28, 4, 4) toe_top_hls_deadlock_detect_unit_28 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_28),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_28),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_28),
        .token_in_vec(token_in_vec_28),
        .dl_detect_in(dl_detect_out),
        .origin(origin[28]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_28),
        .out_chan_dep_data(out_chan_dep_data_28),
        .token_out_vec(token_out_vec_28),
        .dl_detect_out(dl_in_vec[28]));

    assign proc_28_data_FIFO_blk[0] = 1'b0 | (~drop_optional_header_fields_512_U0.rxEng_optionalFieldsMetaFifo_blk_n);
    assign proc_28_data_PIPO_blk[0] = 1'b0;
    assign proc_28_start_FIFO_blk[0] = 1'b0;
    assign proc_28_TLF_FIFO_blk[0] = 1'b0;
    assign proc_28_input_sync_blk[0] = 1'b0;
    assign proc_28_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_28[0] = dl_detect_out ? proc_dep_vld_vec_28_reg[0] : (proc_28_data_FIFO_blk[0] | proc_28_data_PIPO_blk[0] | proc_28_start_FIFO_blk[0] | proc_28_TLF_FIFO_blk[0] | proc_28_input_sync_blk[0] | proc_28_output_sync_blk[0]);
    assign proc_28_data_FIFO_blk[1] = 1'b0 | (~drop_optional_header_fields_512_U0.rxEng_dataBuffer3b_blk_n);
    assign proc_28_data_PIPO_blk[1] = 1'b0;
    assign proc_28_start_FIFO_blk[1] = 1'b0;
    assign proc_28_TLF_FIFO_blk[1] = 1'b0;
    assign proc_28_input_sync_blk[1] = 1'b0;
    assign proc_28_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_28[1] = dl_detect_out ? proc_dep_vld_vec_28_reg[1] : (proc_28_data_FIFO_blk[1] | proc_28_data_PIPO_blk[1] | proc_28_start_FIFO_blk[1] | proc_28_TLF_FIFO_blk[1] | proc_28_input_sync_blk[1] | proc_28_output_sync_blk[1]);
    assign proc_28_data_FIFO_blk[2] = 1'b0 | (~drop_optional_header_fields_512_U0.rxEng_dataBuffer3_blk_n);
    assign proc_28_data_PIPO_blk[2] = 1'b0;
    assign proc_28_start_FIFO_blk[2] = 1'b0;
    assign proc_28_TLF_FIFO_blk[2] = 1'b0;
    assign proc_28_input_sync_blk[2] = 1'b0;
    assign proc_28_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_28[2] = dl_detect_out ? proc_dep_vld_vec_28_reg[2] : (proc_28_data_FIFO_blk[2] | proc_28_data_PIPO_blk[2] | proc_28_start_FIFO_blk[2] | proc_28_TLF_FIFO_blk[2] | proc_28_input_sync_blk[2] | proc_28_output_sync_blk[2]);
    assign proc_28_data_FIFO_blk[3] = 1'b0 | (~drop_optional_header_fields_512_U0.rxEng_dataOffsetFifo_blk_n) | (~drop_optional_header_fields_512_U0.rxEng_optionalFieldsFifo_blk_n);
    assign proc_28_data_PIPO_blk[3] = 1'b0;
    assign proc_28_start_FIFO_blk[3] = 1'b0;
    assign proc_28_TLF_FIFO_blk[3] = 1'b0;
    assign proc_28_input_sync_blk[3] = 1'b0;
    assign proc_28_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_28[3] = dl_detect_out ? proc_dep_vld_vec_28_reg[3] : (proc_28_data_FIFO_blk[3] | proc_28_data_PIPO_blk[3] | proc_28_start_FIFO_blk[3] | proc_28_TLF_FIFO_blk[3] | proc_28_input_sync_blk[3] | proc_28_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_28_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_28_reg <= proc_dep_vld_vec_28;
        end
    end
    assign in_chan_dep_vld_vec_28[0] = dep_chan_vld_26_28;
    assign in_chan_dep_data_vec_28[59 : 0] = dep_chan_data_26_28;
    assign token_in_vec_28[0] = token_26_28;
    assign in_chan_dep_vld_vec_28[1] = dep_chan_vld_27_28;
    assign in_chan_dep_data_vec_28[119 : 60] = dep_chan_data_27_28;
    assign token_in_vec_28[1] = token_27_28;
    assign in_chan_dep_vld_vec_28[2] = dep_chan_vld_29_28;
    assign in_chan_dep_data_vec_28[179 : 120] = dep_chan_data_29_28;
    assign token_in_vec_28[2] = token_29_28;
    assign in_chan_dep_vld_vec_28[3] = dep_chan_vld_33_28;
    assign in_chan_dep_data_vec_28[239 : 180] = dep_chan_data_33_28;
    assign token_in_vec_28[3] = token_33_28;
    assign dep_chan_vld_28_26 = out_chan_dep_vld_vec_28[0];
    assign dep_chan_data_28_26 = out_chan_dep_data_28;
    assign token_28_26 = token_out_vec_28[0];
    assign dep_chan_vld_28_27 = out_chan_dep_vld_vec_28[1];
    assign dep_chan_data_28_27 = out_chan_dep_data_28;
    assign token_28_27 = token_out_vec_28[1];
    assign dep_chan_vld_28_33 = out_chan_dep_vld_vec_28[2];
    assign dep_chan_data_28_33 = out_chan_dep_data_28;
    assign token_28_33 = token_out_vec_28[2];
    assign dep_chan_vld_28_29 = out_chan_dep_vld_vec_28[3];
    assign dep_chan_data_28_29 = out_chan_dep_data_28;
    assign token_28_29 = token_out_vec_28[3];

    // Process: parse_optional_header_fields_U0
    toe_top_hls_deadlock_detect_unit #(60, 29, 2, 2) toe_top_hls_deadlock_detect_unit_29 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_29),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_29),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_29),
        .token_in_vec(token_in_vec_29),
        .dl_detect_in(dl_detect_out),
        .origin(origin[29]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_29),
        .out_chan_dep_data(out_chan_dep_data_29),
        .token_out_vec(token_out_vec_29),
        .dl_detect_out(dl_in_vec[29]));

    assign proc_29_data_FIFO_blk[0] = 1'b0 | (~parse_optional_header_fields_U0.rxEng_dataOffsetFifo_blk_n) | (~parse_optional_header_fields_U0.rxEng_optionalFieldsFifo_blk_n);
    assign proc_29_data_PIPO_blk[0] = 1'b0;
    assign proc_29_start_FIFO_blk[0] = 1'b0;
    assign proc_29_TLF_FIFO_blk[0] = 1'b0;
    assign proc_29_input_sync_blk[0] = 1'b0;
    assign proc_29_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_29[0] = dl_detect_out ? proc_dep_vld_vec_29_reg[0] : (proc_29_data_FIFO_blk[0] | proc_29_data_PIPO_blk[0] | proc_29_start_FIFO_blk[0] | proc_29_TLF_FIFO_blk[0] | proc_29_input_sync_blk[0] | proc_29_output_sync_blk[0]);
    assign proc_29_data_FIFO_blk[1] = 1'b0 | (~parse_optional_header_fields_U0.rxEng_winScaleFifo_blk_n);
    assign proc_29_data_PIPO_blk[1] = 1'b0;
    assign proc_29_start_FIFO_blk[1] = 1'b0;
    assign proc_29_TLF_FIFO_blk[1] = 1'b0;
    assign proc_29_input_sync_blk[1] = 1'b0;
    assign proc_29_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_29[1] = dl_detect_out ? proc_dep_vld_vec_29_reg[1] : (proc_29_data_FIFO_blk[1] | proc_29_data_PIPO_blk[1] | proc_29_start_FIFO_blk[1] | proc_29_TLF_FIFO_blk[1] | proc_29_input_sync_blk[1] | proc_29_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_29_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_29_reg <= proc_dep_vld_vec_29;
        end
    end
    assign in_chan_dep_vld_vec_29[0] = dep_chan_vld_28_29;
    assign in_chan_dep_data_vec_29[59 : 0] = dep_chan_data_28_29;
    assign token_in_vec_29[0] = token_28_29;
    assign in_chan_dep_vld_vec_29[1] = dep_chan_vld_30_29;
    assign in_chan_dep_data_vec_29[119 : 60] = dep_chan_data_30_29;
    assign token_in_vec_29[1] = token_30_29;
    assign dep_chan_vld_29_28 = out_chan_dep_vld_vec_29[0];
    assign dep_chan_data_29_28 = out_chan_dep_data_29;
    assign token_29_28 = token_out_vec_29[0];
    assign dep_chan_vld_29_30 = out_chan_dep_vld_vec_29[1];
    assign dep_chan_data_29_30 = out_chan_dep_data_29;
    assign token_29_30 = token_out_vec_29[1];

    // Process: merge_header_meta_U0
    toe_top_hls_deadlock_detect_unit #(60, 30, 3, 3) toe_top_hls_deadlock_detect_unit_30 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_30),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_30),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_30),
        .token_in_vec(token_in_vec_30),
        .dl_detect_in(dl_detect_out),
        .origin(origin[30]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_30),
        .out_chan_dep_data(out_chan_dep_data_30),
        .token_out_vec(token_out_vec_30),
        .dl_detect_out(dl_in_vec[30]));

    assign proc_30_data_FIFO_blk[0] = 1'b0 | (~merge_header_meta_U0.rxEng_headerMetaFifo_blk_n);
    assign proc_30_data_PIPO_blk[0] = 1'b0;
    assign proc_30_start_FIFO_blk[0] = 1'b0;
    assign proc_30_TLF_FIFO_blk[0] = 1'b0;
    assign proc_30_input_sync_blk[0] = 1'b0;
    assign proc_30_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_30[0] = dl_detect_out ? proc_dep_vld_vec_30_reg[0] : (proc_30_data_FIFO_blk[0] | proc_30_data_PIPO_blk[0] | proc_30_start_FIFO_blk[0] | proc_30_TLF_FIFO_blk[0] | proc_30_input_sync_blk[0] | proc_30_output_sync_blk[0]);
    assign proc_30_data_FIFO_blk[1] = 1'b0 | (~merge_header_meta_U0.rxEng_metaDataFifo_blk_n);
    assign proc_30_data_PIPO_blk[1] = 1'b0;
    assign proc_30_start_FIFO_blk[1] = 1'b0;
    assign proc_30_TLF_FIFO_blk[1] = 1'b0;
    assign proc_30_input_sync_blk[1] = 1'b0;
    assign proc_30_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_30[1] = dl_detect_out ? proc_dep_vld_vec_30_reg[1] : (proc_30_data_FIFO_blk[1] | proc_30_data_PIPO_blk[1] | proc_30_start_FIFO_blk[1] | proc_30_TLF_FIFO_blk[1] | proc_30_input_sync_blk[1] | proc_30_output_sync_blk[1]);
    assign proc_30_data_FIFO_blk[2] = 1'b0 | (~merge_header_meta_U0.rxEng_winScaleFifo_blk_n);
    assign proc_30_data_PIPO_blk[2] = 1'b0;
    assign proc_30_start_FIFO_blk[2] = 1'b0;
    assign proc_30_TLF_FIFO_blk[2] = 1'b0;
    assign proc_30_input_sync_blk[2] = 1'b0;
    assign proc_30_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_30[2] = dl_detect_out ? proc_dep_vld_vec_30_reg[2] : (proc_30_data_FIFO_blk[2] | proc_30_data_PIPO_blk[2] | proc_30_start_FIFO_blk[2] | proc_30_TLF_FIFO_blk[2] | proc_30_input_sync_blk[2] | proc_30_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_30_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_30_reg <= proc_dep_vld_vec_30;
        end
    end
    assign in_chan_dep_vld_vec_30[0] = dep_chan_vld_26_30;
    assign in_chan_dep_data_vec_30[59 : 0] = dep_chan_data_26_30;
    assign token_in_vec_30[0] = token_26_30;
    assign in_chan_dep_vld_vec_30[1] = dep_chan_vld_29_30;
    assign in_chan_dep_data_vec_30[119 : 60] = dep_chan_data_29_30;
    assign token_in_vec_30[1] = token_29_30;
    assign in_chan_dep_vld_vec_30[2] = dep_chan_vld_31_30;
    assign in_chan_dep_data_vec_30[179 : 120] = dep_chan_data_31_30;
    assign token_in_vec_30[2] = token_31_30;
    assign dep_chan_vld_30_26 = out_chan_dep_vld_vec_30[0];
    assign dep_chan_data_30_26 = out_chan_dep_data_30;
    assign token_30_26 = token_out_vec_30[0];
    assign dep_chan_vld_30_31 = out_chan_dep_vld_vec_30[1];
    assign dep_chan_data_30_31 = out_chan_dep_data_30;
    assign token_30_31 = token_out_vec_30[1];
    assign dep_chan_vld_30_29 = out_chan_dep_vld_vec_30[2];
    assign dep_chan_data_30_29 = out_chan_dep_data_30;
    assign token_30_29 = token_out_vec_30[2];

    // Process: rxMetadataHandler_U0
    toe_top_hls_deadlock_detect_unit #(60, 31, 7, 7) toe_top_hls_deadlock_detect_unit_31 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_31),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_31),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_31),
        .token_in_vec(token_in_vec_31),
        .dl_detect_in(dl_detect_out),
        .origin(origin[31]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_31),
        .out_chan_dep_data(out_chan_dep_data_31),
        .token_out_vec(token_out_vec_31),
        .dl_detect_out(dl_in_vec[31]));

    assign proc_31_data_FIFO_blk[0] = 1'b0 | (~rxMetadataHandler_U0.rxEng_metaDataFifo_blk_n);
    assign proc_31_data_PIPO_blk[0] = 1'b0;
    assign proc_31_start_FIFO_blk[0] = 1'b0;
    assign proc_31_TLF_FIFO_blk[0] = 1'b0;
    assign proc_31_input_sync_blk[0] = 1'b0;
    assign proc_31_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_31[0] = dl_detect_out ? proc_dep_vld_vec_31_reg[0] : (proc_31_data_FIFO_blk[0] | proc_31_data_PIPO_blk[0] | proc_31_start_FIFO_blk[0] | proc_31_TLF_FIFO_blk[0] | proc_31_input_sync_blk[0] | proc_31_output_sync_blk[0]);
    assign proc_31_data_FIFO_blk[1] = 1'b0 | (~rxMetadataHandler_U0.portTable2rxEng_check_rsp_blk_n);
    assign proc_31_data_PIPO_blk[1] = 1'b0;
    assign proc_31_start_FIFO_blk[1] = 1'b0;
    assign proc_31_TLF_FIFO_blk[1] = 1'b0;
    assign proc_31_input_sync_blk[1] = 1'b0;
    assign proc_31_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_31[1] = dl_detect_out ? proc_dep_vld_vec_31_reg[1] : (proc_31_data_FIFO_blk[1] | proc_31_data_PIPO_blk[1] | proc_31_start_FIFO_blk[1] | proc_31_TLF_FIFO_blk[1] | proc_31_input_sync_blk[1] | proc_31_output_sync_blk[1]);
    assign proc_31_data_FIFO_blk[2] = 1'b0 | (~rxMetadataHandler_U0.rxEng_tupleBuffer_blk_n);
    assign proc_31_data_PIPO_blk[2] = 1'b0;
    assign proc_31_start_FIFO_blk[2] = 1'b0;
    assign proc_31_TLF_FIFO_blk[2] = 1'b0;
    assign proc_31_input_sync_blk[2] = 1'b0;
    assign proc_31_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_31[2] = dl_detect_out ? proc_dep_vld_vec_31_reg[2] : (proc_31_data_FIFO_blk[2] | proc_31_data_PIPO_blk[2] | proc_31_start_FIFO_blk[2] | proc_31_TLF_FIFO_blk[2] | proc_31_input_sync_blk[2] | proc_31_output_sync_blk[2]);
    assign proc_31_data_FIFO_blk[3] = 1'b0 | (~rxMetadataHandler_U0.rxEng_metaHandlerEventFifo_blk_n);
    assign proc_31_data_PIPO_blk[3] = 1'b0;
    assign proc_31_start_FIFO_blk[3] = 1'b0;
    assign proc_31_TLF_FIFO_blk[3] = 1'b0;
    assign proc_31_input_sync_blk[3] = 1'b0;
    assign proc_31_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_31[3] = dl_detect_out ? proc_dep_vld_vec_31_reg[3] : (proc_31_data_FIFO_blk[3] | proc_31_data_PIPO_blk[3] | proc_31_start_FIFO_blk[3] | proc_31_TLF_FIFO_blk[3] | proc_31_input_sync_blk[3] | proc_31_output_sync_blk[3]);
    assign proc_31_data_FIFO_blk[4] = 1'b0 | (~rxMetadataHandler_U0.rxEng_metaHandlerDropFifo_blk_n);
    assign proc_31_data_PIPO_blk[4] = 1'b0;
    assign proc_31_start_FIFO_blk[4] = 1'b0;
    assign proc_31_TLF_FIFO_blk[4] = 1'b0;
    assign proc_31_input_sync_blk[4] = 1'b0;
    assign proc_31_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_31[4] = dl_detect_out ? proc_dep_vld_vec_31_reg[4] : (proc_31_data_FIFO_blk[4] | proc_31_data_PIPO_blk[4] | proc_31_start_FIFO_blk[4] | proc_31_TLF_FIFO_blk[4] | proc_31_input_sync_blk[4] | proc_31_output_sync_blk[4]);
    assign proc_31_data_FIFO_blk[5] = 1'b0 | (~rxMetadataHandler_U0.rxEng2sLookup_req_blk_n) | (~rxMetadataHandler_U0.sLookup2rxEng_rsp_blk_n);
    assign proc_31_data_PIPO_blk[5] = 1'b0;
    assign proc_31_start_FIFO_blk[5] = 1'b0;
    assign proc_31_TLF_FIFO_blk[5] = 1'b0;
    assign proc_31_input_sync_blk[5] = 1'b0;
    assign proc_31_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_31[5] = dl_detect_out ? proc_dep_vld_vec_31_reg[5] : (proc_31_data_FIFO_blk[5] | proc_31_data_PIPO_blk[5] | proc_31_start_FIFO_blk[5] | proc_31_TLF_FIFO_blk[5] | proc_31_input_sync_blk[5] | proc_31_output_sync_blk[5]);
    assign proc_31_data_FIFO_blk[6] = 1'b0 | (~rxMetadataHandler_U0.rxEng_fsmMetaDataFifo_blk_n);
    assign proc_31_data_PIPO_blk[6] = 1'b0;
    assign proc_31_start_FIFO_blk[6] = 1'b0;
    assign proc_31_TLF_FIFO_blk[6] = 1'b0;
    assign proc_31_input_sync_blk[6] = 1'b0;
    assign proc_31_output_sync_blk[6] = 1'b0;
    assign proc_dep_vld_vec_31[6] = dl_detect_out ? proc_dep_vld_vec_31_reg[6] : (proc_31_data_FIFO_blk[6] | proc_31_data_PIPO_blk[6] | proc_31_start_FIFO_blk[6] | proc_31_TLF_FIFO_blk[6] | proc_31_input_sync_blk[6] | proc_31_output_sync_blk[6]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_31_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_31_reg <= proc_dep_vld_vec_31;
        end
    end
    assign in_chan_dep_vld_vec_31[0] = dep_chan_vld_1_31;
    assign in_chan_dep_data_vec_31[59 : 0] = dep_chan_data_1_31;
    assign token_in_vec_31[0] = token_1_31;
    assign in_chan_dep_vld_vec_31[1] = dep_chan_vld_11_31;
    assign in_chan_dep_data_vec_31[119 : 60] = dep_chan_data_11_31;
    assign token_in_vec_31[1] = token_11_31;
    assign in_chan_dep_vld_vec_31[2] = dep_chan_vld_26_31;
    assign in_chan_dep_data_vec_31[179 : 120] = dep_chan_data_26_31;
    assign token_in_vec_31[2] = token_26_31;
    assign in_chan_dep_vld_vec_31[3] = dep_chan_vld_30_31;
    assign in_chan_dep_data_vec_31[239 : 180] = dep_chan_data_30_31;
    assign token_in_vec_31[3] = token_30_31;
    assign in_chan_dep_vld_vec_31[4] = dep_chan_vld_32_31;
    assign in_chan_dep_data_vec_31[299 : 240] = dep_chan_data_32_31;
    assign token_in_vec_31[4] = token_32_31;
    assign in_chan_dep_vld_vec_31[5] = dep_chan_vld_33_31;
    assign in_chan_dep_data_vec_31[359 : 300] = dep_chan_data_33_31;
    assign token_in_vec_31[5] = token_33_31;
    assign in_chan_dep_vld_vec_31[6] = dep_chan_vld_34_31;
    assign in_chan_dep_data_vec_31[419 : 360] = dep_chan_data_34_31;
    assign token_in_vec_31[6] = token_34_31;
    assign dep_chan_vld_31_30 = out_chan_dep_vld_vec_31[0];
    assign dep_chan_data_31_30 = out_chan_dep_data_31;
    assign token_31_30 = token_out_vec_31[0];
    assign dep_chan_vld_31_11 = out_chan_dep_vld_vec_31[1];
    assign dep_chan_data_31_11 = out_chan_dep_data_31;
    assign token_31_11 = token_out_vec_31[1];
    assign dep_chan_vld_31_26 = out_chan_dep_vld_vec_31[2];
    assign dep_chan_data_31_26 = out_chan_dep_data_31;
    assign token_31_26 = token_out_vec_31[2];
    assign dep_chan_vld_31_34 = out_chan_dep_vld_vec_31[3];
    assign dep_chan_data_31_34 = out_chan_dep_data_31;
    assign token_31_34 = token_out_vec_31[3];
    assign dep_chan_vld_31_33 = out_chan_dep_vld_vec_31[4];
    assign dep_chan_data_31_33 = out_chan_dep_data_31;
    assign token_31_33 = token_out_vec_31[4];
    assign dep_chan_vld_31_1 = out_chan_dep_vld_vec_31[5];
    assign dep_chan_data_31_1 = out_chan_dep_data_31;
    assign token_31_1 = token_out_vec_31[5];
    assign dep_chan_vld_31_32 = out_chan_dep_vld_vec_31[6];
    assign dep_chan_data_31_32 = out_chan_dep_data_31;
    assign token_31_32 = token_out_vec_31[6];

    // Process: rxTcpFSM_U0
    toe_top_hls_deadlock_detect_unit #(60, 32, 11, 11) toe_top_hls_deadlock_detect_unit_32 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_32),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_32),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_32),
        .token_in_vec(token_in_vec_32),
        .dl_detect_in(dl_detect_out),
        .origin(origin[32]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_32),
        .out_chan_dep_data(out_chan_dep_data_32),
        .token_out_vec(token_out_vec_32),
        .dl_detect_out(dl_in_vec[32]));

    assign proc_32_data_FIFO_blk[0] = 1'b0 | (~rxTcpFSM_U0.rxEng_fsmMetaDataFifo_blk_n);
    assign proc_32_data_PIPO_blk[0] = 1'b0;
    assign proc_32_start_FIFO_blk[0] = 1'b0;
    assign proc_32_TLF_FIFO_blk[0] = 1'b0;
    assign proc_32_input_sync_blk[0] = 1'b0;
    assign proc_32_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_32[0] = dl_detect_out ? proc_dep_vld_vec_32_reg[0] : (proc_32_data_FIFO_blk[0] | proc_32_data_PIPO_blk[0] | proc_32_start_FIFO_blk[0] | proc_32_TLF_FIFO_blk[0] | proc_32_input_sync_blk[0] | proc_32_output_sync_blk[0]);
    assign proc_32_data_FIFO_blk[1] = 1'b0 | (~rxTcpFSM_U0.rxEng2stateTable_upd_req_blk_n) | (~rxTcpFSM_U0.stateTable2rxEng_upd_rsp_blk_n);
    assign proc_32_data_PIPO_blk[1] = 1'b0;
    assign proc_32_start_FIFO_blk[1] = 1'b0;
    assign proc_32_TLF_FIFO_blk[1] = 1'b0;
    assign proc_32_input_sync_blk[1] = 1'b0;
    assign proc_32_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_32[1] = dl_detect_out ? proc_dep_vld_vec_32_reg[1] : (proc_32_data_FIFO_blk[1] | proc_32_data_PIPO_blk[1] | proc_32_start_FIFO_blk[1] | proc_32_TLF_FIFO_blk[1] | proc_32_input_sync_blk[1] | proc_32_output_sync_blk[1]);
    assign proc_32_data_FIFO_blk[2] = 1'b0 | (~rxTcpFSM_U0.rxEng2rxSar_upd_req_blk_n) | (~rxTcpFSM_U0.rxSar2rxEng_upd_rsp_blk_n);
    assign proc_32_data_PIPO_blk[2] = 1'b0;
    assign proc_32_start_FIFO_blk[2] = 1'b0;
    assign proc_32_TLF_FIFO_blk[2] = 1'b0;
    assign proc_32_input_sync_blk[2] = 1'b0;
    assign proc_32_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_32[2] = dl_detect_out ? proc_dep_vld_vec_32_reg[2] : (proc_32_data_FIFO_blk[2] | proc_32_data_PIPO_blk[2] | proc_32_start_FIFO_blk[2] | proc_32_TLF_FIFO_blk[2] | proc_32_input_sync_blk[2] | proc_32_output_sync_blk[2]);
    assign proc_32_data_FIFO_blk[3] = 1'b0 | (~rxTcpFSM_U0.rxEng2txSar_upd_req_blk_n) | (~rxTcpFSM_U0.txSar2rxEng_upd_rsp_blk_n);
    assign proc_32_data_PIPO_blk[3] = 1'b0;
    assign proc_32_start_FIFO_blk[3] = 1'b0;
    assign proc_32_TLF_FIFO_blk[3] = 1'b0;
    assign proc_32_input_sync_blk[3] = 1'b0;
    assign proc_32_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_32[3] = dl_detect_out ? proc_dep_vld_vec_32_reg[3] : (proc_32_data_FIFO_blk[3] | proc_32_data_PIPO_blk[3] | proc_32_start_FIFO_blk[3] | proc_32_TLF_FIFO_blk[3] | proc_32_input_sync_blk[3] | proc_32_output_sync_blk[3]);
    assign proc_32_data_FIFO_blk[4] = 1'b0 | (~rxTcpFSM_U0.rxEng2timer_clearRetransmitTimer_blk_n);
    assign proc_32_data_PIPO_blk[4] = 1'b0;
    assign proc_32_start_FIFO_blk[4] = 1'b0;
    assign proc_32_TLF_FIFO_blk[4] = 1'b0;
    assign proc_32_input_sync_blk[4] = 1'b0;
    assign proc_32_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_32[4] = dl_detect_out ? proc_dep_vld_vec_32_reg[4] : (proc_32_data_FIFO_blk[4] | proc_32_data_PIPO_blk[4] | proc_32_start_FIFO_blk[4] | proc_32_TLF_FIFO_blk[4] | proc_32_input_sync_blk[4] | proc_32_output_sync_blk[4]);
    assign proc_32_data_FIFO_blk[5] = 1'b0 | (~rxTcpFSM_U0.rxEng2timer_clearProbeTimer_blk_n);
    assign proc_32_data_PIPO_blk[5] = 1'b0;
    assign proc_32_start_FIFO_blk[5] = 1'b0;
    assign proc_32_TLF_FIFO_blk[5] = 1'b0;
    assign proc_32_input_sync_blk[5] = 1'b0;
    assign proc_32_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_32[5] = dl_detect_out ? proc_dep_vld_vec_32_reg[5] : (proc_32_data_FIFO_blk[5] | proc_32_data_PIPO_blk[5] | proc_32_start_FIFO_blk[5] | proc_32_TLF_FIFO_blk[5] | proc_32_input_sync_blk[5] | proc_32_output_sync_blk[5]);
    assign proc_32_data_FIFO_blk[6] = 1'b0 | (~rxTcpFSM_U0.rxEng2rxApp_notification_blk_n);
    assign proc_32_data_PIPO_blk[6] = 1'b0;
    assign proc_32_start_FIFO_blk[6] = 1'b0;
    assign proc_32_TLF_FIFO_blk[6] = 1'b0;
    assign proc_32_input_sync_blk[6] = 1'b0;
    assign proc_32_output_sync_blk[6] = 1'b0;
    assign proc_dep_vld_vec_32[6] = dl_detect_out ? proc_dep_vld_vec_32_reg[6] : (proc_32_data_FIFO_blk[6] | proc_32_data_PIPO_blk[6] | proc_32_start_FIFO_blk[6] | proc_32_TLF_FIFO_blk[6] | proc_32_input_sync_blk[6] | proc_32_output_sync_blk[6]);
    assign proc_32_data_FIFO_blk[7] = 1'b0 | (~rxTcpFSM_U0.rxEng_fsmDropFifo_blk_n);
    assign proc_32_data_PIPO_blk[7] = 1'b0;
    assign proc_32_start_FIFO_blk[7] = 1'b0;
    assign proc_32_TLF_FIFO_blk[7] = 1'b0;
    assign proc_32_input_sync_blk[7] = 1'b0;
    assign proc_32_output_sync_blk[7] = 1'b0;
    assign proc_dep_vld_vec_32[7] = dl_detect_out ? proc_dep_vld_vec_32_reg[7] : (proc_32_data_FIFO_blk[7] | proc_32_data_PIPO_blk[7] | proc_32_start_FIFO_blk[7] | proc_32_TLF_FIFO_blk[7] | proc_32_input_sync_blk[7] | proc_32_output_sync_blk[7]);
    assign proc_32_data_FIFO_blk[8] = 1'b0 | (~rxTcpFSM_U0.rxEng_fsmEventFifo_blk_n);
    assign proc_32_data_PIPO_blk[8] = 1'b0;
    assign proc_32_start_FIFO_blk[8] = 1'b0;
    assign proc_32_TLF_FIFO_blk[8] = 1'b0;
    assign proc_32_input_sync_blk[8] = 1'b0;
    assign proc_32_output_sync_blk[8] = 1'b0;
    assign proc_dep_vld_vec_32[8] = dl_detect_out ? proc_dep_vld_vec_32_reg[8] : (proc_32_data_FIFO_blk[8] | proc_32_data_PIPO_blk[8] | proc_32_start_FIFO_blk[8] | proc_32_TLF_FIFO_blk[8] | proc_32_input_sync_blk[8] | proc_32_output_sync_blk[8]);
    assign proc_32_data_FIFO_blk[9] = 1'b0 | (~rxTcpFSM_U0.rxEng2timer_setCloseTimer_blk_n);
    assign proc_32_data_PIPO_blk[9] = 1'b0;
    assign proc_32_start_FIFO_blk[9] = 1'b0;
    assign proc_32_TLF_FIFO_blk[9] = 1'b0;
    assign proc_32_input_sync_blk[9] = 1'b0;
    assign proc_32_output_sync_blk[9] = 1'b0;
    assign proc_dep_vld_vec_32[9] = dl_detect_out ? proc_dep_vld_vec_32_reg[9] : (proc_32_data_FIFO_blk[9] | proc_32_data_PIPO_blk[9] | proc_32_start_FIFO_blk[9] | proc_32_TLF_FIFO_blk[9] | proc_32_input_sync_blk[9] | proc_32_output_sync_blk[9]);
    assign proc_32_data_FIFO_blk[10] = 1'b0 | (~rxTcpFSM_U0.conEstablishedFifo_blk_n);
    assign proc_32_data_PIPO_blk[10] = 1'b0;
    assign proc_32_start_FIFO_blk[10] = 1'b0;
    assign proc_32_TLF_FIFO_blk[10] = 1'b0;
    assign proc_32_input_sync_blk[10] = 1'b0;
    assign proc_32_output_sync_blk[10] = 1'b0;
    assign proc_dep_vld_vec_32[10] = dl_detect_out ? proc_dep_vld_vec_32_reg[10] : (proc_32_data_FIFO_blk[10] | proc_32_data_PIPO_blk[10] | proc_32_start_FIFO_blk[10] | proc_32_TLF_FIFO_blk[10] | proc_32_input_sync_blk[10] | proc_32_output_sync_blk[10]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_32_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_32_reg <= proc_dep_vld_vec_32;
        end
    end
    assign in_chan_dep_vld_vec_32[0] = dep_chan_vld_5_32;
    assign in_chan_dep_data_vec_32[59 : 0] = dep_chan_data_5_32;
    assign token_in_vec_32[0] = token_5_32;
    assign in_chan_dep_vld_vec_32[1] = dep_chan_vld_6_32;
    assign in_chan_dep_data_vec_32[119 : 60] = dep_chan_data_6_32;
    assign token_in_vec_32[1] = token_6_32;
    assign in_chan_dep_vld_vec_32[2] = dep_chan_vld_7_32;
    assign in_chan_dep_data_vec_32[179 : 120] = dep_chan_data_7_32;
    assign token_in_vec_32[2] = token_7_32;
    assign in_chan_dep_vld_vec_32[3] = dep_chan_vld_13_32;
    assign in_chan_dep_data_vec_32[239 : 180] = dep_chan_data_13_32;
    assign token_in_vec_32[3] = token_13_32;
    assign in_chan_dep_vld_vec_32[4] = dep_chan_vld_14_32;
    assign in_chan_dep_data_vec_32[299 : 240] = dep_chan_data_14_32;
    assign token_in_vec_32[4] = token_14_32;
    assign in_chan_dep_vld_vec_32[5] = dep_chan_vld_15_32;
    assign in_chan_dep_data_vec_32[359 : 300] = dep_chan_data_15_32;
    assign token_in_vec_32[5] = token_15_32;
    assign in_chan_dep_vld_vec_32[6] = dep_chan_vld_31_32;
    assign in_chan_dep_data_vec_32[419 : 360] = dep_chan_data_31_32;
    assign token_in_vec_32[6] = token_31_32;
    assign in_chan_dep_vld_vec_32[7] = dep_chan_vld_33_32;
    assign in_chan_dep_data_vec_32[479 : 420] = dep_chan_data_33_32;
    assign token_in_vec_32[7] = token_33_32;
    assign in_chan_dep_vld_vec_32[8] = dep_chan_vld_34_32;
    assign in_chan_dep_data_vec_32[539 : 480] = dep_chan_data_34_32;
    assign token_in_vec_32[8] = token_34_32;
    assign in_chan_dep_vld_vec_32[9] = dep_chan_vld_52_32;
    assign in_chan_dep_data_vec_32[599 : 540] = dep_chan_data_52_32;
    assign token_in_vec_32[9] = token_52_32;
    assign in_chan_dep_vld_vec_32[10] = dep_chan_vld_58_32;
    assign in_chan_dep_data_vec_32[659 : 600] = dep_chan_data_58_32;
    assign token_in_vec_32[10] = token_58_32;
    assign dep_chan_vld_32_31 = out_chan_dep_vld_vec_32[0];
    assign dep_chan_data_32_31 = out_chan_dep_data_32;
    assign token_32_31 = token_out_vec_32[0];
    assign dep_chan_vld_32_5 = out_chan_dep_vld_vec_32[1];
    assign dep_chan_data_32_5 = out_chan_dep_data_32;
    assign token_32_5 = token_out_vec_32[1];
    assign dep_chan_vld_32_6 = out_chan_dep_vld_vec_32[2];
    assign dep_chan_data_32_6 = out_chan_dep_data_32;
    assign token_32_6 = token_out_vec_32[2];
    assign dep_chan_vld_32_7 = out_chan_dep_vld_vec_32[3];
    assign dep_chan_data_32_7 = out_chan_dep_data_32;
    assign token_32_7 = token_out_vec_32[3];
    assign dep_chan_vld_32_13 = out_chan_dep_vld_vec_32[4];
    assign dep_chan_data_32_13 = out_chan_dep_data_32;
    assign token_32_13 = token_out_vec_32[4];
    assign dep_chan_vld_32_14 = out_chan_dep_vld_vec_32[5];
    assign dep_chan_data_32_14 = out_chan_dep_data_32;
    assign token_32_14 = token_out_vec_32[5];
    assign dep_chan_vld_32_52 = out_chan_dep_vld_vec_32[6];
    assign dep_chan_data_32_52 = out_chan_dep_data_32;
    assign token_32_52 = token_out_vec_32[6];
    assign dep_chan_vld_32_33 = out_chan_dep_vld_vec_32[7];
    assign dep_chan_data_32_33 = out_chan_dep_data_32;
    assign token_32_33 = token_out_vec_32[7];
    assign dep_chan_vld_32_34 = out_chan_dep_vld_vec_32[8];
    assign dep_chan_data_32_34 = out_chan_dep_data_32;
    assign token_32_34 = token_out_vec_32[8];
    assign dep_chan_vld_32_15 = out_chan_dep_vld_vec_32[9];
    assign dep_chan_data_32_15 = out_chan_dep_data_32;
    assign token_32_15 = token_out_vec_32[9];
    assign dep_chan_vld_32_58 = out_chan_dep_vld_vec_32[10];
    assign dep_chan_data_32_58 = out_chan_dep_data_32;
    assign token_32_58 = token_out_vec_32[10];

    // Process: rxPackageDropper_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 33, 3, 3) toe_top_hls_deadlock_detect_unit_33 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_33),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_33),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_33),
        .token_in_vec(token_in_vec_33),
        .dl_detect_in(dl_detect_out),
        .origin(origin[33]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_33),
        .out_chan_dep_data(out_chan_dep_data_33),
        .token_out_vec(token_out_vec_33),
        .dl_detect_out(dl_in_vec[33]));

    assign proc_33_data_FIFO_blk[0] = 1'b0 | (~rxPackageDropper_512_U0.rxEng_metaHandlerDropFifo_blk_n);
    assign proc_33_data_PIPO_blk[0] = 1'b0;
    assign proc_33_start_FIFO_blk[0] = 1'b0;
    assign proc_33_TLF_FIFO_blk[0] = 1'b0;
    assign proc_33_input_sync_blk[0] = 1'b0;
    assign proc_33_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_33[0] = dl_detect_out ? proc_dep_vld_vec_33_reg[0] : (proc_33_data_FIFO_blk[0] | proc_33_data_PIPO_blk[0] | proc_33_start_FIFO_blk[0] | proc_33_TLF_FIFO_blk[0] | proc_33_input_sync_blk[0] | proc_33_output_sync_blk[0]);
    assign proc_33_data_FIFO_blk[1] = 1'b0 | (~rxPackageDropper_512_U0.rxEng_fsmDropFifo_blk_n);
    assign proc_33_data_PIPO_blk[1] = 1'b0;
    assign proc_33_start_FIFO_blk[1] = 1'b0;
    assign proc_33_TLF_FIFO_blk[1] = 1'b0;
    assign proc_33_input_sync_blk[1] = 1'b0;
    assign proc_33_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_33[1] = dl_detect_out ? proc_dep_vld_vec_33_reg[1] : (proc_33_data_FIFO_blk[1] | proc_33_data_PIPO_blk[1] | proc_33_start_FIFO_blk[1] | proc_33_TLF_FIFO_blk[1] | proc_33_input_sync_blk[1] | proc_33_output_sync_blk[1]);
    assign proc_33_data_FIFO_blk[2] = 1'b0 | (~rxPackageDropper_512_U0.rxEng_dataBuffer3_blk_n);
    assign proc_33_data_PIPO_blk[2] = 1'b0;
    assign proc_33_start_FIFO_blk[2] = 1'b0;
    assign proc_33_TLF_FIFO_blk[2] = 1'b0;
    assign proc_33_input_sync_blk[2] = 1'b0;
    assign proc_33_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_33[2] = dl_detect_out ? proc_dep_vld_vec_33_reg[2] : (proc_33_data_FIFO_blk[2] | proc_33_data_PIPO_blk[2] | proc_33_start_FIFO_blk[2] | proc_33_TLF_FIFO_blk[2] | proc_33_input_sync_blk[2] | proc_33_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_33_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_33_reg <= proc_dep_vld_vec_33;
        end
    end
    assign in_chan_dep_vld_vec_33[0] = dep_chan_vld_28_33;
    assign in_chan_dep_data_vec_33[59 : 0] = dep_chan_data_28_33;
    assign token_in_vec_33[0] = token_28_33;
    assign in_chan_dep_vld_vec_33[1] = dep_chan_vld_31_33;
    assign in_chan_dep_data_vec_33[119 : 60] = dep_chan_data_31_33;
    assign token_in_vec_33[1] = token_31_33;
    assign in_chan_dep_vld_vec_33[2] = dep_chan_vld_32_33;
    assign in_chan_dep_data_vec_33[179 : 120] = dep_chan_data_32_33;
    assign token_in_vec_33[2] = token_32_33;
    assign dep_chan_vld_33_31 = out_chan_dep_vld_vec_33[0];
    assign dep_chan_data_33_31 = out_chan_dep_data_33;
    assign token_33_31 = token_out_vec_33[0];
    assign dep_chan_vld_33_32 = out_chan_dep_vld_vec_33[1];
    assign dep_chan_data_33_32 = out_chan_dep_data_33;
    assign token_33_32 = token_out_vec_33[1];
    assign dep_chan_vld_33_28 = out_chan_dep_vld_vec_33[2];
    assign dep_chan_data_33_28 = out_chan_dep_data_33;
    assign token_33_28 = token_out_vec_33[2];

    // Process: rxEventMerger_U0
    toe_top_hls_deadlock_detect_unit #(60, 34, 3, 3) toe_top_hls_deadlock_detect_unit_34 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_34),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_34),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_34),
        .token_in_vec(token_in_vec_34),
        .dl_detect_in(dl_detect_out),
        .origin(origin[34]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_34),
        .out_chan_dep_data(out_chan_dep_data_34),
        .token_out_vec(token_out_vec_34),
        .dl_detect_out(dl_in_vec[34]));

    assign proc_34_data_FIFO_blk[0] = 1'b0 | (~rxEventMerger_U0.rxEng_metaHandlerEventFifo_blk_n);
    assign proc_34_data_PIPO_blk[0] = 1'b0;
    assign proc_34_start_FIFO_blk[0] = 1'b0;
    assign proc_34_TLF_FIFO_blk[0] = 1'b0;
    assign proc_34_input_sync_blk[0] = 1'b0;
    assign proc_34_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_34[0] = dl_detect_out ? proc_dep_vld_vec_34_reg[0] : (proc_34_data_FIFO_blk[0] | proc_34_data_PIPO_blk[0] | proc_34_start_FIFO_blk[0] | proc_34_TLF_FIFO_blk[0] | proc_34_input_sync_blk[0] | proc_34_output_sync_blk[0]);
    assign proc_34_data_FIFO_blk[1] = 1'b0 | (~rxEventMerger_U0.rxEng2eventEng_setEvent_blk_n);
    assign proc_34_data_PIPO_blk[1] = 1'b0;
    assign proc_34_start_FIFO_blk[1] = 1'b0;
    assign proc_34_TLF_FIFO_blk[1] = 1'b0;
    assign proc_34_input_sync_blk[1] = 1'b0;
    assign proc_34_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_34[1] = dl_detect_out ? proc_dep_vld_vec_34_reg[1] : (proc_34_data_FIFO_blk[1] | proc_34_data_PIPO_blk[1] | proc_34_start_FIFO_blk[1] | proc_34_TLF_FIFO_blk[1] | proc_34_input_sync_blk[1] | proc_34_output_sync_blk[1]);
    assign proc_34_data_FIFO_blk[2] = 1'b0 | (~rxEventMerger_U0.rxEng_fsmEventFifo_blk_n);
    assign proc_34_data_PIPO_blk[2] = 1'b0;
    assign proc_34_start_FIFO_blk[2] = 1'b0;
    assign proc_34_TLF_FIFO_blk[2] = 1'b0;
    assign proc_34_input_sync_blk[2] = 1'b0;
    assign proc_34_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_34[2] = dl_detect_out ? proc_dep_vld_vec_34_reg[2] : (proc_34_data_FIFO_blk[2] | proc_34_data_PIPO_blk[2] | proc_34_start_FIFO_blk[2] | proc_34_TLF_FIFO_blk[2] | proc_34_input_sync_blk[2] | proc_34_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_34_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_34_reg <= proc_dep_vld_vec_34;
        end
    end
    assign in_chan_dep_vld_vec_34[0] = dep_chan_vld_17_34;
    assign in_chan_dep_data_vec_34[59 : 0] = dep_chan_data_17_34;
    assign token_in_vec_34[0] = token_17_34;
    assign in_chan_dep_vld_vec_34[1] = dep_chan_vld_31_34;
    assign in_chan_dep_data_vec_34[119 : 60] = dep_chan_data_31_34;
    assign token_in_vec_34[1] = token_31_34;
    assign in_chan_dep_vld_vec_34[2] = dep_chan_vld_32_34;
    assign in_chan_dep_data_vec_34[179 : 120] = dep_chan_data_32_34;
    assign token_in_vec_34[2] = token_32_34;
    assign dep_chan_vld_34_31 = out_chan_dep_vld_vec_34[0];
    assign dep_chan_data_34_31 = out_chan_dep_data_34;
    assign token_34_31 = token_out_vec_34[0];
    assign dep_chan_vld_34_17 = out_chan_dep_vld_vec_34[1];
    assign dep_chan_data_34_17 = out_chan_dep_data_34;
    assign token_34_17 = token_out_vec_34[1];
    assign dep_chan_vld_34_32 = out_chan_dep_vld_vec_34[2];
    assign dep_chan_data_34_32 = out_chan_dep_data_34;
    assign token_34_32 = token_out_vec_34[2];

    // Process: metaLoader_U0
    toe_top_hls_deadlock_detect_unit #(60, 35, 12, 12) toe_top_hls_deadlock_detect_unit_35 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_35),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_35),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_35),
        .token_in_vec(token_in_vec_35),
        .dl_detect_in(dl_detect_out),
        .origin(origin[35]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_35),
        .out_chan_dep_data(out_chan_dep_data_35),
        .token_out_vec(token_out_vec_35),
        .dl_detect_out(dl_in_vec[35]));

    assign proc_35_data_FIFO_blk[0] = 1'b0 | (~metaLoader_U0.eventEng2txEng_event_blk_n);
    assign proc_35_data_PIPO_blk[0] = 1'b0;
    assign proc_35_start_FIFO_blk[0] = 1'b0;
    assign proc_35_TLF_FIFO_blk[0] = 1'b0;
    assign proc_35_input_sync_blk[0] = 1'b0;
    assign proc_35_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_35[0] = dl_detect_out ? proc_dep_vld_vec_35_reg[0] : (proc_35_data_FIFO_blk[0] | proc_35_data_PIPO_blk[0] | proc_35_start_FIFO_blk[0] | proc_35_TLF_FIFO_blk[0] | proc_35_input_sync_blk[0] | proc_35_output_sync_blk[0]);
    assign proc_35_data_FIFO_blk[1] = 1'b0 | (~metaLoader_U0.txEngFifoReadCount_blk_n);
    assign proc_35_data_PIPO_blk[1] = 1'b0;
    assign proc_35_start_FIFO_blk[1] = 1'b0;
    assign proc_35_TLF_FIFO_blk[1] = 1'b0;
    assign proc_35_input_sync_blk[1] = 1'b0;
    assign proc_35_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_35[1] = dl_detect_out ? proc_dep_vld_vec_35_reg[1] : (proc_35_data_FIFO_blk[1] | proc_35_data_PIPO_blk[1] | proc_35_start_FIFO_blk[1] | proc_35_TLF_FIFO_blk[1] | proc_35_input_sync_blk[1] | proc_35_output_sync_blk[1]);
    assign proc_35_data_FIFO_blk[2] = 1'b0 | (~metaLoader_U0.txEng2rxSar_req_blk_n) | (~metaLoader_U0.rxSar2txEng_rsp_blk_n);
    assign proc_35_data_PIPO_blk[2] = 1'b0;
    assign proc_35_start_FIFO_blk[2] = 1'b0;
    assign proc_35_TLF_FIFO_blk[2] = 1'b0;
    assign proc_35_input_sync_blk[2] = 1'b0;
    assign proc_35_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_35[2] = dl_detect_out ? proc_dep_vld_vec_35_reg[2] : (proc_35_data_FIFO_blk[2] | proc_35_data_PIPO_blk[2] | proc_35_start_FIFO_blk[2] | proc_35_TLF_FIFO_blk[2] | proc_35_input_sync_blk[2] | proc_35_output_sync_blk[2]);
    assign proc_35_data_FIFO_blk[3] = 1'b0 | (~metaLoader_U0.txEng2txSar_upd_req_blk_n) | (~metaLoader_U0.txSar2txEng_upd_rsp_blk_n);
    assign proc_35_data_PIPO_blk[3] = 1'b0;
    assign proc_35_start_FIFO_blk[3] = 1'b0;
    assign proc_35_TLF_FIFO_blk[3] = 1'b0;
    assign proc_35_input_sync_blk[3] = 1'b0;
    assign proc_35_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_35[3] = dl_detect_out ? proc_dep_vld_vec_35_reg[3] : (proc_35_data_FIFO_blk[3] | proc_35_data_PIPO_blk[3] | proc_35_start_FIFO_blk[3] | proc_35_TLF_FIFO_blk[3] | proc_35_input_sync_blk[3] | proc_35_output_sync_blk[3]);
    assign proc_35_data_FIFO_blk[4] = 1'b0 | (~metaLoader_U0.txEng2timer_setProbeTimer_blk_n);
    assign proc_35_data_PIPO_blk[4] = 1'b0;
    assign proc_35_start_FIFO_blk[4] = 1'b0;
    assign proc_35_TLF_FIFO_blk[4] = 1'b0;
    assign proc_35_input_sync_blk[4] = 1'b0;
    assign proc_35_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_35[4] = dl_detect_out ? proc_dep_vld_vec_35_reg[4] : (proc_35_data_FIFO_blk[4] | proc_35_data_PIPO_blk[4] | proc_35_start_FIFO_blk[4] | proc_35_TLF_FIFO_blk[4] | proc_35_input_sync_blk[4] | proc_35_output_sync_blk[4]);
    assign proc_35_data_FIFO_blk[5] = 1'b0 | (~metaLoader_U0.txEng_ipMetaFifo_blk_n);
    assign proc_35_data_PIPO_blk[5] = 1'b0;
    assign proc_35_start_FIFO_blk[5] = 1'b0;
    assign proc_35_TLF_FIFO_blk[5] = 1'b0;
    assign proc_35_input_sync_blk[5] = 1'b0;
    assign proc_35_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_35[5] = dl_detect_out ? proc_dep_vld_vec_35_reg[5] : (proc_35_data_FIFO_blk[5] | proc_35_data_PIPO_blk[5] | proc_35_start_FIFO_blk[5] | proc_35_TLF_FIFO_blk[5] | proc_35_input_sync_blk[5] | proc_35_output_sync_blk[5]);
    assign proc_35_data_FIFO_blk[6] = 1'b0 | (~metaLoader_U0.txEng_tcpMetaFifo_blk_n);
    assign proc_35_data_PIPO_blk[6] = 1'b0;
    assign proc_35_start_FIFO_blk[6] = 1'b0;
    assign proc_35_TLF_FIFO_blk[6] = 1'b0;
    assign proc_35_input_sync_blk[6] = 1'b0;
    assign proc_35_output_sync_blk[6] = 1'b0;
    assign proc_dep_vld_vec_35[6] = dl_detect_out ? proc_dep_vld_vec_35_reg[6] : (proc_35_data_FIFO_blk[6] | proc_35_data_PIPO_blk[6] | proc_35_start_FIFO_blk[6] | proc_35_TLF_FIFO_blk[6] | proc_35_input_sync_blk[6] | proc_35_output_sync_blk[6]);
    assign proc_35_data_FIFO_blk[7] = 1'b0 | (~metaLoader_U0.txEng_isLookUpFifo_blk_n) | (~metaLoader_U0.txEng_tupleShortCutFifo_blk_n);
    assign proc_35_data_PIPO_blk[7] = 1'b0;
    assign proc_35_start_FIFO_blk[7] = 1'b0;
    assign proc_35_TLF_FIFO_blk[7] = 1'b0;
    assign proc_35_input_sync_blk[7] = 1'b0;
    assign proc_35_output_sync_blk[7] = 1'b0;
    assign proc_dep_vld_vec_35[7] = dl_detect_out ? proc_dep_vld_vec_35_reg[7] : (proc_35_data_FIFO_blk[7] | proc_35_data_PIPO_blk[7] | proc_35_start_FIFO_blk[7] | proc_35_TLF_FIFO_blk[7] | proc_35_input_sync_blk[7] | proc_35_output_sync_blk[7]);
    assign proc_35_data_FIFO_blk[8] = 1'b0 | (~metaLoader_U0.txEng_isDDRbypass_blk_n);
    assign proc_35_data_PIPO_blk[8] = 1'b0;
    assign proc_35_start_FIFO_blk[8] = 1'b0;
    assign proc_35_TLF_FIFO_blk[8] = 1'b0;
    assign proc_35_input_sync_blk[8] = 1'b0;
    assign proc_35_output_sync_blk[8] = 1'b0;
    assign proc_dep_vld_vec_35[8] = dl_detect_out ? proc_dep_vld_vec_35_reg[8] : (proc_35_data_FIFO_blk[8] | proc_35_data_PIPO_blk[8] | proc_35_start_FIFO_blk[8] | proc_35_TLF_FIFO_blk[8] | proc_35_input_sync_blk[8] | proc_35_output_sync_blk[8]);
    assign proc_35_data_FIFO_blk[9] = 1'b0 | (~metaLoader_U0.txEng2sLookup_rev_req_blk_n);
    assign proc_35_data_PIPO_blk[9] = 1'b0;
    assign proc_35_start_FIFO_blk[9] = 1'b0;
    assign proc_35_TLF_FIFO_blk[9] = 1'b0;
    assign proc_35_input_sync_blk[9] = 1'b0;
    assign proc_35_output_sync_blk[9] = 1'b0;
    assign proc_dep_vld_vec_35[9] = dl_detect_out ? proc_dep_vld_vec_35_reg[9] : (proc_35_data_FIFO_blk[9] | proc_35_data_PIPO_blk[9] | proc_35_start_FIFO_blk[9] | proc_35_TLF_FIFO_blk[9] | proc_35_input_sync_blk[9] | proc_35_output_sync_blk[9]);
    assign proc_35_data_FIFO_blk[10] = 1'b0 | (~metaLoader_U0.txEng2timer_setRetransmitTimer_blk_n);
    assign proc_35_data_PIPO_blk[10] = 1'b0;
    assign proc_35_start_FIFO_blk[10] = 1'b0;
    assign proc_35_TLF_FIFO_blk[10] = 1'b0;
    assign proc_35_input_sync_blk[10] = 1'b0;
    assign proc_35_output_sync_blk[10] = 1'b0;
    assign proc_dep_vld_vec_35[10] = dl_detect_out ? proc_dep_vld_vec_35_reg[10] : (proc_35_data_FIFO_blk[10] | proc_35_data_PIPO_blk[10] | proc_35_start_FIFO_blk[10] | proc_35_TLF_FIFO_blk[10] | proc_35_input_sync_blk[10] | proc_35_output_sync_blk[10]);
    assign proc_35_data_FIFO_blk[11] = 1'b0 | (~metaLoader_U0.txMetaloader2memAccessBreakdown_blk_n);
    assign proc_35_data_PIPO_blk[11] = 1'b0;
    assign proc_35_start_FIFO_blk[11] = 1'b0;
    assign proc_35_TLF_FIFO_blk[11] = 1'b0;
    assign proc_35_input_sync_blk[11] = 1'b0;
    assign proc_35_output_sync_blk[11] = 1'b0;
    assign proc_dep_vld_vec_35[11] = dl_detect_out ? proc_dep_vld_vec_35_reg[11] : (proc_35_data_FIFO_blk[11] | proc_35_data_PIPO_blk[11] | proc_35_start_FIFO_blk[11] | proc_35_TLF_FIFO_blk[11] | proc_35_input_sync_blk[11] | proc_35_output_sync_blk[11]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_35_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_35_reg <= proc_dep_vld_vec_35;
        end
    end
    assign in_chan_dep_vld_vec_35[0] = dep_chan_vld_4_35;
    assign in_chan_dep_data_vec_35[59 : 0] = dep_chan_data_4_35;
    assign token_in_vec_35[0] = token_4_35;
    assign in_chan_dep_vld_vec_35[1] = dep_chan_vld_6_35;
    assign in_chan_dep_data_vec_35[119 : 60] = dep_chan_data_6_35;
    assign token_in_vec_35[1] = token_6_35;
    assign in_chan_dep_vld_vec_35[2] = dep_chan_vld_7_35;
    assign in_chan_dep_data_vec_35[179 : 120] = dep_chan_data_7_35;
    assign token_in_vec_35[2] = token_7_35;
    assign in_chan_dep_vld_vec_35[3] = dep_chan_vld_13_35;
    assign in_chan_dep_data_vec_35[239 : 180] = dep_chan_data_13_35;
    assign token_in_vec_35[3] = token_13_35;
    assign in_chan_dep_vld_vec_35[4] = dep_chan_vld_14_35;
    assign in_chan_dep_data_vec_35[299 : 240] = dep_chan_data_14_35;
    assign token_in_vec_35[4] = token_14_35;
    assign in_chan_dep_vld_vec_35[5] = dep_chan_vld_17_35;
    assign in_chan_dep_data_vec_35[359 : 300] = dep_chan_data_17_35;
    assign token_in_vec_35[5] = token_17_35;
    assign in_chan_dep_vld_vec_35[6] = dep_chan_vld_18_35;
    assign in_chan_dep_data_vec_35[419 : 360] = dep_chan_data_18_35;
    assign token_in_vec_35[6] = token_18_35;
    assign in_chan_dep_vld_vec_35[7] = dep_chan_vld_36_35;
    assign in_chan_dep_data_vec_35[479 : 420] = dep_chan_data_36_35;
    assign token_in_vec_35[7] = token_36_35;
    assign in_chan_dep_vld_vec_35[8] = dep_chan_vld_37_35;
    assign in_chan_dep_data_vec_35[539 : 480] = dep_chan_data_37_35;
    assign token_in_vec_35[8] = token_37_35;
    assign in_chan_dep_vld_vec_35[9] = dep_chan_vld_39_35;
    assign in_chan_dep_data_vec_35[599 : 540] = dep_chan_data_39_35;
    assign token_in_vec_35[9] = token_39_35;
    assign in_chan_dep_vld_vec_35[10] = dep_chan_vld_41_35;
    assign in_chan_dep_data_vec_35[659 : 600] = dep_chan_data_41_35;
    assign token_in_vec_35[10] = token_41_35;
    assign in_chan_dep_vld_vec_35[11] = dep_chan_vld_48_35;
    assign in_chan_dep_data_vec_35[719 : 660] = dep_chan_data_48_35;
    assign token_in_vec_35[11] = token_48_35;
    assign dep_chan_vld_35_18 = out_chan_dep_vld_vec_35[0];
    assign dep_chan_data_35_18 = out_chan_dep_data_35;
    assign token_35_18 = token_out_vec_35[0];
    assign dep_chan_vld_35_17 = out_chan_dep_vld_vec_35[1];
    assign dep_chan_data_35_17 = out_chan_dep_data_35;
    assign token_35_17 = token_out_vec_35[1];
    assign dep_chan_vld_35_6 = out_chan_dep_vld_vec_35[2];
    assign dep_chan_data_35_6 = out_chan_dep_data_35;
    assign token_35_6 = token_out_vec_35[2];
    assign dep_chan_vld_35_7 = out_chan_dep_vld_vec_35[3];
    assign dep_chan_data_35_7 = out_chan_dep_data_35;
    assign token_35_7 = token_out_vec_35[3];
    assign dep_chan_vld_35_14 = out_chan_dep_vld_vec_35[4];
    assign dep_chan_data_35_14 = out_chan_dep_data_35;
    assign token_35_14 = token_out_vec_35[4];
    assign dep_chan_vld_35_48 = out_chan_dep_vld_vec_35[5];
    assign dep_chan_data_35_48 = out_chan_dep_data_35;
    assign token_35_48 = token_out_vec_35[5];
    assign dep_chan_vld_35_41 = out_chan_dep_vld_vec_35[6];
    assign dep_chan_data_35_41 = out_chan_dep_data_35;
    assign token_35_41 = token_out_vec_35[6];
    assign dep_chan_vld_35_37 = out_chan_dep_vld_vec_35[7];
    assign dep_chan_data_35_37 = out_chan_dep_data_35;
    assign token_35_37 = token_out_vec_35[7];
    assign dep_chan_vld_35_39 = out_chan_dep_vld_vec_35[8];
    assign dep_chan_data_35_39 = out_chan_dep_data_35;
    assign token_35_39 = token_out_vec_35[8];
    assign dep_chan_vld_35_4 = out_chan_dep_vld_vec_35[9];
    assign dep_chan_data_35_4 = out_chan_dep_data_35;
    assign token_35_4 = token_out_vec_35[9];
    assign dep_chan_vld_35_13 = out_chan_dep_vld_vec_35[10];
    assign dep_chan_data_35_13 = out_chan_dep_data_35;
    assign token_35_13 = token_out_vec_35[10];
    assign dep_chan_vld_35_36 = out_chan_dep_vld_vec_35[11];
    assign dep_chan_data_35_36 = out_chan_dep_data_35;
    assign token_35_36 = token_out_vec_35[11];

    // Process: txEngMemAccessBreakdown_U0
    toe_top_hls_deadlock_detect_unit #(60, 36, 2, 2) toe_top_hls_deadlock_detect_unit_36 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_36),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_36),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_36),
        .token_in_vec(token_in_vec_36),
        .dl_detect_in(dl_detect_out),
        .origin(origin[36]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_36),
        .out_chan_dep_data(out_chan_dep_data_36),
        .token_out_vec(token_out_vec_36),
        .dl_detect_out(dl_in_vec[36]));

    assign proc_36_data_FIFO_blk[0] = 1'b0 | (~txEngMemAccessBreakdown_U0.txMetaloader2memAccessBreakdown_blk_n);
    assign proc_36_data_PIPO_blk[0] = 1'b0;
    assign proc_36_start_FIFO_blk[0] = 1'b0;
    assign proc_36_TLF_FIFO_blk[0] = 1'b0;
    assign proc_36_input_sync_blk[0] = 1'b0;
    assign proc_36_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_36[0] = dl_detect_out ? proc_dep_vld_vec_36_reg[0] : (proc_36_data_FIFO_blk[0] | proc_36_data_PIPO_blk[0] | proc_36_start_FIFO_blk[0] | proc_36_TLF_FIFO_blk[0] | proc_36_input_sync_blk[0] | proc_36_output_sync_blk[0]);
    assign proc_36_data_FIFO_blk[1] = 1'b0 | (~txEngMemAccessBreakdown_U0.memAccessBreakdown2txPkgStitcher_blk_n);
    assign proc_36_data_PIPO_blk[1] = 1'b0;
    assign proc_36_start_FIFO_blk[1] = 1'b0;
    assign proc_36_TLF_FIFO_blk[1] = 1'b0;
    assign proc_36_input_sync_blk[1] = 1'b0;
    assign proc_36_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_36[1] = dl_detect_out ? proc_dep_vld_vec_36_reg[1] : (proc_36_data_FIFO_blk[1] | proc_36_data_PIPO_blk[1] | proc_36_start_FIFO_blk[1] | proc_36_TLF_FIFO_blk[1] | proc_36_input_sync_blk[1] | proc_36_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_36_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_36_reg <= proc_dep_vld_vec_36;
        end
    end
    assign in_chan_dep_vld_vec_36[0] = dep_chan_vld_35_36;
    assign in_chan_dep_data_vec_36[59 : 0] = dep_chan_data_35_36;
    assign token_in_vec_36[0] = token_35_36;
    assign in_chan_dep_vld_vec_36[1] = dep_chan_vld_38_36;
    assign in_chan_dep_data_vec_36[119 : 60] = dep_chan_data_38_36;
    assign token_in_vec_36[1] = token_38_36;
    assign dep_chan_vld_36_35 = out_chan_dep_vld_vec_36[0];
    assign dep_chan_data_36_35 = out_chan_dep_data_36;
    assign token_36_35 = token_out_vec_36[0];
    assign dep_chan_vld_36_38 = out_chan_dep_vld_vec_36[1];
    assign dep_chan_data_36_38 = out_chan_dep_data_36;
    assign token_36_38 = token_out_vec_36[1];

    // Process: tupleSplitter_U0
    toe_top_hls_deadlock_detect_unit #(60, 37, 4, 4) toe_top_hls_deadlock_detect_unit_37 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_37),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_37),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_37),
        .token_in_vec(token_in_vec_37),
        .dl_detect_in(dl_detect_out),
        .origin(origin[37]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_37),
        .out_chan_dep_data(out_chan_dep_data_37),
        .token_out_vec(token_out_vec_37),
        .dl_detect_out(dl_in_vec[37]));

    assign proc_37_data_FIFO_blk[0] = 1'b0 | (~tupleSplitter_U0.txEng_isLookUpFifo_blk_n) | (~tupleSplitter_U0.txEng_tupleShortCutFifo_blk_n);
    assign proc_37_data_PIPO_blk[0] = 1'b0;
    assign proc_37_start_FIFO_blk[0] = 1'b0;
    assign proc_37_TLF_FIFO_blk[0] = 1'b0;
    assign proc_37_input_sync_blk[0] = 1'b0;
    assign proc_37_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_37[0] = dl_detect_out ? proc_dep_vld_vec_37_reg[0] : (proc_37_data_FIFO_blk[0] | proc_37_data_PIPO_blk[0] | proc_37_start_FIFO_blk[0] | proc_37_TLF_FIFO_blk[0] | proc_37_input_sync_blk[0] | proc_37_output_sync_blk[0]);
    assign proc_37_data_FIFO_blk[1] = 1'b0 | (~tupleSplitter_U0.sLookup2txEng_rev_rsp_blk_n);
    assign proc_37_data_PIPO_blk[1] = 1'b0;
    assign proc_37_start_FIFO_blk[1] = 1'b0;
    assign proc_37_TLF_FIFO_blk[1] = 1'b0;
    assign proc_37_input_sync_blk[1] = 1'b0;
    assign proc_37_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_37[1] = dl_detect_out ? proc_dep_vld_vec_37_reg[1] : (proc_37_data_FIFO_blk[1] | proc_37_data_PIPO_blk[1] | proc_37_start_FIFO_blk[1] | proc_37_TLF_FIFO_blk[1] | proc_37_input_sync_blk[1] | proc_37_output_sync_blk[1]);
    assign proc_37_data_FIFO_blk[2] = 1'b0 | (~tupleSplitter_U0.txEng_ipTupleFifo_blk_n);
    assign proc_37_data_PIPO_blk[2] = 1'b0;
    assign proc_37_start_FIFO_blk[2] = 1'b0;
    assign proc_37_TLF_FIFO_blk[2] = 1'b0;
    assign proc_37_input_sync_blk[2] = 1'b0;
    assign proc_37_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_37[2] = dl_detect_out ? proc_dep_vld_vec_37_reg[2] : (proc_37_data_FIFO_blk[2] | proc_37_data_PIPO_blk[2] | proc_37_start_FIFO_blk[2] | proc_37_TLF_FIFO_blk[2] | proc_37_input_sync_blk[2] | proc_37_output_sync_blk[2]);
    assign proc_37_data_FIFO_blk[3] = 1'b0 | (~tupleSplitter_U0.txEng_tcpTupleFifo_blk_n);
    assign proc_37_data_PIPO_blk[3] = 1'b0;
    assign proc_37_start_FIFO_blk[3] = 1'b0;
    assign proc_37_TLF_FIFO_blk[3] = 1'b0;
    assign proc_37_input_sync_blk[3] = 1'b0;
    assign proc_37_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_37[3] = dl_detect_out ? proc_dep_vld_vec_37_reg[3] : (proc_37_data_FIFO_blk[3] | proc_37_data_PIPO_blk[3] | proc_37_start_FIFO_blk[3] | proc_37_TLF_FIFO_blk[3] | proc_37_input_sync_blk[3] | proc_37_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_37_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_37_reg <= proc_dep_vld_vec_37;
        end
    end
    assign in_chan_dep_vld_vec_37[0] = dep_chan_vld_4_37;
    assign in_chan_dep_data_vec_37[59 : 0] = dep_chan_data_4_37;
    assign token_in_vec_37[0] = token_4_37;
    assign in_chan_dep_vld_vec_37[1] = dep_chan_vld_35_37;
    assign in_chan_dep_data_vec_37[119 : 60] = dep_chan_data_35_37;
    assign token_in_vec_37[1] = token_35_37;
    assign in_chan_dep_vld_vec_37[2] = dep_chan_vld_41_37;
    assign in_chan_dep_data_vec_37[179 : 120] = dep_chan_data_41_37;
    assign token_in_vec_37[2] = token_41_37;
    assign in_chan_dep_vld_vec_37[3] = dep_chan_vld_48_37;
    assign in_chan_dep_data_vec_37[239 : 180] = dep_chan_data_48_37;
    assign token_in_vec_37[3] = token_48_37;
    assign dep_chan_vld_37_35 = out_chan_dep_vld_vec_37[0];
    assign dep_chan_data_37_35 = out_chan_dep_data_37;
    assign token_37_35 = token_out_vec_37[0];
    assign dep_chan_vld_37_4 = out_chan_dep_vld_vec_37[1];
    assign dep_chan_data_37_4 = out_chan_dep_data_37;
    assign token_37_4 = token_out_vec_37[1];
    assign dep_chan_vld_37_48 = out_chan_dep_vld_vec_37[2];
    assign dep_chan_data_37_48 = out_chan_dep_data_37;
    assign token_37_48 = token_out_vec_37[2];
    assign dep_chan_vld_37_41 = out_chan_dep_vld_vec_37[3];
    assign dep_chan_data_37_41 = out_chan_dep_data_37;
    assign token_37_41 = token_out_vec_37[3];

    // Process: read_data_stitching_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 38, 2, 2) toe_top_hls_deadlock_detect_unit_38 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_38),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_38),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_38),
        .token_in_vec(token_in_vec_38),
        .dl_detect_in(dl_detect_out),
        .origin(origin[38]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_38),
        .out_chan_dep_data(out_chan_dep_data_38),
        .token_out_vec(token_out_vec_38),
        .dl_detect_out(dl_in_vec[38]));

    assign proc_38_data_FIFO_blk[0] = 1'b0 | (~read_data_stitching_512_U0.memAccessBreakdown2txPkgStitcher_blk_n);
    assign proc_38_data_PIPO_blk[0] = 1'b0;
    assign proc_38_start_FIFO_blk[0] = 1'b0;
    assign proc_38_TLF_FIFO_blk[0] = 1'b0;
    assign proc_38_input_sync_blk[0] = 1'b0;
    assign proc_38_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_38[0] = dl_detect_out ? proc_dep_vld_vec_38_reg[0] : (proc_38_data_FIFO_blk[0] | proc_38_data_PIPO_blk[0] | proc_38_start_FIFO_blk[0] | proc_38_TLF_FIFO_blk[0] | proc_38_input_sync_blk[0] | proc_38_output_sync_blk[0]);
    assign proc_38_data_FIFO_blk[1] = 1'b0 | (~read_data_stitching_512_U0.txBufferReadDataStitched_blk_n);
    assign proc_38_data_PIPO_blk[1] = 1'b0;
    assign proc_38_start_FIFO_blk[1] = 1'b0;
    assign proc_38_TLF_FIFO_blk[1] = 1'b0;
    assign proc_38_input_sync_blk[1] = 1'b0;
    assign proc_38_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_38[1] = dl_detect_out ? proc_dep_vld_vec_38_reg[1] : (proc_38_data_FIFO_blk[1] | proc_38_data_PIPO_blk[1] | proc_38_start_FIFO_blk[1] | proc_38_TLF_FIFO_blk[1] | proc_38_input_sync_blk[1] | proc_38_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_38_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_38_reg <= proc_dep_vld_vec_38;
        end
    end
    assign in_chan_dep_vld_vec_38[0] = dep_chan_vld_36_38;
    assign in_chan_dep_data_vec_38[59 : 0] = dep_chan_data_36_38;
    assign token_in_vec_38[0] = token_36_38;
    assign in_chan_dep_vld_vec_38[1] = dep_chan_vld_39_38;
    assign in_chan_dep_data_vec_38[119 : 60] = dep_chan_data_39_38;
    assign token_in_vec_38[1] = token_39_38;
    assign dep_chan_vld_38_36 = out_chan_dep_vld_vec_38[0];
    assign dep_chan_data_38_36 = out_chan_dep_data_38;
    assign token_38_36 = token_out_vec_38[0];
    assign dep_chan_vld_38_39 = out_chan_dep_vld_vec_38[1];
    assign dep_chan_data_38_39 = out_chan_dep_data_38;
    assign token_38_39 = token_out_vec_38[1];

    // Process: read_data_arbiter_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 39, 4, 4) toe_top_hls_deadlock_detect_unit_39 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_39),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_39),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_39),
        .token_in_vec(token_in_vec_39),
        .dl_detect_in(dl_detect_out),
        .origin(origin[39]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_39),
        .out_chan_dep_data(out_chan_dep_data_39),
        .token_out_vec(token_out_vec_39),
        .dl_detect_out(dl_in_vec[39]));

    assign proc_39_data_FIFO_blk[0] = 1'b0 | (~read_data_arbiter_512_U0.txEng_isDDRbypass_blk_n);
    assign proc_39_data_PIPO_blk[0] = 1'b0;
    assign proc_39_start_FIFO_blk[0] = 1'b0;
    assign proc_39_TLF_FIFO_blk[0] = 1'b0;
    assign proc_39_input_sync_blk[0] = 1'b0;
    assign proc_39_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_39[0] = dl_detect_out ? proc_dep_vld_vec_39_reg[0] : (proc_39_data_FIFO_blk[0] | proc_39_data_PIPO_blk[0] | proc_39_start_FIFO_blk[0] | proc_39_TLF_FIFO_blk[0] | proc_39_input_sync_blk[0] | proc_39_output_sync_blk[0]);
    assign proc_39_data_FIFO_blk[1] = 1'b0 | (~read_data_arbiter_512_U0.txBufferReadDataStitched_blk_n);
    assign proc_39_data_PIPO_blk[1] = 1'b0;
    assign proc_39_start_FIFO_blk[1] = 1'b0;
    assign proc_39_TLF_FIFO_blk[1] = 1'b0;
    assign proc_39_input_sync_blk[1] = 1'b0;
    assign proc_39_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_39[1] = dl_detect_out ? proc_dep_vld_vec_39_reg[1] : (proc_39_data_FIFO_blk[1] | proc_39_data_PIPO_blk[1] | proc_39_start_FIFO_blk[1] | proc_39_TLF_FIFO_blk[1] | proc_39_input_sync_blk[1] | proc_39_output_sync_blk[1]);
    assign proc_39_data_FIFO_blk[2] = 1'b0 | (~read_data_arbiter_512_U0.txEng_tcpPkgBuffer0_blk_n);
    assign proc_39_data_PIPO_blk[2] = 1'b0;
    assign proc_39_start_FIFO_blk[2] = 1'b0;
    assign proc_39_TLF_FIFO_blk[2] = 1'b0;
    assign proc_39_input_sync_blk[2] = 1'b0;
    assign proc_39_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_39[2] = dl_detect_out ? proc_dep_vld_vec_39_reg[2] : (proc_39_data_FIFO_blk[2] | proc_39_data_PIPO_blk[2] | proc_39_start_FIFO_blk[2] | proc_39_TLF_FIFO_blk[2] | proc_39_input_sync_blk[2] | proc_39_output_sync_blk[2]);
    assign proc_39_data_FIFO_blk[3] = 1'b0 | (~read_data_arbiter_512_U0.txApp2txEng_data_stream_blk_n);
    assign proc_39_data_PIPO_blk[3] = 1'b0;
    assign proc_39_start_FIFO_blk[3] = 1'b0;
    assign proc_39_TLF_FIFO_blk[3] = 1'b0;
    assign proc_39_input_sync_blk[3] = 1'b0;
    assign proc_39_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_39[3] = dl_detect_out ? proc_dep_vld_vec_39_reg[3] : (proc_39_data_FIFO_blk[3] | proc_39_data_PIPO_blk[3] | proc_39_start_FIFO_blk[3] | proc_39_TLF_FIFO_blk[3] | proc_39_input_sync_blk[3] | proc_39_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_39_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_39_reg <= proc_dep_vld_vec_39;
        end
    end
    assign in_chan_dep_vld_vec_39[0] = dep_chan_vld_35_39;
    assign in_chan_dep_data_vec_39[59 : 0] = dep_chan_data_35_39;
    assign token_in_vec_39[0] = token_35_39;
    assign in_chan_dep_vld_vec_39[1] = dep_chan_vld_38_39;
    assign in_chan_dep_data_vec_39[119 : 60] = dep_chan_data_38_39;
    assign token_in_vec_39[1] = token_38_39;
    assign in_chan_dep_vld_vec_39[2] = dep_chan_vld_40_39;
    assign in_chan_dep_data_vec_39[179 : 120] = dep_chan_data_40_39;
    assign token_in_vec_39[2] = token_40_39;
    assign in_chan_dep_vld_vec_39[3] = dep_chan_vld_56_39;
    assign in_chan_dep_data_vec_39[239 : 180] = dep_chan_data_56_39;
    assign token_in_vec_39[3] = token_56_39;
    assign dep_chan_vld_39_35 = out_chan_dep_vld_vec_39[0];
    assign dep_chan_data_39_35 = out_chan_dep_data_39;
    assign token_39_35 = token_out_vec_39[0];
    assign dep_chan_vld_39_38 = out_chan_dep_vld_vec_39[1];
    assign dep_chan_data_39_38 = out_chan_dep_data_39;
    assign token_39_38 = token_out_vec_39[1];
    assign dep_chan_vld_39_40 = out_chan_dep_vld_vec_39[2];
    assign dep_chan_data_39_40 = out_chan_dep_data_39;
    assign token_39_40 = token_out_vec_39[2];
    assign dep_chan_vld_39_56 = out_chan_dep_vld_vec_39[3];
    assign dep_chan_data_39_56 = out_chan_dep_data_39;
    assign token_39_56 = token_out_vec_39[3];

    // Process: lshiftWordByOctet_512_51_U0
    toe_top_hls_deadlock_detect_unit #(60, 40, 2, 2) toe_top_hls_deadlock_detect_unit_40 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_40),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_40),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_40),
        .token_in_vec(token_in_vec_40),
        .dl_detect_in(dl_detect_out),
        .origin(origin[40]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_40),
        .out_chan_dep_data(out_chan_dep_data_40),
        .token_out_vec(token_out_vec_40),
        .dl_detect_out(dl_in_vec[40]));

    assign proc_40_data_FIFO_blk[0] = 1'b0 | (~lshiftWordByOctet_512_51_U0.txEng_shift2pseudoFifo_blk_n);
    assign proc_40_data_PIPO_blk[0] = 1'b0;
    assign proc_40_start_FIFO_blk[0] = 1'b0;
    assign proc_40_TLF_FIFO_blk[0] = 1'b0;
    assign proc_40_input_sync_blk[0] = 1'b0;
    assign proc_40_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_40[0] = dl_detect_out ? proc_dep_vld_vec_40_reg[0] : (proc_40_data_FIFO_blk[0] | proc_40_data_PIPO_blk[0] | proc_40_start_FIFO_blk[0] | proc_40_TLF_FIFO_blk[0] | proc_40_input_sync_blk[0] | proc_40_output_sync_blk[0]);
    assign proc_40_data_FIFO_blk[1] = 1'b0 | (~lshiftWordByOctet_512_51_U0.txEng_tcpPkgBuffer0_blk_n);
    assign proc_40_data_PIPO_blk[1] = 1'b0;
    assign proc_40_start_FIFO_blk[1] = 1'b0;
    assign proc_40_TLF_FIFO_blk[1] = 1'b0;
    assign proc_40_input_sync_blk[1] = 1'b0;
    assign proc_40_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_40[1] = dl_detect_out ? proc_dep_vld_vec_40_reg[1] : (proc_40_data_FIFO_blk[1] | proc_40_data_PIPO_blk[1] | proc_40_start_FIFO_blk[1] | proc_40_TLF_FIFO_blk[1] | proc_40_input_sync_blk[1] | proc_40_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_40_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_40_reg <= proc_dep_vld_vec_40;
        end
    end
    assign in_chan_dep_vld_vec_40[0] = dep_chan_vld_39_40;
    assign in_chan_dep_data_vec_40[59 : 0] = dep_chan_data_39_40;
    assign token_in_vec_40[0] = token_39_40;
    assign in_chan_dep_vld_vec_40[1] = dep_chan_vld_41_40;
    assign in_chan_dep_data_vec_40[119 : 60] = dep_chan_data_41_40;
    assign token_in_vec_40[1] = token_41_40;
    assign dep_chan_vld_40_41 = out_chan_dep_vld_vec_40[0];
    assign dep_chan_data_40_41 = out_chan_dep_data_40;
    assign token_40_41 = token_out_vec_40[0];
    assign dep_chan_vld_40_39 = out_chan_dep_vld_vec_40[1];
    assign dep_chan_data_40_39 = out_chan_dep_data_40;
    assign token_40_39 = token_out_vec_40[1];

    // Process: pseudoHeaderConstructionNew_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 41, 4, 4) toe_top_hls_deadlock_detect_unit_41 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_41),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_41),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_41),
        .token_in_vec(token_in_vec_41),
        .dl_detect_in(dl_detect_out),
        .origin(origin[41]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_41),
        .out_chan_dep_data(out_chan_dep_data_41),
        .token_out_vec(token_out_vec_41),
        .dl_detect_out(dl_in_vec[41]));

    assign proc_41_data_FIFO_blk[0] = 1'b0 | (~pseudoHeaderConstructionNew_512_U0.txEng_tcpMetaFifo_blk_n);
    assign proc_41_data_PIPO_blk[0] = 1'b0;
    assign proc_41_start_FIFO_blk[0] = 1'b0;
    assign proc_41_TLF_FIFO_blk[0] = 1'b0;
    assign proc_41_input_sync_blk[0] = 1'b0;
    assign proc_41_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_41[0] = dl_detect_out ? proc_dep_vld_vec_41_reg[0] : (proc_41_data_FIFO_blk[0] | proc_41_data_PIPO_blk[0] | proc_41_start_FIFO_blk[0] | proc_41_TLF_FIFO_blk[0] | proc_41_input_sync_blk[0] | proc_41_output_sync_blk[0]);
    assign proc_41_data_FIFO_blk[1] = 1'b0 | (~pseudoHeaderConstructionNew_512_U0.txEng_tcpTupleFifo_blk_n);
    assign proc_41_data_PIPO_blk[1] = 1'b0;
    assign proc_41_start_FIFO_blk[1] = 1'b0;
    assign proc_41_TLF_FIFO_blk[1] = 1'b0;
    assign proc_41_input_sync_blk[1] = 1'b0;
    assign proc_41_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_41[1] = dl_detect_out ? proc_dep_vld_vec_41_reg[1] : (proc_41_data_FIFO_blk[1] | proc_41_data_PIPO_blk[1] | proc_41_start_FIFO_blk[1] | proc_41_TLF_FIFO_blk[1] | proc_41_input_sync_blk[1] | proc_41_output_sync_blk[1]);
    assign proc_41_data_FIFO_blk[2] = 1'b0 | (~pseudoHeaderConstructionNew_512_U0.txEng_tcpPkgBuffer1_blk_n);
    assign proc_41_data_PIPO_blk[2] = 1'b0;
    assign proc_41_start_FIFO_blk[2] = 1'b0;
    assign proc_41_TLF_FIFO_blk[2] = 1'b0;
    assign proc_41_input_sync_blk[2] = 1'b0;
    assign proc_41_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_41[2] = dl_detect_out ? proc_dep_vld_vec_41_reg[2] : (proc_41_data_FIFO_blk[2] | proc_41_data_PIPO_blk[2] | proc_41_start_FIFO_blk[2] | proc_41_TLF_FIFO_blk[2] | proc_41_input_sync_blk[2] | proc_41_output_sync_blk[2]);
    assign proc_41_data_FIFO_blk[3] = 1'b0 | (~pseudoHeaderConstructionNew_512_U0.txEng_shift2pseudoFifo_blk_n);
    assign proc_41_data_PIPO_blk[3] = 1'b0;
    assign proc_41_start_FIFO_blk[3] = 1'b0;
    assign proc_41_TLF_FIFO_blk[3] = 1'b0;
    assign proc_41_input_sync_blk[3] = 1'b0;
    assign proc_41_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_41[3] = dl_detect_out ? proc_dep_vld_vec_41_reg[3] : (proc_41_data_FIFO_blk[3] | proc_41_data_PIPO_blk[3] | proc_41_start_FIFO_blk[3] | proc_41_TLF_FIFO_blk[3] | proc_41_input_sync_blk[3] | proc_41_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_41_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_41_reg <= proc_dep_vld_vec_41;
        end
    end
    assign in_chan_dep_vld_vec_41[0] = dep_chan_vld_35_41;
    assign in_chan_dep_data_vec_41[59 : 0] = dep_chan_data_35_41;
    assign token_in_vec_41[0] = token_35_41;
    assign in_chan_dep_vld_vec_41[1] = dep_chan_vld_37_41;
    assign in_chan_dep_data_vec_41[119 : 60] = dep_chan_data_37_41;
    assign token_in_vec_41[1] = token_37_41;
    assign in_chan_dep_vld_vec_41[2] = dep_chan_vld_40_41;
    assign in_chan_dep_data_vec_41[179 : 120] = dep_chan_data_40_41;
    assign token_in_vec_41[2] = token_40_41;
    assign in_chan_dep_vld_vec_41[3] = dep_chan_vld_42_41;
    assign in_chan_dep_data_vec_41[239 : 180] = dep_chan_data_42_41;
    assign token_in_vec_41[3] = token_42_41;
    assign dep_chan_vld_41_35 = out_chan_dep_vld_vec_41[0];
    assign dep_chan_data_41_35 = out_chan_dep_data_41;
    assign token_41_35 = token_out_vec_41[0];
    assign dep_chan_vld_41_37 = out_chan_dep_vld_vec_41[1];
    assign dep_chan_data_41_37 = out_chan_dep_data_41;
    assign token_41_37 = token_out_vec_41[1];
    assign dep_chan_vld_41_42 = out_chan_dep_vld_vec_41[2];
    assign dep_chan_data_41_42 = out_chan_dep_data_41;
    assign token_41_42 = token_out_vec_41[2];
    assign dep_chan_vld_41_40 = out_chan_dep_vld_vec_41[3];
    assign dep_chan_data_41_40 = out_chan_dep_data_41;
    assign token_41_40 = token_out_vec_41[3];

    // Process: two_complement_subchecksums_512_22_U0
    toe_top_hls_deadlock_detect_unit #(60, 42, 3, 3) toe_top_hls_deadlock_detect_unit_42 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_42),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_42),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_42),
        .token_in_vec(token_in_vec_42),
        .dl_detect_in(dl_detect_out),
        .origin(origin[42]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_42),
        .out_chan_dep_data(out_chan_dep_data_42),
        .token_out_vec(token_out_vec_42),
        .dl_detect_out(dl_in_vec[42]));

    assign proc_42_data_FIFO_blk[0] = 1'b0 | (~two_complement_subchecksums_512_22_U0.txEng_tcpPkgBuffer1_blk_n);
    assign proc_42_data_PIPO_blk[0] = 1'b0;
    assign proc_42_start_FIFO_blk[0] = 1'b0;
    assign proc_42_TLF_FIFO_blk[0] = 1'b0;
    assign proc_42_input_sync_blk[0] = 1'b0;
    assign proc_42_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_42[0] = dl_detect_out ? proc_dep_vld_vec_42_reg[0] : (proc_42_data_FIFO_blk[0] | proc_42_data_PIPO_blk[0] | proc_42_start_FIFO_blk[0] | proc_42_TLF_FIFO_blk[0] | proc_42_input_sync_blk[0] | proc_42_output_sync_blk[0]);
    assign proc_42_data_FIFO_blk[1] = 1'b0 | (~two_complement_subchecksums_512_22_U0.txEng_tcpPkgBuffer2_blk_n);
    assign proc_42_data_PIPO_blk[1] = 1'b0;
    assign proc_42_start_FIFO_blk[1] = 1'b0;
    assign proc_42_TLF_FIFO_blk[1] = 1'b0;
    assign proc_42_input_sync_blk[1] = 1'b0;
    assign proc_42_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_42[1] = dl_detect_out ? proc_dep_vld_vec_42_reg[1] : (proc_42_data_FIFO_blk[1] | proc_42_data_PIPO_blk[1] | proc_42_start_FIFO_blk[1] | proc_42_TLF_FIFO_blk[1] | proc_42_input_sync_blk[1] | proc_42_output_sync_blk[1]);
    assign proc_42_data_FIFO_blk[2] = 1'b0 | (~two_complement_subchecksums_512_22_U0.txEng_subChecksumsFifo_blk_n);
    assign proc_42_data_PIPO_blk[2] = 1'b0;
    assign proc_42_start_FIFO_blk[2] = 1'b0;
    assign proc_42_TLF_FIFO_blk[2] = 1'b0;
    assign proc_42_input_sync_blk[2] = 1'b0;
    assign proc_42_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_42[2] = dl_detect_out ? proc_dep_vld_vec_42_reg[2] : (proc_42_data_FIFO_blk[2] | proc_42_data_PIPO_blk[2] | proc_42_start_FIFO_blk[2] | proc_42_TLF_FIFO_blk[2] | proc_42_input_sync_blk[2] | proc_42_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_42_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_42_reg <= proc_dep_vld_vec_42;
        end
    end
    assign in_chan_dep_vld_vec_42[0] = dep_chan_vld_41_42;
    assign in_chan_dep_data_vec_42[59 : 0] = dep_chan_data_41_42;
    assign token_in_vec_42[0] = token_41_42;
    assign in_chan_dep_vld_vec_42[1] = dep_chan_vld_43_42;
    assign in_chan_dep_data_vec_42[119 : 60] = dep_chan_data_43_42;
    assign token_in_vec_42[1] = token_43_42;
    assign in_chan_dep_vld_vec_42[2] = dep_chan_vld_44_42;
    assign in_chan_dep_data_vec_42[179 : 120] = dep_chan_data_44_42;
    assign token_in_vec_42[2] = token_44_42;
    assign dep_chan_vld_42_41 = out_chan_dep_vld_vec_42[0];
    assign dep_chan_data_42_41 = out_chan_dep_data_42;
    assign token_42_41 = token_out_vec_42[0];
    assign dep_chan_vld_42_44 = out_chan_dep_vld_vec_42[1];
    assign dep_chan_data_42_44 = out_chan_dep_data_42;
    assign token_42_44 = token_out_vec_42[1];
    assign dep_chan_vld_42_43 = out_chan_dep_vld_vec_42[2];
    assign dep_chan_data_42_43 = out_chan_dep_data_42;
    assign token_42_43 = token_out_vec_42[2];

    // Process: finalize_ipv4_checksum_32_U0
    toe_top_hls_deadlock_detect_unit #(60, 43, 2, 2) toe_top_hls_deadlock_detect_unit_43 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_43),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_43),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_43),
        .token_in_vec(token_in_vec_43),
        .dl_detect_in(dl_detect_out),
        .origin(origin[43]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_43),
        .out_chan_dep_data(out_chan_dep_data_43),
        .token_out_vec(token_out_vec_43),
        .dl_detect_out(dl_in_vec[43]));

    assign proc_43_data_FIFO_blk[0] = 1'b0 | (~finalize_ipv4_checksum_32_U0.txEng_subChecksumsFifo_blk_n);
    assign proc_43_data_PIPO_blk[0] = 1'b0;
    assign proc_43_start_FIFO_blk[0] = 1'b0;
    assign proc_43_TLF_FIFO_blk[0] = 1'b0;
    assign proc_43_input_sync_blk[0] = 1'b0;
    assign proc_43_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_43[0] = dl_detect_out ? proc_dep_vld_vec_43_reg[0] : (proc_43_data_FIFO_blk[0] | proc_43_data_PIPO_blk[0] | proc_43_start_FIFO_blk[0] | proc_43_TLF_FIFO_blk[0] | proc_43_input_sync_blk[0] | proc_43_output_sync_blk[0]);
    assign proc_43_data_FIFO_blk[1] = 1'b0 | (~finalize_ipv4_checksum_32_U0.txEng_tcpChecksumFifo_blk_n);
    assign proc_43_data_PIPO_blk[1] = 1'b0;
    assign proc_43_start_FIFO_blk[1] = 1'b0;
    assign proc_43_TLF_FIFO_blk[1] = 1'b0;
    assign proc_43_input_sync_blk[1] = 1'b0;
    assign proc_43_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_43[1] = dl_detect_out ? proc_dep_vld_vec_43_reg[1] : (proc_43_data_FIFO_blk[1] | proc_43_data_PIPO_blk[1] | proc_43_start_FIFO_blk[1] | proc_43_TLF_FIFO_blk[1] | proc_43_input_sync_blk[1] | proc_43_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_43_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_43_reg <= proc_dep_vld_vec_43;
        end
    end
    assign in_chan_dep_vld_vec_43[0] = dep_chan_vld_42_43;
    assign in_chan_dep_data_vec_43[59 : 0] = dep_chan_data_42_43;
    assign token_in_vec_43[0] = token_42_43;
    assign in_chan_dep_vld_vec_43[1] = dep_chan_vld_46_43;
    assign in_chan_dep_data_vec_43[119 : 60] = dep_chan_data_46_43;
    assign token_in_vec_43[1] = token_46_43;
    assign dep_chan_vld_43_42 = out_chan_dep_vld_vec_43[0];
    assign dep_chan_data_43_42 = out_chan_dep_data_43;
    assign token_43_42 = token_out_vec_43[0];
    assign dep_chan_vld_43_46 = out_chan_dep_vld_vec_43[1];
    assign dep_chan_data_43_46 = out_chan_dep_data_43;
    assign token_43_46 = token_out_vec_43[1];

    // Process: remove_pseudo_header_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 44, 2, 2) toe_top_hls_deadlock_detect_unit_44 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_44),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_44),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_44),
        .token_in_vec(token_in_vec_44),
        .dl_detect_in(dl_detect_out),
        .origin(origin[44]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_44),
        .out_chan_dep_data(out_chan_dep_data_44),
        .token_out_vec(token_out_vec_44),
        .dl_detect_out(dl_in_vec[44]));

    assign proc_44_data_FIFO_blk[0] = 1'b0 | (~remove_pseudo_header_512_U0.txEng_tcpPkgBuffer2_blk_n);
    assign proc_44_data_PIPO_blk[0] = 1'b0;
    assign proc_44_start_FIFO_blk[0] = 1'b0;
    assign proc_44_TLF_FIFO_blk[0] = 1'b0;
    assign proc_44_input_sync_blk[0] = 1'b0;
    assign proc_44_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_44[0] = dl_detect_out ? proc_dep_vld_vec_44_reg[0] : (proc_44_data_FIFO_blk[0] | proc_44_data_PIPO_blk[0] | proc_44_start_FIFO_blk[0] | proc_44_TLF_FIFO_blk[0] | proc_44_input_sync_blk[0] | proc_44_output_sync_blk[0]);
    assign proc_44_data_FIFO_blk[1] = 1'b0 | (~remove_pseudo_header_512_U0.txEng_tcpPkgBuffer3_blk_n);
    assign proc_44_data_PIPO_blk[1] = 1'b0;
    assign proc_44_start_FIFO_blk[1] = 1'b0;
    assign proc_44_TLF_FIFO_blk[1] = 1'b0;
    assign proc_44_input_sync_blk[1] = 1'b0;
    assign proc_44_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_44[1] = dl_detect_out ? proc_dep_vld_vec_44_reg[1] : (proc_44_data_FIFO_blk[1] | proc_44_data_PIPO_blk[1] | proc_44_start_FIFO_blk[1] | proc_44_TLF_FIFO_blk[1] | proc_44_input_sync_blk[1] | proc_44_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_44_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_44_reg <= proc_dep_vld_vec_44;
        end
    end
    assign in_chan_dep_vld_vec_44[0] = dep_chan_vld_42_44;
    assign in_chan_dep_data_vec_44[59 : 0] = dep_chan_data_42_44;
    assign token_in_vec_44[0] = token_42_44;
    assign in_chan_dep_vld_vec_44[1] = dep_chan_vld_45_44;
    assign in_chan_dep_data_vec_44[119 : 60] = dep_chan_data_45_44;
    assign token_in_vec_44[1] = token_45_44;
    assign dep_chan_vld_44_42 = out_chan_dep_vld_vec_44[0];
    assign dep_chan_data_44_42 = out_chan_dep_data_44;
    assign token_44_42 = token_out_vec_44[0];
    assign dep_chan_vld_44_45 = out_chan_dep_vld_vec_44[1];
    assign dep_chan_data_44_45 = out_chan_dep_data_44;
    assign token_44_45 = token_out_vec_44[1];

    // Process: rshiftWordByOctet_net_axis_512_512_53_U0
    toe_top_hls_deadlock_detect_unit #(60, 45, 2, 2) toe_top_hls_deadlock_detect_unit_45 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_45),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_45),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_45),
        .token_in_vec(token_in_vec_45),
        .dl_detect_in(dl_detect_out),
        .origin(origin[45]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_45),
        .out_chan_dep_data(out_chan_dep_data_45),
        .token_out_vec(token_out_vec_45),
        .dl_detect_out(dl_in_vec[45]));

    assign proc_45_data_FIFO_blk[0] = 1'b0 | (~rshiftWordByOctet_net_axis_512_512_53_U0.txEng_tcpPkgBuffer3_blk_n);
    assign proc_45_data_PIPO_blk[0] = 1'b0;
    assign proc_45_start_FIFO_blk[0] = 1'b0;
    assign proc_45_TLF_FIFO_blk[0] = 1'b0;
    assign proc_45_input_sync_blk[0] = 1'b0;
    assign proc_45_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_45[0] = dl_detect_out ? proc_dep_vld_vec_45_reg[0] : (proc_45_data_FIFO_blk[0] | proc_45_data_PIPO_blk[0] | proc_45_start_FIFO_blk[0] | proc_45_TLF_FIFO_blk[0] | proc_45_input_sync_blk[0] | proc_45_output_sync_blk[0]);
    assign proc_45_data_FIFO_blk[1] = 1'b0 | (~rshiftWordByOctet_net_axis_512_512_53_U0.txEng_tcpPkgBuffer4_blk_n);
    assign proc_45_data_PIPO_blk[1] = 1'b0;
    assign proc_45_start_FIFO_blk[1] = 1'b0;
    assign proc_45_TLF_FIFO_blk[1] = 1'b0;
    assign proc_45_input_sync_blk[1] = 1'b0;
    assign proc_45_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_45[1] = dl_detect_out ? proc_dep_vld_vec_45_reg[1] : (proc_45_data_FIFO_blk[1] | proc_45_data_PIPO_blk[1] | proc_45_start_FIFO_blk[1] | proc_45_TLF_FIFO_blk[1] | proc_45_input_sync_blk[1] | proc_45_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_45_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_45_reg <= proc_dep_vld_vec_45;
        end
    end
    assign in_chan_dep_vld_vec_45[0] = dep_chan_vld_44_45;
    assign in_chan_dep_data_vec_45[59 : 0] = dep_chan_data_44_45;
    assign token_in_vec_45[0] = token_44_45;
    assign in_chan_dep_vld_vec_45[1] = dep_chan_vld_46_45;
    assign in_chan_dep_data_vec_45[119 : 60] = dep_chan_data_46_45;
    assign token_in_vec_45[1] = token_46_45;
    assign dep_chan_vld_45_44 = out_chan_dep_vld_vec_45[0];
    assign dep_chan_data_45_44 = out_chan_dep_data_45;
    assign token_45_44 = token_out_vec_45[0];
    assign dep_chan_vld_45_46 = out_chan_dep_vld_vec_45[1];
    assign dep_chan_data_45_46 = out_chan_dep_data_45;
    assign token_45_46 = token_out_vec_45[1];

    // Process: insert_checksum_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 46, 3, 3) toe_top_hls_deadlock_detect_unit_46 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_46),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_46),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_46),
        .token_in_vec(token_in_vec_46),
        .dl_detect_in(dl_detect_out),
        .origin(origin[46]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_46),
        .out_chan_dep_data(out_chan_dep_data_46),
        .token_out_vec(token_out_vec_46),
        .dl_detect_out(dl_in_vec[46]));

    assign proc_46_data_FIFO_blk[0] = 1'b0 | (~insert_checksum_512_U0.txEng_tcpChecksumFifo_blk_n);
    assign proc_46_data_PIPO_blk[0] = 1'b0;
    assign proc_46_start_FIFO_blk[0] = 1'b0;
    assign proc_46_TLF_FIFO_blk[0] = 1'b0;
    assign proc_46_input_sync_blk[0] = 1'b0;
    assign proc_46_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_46[0] = dl_detect_out ? proc_dep_vld_vec_46_reg[0] : (proc_46_data_FIFO_blk[0] | proc_46_data_PIPO_blk[0] | proc_46_start_FIFO_blk[0] | proc_46_TLF_FIFO_blk[0] | proc_46_input_sync_blk[0] | proc_46_output_sync_blk[0]);
    assign proc_46_data_FIFO_blk[1] = 1'b0 | (~insert_checksum_512_U0.txEng_tcpPkgBuffer4_blk_n);
    assign proc_46_data_PIPO_blk[1] = 1'b0;
    assign proc_46_start_FIFO_blk[1] = 1'b0;
    assign proc_46_TLF_FIFO_blk[1] = 1'b0;
    assign proc_46_input_sync_blk[1] = 1'b0;
    assign proc_46_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_46[1] = dl_detect_out ? proc_dep_vld_vec_46_reg[1] : (proc_46_data_FIFO_blk[1] | proc_46_data_PIPO_blk[1] | proc_46_start_FIFO_blk[1] | proc_46_TLF_FIFO_blk[1] | proc_46_input_sync_blk[1] | proc_46_output_sync_blk[1]);
    assign proc_46_data_FIFO_blk[2] = 1'b0 | (~insert_checksum_512_U0.txEng_tcpPkgBuffer5_blk_n);
    assign proc_46_data_PIPO_blk[2] = 1'b0;
    assign proc_46_start_FIFO_blk[2] = 1'b0;
    assign proc_46_TLF_FIFO_blk[2] = 1'b0;
    assign proc_46_input_sync_blk[2] = 1'b0;
    assign proc_46_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_46[2] = dl_detect_out ? proc_dep_vld_vec_46_reg[2] : (proc_46_data_FIFO_blk[2] | proc_46_data_PIPO_blk[2] | proc_46_start_FIFO_blk[2] | proc_46_TLF_FIFO_blk[2] | proc_46_input_sync_blk[2] | proc_46_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_46_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_46_reg <= proc_dep_vld_vec_46;
        end
    end
    assign in_chan_dep_vld_vec_46[0] = dep_chan_vld_43_46;
    assign in_chan_dep_data_vec_46[59 : 0] = dep_chan_data_43_46;
    assign token_in_vec_46[0] = token_43_46;
    assign in_chan_dep_vld_vec_46[1] = dep_chan_vld_45_46;
    assign in_chan_dep_data_vec_46[119 : 60] = dep_chan_data_45_46;
    assign token_in_vec_46[1] = token_45_46;
    assign in_chan_dep_vld_vec_46[2] = dep_chan_vld_47_46;
    assign in_chan_dep_data_vec_46[179 : 120] = dep_chan_data_47_46;
    assign token_in_vec_46[2] = token_47_46;
    assign dep_chan_vld_46_43 = out_chan_dep_vld_vec_46[0];
    assign dep_chan_data_46_43 = out_chan_dep_data_46;
    assign token_46_43 = token_out_vec_46[0];
    assign dep_chan_vld_46_45 = out_chan_dep_vld_vec_46[1];
    assign dep_chan_data_46_45 = out_chan_dep_data_46;
    assign token_46_45 = token_out_vec_46[1];
    assign dep_chan_vld_46_47 = out_chan_dep_vld_vec_46[2];
    assign dep_chan_data_46_47 = out_chan_dep_data_46;
    assign token_46_47 = token_out_vec_46[2];

    // Process: lshiftWordByOctet_512_52_U0
    toe_top_hls_deadlock_detect_unit #(60, 47, 2, 2) toe_top_hls_deadlock_detect_unit_47 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_47),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_47),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_47),
        .token_in_vec(token_in_vec_47),
        .dl_detect_in(dl_detect_out),
        .origin(origin[47]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_47),
        .out_chan_dep_data(out_chan_dep_data_47),
        .token_out_vec(token_out_vec_47),
        .dl_detect_out(dl_in_vec[47]));

    assign proc_47_data_FIFO_blk[0] = 1'b0 | (~lshiftWordByOctet_512_52_U0.txEng_tcpPkgBuffer6_blk_n);
    assign proc_47_data_PIPO_blk[0] = 1'b0;
    assign proc_47_start_FIFO_blk[0] = 1'b0;
    assign proc_47_TLF_FIFO_blk[0] = 1'b0;
    assign proc_47_input_sync_blk[0] = 1'b0;
    assign proc_47_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_47[0] = dl_detect_out ? proc_dep_vld_vec_47_reg[0] : (proc_47_data_FIFO_blk[0] | proc_47_data_PIPO_blk[0] | proc_47_start_FIFO_blk[0] | proc_47_TLF_FIFO_blk[0] | proc_47_input_sync_blk[0] | proc_47_output_sync_blk[0]);
    assign proc_47_data_FIFO_blk[1] = 1'b0 | (~lshiftWordByOctet_512_52_U0.txEng_tcpPkgBuffer5_blk_n);
    assign proc_47_data_PIPO_blk[1] = 1'b0;
    assign proc_47_start_FIFO_blk[1] = 1'b0;
    assign proc_47_TLF_FIFO_blk[1] = 1'b0;
    assign proc_47_input_sync_blk[1] = 1'b0;
    assign proc_47_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_47[1] = dl_detect_out ? proc_dep_vld_vec_47_reg[1] : (proc_47_data_FIFO_blk[1] | proc_47_data_PIPO_blk[1] | proc_47_start_FIFO_blk[1] | proc_47_TLF_FIFO_blk[1] | proc_47_input_sync_blk[1] | proc_47_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_47_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_47_reg <= proc_dep_vld_vec_47;
        end
    end
    assign in_chan_dep_vld_vec_47[0] = dep_chan_vld_46_47;
    assign in_chan_dep_data_vec_47[59 : 0] = dep_chan_data_46_47;
    assign token_in_vec_47[0] = token_46_47;
    assign in_chan_dep_vld_vec_47[1] = dep_chan_vld_48_47;
    assign in_chan_dep_data_vec_47[119 : 60] = dep_chan_data_48_47;
    assign token_in_vec_47[1] = token_48_47;
    assign dep_chan_vld_47_48 = out_chan_dep_vld_vec_47[0];
    assign dep_chan_data_47_48 = out_chan_dep_data_47;
    assign token_47_48 = token_out_vec_47[0];
    assign dep_chan_vld_47_46 = out_chan_dep_vld_vec_47[1];
    assign dep_chan_data_47_46 = out_chan_dep_data_47;
    assign token_47_46 = token_out_vec_47[1];

    // Process: generate_ipv4_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 48, 3, 3) toe_top_hls_deadlock_detect_unit_48 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_48),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_48),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_48),
        .token_in_vec(token_in_vec_48),
        .dl_detect_in(dl_detect_out),
        .origin(origin[48]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_48),
        .out_chan_dep_data(out_chan_dep_data_48),
        .token_out_vec(token_out_vec_48),
        .dl_detect_out(dl_in_vec[48]));

    assign proc_48_data_FIFO_blk[0] = 1'b0 | (~generate_ipv4_512_U0.txEng_ipMetaFifo_blk_n);
    assign proc_48_data_PIPO_blk[0] = 1'b0;
    assign proc_48_start_FIFO_blk[0] = 1'b0;
    assign proc_48_TLF_FIFO_blk[0] = 1'b0;
    assign proc_48_input_sync_blk[0] = 1'b0;
    assign proc_48_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_48[0] = dl_detect_out ? proc_dep_vld_vec_48_reg[0] : (proc_48_data_FIFO_blk[0] | proc_48_data_PIPO_blk[0] | proc_48_start_FIFO_blk[0] | proc_48_TLF_FIFO_blk[0] | proc_48_input_sync_blk[0] | proc_48_output_sync_blk[0]);
    assign proc_48_data_FIFO_blk[1] = 1'b0 | (~generate_ipv4_512_U0.txEng_ipTupleFifo_blk_n);
    assign proc_48_data_PIPO_blk[1] = 1'b0;
    assign proc_48_start_FIFO_blk[1] = 1'b0;
    assign proc_48_TLF_FIFO_blk[1] = 1'b0;
    assign proc_48_input_sync_blk[1] = 1'b0;
    assign proc_48_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_48[1] = dl_detect_out ? proc_dep_vld_vec_48_reg[1] : (proc_48_data_FIFO_blk[1] | proc_48_data_PIPO_blk[1] | proc_48_start_FIFO_blk[1] | proc_48_TLF_FIFO_blk[1] | proc_48_input_sync_blk[1] | proc_48_output_sync_blk[1]);
    assign proc_48_data_FIFO_blk[2] = 1'b0 | (~generate_ipv4_512_U0.txEng_tcpPkgBuffer6_blk_n);
    assign proc_48_data_PIPO_blk[2] = 1'b0;
    assign proc_48_start_FIFO_blk[2] = 1'b0;
    assign proc_48_TLF_FIFO_blk[2] = 1'b0;
    assign proc_48_input_sync_blk[2] = 1'b0;
    assign proc_48_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_48[2] = dl_detect_out ? proc_dep_vld_vec_48_reg[2] : (proc_48_data_FIFO_blk[2] | proc_48_data_PIPO_blk[2] | proc_48_start_FIFO_blk[2] | proc_48_TLF_FIFO_blk[2] | proc_48_input_sync_blk[2] | proc_48_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_48_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_48_reg <= proc_dep_vld_vec_48;
        end
    end
    assign in_chan_dep_vld_vec_48[0] = dep_chan_vld_35_48;
    assign in_chan_dep_data_vec_48[59 : 0] = dep_chan_data_35_48;
    assign token_in_vec_48[0] = token_35_48;
    assign in_chan_dep_vld_vec_48[1] = dep_chan_vld_37_48;
    assign in_chan_dep_data_vec_48[119 : 60] = dep_chan_data_37_48;
    assign token_in_vec_48[1] = token_37_48;
    assign in_chan_dep_vld_vec_48[2] = dep_chan_vld_47_48;
    assign in_chan_dep_data_vec_48[179 : 120] = dep_chan_data_47_48;
    assign token_in_vec_48[2] = token_47_48;
    assign dep_chan_vld_48_35 = out_chan_dep_vld_vec_48[0];
    assign dep_chan_data_48_35 = out_chan_dep_data_48;
    assign token_48_35 = token_out_vec_48[0];
    assign dep_chan_vld_48_37 = out_chan_dep_vld_vec_48[1];
    assign dep_chan_data_48_37 = out_chan_dep_data_48;
    assign token_48_37 = token_out_vec_48[1];
    assign dep_chan_vld_48_47 = out_chan_dep_vld_vec_48[2];
    assign dep_chan_data_48_47 = out_chan_dep_data_48;
    assign token_48_47 = token_out_vec_48[2];

    // Process: rx_app_stream_if_U0
    toe_top_hls_deadlock_detect_unit #(60, 49, 2, 2) toe_top_hls_deadlock_detect_unit_49 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_49),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_49),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_49),
        .token_in_vec(token_in_vec_49),
        .dl_detect_in(dl_detect_out),
        .origin(origin[49]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_49),
        .out_chan_dep_data(out_chan_dep_data_49),
        .token_out_vec(token_out_vec_49),
        .dl_detect_out(dl_in_vec[49]));

    assign proc_49_data_FIFO_blk[0] = 1'b0 | (~rx_app_stream_if_U0.rxApp2rxSar_upd_req_blk_n) | (~rx_app_stream_if_U0.rxSar2rxApp_upd_rsp_blk_n);
    assign proc_49_data_PIPO_blk[0] = 1'b0;
    assign proc_49_start_FIFO_blk[0] = 1'b0;
    assign proc_49_TLF_FIFO_blk[0] = 1'b0;
    assign proc_49_input_sync_blk[0] = 1'b0;
    assign proc_49_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_49[0] = dl_detect_out ? proc_dep_vld_vec_49_reg[0] : (proc_49_data_FIFO_blk[0] | proc_49_data_PIPO_blk[0] | proc_49_start_FIFO_blk[0] | proc_49_TLF_FIFO_blk[0] | proc_49_input_sync_blk[0] | proc_49_output_sync_blk[0]);
    assign proc_49_data_FIFO_blk[1] = 1'b0 | (~rx_app_stream_if_U0.rxBufferReadCmd_blk_n);
    assign proc_49_data_PIPO_blk[1] = 1'b0;
    assign proc_49_start_FIFO_blk[1] = 1'b0;
    assign proc_49_TLF_FIFO_blk[1] = 1'b0;
    assign proc_49_input_sync_blk[1] = 1'b0;
    assign proc_49_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_49[1] = dl_detect_out ? proc_dep_vld_vec_49_reg[1] : (proc_49_data_FIFO_blk[1] | proc_49_data_PIPO_blk[1] | proc_49_start_FIFO_blk[1] | proc_49_TLF_FIFO_blk[1] | proc_49_input_sync_blk[1] | proc_49_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_49_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_49_reg <= proc_dep_vld_vec_49;
        end
    end
    assign in_chan_dep_vld_vec_49[0] = dep_chan_vld_6_49;
    assign in_chan_dep_data_vec_49[59 : 0] = dep_chan_data_6_49;
    assign token_in_vec_49[0] = token_6_49;
    assign in_chan_dep_vld_vec_49[1] = dep_chan_vld_50_49;
    assign in_chan_dep_data_vec_49[119 : 60] = dep_chan_data_50_49;
    assign token_in_vec_49[1] = token_50_49;
    assign dep_chan_vld_49_6 = out_chan_dep_vld_vec_49[0];
    assign dep_chan_data_49_6 = out_chan_dep_data_49;
    assign token_49_6 = token_out_vec_49[0];
    assign dep_chan_vld_49_50 = out_chan_dep_vld_vec_49[1];
    assign dep_chan_data_49_50 = out_chan_dep_data_49;
    assign token_49_50 = token_out_vec_49[1];

    // Process: rxAppMemDataRead_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 50, 1, 1) toe_top_hls_deadlock_detect_unit_50 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_50),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_50),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_50),
        .token_in_vec(token_in_vec_50),
        .dl_detect_in(dl_detect_out),
        .origin(origin[50]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_50),
        .out_chan_dep_data(out_chan_dep_data_50),
        .token_out_vec(token_out_vec_50),
        .dl_detect_out(dl_in_vec[50]));

    assign proc_50_data_FIFO_blk[0] = 1'b0 | (~rxAppMemDataRead_512_U0.rxBufferReadCmd_blk_n);
    assign proc_50_data_PIPO_blk[0] = 1'b0;
    assign proc_50_start_FIFO_blk[0] = 1'b0;
    assign proc_50_TLF_FIFO_blk[0] = 1'b0;
    assign proc_50_input_sync_blk[0] = 1'b0;
    assign proc_50_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_50[0] = dl_detect_out ? proc_dep_vld_vec_50_reg[0] : (proc_50_data_FIFO_blk[0] | proc_50_data_PIPO_blk[0] | proc_50_start_FIFO_blk[0] | proc_50_TLF_FIFO_blk[0] | proc_50_input_sync_blk[0] | proc_50_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_50_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_50_reg <= proc_dep_vld_vec_50;
        end
    end
    assign in_chan_dep_vld_vec_50[0] = dep_chan_vld_49_50;
    assign in_chan_dep_data_vec_50[59 : 0] = dep_chan_data_49_50;
    assign token_in_vec_50[0] = token_49_50;
    assign dep_chan_vld_50_49 = out_chan_dep_vld_vec_50[0];
    assign dep_chan_data_50_49 = out_chan_dep_data_50;
    assign token_50_49 = token_out_vec_50[0];

    // Process: rx_app_if_U0
    toe_top_hls_deadlock_detect_unit #(60, 51, 1, 1) toe_top_hls_deadlock_detect_unit_51 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_51),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_51),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_51),
        .token_in_vec(token_in_vec_51),
        .dl_detect_in(dl_detect_out),
        .origin(origin[51]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_51),
        .out_chan_dep_data(out_chan_dep_data_51),
        .token_out_vec(token_out_vec_51),
        .dl_detect_out(dl_in_vec[51]));

    assign proc_51_data_FIFO_blk[0] = 1'b0 | (~rx_app_if_U0.rxApp2portTable_listen_req_blk_n) | (~rx_app_if_U0.portTable2rxApp_listen_rsp_blk_n);
    assign proc_51_data_PIPO_blk[0] = 1'b0;
    assign proc_51_start_FIFO_blk[0] = 1'b0;
    assign proc_51_TLF_FIFO_blk[0] = 1'b0;
    assign proc_51_input_sync_blk[0] = 1'b0;
    assign proc_51_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_51[0] = dl_detect_out ? proc_dep_vld_vec_51_reg[0] : (proc_51_data_FIFO_blk[0] | proc_51_data_PIPO_blk[0] | proc_51_start_FIFO_blk[0] | proc_51_TLF_FIFO_blk[0] | proc_51_input_sync_blk[0] | proc_51_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_51_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_51_reg <= proc_dep_vld_vec_51;
        end
    end
    assign in_chan_dep_vld_vec_51[0] = dep_chan_vld_8_51;
    assign in_chan_dep_data_vec_51[59 : 0] = dep_chan_data_8_51;
    assign token_in_vec_51[0] = token_8_51;
    assign dep_chan_vld_51_8 = out_chan_dep_vld_vec_51[0];
    assign dep_chan_data_51_8 = out_chan_dep_data_51;
    assign token_51_8 = token_out_vec_51[0];

    // Process: stream_merger_appNotification_U0
    toe_top_hls_deadlock_detect_unit #(60, 52, 2, 2) toe_top_hls_deadlock_detect_unit_52 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_52),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_52),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_52),
        .token_in_vec(token_in_vec_52),
        .dl_detect_in(dl_detect_out),
        .origin(origin[52]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_52),
        .out_chan_dep_data(out_chan_dep_data_52),
        .token_out_vec(token_out_vec_52),
        .dl_detect_out(dl_in_vec[52]));

    assign proc_52_data_FIFO_blk[0] = 1'b0 | (~stream_merger_appNotification_U0.rxEng2rxApp_notification_blk_n);
    assign proc_52_data_PIPO_blk[0] = 1'b0;
    assign proc_52_start_FIFO_blk[0] = 1'b0;
    assign proc_52_TLF_FIFO_blk[0] = 1'b0;
    assign proc_52_input_sync_blk[0] = 1'b0;
    assign proc_52_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_52[0] = dl_detect_out ? proc_dep_vld_vec_52_reg[0] : (proc_52_data_FIFO_blk[0] | proc_52_data_PIPO_blk[0] | proc_52_start_FIFO_blk[0] | proc_52_TLF_FIFO_blk[0] | proc_52_input_sync_blk[0] | proc_52_output_sync_blk[0]);
    assign proc_52_data_FIFO_blk[1] = 1'b0 | (~stream_merger_appNotification_U0.timer2rxApp_notification_blk_n);
    assign proc_52_data_PIPO_blk[1] = 1'b0;
    assign proc_52_start_FIFO_blk[1] = 1'b0;
    assign proc_52_TLF_FIFO_blk[1] = 1'b0;
    assign proc_52_input_sync_blk[1] = 1'b0;
    assign proc_52_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_52[1] = dl_detect_out ? proc_dep_vld_vec_52_reg[1] : (proc_52_data_FIFO_blk[1] | proc_52_data_PIPO_blk[1] | proc_52_start_FIFO_blk[1] | proc_52_TLF_FIFO_blk[1] | proc_52_input_sync_blk[1] | proc_52_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_52_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_52_reg <= proc_dep_vld_vec_52;
        end
    end
    assign in_chan_dep_vld_vec_52[0] = dep_chan_vld_13_52;
    assign in_chan_dep_data_vec_52[59 : 0] = dep_chan_data_13_52;
    assign token_in_vec_52[0] = token_13_52;
    assign in_chan_dep_vld_vec_52[1] = dep_chan_vld_32_52;
    assign in_chan_dep_data_vec_52[119 : 60] = dep_chan_data_32_52;
    assign token_in_vec_52[1] = token_32_52;
    assign dep_chan_vld_52_32 = out_chan_dep_vld_vec_52[0];
    assign dep_chan_data_52_32 = out_chan_dep_data_52;
    assign token_52_32 = token_out_vec_52[0];
    assign dep_chan_vld_52_13 = out_chan_dep_vld_vec_52[1];
    assign dep_chan_data_52_13 = out_chan_dep_data_52;
    assign token_52_13 = token_out_vec_52[1];

    // Process: txEventMerger_U0
    toe_top_hls_deadlock_detect_unit #(60, 53, 4, 4) toe_top_hls_deadlock_detect_unit_53 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_53),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_53),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_53),
        .token_in_vec(token_in_vec_53),
        .dl_detect_in(dl_detect_out),
        .origin(origin[53]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_53),
        .out_chan_dep_data(out_chan_dep_data_53),
        .token_out_vec(token_out_vec_53),
        .dl_detect_out(dl_in_vec[53]));

    assign proc_53_data_FIFO_blk[0] = 1'b0 | (~txEventMerger_U0.txApp2eventEng_mergeEvent_blk_n);
    assign proc_53_data_PIPO_blk[0] = 1'b0;
    assign proc_53_start_FIFO_blk[0] = 1'b0;
    assign proc_53_TLF_FIFO_blk[0] = 1'b0;
    assign proc_53_input_sync_blk[0] = 1'b0;
    assign proc_53_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_53[0] = dl_detect_out ? proc_dep_vld_vec_53_reg[0] : (proc_53_data_FIFO_blk[0] | proc_53_data_PIPO_blk[0] | proc_53_start_FIFO_blk[0] | proc_53_TLF_FIFO_blk[0] | proc_53_input_sync_blk[0] | proc_53_output_sync_blk[0]);
    assign proc_53_data_FIFO_blk[1] = 1'b0 | (~txEventMerger_U0.txApp2eventEng_setEvent_blk_n);
    assign proc_53_data_PIPO_blk[1] = 1'b0;
    assign proc_53_start_FIFO_blk[1] = 1'b0;
    assign proc_53_TLF_FIFO_blk[1] = 1'b0;
    assign proc_53_input_sync_blk[1] = 1'b0;
    assign proc_53_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_53[1] = dl_detect_out ? proc_dep_vld_vec_53_reg[1] : (proc_53_data_FIFO_blk[1] | proc_53_data_PIPO_blk[1] | proc_53_start_FIFO_blk[1] | proc_53_TLF_FIFO_blk[1] | proc_53_input_sync_blk[1] | proc_53_output_sync_blk[1]);
    assign proc_53_data_FIFO_blk[2] = 1'b0 | (~txEventMerger_U0.txAppStream2event_mergeEvent_blk_n);
    assign proc_53_data_PIPO_blk[2] = 1'b0;
    assign proc_53_start_FIFO_blk[2] = 1'b0;
    assign proc_53_TLF_FIFO_blk[2] = 1'b0;
    assign proc_53_input_sync_blk[2] = 1'b0;
    assign proc_53_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_53[2] = dl_detect_out ? proc_dep_vld_vec_53_reg[2] : (proc_53_data_FIFO_blk[2] | proc_53_data_PIPO_blk[2] | proc_53_start_FIFO_blk[2] | proc_53_TLF_FIFO_blk[2] | proc_53_input_sync_blk[2] | proc_53_output_sync_blk[2]);
    assign proc_53_data_FIFO_blk[3] = 1'b0 | (~txEventMerger_U0.txApp_txEventCache_blk_n);
    assign proc_53_data_PIPO_blk[3] = 1'b0;
    assign proc_53_start_FIFO_blk[3] = 1'b0;
    assign proc_53_TLF_FIFO_blk[3] = 1'b0;
    assign proc_53_input_sync_blk[3] = 1'b0;
    assign proc_53_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_53[3] = dl_detect_out ? proc_dep_vld_vec_53_reg[3] : (proc_53_data_FIFO_blk[3] | proc_53_data_PIPO_blk[3] | proc_53_start_FIFO_blk[3] | proc_53_TLF_FIFO_blk[3] | proc_53_input_sync_blk[3] | proc_53_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_53_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_53_reg <= proc_dep_vld_vec_53;
        end
    end
    assign in_chan_dep_vld_vec_53[0] = dep_chan_vld_17_53;
    assign in_chan_dep_data_vec_53[59 : 0] = dep_chan_data_17_53;
    assign token_in_vec_53[0] = token_17_53;
    assign in_chan_dep_vld_vec_53[1] = dep_chan_vld_54_53;
    assign in_chan_dep_data_vec_53[119 : 60] = dep_chan_data_54_53;
    assign token_in_vec_53[1] = token_54_53;
    assign in_chan_dep_vld_vec_53[2] = dep_chan_vld_55_53;
    assign in_chan_dep_data_vec_53[179 : 120] = dep_chan_data_55_53;
    assign token_in_vec_53[2] = token_55_53;
    assign in_chan_dep_vld_vec_53[3] = dep_chan_vld_58_53;
    assign in_chan_dep_data_vec_53[239 : 180] = dep_chan_data_58_53;
    assign token_in_vec_53[3] = token_58_53;
    assign dep_chan_vld_53_58 = out_chan_dep_vld_vec_53[0];
    assign dep_chan_data_53_58 = out_chan_dep_data_53;
    assign token_53_58 = token_out_vec_53[0];
    assign dep_chan_vld_53_17 = out_chan_dep_vld_vec_53[1];
    assign dep_chan_data_53_17 = out_chan_dep_data_53;
    assign token_53_17 = token_out_vec_53[1];
    assign dep_chan_vld_53_55 = out_chan_dep_vld_vec_53[2];
    assign dep_chan_data_53_55 = out_chan_dep_data_53;
    assign token_53_55 = token_out_vec_53[2];
    assign dep_chan_vld_53_54 = out_chan_dep_vld_vec_53[3];
    assign dep_chan_data_53_54 = out_chan_dep_data_53;
    assign token_53_54 = token_out_vec_53[3];

    // Process: txAppStatusHandler_U0
    toe_top_hls_deadlock_detect_unit #(60, 54, 2, 2) toe_top_hls_deadlock_detect_unit_54 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_54),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_54),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_54),
        .token_in_vec(token_in_vec_54),
        .dl_detect_in(dl_detect_out),
        .origin(origin[54]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_54),
        .out_chan_dep_data(out_chan_dep_data_54),
        .token_out_vec(token_out_vec_54),
        .dl_detect_out(dl_in_vec[54]));

    assign proc_54_data_FIFO_blk[0] = 1'b0 | (~txAppStatusHandler_U0.txApp_txEventCache_blk_n);
    assign proc_54_data_PIPO_blk[0] = 1'b0;
    assign proc_54_start_FIFO_blk[0] = 1'b0;
    assign proc_54_TLF_FIFO_blk[0] = 1'b0;
    assign proc_54_input_sync_blk[0] = 1'b0;
    assign proc_54_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_54[0] = dl_detect_out ? proc_dep_vld_vec_54_reg[0] : (proc_54_data_FIFO_blk[0] | proc_54_data_PIPO_blk[0] | proc_54_start_FIFO_blk[0] | proc_54_TLF_FIFO_blk[0] | proc_54_input_sync_blk[0] | proc_54_output_sync_blk[0]);
    assign proc_54_data_FIFO_blk[1] = 1'b0 | (~txAppStatusHandler_U0.txApp2txSar_push_blk_n);
    assign proc_54_data_PIPO_blk[1] = 1'b0;
    assign proc_54_start_FIFO_blk[1] = 1'b0;
    assign proc_54_TLF_FIFO_blk[1] = 1'b0;
    assign proc_54_input_sync_blk[1] = 1'b0;
    assign proc_54_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_54[1] = dl_detect_out ? proc_dep_vld_vec_54_reg[1] : (proc_54_data_FIFO_blk[1] | proc_54_data_PIPO_blk[1] | proc_54_start_FIFO_blk[1] | proc_54_TLF_FIFO_blk[1] | proc_54_input_sync_blk[1] | proc_54_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_54_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_54_reg <= proc_dep_vld_vec_54;
        end
    end
    assign in_chan_dep_vld_vec_54[0] = dep_chan_vld_7_54;
    assign in_chan_dep_data_vec_54[59 : 0] = dep_chan_data_7_54;
    assign token_in_vec_54[0] = token_7_54;
    assign in_chan_dep_vld_vec_54[1] = dep_chan_vld_53_54;
    assign in_chan_dep_data_vec_54[119 : 60] = dep_chan_data_53_54;
    assign token_in_vec_54[1] = token_53_54;
    assign dep_chan_vld_54_53 = out_chan_dep_vld_vec_54[0];
    assign dep_chan_data_54_53 = out_chan_dep_data_54;
    assign token_54_53 = token_out_vec_54[0];
    assign dep_chan_vld_54_7 = out_chan_dep_vld_vec_54[1];
    assign dep_chan_data_54_7 = out_chan_dep_data_54;
    assign token_54_7 = token_out_vec_54[1];

    // Process: tasi_metaLoader_U0
    toe_top_hls_deadlock_detect_unit #(60, 55, 4, 4) toe_top_hls_deadlock_detect_unit_55 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_55),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_55),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_55),
        .token_in_vec(token_in_vec_55),
        .dl_detect_in(dl_detect_out),
        .origin(origin[55]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_55),
        .out_chan_dep_data(out_chan_dep_data_55),
        .token_out_vec(token_out_vec_55),
        .dl_detect_out(dl_in_vec[55]));

    assign proc_55_data_FIFO_blk[0] = 1'b0 | (~tasi_metaLoader_U0.txApp2stateTable_req_blk_n) | (~tasi_metaLoader_U0.stateTable2txApp_rsp_blk_n);
    assign proc_55_data_PIPO_blk[0] = 1'b0;
    assign proc_55_start_FIFO_blk[0] = 1'b0;
    assign proc_55_TLF_FIFO_blk[0] = 1'b0;
    assign proc_55_input_sync_blk[0] = 1'b0;
    assign proc_55_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_55[0] = dl_detect_out ? proc_dep_vld_vec_55_reg[0] : (proc_55_data_FIFO_blk[0] | proc_55_data_PIPO_blk[0] | proc_55_start_FIFO_blk[0] | proc_55_TLF_FIFO_blk[0] | proc_55_input_sync_blk[0] | proc_55_output_sync_blk[0]);
    assign proc_55_data_FIFO_blk[1] = 1'b0 | (~tasi_metaLoader_U0.txApp2txSar_upd_req_blk_n) | (~tasi_metaLoader_U0.txSar2txApp_upd_rsp_blk_n);
    assign proc_55_data_PIPO_blk[1] = 1'b0;
    assign proc_55_start_FIFO_blk[1] = 1'b0;
    assign proc_55_TLF_FIFO_blk[1] = 1'b0;
    assign proc_55_input_sync_blk[1] = 1'b0;
    assign proc_55_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_55[1] = dl_detect_out ? proc_dep_vld_vec_55_reg[1] : (proc_55_data_FIFO_blk[1] | proc_55_data_PIPO_blk[1] | proc_55_start_FIFO_blk[1] | proc_55_TLF_FIFO_blk[1] | proc_55_input_sync_blk[1] | proc_55_output_sync_blk[1]);
    assign proc_55_data_FIFO_blk[2] = 1'b0 | (~tasi_metaLoader_U0.tasi_meta2pkgPushCmd_blk_n);
    assign proc_55_data_PIPO_blk[2] = 1'b0;
    assign proc_55_start_FIFO_blk[2] = 1'b0;
    assign proc_55_TLF_FIFO_blk[2] = 1'b0;
    assign proc_55_input_sync_blk[2] = 1'b0;
    assign proc_55_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_55[2] = dl_detect_out ? proc_dep_vld_vec_55_reg[2] : (proc_55_data_FIFO_blk[2] | proc_55_data_PIPO_blk[2] | proc_55_start_FIFO_blk[2] | proc_55_TLF_FIFO_blk[2] | proc_55_input_sync_blk[2] | proc_55_output_sync_blk[2]);
    assign proc_55_data_FIFO_blk[3] = 1'b0 | (~tasi_metaLoader_U0.txAppStream2event_mergeEvent_blk_n);
    assign proc_55_data_PIPO_blk[3] = 1'b0;
    assign proc_55_start_FIFO_blk[3] = 1'b0;
    assign proc_55_TLF_FIFO_blk[3] = 1'b0;
    assign proc_55_input_sync_blk[3] = 1'b0;
    assign proc_55_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_55[3] = dl_detect_out ? proc_dep_vld_vec_55_reg[3] : (proc_55_data_FIFO_blk[3] | proc_55_data_PIPO_blk[3] | proc_55_start_FIFO_blk[3] | proc_55_TLF_FIFO_blk[3] | proc_55_input_sync_blk[3] | proc_55_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_55_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_55_reg <= proc_dep_vld_vec_55;
        end
    end
    assign in_chan_dep_vld_vec_55[0] = dep_chan_vld_5_55;
    assign in_chan_dep_data_vec_55[59 : 0] = dep_chan_data_5_55;
    assign token_in_vec_55[0] = token_5_55;
    assign in_chan_dep_vld_vec_55[1] = dep_chan_vld_53_55;
    assign in_chan_dep_data_vec_55[119 : 60] = dep_chan_data_53_55;
    assign token_in_vec_55[1] = token_53_55;
    assign in_chan_dep_vld_vec_55[2] = dep_chan_vld_57_55;
    assign in_chan_dep_data_vec_55[179 : 120] = dep_chan_data_57_55;
    assign token_in_vec_55[2] = token_57_55;
    assign in_chan_dep_vld_vec_55[3] = dep_chan_vld_59_55;
    assign in_chan_dep_data_vec_55[239 : 180] = dep_chan_data_59_55;
    assign token_in_vec_55[3] = token_59_55;
    assign dep_chan_vld_55_5 = out_chan_dep_vld_vec_55[0];
    assign dep_chan_data_55_5 = out_chan_dep_data_55;
    assign token_55_5 = token_out_vec_55[0];
    assign dep_chan_vld_55_59 = out_chan_dep_vld_vec_55[1];
    assign dep_chan_data_55_59 = out_chan_dep_data_55;
    assign token_55_59 = token_out_vec_55[1];
    assign dep_chan_vld_55_57 = out_chan_dep_vld_vec_55[2];
    assign dep_chan_data_55_57 = out_chan_dep_data_55;
    assign token_55_57 = token_out_vec_55[2];
    assign dep_chan_vld_55_53 = out_chan_dep_vld_vec_55[3];
    assign dep_chan_data_55_53 = out_chan_dep_data_55;
    assign token_55_53 = token_out_vec_55[3];

    // Process: toe_duplicate_stream_net_axis_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 56, 2, 2) toe_top_hls_deadlock_detect_unit_56 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_56),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_56),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_56),
        .token_in_vec(token_in_vec_56),
        .dl_detect_in(dl_detect_out),
        .origin(origin[56]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_56),
        .out_chan_dep_data(out_chan_dep_data_56),
        .token_out_vec(token_out_vec_56),
        .dl_detect_out(dl_in_vec[56]));

    assign proc_56_data_FIFO_blk[0] = 1'b0 | (~toe_duplicate_stream_net_axis_512_U0.tasi_dataFifo_blk_n);
    assign proc_56_data_PIPO_blk[0] = 1'b0;
    assign proc_56_start_FIFO_blk[0] = 1'b0;
    assign proc_56_TLF_FIFO_blk[0] = 1'b0;
    assign proc_56_input_sync_blk[0] = 1'b0;
    assign proc_56_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_56[0] = dl_detect_out ? proc_dep_vld_vec_56_reg[0] : (proc_56_data_FIFO_blk[0] | proc_56_data_PIPO_blk[0] | proc_56_start_FIFO_blk[0] | proc_56_TLF_FIFO_blk[0] | proc_56_input_sync_blk[0] | proc_56_output_sync_blk[0]);
    assign proc_56_data_FIFO_blk[1] = 1'b0 | (~toe_duplicate_stream_net_axis_512_U0.txApp2txEng_data_stream_blk_n);
    assign proc_56_data_PIPO_blk[1] = 1'b0;
    assign proc_56_start_FIFO_blk[1] = 1'b0;
    assign proc_56_TLF_FIFO_blk[1] = 1'b0;
    assign proc_56_input_sync_blk[1] = 1'b0;
    assign proc_56_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_56[1] = dl_detect_out ? proc_dep_vld_vec_56_reg[1] : (proc_56_data_FIFO_blk[1] | proc_56_data_PIPO_blk[1] | proc_56_start_FIFO_blk[1] | proc_56_TLF_FIFO_blk[1] | proc_56_input_sync_blk[1] | proc_56_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_56_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_56_reg <= proc_dep_vld_vec_56;
        end
    end
    assign in_chan_dep_vld_vec_56[0] = dep_chan_vld_39_56;
    assign in_chan_dep_data_vec_56[59 : 0] = dep_chan_data_39_56;
    assign token_in_vec_56[0] = token_39_56;
    assign in_chan_dep_vld_vec_56[1] = dep_chan_vld_57_56;
    assign in_chan_dep_data_vec_56[119 : 60] = dep_chan_data_57_56;
    assign token_in_vec_56[1] = token_57_56;
    assign dep_chan_vld_56_57 = out_chan_dep_vld_vec_56[0];
    assign dep_chan_data_56_57 = out_chan_dep_data_56;
    assign token_56_57 = token_out_vec_56[0];
    assign dep_chan_vld_56_39 = out_chan_dep_vld_vec_56[1];
    assign dep_chan_data_56_39 = out_chan_dep_data_56;
    assign token_56_39 = token_out_vec_56[1];

    // Process: tasi_pkg_pusher_512_U0
    toe_top_hls_deadlock_detect_unit #(60, 57, 2, 2) toe_top_hls_deadlock_detect_unit_57 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_57),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_57),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_57),
        .token_in_vec(token_in_vec_57),
        .dl_detect_in(dl_detect_out),
        .origin(origin[57]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_57),
        .out_chan_dep_data(out_chan_dep_data_57),
        .token_out_vec(token_out_vec_57),
        .dl_detect_out(dl_in_vec[57]));

    assign proc_57_data_FIFO_blk[0] = 1'b0 | (~tasi_pkg_pusher_512_U0.tasi_meta2pkgPushCmd_blk_n);
    assign proc_57_data_PIPO_blk[0] = 1'b0;
    assign proc_57_start_FIFO_blk[0] = 1'b0;
    assign proc_57_TLF_FIFO_blk[0] = 1'b0;
    assign proc_57_input_sync_blk[0] = 1'b0;
    assign proc_57_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_57[0] = dl_detect_out ? proc_dep_vld_vec_57_reg[0] : (proc_57_data_FIFO_blk[0] | proc_57_data_PIPO_blk[0] | proc_57_start_FIFO_blk[0] | proc_57_TLF_FIFO_blk[0] | proc_57_input_sync_blk[0] | proc_57_output_sync_blk[0]);
    assign proc_57_data_FIFO_blk[1] = 1'b0 | (~tasi_pkg_pusher_512_U0.tasi_dataFifo_blk_n);
    assign proc_57_data_PIPO_blk[1] = 1'b0;
    assign proc_57_start_FIFO_blk[1] = 1'b0;
    assign proc_57_TLF_FIFO_blk[1] = 1'b0;
    assign proc_57_input_sync_blk[1] = 1'b0;
    assign proc_57_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_57[1] = dl_detect_out ? proc_dep_vld_vec_57_reg[1] : (proc_57_data_FIFO_blk[1] | proc_57_data_PIPO_blk[1] | proc_57_start_FIFO_blk[1] | proc_57_TLF_FIFO_blk[1] | proc_57_input_sync_blk[1] | proc_57_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_57_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_57_reg <= proc_dep_vld_vec_57;
        end
    end
    assign in_chan_dep_vld_vec_57[0] = dep_chan_vld_55_57;
    assign in_chan_dep_data_vec_57[59 : 0] = dep_chan_data_55_57;
    assign token_in_vec_57[0] = token_55_57;
    assign in_chan_dep_vld_vec_57[1] = dep_chan_vld_56_57;
    assign in_chan_dep_data_vec_57[119 : 60] = dep_chan_data_56_57;
    assign token_in_vec_57[1] = token_56_57;
    assign dep_chan_vld_57_55 = out_chan_dep_vld_vec_57[0];
    assign dep_chan_data_57_55 = out_chan_dep_data_57;
    assign token_57_55 = token_out_vec_57[0];
    assign dep_chan_vld_57_56 = out_chan_dep_vld_vec_57[1];
    assign dep_chan_data_57_56 = out_chan_dep_data_57;
    assign token_57_56 = token_out_vec_57[1];

    // Process: tx_app_if_U0
    toe_top_hls_deadlock_detect_unit #(60, 58, 6, 6) toe_top_hls_deadlock_detect_unit_58 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_58),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_58),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_58),
        .token_in_vec(token_in_vec_58),
        .dl_detect_in(dl_detect_out),
        .origin(origin[58]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_58),
        .out_chan_dep_data(out_chan_dep_data_58),
        .token_out_vec(token_out_vec_58),
        .dl_detect_out(dl_in_vec[58]));

    assign proc_58_data_FIFO_blk[0] = 1'b0 | (~tx_app_if_U0.portTable2txApp_port_rsp_blk_n);
    assign proc_58_data_PIPO_blk[0] = 1'b0;
    assign proc_58_start_FIFO_blk[0] = 1'b0;
    assign proc_58_TLF_FIFO_blk[0] = 1'b0;
    assign proc_58_input_sync_blk[0] = 1'b0;
    assign proc_58_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_58[0] = dl_detect_out ? proc_dep_vld_vec_58_reg[0] : (proc_58_data_FIFO_blk[0] | proc_58_data_PIPO_blk[0] | proc_58_start_FIFO_blk[0] | proc_58_TLF_FIFO_blk[0] | proc_58_input_sync_blk[0] | proc_58_output_sync_blk[0]);
    assign proc_58_data_FIFO_blk[1] = 1'b0 | (~tx_app_if_U0.txApp2sLookup_req_blk_n) | (~tx_app_if_U0.sLookup2txApp_rsp_blk_n);
    assign proc_58_data_PIPO_blk[1] = 1'b0;
    assign proc_58_start_FIFO_blk[1] = 1'b0;
    assign proc_58_TLF_FIFO_blk[1] = 1'b0;
    assign proc_58_input_sync_blk[1] = 1'b0;
    assign proc_58_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_58[1] = dl_detect_out ? proc_dep_vld_vec_58_reg[1] : (proc_58_data_FIFO_blk[1] | proc_58_data_PIPO_blk[1] | proc_58_start_FIFO_blk[1] | proc_58_TLF_FIFO_blk[1] | proc_58_input_sync_blk[1] | proc_58_output_sync_blk[1]);
    assign proc_58_data_FIFO_blk[2] = 1'b0 | (~tx_app_if_U0.txApp2eventEng_mergeEvent_blk_n);
    assign proc_58_data_PIPO_blk[2] = 1'b0;
    assign proc_58_start_FIFO_blk[2] = 1'b0;
    assign proc_58_TLF_FIFO_blk[2] = 1'b0;
    assign proc_58_input_sync_blk[2] = 1'b0;
    assign proc_58_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_58[2] = dl_detect_out ? proc_dep_vld_vec_58_reg[2] : (proc_58_data_FIFO_blk[2] | proc_58_data_PIPO_blk[2] | proc_58_start_FIFO_blk[2] | proc_58_TLF_FIFO_blk[2] | proc_58_input_sync_blk[2] | proc_58_output_sync_blk[2]);
    assign proc_58_data_FIFO_blk[3] = 1'b0 | (~tx_app_if_U0.txApp2stateTable_upd_req_blk_n) | (~tx_app_if_U0.stateTable2txApp_upd_rsp_blk_n);
    assign proc_58_data_PIPO_blk[3] = 1'b0;
    assign proc_58_start_FIFO_blk[3] = 1'b0;
    assign proc_58_TLF_FIFO_blk[3] = 1'b0;
    assign proc_58_input_sync_blk[3] = 1'b0;
    assign proc_58_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_58[3] = dl_detect_out ? proc_dep_vld_vec_58_reg[3] : (proc_58_data_FIFO_blk[3] | proc_58_data_PIPO_blk[3] | proc_58_start_FIFO_blk[3] | proc_58_TLF_FIFO_blk[3] | proc_58_input_sync_blk[3] | proc_58_output_sync_blk[3]);
    assign proc_58_data_FIFO_blk[4] = 1'b0 | (~tx_app_if_U0.conEstablishedFifo_blk_n);
    assign proc_58_data_PIPO_blk[4] = 1'b0;
    assign proc_58_start_FIFO_blk[4] = 1'b0;
    assign proc_58_TLF_FIFO_blk[4] = 1'b0;
    assign proc_58_input_sync_blk[4] = 1'b0;
    assign proc_58_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_58[4] = dl_detect_out ? proc_dep_vld_vec_58_reg[4] : (proc_58_data_FIFO_blk[4] | proc_58_data_PIPO_blk[4] | proc_58_start_FIFO_blk[4] | proc_58_TLF_FIFO_blk[4] | proc_58_input_sync_blk[4] | proc_58_output_sync_blk[4]);
    assign proc_58_data_FIFO_blk[5] = 1'b0 | (~tx_app_if_U0.timer2txApp_notification_blk_n);
    assign proc_58_data_PIPO_blk[5] = 1'b0;
    assign proc_58_start_FIFO_blk[5] = 1'b0;
    assign proc_58_TLF_FIFO_blk[5] = 1'b0;
    assign proc_58_input_sync_blk[5] = 1'b0;
    assign proc_58_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_58[5] = dl_detect_out ? proc_dep_vld_vec_58_reg[5] : (proc_58_data_FIFO_blk[5] | proc_58_data_PIPO_blk[5] | proc_58_start_FIFO_blk[5] | proc_58_TLF_FIFO_blk[5] | proc_58_input_sync_blk[5] | proc_58_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_58_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_58_reg <= proc_dep_vld_vec_58;
        end
    end
    assign in_chan_dep_vld_vec_58[0] = dep_chan_vld_1_58;
    assign in_chan_dep_data_vec_58[59 : 0] = dep_chan_data_1_58;
    assign token_in_vec_58[0] = token_1_58;
    assign in_chan_dep_vld_vec_58[1] = dep_chan_vld_5_58;
    assign in_chan_dep_data_vec_58[119 : 60] = dep_chan_data_5_58;
    assign token_in_vec_58[1] = token_5_58;
    assign in_chan_dep_vld_vec_58[2] = dep_chan_vld_9_58;
    assign in_chan_dep_data_vec_58[179 : 120] = dep_chan_data_9_58;
    assign token_in_vec_58[2] = token_9_58;
    assign in_chan_dep_vld_vec_58[3] = dep_chan_vld_13_58;
    assign in_chan_dep_data_vec_58[239 : 180] = dep_chan_data_13_58;
    assign token_in_vec_58[3] = token_13_58;
    assign in_chan_dep_vld_vec_58[4] = dep_chan_vld_32_58;
    assign in_chan_dep_data_vec_58[299 : 240] = dep_chan_data_32_58;
    assign token_in_vec_58[4] = token_32_58;
    assign in_chan_dep_vld_vec_58[5] = dep_chan_vld_53_58;
    assign in_chan_dep_data_vec_58[359 : 300] = dep_chan_data_53_58;
    assign token_in_vec_58[5] = token_53_58;
    assign dep_chan_vld_58_9 = out_chan_dep_vld_vec_58[0];
    assign dep_chan_data_58_9 = out_chan_dep_data_58;
    assign token_58_9 = token_out_vec_58[0];
    assign dep_chan_vld_58_1 = out_chan_dep_vld_vec_58[1];
    assign dep_chan_data_58_1 = out_chan_dep_data_58;
    assign token_58_1 = token_out_vec_58[1];
    assign dep_chan_vld_58_53 = out_chan_dep_vld_vec_58[2];
    assign dep_chan_data_58_53 = out_chan_dep_data_58;
    assign token_58_53 = token_out_vec_58[2];
    assign dep_chan_vld_58_5 = out_chan_dep_vld_vec_58[3];
    assign dep_chan_data_58_5 = out_chan_dep_data_58;
    assign token_58_5 = token_out_vec_58[3];
    assign dep_chan_vld_58_32 = out_chan_dep_vld_vec_58[4];
    assign dep_chan_data_58_32 = out_chan_dep_data_58;
    assign token_58_32 = token_out_vec_58[4];
    assign dep_chan_vld_58_13 = out_chan_dep_vld_vec_58[5];
    assign dep_chan_data_58_13 = out_chan_dep_data_58;
    assign token_58_13 = token_out_vec_58[5];

    // Process: tx_app_table_U0
    toe_top_hls_deadlock_detect_unit #(60, 59, 2, 2) toe_top_hls_deadlock_detect_unit_59 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_59),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_59),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_59),
        .token_in_vec(token_in_vec_59),
        .dl_detect_in(dl_detect_out),
        .origin(origin[59]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_59),
        .out_chan_dep_data(out_chan_dep_data_59),
        .token_out_vec(token_out_vec_59),
        .dl_detect_out(dl_in_vec[59]));

    assign proc_59_data_FIFO_blk[0] = 1'b0 | (~tx_app_table_U0.txSar2txApp_ack_push_blk_n);
    assign proc_59_data_PIPO_blk[0] = 1'b0;
    assign proc_59_start_FIFO_blk[0] = 1'b0;
    assign proc_59_TLF_FIFO_blk[0] = 1'b0;
    assign proc_59_input_sync_blk[0] = 1'b0;
    assign proc_59_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_59[0] = dl_detect_out ? proc_dep_vld_vec_59_reg[0] : (proc_59_data_FIFO_blk[0] | proc_59_data_PIPO_blk[0] | proc_59_start_FIFO_blk[0] | proc_59_TLF_FIFO_blk[0] | proc_59_input_sync_blk[0] | proc_59_output_sync_blk[0]);
    assign proc_59_data_FIFO_blk[1] = 1'b0 | (~tx_app_table_U0.txApp2txSar_upd_req_blk_n) | (~tx_app_table_U0.txSar2txApp_upd_rsp_blk_n);
    assign proc_59_data_PIPO_blk[1] = 1'b0;
    assign proc_59_start_FIFO_blk[1] = 1'b0;
    assign proc_59_TLF_FIFO_blk[1] = 1'b0;
    assign proc_59_input_sync_blk[1] = 1'b0;
    assign proc_59_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_59[1] = dl_detect_out ? proc_dep_vld_vec_59_reg[1] : (proc_59_data_FIFO_blk[1] | proc_59_data_PIPO_blk[1] | proc_59_start_FIFO_blk[1] | proc_59_TLF_FIFO_blk[1] | proc_59_input_sync_blk[1] | proc_59_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_59_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_59_reg <= proc_dep_vld_vec_59;
        end
    end
    assign in_chan_dep_vld_vec_59[0] = dep_chan_vld_7_59;
    assign in_chan_dep_data_vec_59[59 : 0] = dep_chan_data_7_59;
    assign token_in_vec_59[0] = token_7_59;
    assign in_chan_dep_vld_vec_59[1] = dep_chan_vld_55_59;
    assign in_chan_dep_data_vec_59[119 : 60] = dep_chan_data_55_59;
    assign token_in_vec_59[1] = token_55_59;
    assign dep_chan_vld_59_7 = out_chan_dep_vld_vec_59[0];
    assign dep_chan_data_59_7 = out_chan_dep_data_59;
    assign token_59_7 = token_out_vec_59[0];
    assign dep_chan_vld_59_55 = out_chan_dep_vld_vec_59[1];
    assign dep_chan_data_59_55 = out_chan_dep_data_59;
    assign token_59_55 = token_out_vec_59[1];


`include "toe_top_hls_deadlock_report_unit.vh"
