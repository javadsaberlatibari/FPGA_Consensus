#include "ap_int.h"
#include <hls_stream.h>

extern "C" void deposit_summary_krnl(
    uint32_t                      total_deposits,
    hls::stream<ap_uint<32>>&     m_axis_summary
) {
#pragma HLS INTERFACE s_axilite port = total_deposits
#pragma HLS INTERFACE axis     port = m_axis_summary
#pragma HLS INTERFACE s_axilite port = return
#pragma HLS PIPELINE II=1

    m_axis_summary.write(total_deposits);
}
