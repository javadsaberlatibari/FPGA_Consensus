#include <hls_stream.h>
#include <ap_int.h>


// Summary kernel: sends one key-value over AXIS
extern "C" void hybrid_kv_summary_krnl(
    ap_uint<64> packed_key_value,
    hls::stream<ap_uint<64>>& m_axis_kv_summary
) {
#pragma HLS INTERFACE s_axilite port = packed_key_value
#pragma HLS INTERFACE axis      port = m_axis_kv_summary
#pragma HLS INTERFACE s_axilite port = return
#pragma HLS PIPELINE II=1

    m_axis_kv_summary.write(packed_key_value);
}

