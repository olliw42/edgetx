/*
OlliW42
 */

#define LUA_LIB
#if defined(CROSSFIRE)

#include <ctype.h>
#include <stdio.h>
#include "edgetx.h"
#include "stamp.h"
#include "lua_api.h"
#include "api_filesystem.h"
#include "hal/module_port.h"
#include "hal/adc_driver.h"
#include "hal/rotary_encoder.h"
#include "switches.h"
#include "input_mapping.h"

#include "telemetry/crossfire.h"

// Doing the parser and encoding in Lua, it kind of immediately gives CPU limit error, even
// when only modest stuff is being done. Not usable. Hence, the workload is done in C.
// Lua tables are avoided, Lua strings are preferred.

//== mavlink Helper ===================

#include "../thirdparty/fastmavlink/c_library/all/all.h"


//== mavlinkPop(), Parser, Decoder ===================


// created with help by free ChatGPT
static bool mavlink_decode_scalar(lua_State *L, const char* format, const uint8_t* payload, size_t payloadLen, size_t* payloadPos)
{
  if (format[0] != '<' || format[1] == '\0') {
    return false;
  }
  switch (format[1]) {
    case 'b': {
      int8_t value = (*payloadPos < payloadLen) ? (int8_t)payload[*payloadPos] : 0;
      (*payloadPos)++;
      lua_pushinteger(L, value);
      return true;
    }
    case 'B': {
      uint8_t value = (*payloadPos < payloadLen) ? payload[*payloadPos] : 0;
      (*payloadPos)++;
      lua_pushinteger(L, value);
      return true;
    }
    case 'i': case 'I': {
      int size = atoi(format + 2);
      if (size != 2 && size != 4 && size != 8) {
        return false;
      }
      uint64_t value = 0;
      for (int i = 0; i < size; i++) {
        if (*payloadPos < payloadLen) value |= ((uint64_t)payload[*payloadPos]) << (8 * i);
        (*payloadPos)++;
      }
      if (format[1] == 'i') {
        int64_t signedValue;
        if (size == 2) {
          signedValue = (int16_t)value;
        } else if (size == 4) {
          signedValue = (int32_t)value;
        } else {
          signedValue = (int64_t)value;
        }
        lua_pushinteger(L, signedValue);
      }
      else {
        lua_pushinteger(L, (lua_Integer)value);
      }
      return true;
    }
    case 'f': case 'd': {
      int size = (format[1] == 'd') ? sizeof(double) : sizeof(float);
      uint8_t bytes[sizeof(double)];
      for (int i = 0; i < size; i++) {
        bytes[i] = (*payloadPos < payloadLen) ? payload[*payloadPos] : 0;
        (*payloadPos)++;
      }
      if (format[1] == 'f') {
        float value;
        memcpy(&value, bytes, sizeof(value));
        lua_pushnumber(L, value);
      }
      else {
        double value;
        memcpy(&value, bytes, sizeof(value));
        lua_pushnumber(L, value);
      }
      return true;
    }
    default:
      return false;
  }
}


