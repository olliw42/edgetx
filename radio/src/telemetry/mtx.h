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


// usage:
//   DynamicFifo<uint8_t> fifo(128);
//   DynamicFifo<uint8_t>* fifo = nullptr;
//   fifo = new DynamicFifo<uint8_t>(128);
// created with help by free ChatGPT

template <class T>
class DynamicFifo
{
  public:

    explicit DynamicFifo(uint32_t size):
        fifo(nullptr),
        N(size),
        widx(0),
        ridx(0)
    {
        if (N > 1 && !(N & (N - 1))) {
            fifo = new T[N];
        }
        else {
            N = 0;
        }
    }

    ~DynamicFifo()
    {
        delete[] fifo;
    }

    // do not allow copying and moving
    DynamicFifo(const DynamicFifo&) = delete;
    DynamicFifo& operator=(const DynamicFifo&) = delete;
    DynamicFifo(DynamicFifo&&) = delete;
    DynamicFifo& operator=(DynamicFifo&&) = delete;

    void clear()
    {
        widx = ridx = 0;
    }

    void push(T element)
    {
        uint32_t next = nextIndex(widx);
        if (next != ridx) {
            fifo[widx] = element;
            widx = next;
        }
    }

    void skip()
    {
        ridx = nextIndex(ridx);
    }

    bool pop(T & element)
    {
      if (isEmpty()) {
          return false;
      }
      else {
          element = fifo[ridx];
          ridx = nextIndex(ridx);
          return true;
      }
    }

    bool isEmpty() const
    {
        return (ridx == widx);
    }

    bool isFull() const
    {
        uint32_t next = nextIndex(widx);
        return (next == ridx);
    }

    uint32_t size() const
    {
        return (N + widx - ridx) & (N - 1);
    }

    bool hasSpace(uint32_t n) const
    {
        return (N > (size() + n));
    }

    bool probe(T & element) const
    {
        if (isEmpty()) {
            return false;
        }
        else {
            element = fifo[ridx];
            return true;
        }
    }

    T * buffer()
    {
        return fifo;
    }

  protected:
    T * fifo;
    uint32_t N;
    volatile uint32_t widx;
    volatile uint32_t ridx;

    inline uint32_t nextIndex(uint32_t idx) const
    {
        return (idx + 1) & (N - 1);
    }
};


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
//	Fifo<uint8_t, TELEMETRY_MAVLINK_INPUT_FIFO_SIZE> inputFifo;
//  Fifo<uint8_t, TELEMETRY_MAVLINK_OUTPUT_FIFO_SIZE> outputFifo;

    ~MavlinkTelemetryBuffer() { delete inputFifoPtr; delete outputFifoPtr; }
    DynamicFifo<uint8_t>* inputFifoPtr = nullptr;
    DynamicFifo<uint8_t>* outputFifoPtr = nullptr;
    uint32_t rx_fifo_size = 0;
    uint32_t tx_fifo_size = 0;

    uint32_t outputFifoSize(void) { return (outputFifoPtr) ? outputFifoPtr->size() : 0; }

    bool Init(uint32_t _rx_fifo_size, uint32_t _tx_fifo_size);
};

extern MavlinkTelemetryBuffer mavlinkTelemetryBuffer;


bool processCrossfireMavlinkEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount);
bool processCrossfireMbEnvelopeFrame(uint8_t* rxBuffer, uint8_t rxBufferCount);


uint8_t createCrossfireMavlinkEnvelopeFrame(uint8_t* frame);
uint8_t createCrossfireMbEnvelopeFrame(uint8_t* frame);
int8_t selectCrossfireTask(bool do1, bool do2, bool do3);


#endif


