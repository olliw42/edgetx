local name = "mLRSMavW"

local options = {
  -- No user-configurable options yet.
}


local function crcInit()
  return 0xFFFF
end


local function crcAccumulate(byte, crc)
  local tmp = byte ~ (crc & 0xFF)
  tmp = (tmp ~ (tmp << 4)) & 0xFF
  crc = (crc >> 8) ~ (tmp << 8) ~ (tmp << 3) ~ (tmp >> 4)
  return crc & 0xFFFF
end


local mavlinkSeq = 0

local function createHeartbeat()
  local seq = mavlinkSeq
  mavlinkSeq = (mavlinkSeq + 1) & 0xFF

  local frame = {
    -- MAVLink 2 header
    0xFD,       -- magic
    0x09,       -- payload length
    0x00,       -- incompat flags
    0x00,       -- compat flags
    seq,
    254,        -- sysid
    0xBE,       -- compid
    0x00, 0x00, 0x00, -- msgid = 0
    -- HEARTBEAT payload
    0x00, 0x00, 0x00, 0x00, -- custom_mode
    0x06,                    -- type = GCS
    0x08,                    -- autopilot = INVALID
    0x00,                    -- base_mode
    0x00,                    -- system_status
    0x03                     -- mavlink_version
  }
  local crc = crcInit()
  for i = 2, #frame do
    crc = crcAccumulate(frame[i], crc)
  end
  crc = crcAccumulate(50, crc)
  frame[#frame + 1] = crc & 0xFF
  frame[#frame + 1] = (crc >> 8) & 0xFF

  return frame
end


local rxBytes = 0
local tlast_1Hz = 0


local function create(zone, options)
  local widget = { zone = zone, options = options }

  rxBytes = 0
  tlast_1Hz = getTime()

  mavlinkResetStats()

  return widget
end


local function update(widget, options)
  widget.options = options
end


local function background(widget)
  -- Continuously consume received MAVLink data.
  local data = mavlinkPop()
  if data then
    rxBytes = rxBytes + #data
  end

  -- Send heartbeat at 1 Hz.
  local tnow = getTime()
  if tnow - tlast_1Hz >= 100 then
    tlast_1Hz = tnow
    local msg_frame = createHeartbeat()
    mavlinkPush(msg_frame)
  end
end


local function refresh(widget, event, touchState)
--  lcd.drawText(10, 10, "MAVLink widget OK")
--  lcd.drawNumber(10, 40, 12345)

  local stats = mavlinkStats()
  lcd.drawText(10, 10, "MAVLink RX test")
  lcd.drawText(10, 35, "RX bytes:")
  lcd.drawNumber(150, 35, rxBytes)
  lcd.drawText(10, 100, "MAVLink Stats")
  lcd.drawText(10, 125, "bytes:")
  lcd.drawNumber(200, 125, stats.rx_bytes_cnt)
  lcd.drawNumber(300, 125, stats.rx_bytes_cnt - rxBytes)
  lcd.drawText(10, 150, "packets:")
  lcd.drawNumber(200, 150, stats.rx_packets_cnt)
  lcd.drawText(10, 175, "packets missed:")
  lcd.drawNumber(200, 175, stats.packets_missed)
  lcd.drawText(10, 300, "frame err:")
  lcd.drawNumber(200, 300, stats.frame_len_err)
  lcd.drawText(10, 325, "payload err:")
  lcd.drawNumber(200, 325, stats.payload_len_err)
  lcd.drawText(10, 350, "data err:")
  lcd.drawNumber(200, 350, stats.data_len_err)
end


return {
  name = name,
  options = options,
  create = create,
  update = update,
  refresh = refresh,
  background = background
}