// created with help by free ChatGPT
static bool mavlink_decode_payload(lua_State *L, const uint8_t* payload, size_t payloadLen)
{
const int resultIndex = 3;
size_t payloadPos = 0;
char buffer[256];

  lua_getfield(L, 1, "fields"); // msg_struct.fields
  luaL_checktype(L, -1, LUA_TTABLE);
  int fieldsIndex = lua_gettop(L);
  int fieldCount = luaL_len(L, fieldsIndex);
  // decode each field
  for (int i = 1; i <= fieldCount; i++) {
    // fields[i]
    lua_rawgeti(L, fieldsIndex, i);
    luaL_checktype(L, -1, LUA_TTABLE);
    int fieldIndex = lua_gettop(L);
    // fields[i][1] = field name
    lua_rawgeti(L, fieldIndex, 1);
    const char* name = luaL_checkstring(L, -1);
    lua_pop(L, 1);
    // fields[i][2] = format
    lua_rawgeti(L, fieldIndex, 2);
    const char* format = luaL_checkstring(L, -1);
    lua_pop(L, 1);
    // fields[i][3] = array length, if present
    lua_rawgeti(L, fieldIndex, 3);
    int count = lua_isnil(L, -1) ? 1 : luaL_checkinteger(L, -1);
    lua_pop(L, 1);
    // data[name]
    //   not needed?
    // check valid format
    if (format[0] != '<' || format[1] == '\0') {
      lua_pop(L, 2); // pop field, fields
      return false;
    }
    if (format[1] == 'c') { // fixed-size character array: <cN, e.g. { "some_chars", "<c7" }
      size_t size = atoi(format + 2);
      if (size > 255) {
        lua_pop(L, 2);
        return false;
      }
      for (size_t j = 0; j < size; j++) {
        buffer[j] = (payloadPos < payloadLen) ? (char)payload[payloadPos] : '\0';
        payloadPos++;
      }
      size_t stringLen = size;
      while (stringLen > 0 && buffer[stringLen - 1] == '\0') { stringLen--; }
      lua_pushlstring(L, buffer, stringLen);
      lua_setfield(L, resultIndex, name);
    }
    else if (count > 1) { // array, e.g. { "some_array", "<I2", 4 }
      lua_createtable(L, count, 0);
      int arrayIndex = lua_gettop(L);
      for (int j = 1; j <= count; j++) {
        if (!mavlink_decode_scalar(L, format, payload, payloadLen, &payloadPos)) {
          lua_pop(L, 2); // pop array, field
          lua_pop(L, 1); // pop fields
          return false;
        }
        lua_rawseti(L, arrayIndex, j);
      }
      lua_setfield(L, resultIndex, name);
    }
    else { // scalar: <f  <d  <b  <B  <i2  <I2  <i4  <I4  <i8  <I8, e.g. { "type", "<B" },
      if (!mavlink_decode_scalar(L, format, payload, payloadLen, &payloadPos)) {
        lua_pop(L, 2); // pop field, fields
        return false;
      }
      lua_setfield(L, resultIndex, name);
    }
    lua_pop(L, 1); // pop field
  }
  lua_pop(L, 1); // pop fields
  return true;
}


// use:     local payload = mavlinkDecode(msg_struct, msg)
// success: returns payload as Lua table
// nil:     error
static int luaMavlinkDecode(lua_State *L)
{
size_t payloadLen = 0;

  luaL_checktype(L, 1, LUA_TTABLE); // msg_struct
  luaL_checktype(L, 2, LUA_TTABLE); // msg table from mavlinkPop()

  // msg.payload
  lua_getfield(L, 2, "payload");
  const uint8_t *payload = (const uint8_t *)luaL_checklstring(L, -1, &payloadLen);
  lua_pop(L, 1);

  // create return table
  lua_createtable(L, 0, 8);
  if (!mavlink_decode_payload(L, payload, payloadLen)) {
    lua_pop(L, 1); // pop return table
    lua_pushnil(L);
    return 1;
  }

  return 1;
}


// use:     local msg = mavlinkPop()
// success: returns Lua table, payload is Lua string
// nil:     error
static int luaMavlinkPop(lua_State *L)
{
uint8_t c = 0;
static fmav_message_t msg = {};
static fmav_status_t status = {};

  int available = mavlinkTelemetryBuffer.inputFifo.size();
  for (int i = 1; i <= available; i++) {
      mavlinkTelemetryBuffer.inputFifo.pop(c);
      // can return RESULT_NONE, RESULT_HAS_HEADER, RESULT_MSGID_UNKNOWN, RESULT_CRC_ERROR, RESULT_OK
      int8_t res = fmav_parse_to_msg(&msg, &status, c);
      switch (res) {
        case FASTMAVLINK_PARSE_RESULT_MSGID_UNKNOWN: res = -1; break;
        case FASTMAVLINK_PARSE_RESULT_OK: res = 1; break;
        default: continue;
      }

      lua_createtable(L, 0, 7);
      lua_pushtableinteger(L, "magic", msg.magic);
      lua_pushtableinteger(L, "len", msg.len);
      lua_pushtableinteger(L, "seq", msg.seq);
      lua_pushtableinteger(L, "sysid", msg.sysid);
      lua_pushtableinteger(L, "compid", msg.compid);
      lua_pushtableinteger(L, "msgid", msg.msgid);

      lua_pushlstring(L, (const char*)msg.payload, msg.len);
      lua_setfield(L, -2, "payload");

      lua_pushtableinteger(L, "res", res);
      return 1;
  }

  lua_pushnil(L);
  return 1;
}


//== mavlinkPush(), ENCODER ===================


