#include <stdint.h>
#include <hls_stream.h>
#include <iostream>
#include <stdlib.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include "../../../../common/include/communication.hpp"

#define WAIT_TIMER 256
#define ITT_NUM 20
#define SLOT_NUM 100



struct Log
{
	ap_uint<32> minProsal;
	ap_uint<32> FUO;
    LogEntry slots[SLOT_NUM];
	Log()
		:minProsal(0), validPsn(FUO) {}
}

struct LogEntry
{
    ap_uint<32> propVal;
    ap_uint<32> value;
}