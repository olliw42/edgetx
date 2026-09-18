/*
  OlliW42
*/

#include "edgetx.h"
#include "mtx.h"

#if defined(CROSSFIRE)
  #include "crossfire.h"
#endif

#if defined(CROSSFIRE)


MavlinkTelemetryBuffer mavlinkTelemetryBuffer;



bool processCrossfireMavlinkEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount)
{
    // rxBuffer[0]: address = 0xEA (that's what mLRS is using)
    // rxBuffer[1]: len -> uint8_t crsfPayloadLen
    // rxBuffer[2]: frame id -> uint8_t id = 0xAA
    // rxBuffer[3]: payload -> total_chunks : 4; current_chunk : 4;
    // rxBuffer[4]: payload -> data_size
    // rxBuffer[5]: payload -> data[58]

    if (rxBuffer[1] + 2 > rxBufferCount) { // Huston
        mavlinkTelemetryBuffer.rx_frame_len_error++;
        return false;
    }
    if (rxBuffer[4] + 2 + 2 != rxBuffer[1]) { // check if crsfPayloadLen matches data_size
        mavlinkTelemetryBuffer.rx_payload_len_error++;
        return true;
    }
    if (rxBuffer[4] > 58) { // check data_size
        mavlinkTelemetryBuffer.rx_data_len_error++;
        return true;
    }

    uint8_t seq = rxBuffer[3] >> 4; // check sequence
    if (mavlinkTelemetryBuffer.rx_seq_valid) {
        uint8_t expected_seq = mavlinkTelemetryBuffer.rx_seq_last + 1;
        if (expected_seq >= 16) expected_seq = 0;
        if (seq != expected_seq) {
            mavlinkTelemetryBuffer.rx_packets_missed++;
        }
    }
    mavlinkTelemetryBuffer.rx_seq_last = seq;
    mavlinkTelemetryBuffer.rx_seq_valid = true;

    mavlinkTelemetryBuffer.rx_packets_cnt++;
    for (uint16_t i = 0; i < rxBuffer[4]; i++) {
        mavlinkTelemetryBuffer.inputFifo.push(rxBuffer[5 + i]);
        mavlinkTelemetryBuffer.rx_bytes_cnt++;
    }

    return true;
}



bool processCrossfireMbEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount)
{
    // rxBuffer[0]: address = 0xEA (that's what mLRS is using)
    // rxBuffer[1]: len -> uint8_t crsfPayloadLen
    // rxBuffer[2]: frame id -> uint8_t id = 0x82
    // rxBuffer[3]: payload -> cmd = 0x66
    // rxBuffer[4]: payload -> seq
    // rxBuffer[5]: payload -> data_size
    // rxBuffer[6]: payload -> data[57]

    if (rxBuffer[1] + 2 > rxBufferCount) { // Huston
        mavlinkTelemetryBuffer.rx_frame_len_error++;
        return false;
    }
    if (rxBuffer[5] + 3 + 2 != rxBuffer[1]) { // check if crsfPayloadLen matches data_size
        mavlinkTelemetryBuffer.rx_payload_len_error++;
        return false;
    }
    if (rxBuffer[5] > 57) { // check data_size
        mavlinkTelemetryBuffer.rx_data_len_error++;
        return false;
    }

    uint8_t seq = rxBuffer[4] & 0x0F; // check sequence
    if (mavlinkTelemetryBuffer.rx_seq_valid) {
        uint8_t expected_seq = mavlinkTelemetryBuffer.rx_seq_last + 1;
        if (expected_seq >= 16) expected_seq = 0;
        if (seq != expected_seq) {
            mavlinkTelemetryBuffer.rx_packets_missed++;
        }
    }
    mavlinkTelemetryBuffer.rx_seq_last = seq;
    mavlinkTelemetryBuffer.rx_seq_valid = true;

    mavlinkTelemetryBuffer.rx_packets_cnt++;
    for (uint16_t i = 0; i < rxBuffer[5]; i++) {
        mavlinkTelemetryBuffer.inputFifo.push(rxBuffer[6 + i]);
        mavlinkTelemetryBuffer.rx_bytes_cnt++;
    }

    return true;
}


uint8_t createCrossfireMavlinkEnvelopeFrame(uint8_t* frame)
{
    int len = mavlinkTelemetryBuffer.outputFifo.size();
    if (len > 30) len = 30; // MAVLink envelope can only hold 58 bytes max, EdgeTx crashes with 58, 30 is ok

    uint8_t* buf = frame;
    *buf++ = MODULE_ADDRESS;
    *buf++ = 4 + len; // 1(ID) + 2(chunk & size) + len + 1(CRC)
    uint8_t* crc_start = buf;
    *buf++ = 0xAA;
    static uint8_t seq = 0; // caveat: shared by multiple streams
    *buf++ = (seq << 4); // chunks
    seq++;
    *buf++ = len; // data_size

    uint8_t data = 0;
    for (int i = 0; i < len; i++) {
        mavlinkTelemetryBuffer.outputFifo.pop(data);
        *buf++ = data;
    }

    *buf++ = crc8(crc_start, 3 + len);
    return buf - frame;
}


uint8_t createCrossfireMbEnvelopeFrame(uint8_t* frame)
{
    int len = mavlinkTelemetryBuffer.outputFifo.size();
    if (len > 30) len = 30; // MAVLink envelope can only hold 58 bytes max, EdgeTx crashes with 58, 30 is ok

    uint8_t* buf = frame;
    *buf++ = MODULE_ADDRESS;
    *buf++ = 5 + len; // 1(ID) + 2(chunk & size) + len + 1(CRC)
    uint8_t* crc_start = buf;
    *buf++ = 0x81;
    *buf++ = 0x66; // cmd
    static uint8_t seq = 0; // caveat: shared by multiple streams
    *buf++ = (seq & 0x0F); // seq
    seq++;
    *buf++ = len; // data_size

    uint8_t data = 0;
    for (int i = 0; i < len; i++) {
        mavlinkTelemetryBuffer.outputFifo.pop(data);
        *buf++ = data;
    }

    *buf++ = crc8(crc_start, 4 + len);
    return buf - frame;
}


// simple "largest accumulated wait" scheduler
int8_t selectCrossfireTask(bool do1, bool do2, bool do3)
{
const uint8_t weight[3] = {8, 1, 1};
static uint8_t waited[3] = {0, 0, 0};

    bool ready[3] = { do1, do2, do3 };
    int8_t selected = -1;

    // select the ready buffer that has waited longest
    for (int i = 0; i < 3; i++) {
        if (ready[i] && (selected < 0 || waited[i] > waited[selected])) { // selected < 0 to ensure waited[selected] exists
            selected = i;
        }
    }

    // give all other tasks wait time
    for (int i = 0; i < 3; i++) {
        if (i != selected) { waited[i] += weight[i]; }
    }

    // normalize&sanitize such that lowest waited is 0 and none is > 128
    uint8_t lowest_wait = 255;
    for (int i = 0; i < 3; i++) {
       if (waited[i] < lowest_wait) { lowest_wait = waited[i]; }
    }
    for (int i = 0; i < 3; i++) {
        waited[i] -= lowest_wait;
        if (waited[i] > 128) { waited[i] = 128; } // ensure it doesn't run out of bounds
    }

    return selected;
}


#endif