// created with help by free ChatGPT
static bool mavlink_encode_scalar(lua_State *L, const char* format, uint8_t* payload, size_t* payloadLen)
{
  switch (format[1]) {
    case 'b': case 'B':
      payload[(*payloadLen)++] = (uint8_t)(lua_isnil(L, -1) ? 0 : luaL_checkinteger(L, -1));
      return true;
    case 'i': case 'I': {
      int size = atoi(format + 2);
      uint64_t value = (uint64_t)(lua_isnil(L, -1) ? 0 : luaL_checkinteger(L, -1));
      for (int i = 0; i < size; i++) {
        payload[(*payloadLen)++] = (uint8_t)(value >> (8 * i));
      }
      return true;
    }
    case 'f': {
      float value = (float)(lua_isnil(L, -1) ? 0 : luaL_checknumber(L, -1));
      memcpy(payload + *payloadLen, &value, sizeof(value));
      *payloadLen += sizeof(value);
      return true;
    }
    case 'd': {
      double value = (double)(lua_isnil(L, -1) ? 0 : luaL_checknumber(L, -1));
      memcpy(payload + *payloadLen, &value, sizeof(value));
      *payloadLen += sizeof(value);
      return true;
    }
    default:
      return false;
  }
}


// created with help by free ChatGPT
static bool mavlink_encode_payload(lua_State *L, int msgstructIndex, uint8_t* payload, size_t* payloadLen)
{
  lua_getfield(L, msgstructIndex, "fields"); // msg_struct.fields  // index = 1
  luaL_checktype(L, -1, LUA_TTABLE);
  int fieldsIndex = lua_gettop(L);
  int fieldCount = luaL_len(L, fieldsIndex);
  // encode each field
  for (int i = 1; i <= fieldCount; i++) {
    // fields[i]
    lua_rawgeti(L, fieldsIndex, i);
    luaL_checktype(L, -1, LUA_TTABLE);
    int fieldIndex = lua_gettop(L);
    // fields[i][1] = field name
    lua_rawgeti(L, fieldIndex, 1);
    const char* name = luaL_checkstring(L, -1);
    lua_pop(L, 1);
    // fields[i][2] = format
    lua_rawgeti(L, fieldIndex, 2);
    const char* format = luaL_checkstring(L, -1);
    lua_pop(L, 1);
    // fields[i][3] = array length, if present
    lua_rawgeti(L, fieldIndex, 3);
    int count = lua_isnil(L, -1) ? 1 : luaL_checkinteger(L, -1);
    lua_pop(L, 1);
    // data[name]
    lua_getfield(L, msgstructIndex + 1, name); // index = 2
    // check valid format
    if (format[0] != '<' || format[1] == '\0') {
      lua_pop(L, 2); // pop data[name], field
      lua_pop(L, 1); // pop fields
      return false;
    }
    // encode value
    if (format[1] == 'c') { // fixed-size character array: <cN, e.g. { "some_chars", "<c7" }
      size_t size = atoi(format + 2);
      if (*payloadLen + size > 255) {
        lua_pop(L, 2);
        lua_pop(L, 1);
        return false;
      }
      size_t stringLen = 0;
      const char* string = NULL;
      if (!lua_isnil(L, -1)) { string = luaL_checklstring(L, -1, &stringLen); }
      for (size_t j = 0; j < size; j++) {
        payload[(*payloadLen)++] = (string != NULL && j < stringLen) ? (uint8_t)string[j] : 0;
      }
    }
    else if (count > 1) { // array, e.g. { "some_array", "<I2", 4 }
      if (!lua_isnil(L, -1)) { luaL_checktype(L, -1, LUA_TTABLE); }
      int arrayIndex = lua_gettop(L);
      for (int j = 1; j <= count; j++) {
        if (lua_istable(L, arrayIndex)) {
          lua_rawgeti(L, arrayIndex, j);
        } else {
          lua_pushnil(L);
        }
        if (!mavlink_encode_scalar(L, format, payload, payloadLen)) {
          lua_pop(L, 2);
          lua_pop(L, 1);
          return false;
        }
        lua_pop(L, 1); // pop array element
      }
    }
    else { // scalar: <f  <d  <b  <B  <i2  <I2  <i4  <I4  <i8  <I8, e.g. { "type", "<B" },
      if (!mavlink_encode_scalar(L, format, payload, payloadLen)) {
        lua_pop(L, 2);
        lua_pop(L, 1);
        return false;
      }
    }
    lua_pop(L, 2); // pop data[name], field
    if (*payloadLen > 255) {
      lua_pop(L, 1);
      return false;
    }
  }
  lua_pop(L, 1); // pop fields
  return true;
}


