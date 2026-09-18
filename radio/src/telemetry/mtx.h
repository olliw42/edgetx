/*
  OlliW42
*/

#pragma once

/*
telemetry/crossfire.cpp
void processCrossfireTelemetryFrame(uint8_t module, uint8_t* rxBuffer, uint8_t rxBufferCount)
-> fill inputFifo

pulses/crossfire.cpp
static void setupPulsesCrossfire(uint8_t module, uint8_t*& p_buf, uint8_t endpoint, int16_t* channels, uint8_t nChannels)
*/


#define MTX_USE_MB_ENVELOPE  1



#if defined(CROSSFIRE)


#define TELEMETRY_MAVLINK_INPUT_FIFO_SIZE   4*512 // maybe not enough when direct path to MPmQGC exists
#define TELEMETRY_MAVLINK_OUTPUT_FIFO_SIZE  4*512 // probably more than enough


class MavlinkTelemetryBuffer {
public:
  // mimic destination of outputTelemetryBuffe, is that needed??
  void setDestination(uint8_t _destination)
  {
    destination = _destination;
  }

  bool isModuleDestination(uint8_t module)
  {
    return destination != TELEMETRY_ENDPOINT_NONE && destination != TELEMETRY_ENDPOINT_SPORT && (destination >> 2) == module;
  }

  uint8_t destination = TELEMETRY_ENDPOINT_NONE;

  //-- stats
  uint32_t rx_packets_cnt = 0;
  uint32_t rx_bytes_cnt = 0;

	uint32_t rx_frame_len_error = 0;
	uint32_t rx_payload_len_error = 0;
	uint32_t rx_data_len_error = 0;

	uint32_t rx_packets_missed = 0;
	uint8_t rx_seq_last = 0;
	bool rx_seq_valid = false;

	//-- the buffers
	Fifo<uint8_t, TELEMETRY_MAVLINK_INPUT_FIFO_SIZE> inputFifo;
  Fifo<uint8_t, TELEMETRY_MAVLINK_OUTPUT_FIFO_SIZE> outputFifo;
};

extern MavlinkTelemetryBuffer mavlinkTelemetryBuffer;


bool processCrossfireMavlinkEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount);
bool processCrossfireMbEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount);


uint8_t createCrossfireMavlinkEnvelopeFrame(uint8_t* frame);
uint8_t createCrossfireMbEnvelopeFrame(uint8_t* frame);
int8_t selectCrossfireTask(bool do1, bool do2, bool do3);


#endif