static bool mavlink_encode_frame(lua_State *L, uint8_t* frame, size_t* frameLen)
{
size_t payloadLen = 0;
uint16_t crc;

  *frameLen = 0;

  uint8_t seq = (uint8_t)lua_tointeger(L, 1);
  uint8_t sysid = (uint8_t)lua_tointeger(L, 2);
  uint8_t compid = (uint8_t)lua_tointeger(L, 3);

  // msg_struct.id
  lua_getfield(L, 4, "id");
  uint32_t msgid = (uint32_t)luaL_checkinteger(L, -1);
  lua_pop(L, 1);

  // msg_struct.crc_extra
  lua_getfield(L, 4, "crc_extra");
  uint8_t crcExtra = (uint8_t)luaL_checkinteger(L, -1);
  lua_pop(L, 1);

  // encode payload
  // needs to come here so we know payload length
  if (!mavlink_encode_payload(L, 4, frame + 10, &payloadLen)) {
    return false;
  }

  // zero byte truncation
  while (payloadLen > 0 && frame[10 + payloadLen - 1] == 0) {
    payloadLen--;
  }

  // construct MAVLink frame
  frame[0] = 0xFD; // STX for MAVLink V2
  frame[1] = (uint8_t)payloadLen; // len
  frame[2] = 0x00; // incompat flags
  frame[3] = 0x00; // compat flags
  frame[4] = seq;
  frame[5] = sysid;
  frame[6] = compid;
  frame[7] = (uint8_t)(msgid & 0xFF);
  frame[8] = (uint8_t)((msgid >> 8) & 0xFF);
  frame[9] = (uint8_t)((msgid >> 16) & 0xFF);

  *frameLen = 10 + payloadLen;

  // CRC covers everything after the magic byte
  fmav_crc_init(&crc);
  for (size_t i = 1; i < *frameLen; i++) {
    fmav_crc_accumulate(&crc, frame[i]);
  }
  fmav_crc_accumulate(&crc, crcExtra);
  frame[(*frameLen)++] = (uint8_t)(crc & 0xFF);
  frame[(*frameLen)++] = (uint8_t)(crc >> 8);

  return true;
}


// use:     local msg_frame = mavlinkEncode(seq, sysid, compid, msg_struct, data)
// success: returns Lua string
// nil:     error
static int luaMavlinkEncode(lua_State *L)
{
uint8_t frame[300];
size_t frameLen = 0;

  luaL_checkinteger(L, 1); // seq
  luaL_checkinteger(L, 2); // sysid
  luaL_checkinteger(L, 3); // compid
  luaL_checktype(L, 4, LUA_TTABLE); // msg_struct
  luaL_checktype(L, 5, LUA_TTABLE); // data

  if (!mavlink_encode_frame(L, frame, &frameLen)) {
    lua_pushnil(L);
    return 1;
  }

  lua_pushlstring(L, (const char *)frame, frameLen);
  return 1;
}


// use:   local res = mavlinkPush(msg_frame) or
//        local res = mavlinkPush(seq, sysid, compid, msg_struct, data)
// true:  successfully queued
// nil:   no CRSF module selected
// false: not enough space in output FIFO, or incorrect parameter(s)
static int luaMavlinkPush(lua_State* L)
{
  bool external = (moduleState[EXTERNAL_MODULE].protocol == PROTOCOL_CHANNELS_CROSSFIRE);
  bool internal = (moduleState[INTERNAL_MODULE].protocol == PROTOCOL_CHANNELS_CROSSFIRE);

  if (!internal && !external) { // no module selected
    lua_pushnil(L);
    return 1;
  }

  int nargs = lua_gettop(L);
  if (nargs == 1) { // used as mavlinkPush(msg_frame)
    luaL_checklstring(L, 1, NULL); // msg_frame
  }
  else if (nargs == 5) { // used as mavlinkPush(seq, sysid, compid, msg_struct, data)
    luaL_checkinteger(L, 1); // seq
    luaL_checkinteger(L, 2); // sysid
    luaL_checkinteger(L, 3); // compid
    luaL_checktype(L, 4, LUA_TTABLE); // msg_struct
    luaL_checktype(L, 5, LUA_TTABLE); // data
  }
  else {
    lua_pushboolean(L, false);
    return 1;
  }

  size_t len;
  if (nargs == 5) {
    uint8_t data[300];
    if (!mavlink_encode_frame(L, data, &len) || !mavlinkTelemetryBuffer.outputFifo.hasSpace(len)) {
      lua_pushboolean(L, false);
      return 1;
    }
    for (size_t i = 0; i < len; i++) {
      mavlinkTelemetryBuffer.outputFifo.push(data[i]);
    }
  } else {
    const uint8_t* data = (const uint8_t*)luaL_checklstring(L, 1, &len);
    if (!mavlinkTelemetryBuffer.outputFifo.hasSpace(len)) {
      lua_pushboolean(L, false);
      return 1;
    }
    for (size_t i = 0; i < len; i++) {
      mavlinkTelemetryBuffer.outputFifo.push(data[i]);
    }
  }

  mavlinkTelemetryBuffer.setDestination(internal ? 0 : TELEMETRY_ENDPOINT_SPORT);

  lua_pushboolean(L, true);
  return 1;
}


//== mavlink Auxiliary ===================


static int luaMavlinkStats(lua_State* L)
{
  lua_newtable(L);
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_packets_cnt);
  lua_setfield(L, -2, "rx_packets_cnt");
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_bytes_cnt);
  lua_setfield(L, -2, "rx_bytes_cnt");
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_frame_len_error);
  lua_setfield(L, -2, "frame_len_err");
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_payload_len_error);
  lua_setfield(L, -2, "payload_len_err");
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_data_len_error);
  lua_setfield(L, -2, "data_len_err");
  lua_pushinteger(L, mavlinkTelemetryBuffer.rx_packets_missed);
  lua_setfield(L, -2, "packets_missed");
  return 1;
}


static int luaMavlinkResetStats(lua_State* L)
{
  mavlinkTelemetryBuffer.rx_packets_cnt = 0;
  mavlinkTelemetryBuffer.rx_bytes_cnt = 0;
  mavlinkTelemetryBuffer.rx_frame_len_error = 0;
  mavlinkTelemetryBuffer.rx_payload_len_error = 0;
  mavlinkTelemetryBuffer.rx_data_len_error = 0;
  mavlinkTelemetryBuffer.rx_packets_missed = 0;
  mavlinkTelemetryBuffer.inputFifo.clear();
  return 0;
}


//== mavlink Legacy ===================


static int luaMavlinkPopPacket(lua_State * L)
{
uint8_t data = 0;

  int length = mavlinkTelemetryBuffer.inputFifo.size();
  if (length > 286) length = 286; // don't let it become too large
  if (length > 0) {
    lua_newtable(L);
    for (int i = 1; i <= length; i++) {
    mavlinkTelemetryBuffer.inputFifo.pop(data);
      lua_pushinteger(L, i);
      lua_pushinteger(L, data);
      lua_settable(L, -3); // lua_pushinteger(L, data); lua_rawseti(L, -2, i); instead ??
    }
    return 1;
  }
  return 0;
}


static int luaMavlinkPushPacket(lua_State* L)
{
  bool external = (moduleState[EXTERNAL_MODULE].protocol == PROTOCOL_CHANNELS_CROSSFIRE);
  bool internal = (moduleState[INTERNAL_MODULE].protocol == PROTOCOL_CHANNELS_CROSSFIRE);

  if (!internal && !external) { // no module selected
    lua_pushnil(L);
    return 1;
  }
  if (lua_gettop(L) == 0) { // no parameter
    lua_pushboolean(L, false);
    return 1;
  }
  luaL_checktype(L, 1, LUA_TTABLE);
  int length = luaL_len(L, 1);
  if (!mavlinkTelemetryBuffer.outputFifo.hasSpace(length)) {
    lua_pushboolean(L, false);
    return 1;
  }
  for (int i = 0; i < length; i++) {
    lua_rawgeti(L, 1, i + 1);
    mavlinkTelemetryBuffer.outputFifo.push(luaL_checkinteger(L, -1));
    // lua_pop(L, 1); // needed or not? advised to use but not necessary ??
  }
  mavlinkTelemetryBuffer.setDestination(internal ? 0 : TELEMETRY_ENDPOINT_SPORT);
  lua_pushboolean(L, true);
  return 1;
}


extern "C" {
LROT_BEGIN(mavlinklib, NULL, 0)
  LROT_FUNCENTRY( mavlinkPop, luaMavlinkPop )
  LROT_FUNCENTRY( mavlinkDecode, luaMavlinkDecode )
  LROT_FUNCENTRY( mavlinkEncode, luaMavlinkEncode )
  LROT_FUNCENTRY( mavlinkPush, luaMavlinkPush )
  LROT_FUNCENTRY( mavlinkStats, luaMavlinkStats )
  LROT_FUNCENTRY( mavlinkResetStats, luaMavlinkResetStats )
  LROT_FUNCENTRY( mavlinkPopPacket, luaMavlinkPopPacket )
  LROT_FUNCENTRY( mavlinkPushPacket, luaMavlinkPushPacket )
LROT_END(mavlinklib, NULL, 0)
}

#endif
