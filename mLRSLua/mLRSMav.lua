--local toolName = "TNS|mLRS Mavlink GCS|TNE"
----------------------------------------------------------------------
-- Copyright (c) MLRS project
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
-- OlliW @ www.olliw.eu
----------------------------------------------------------------------
-- Lua TOOLS script
----------------------------------------------------------------------
-- copy script to SCRIPTS\TOOLS folder on OpenTx SD card

local VERSION = {
    script = '2026-09-11.01', -- add a '.01' if needed for the day
    required_tx_version_int = 10403,  -- 'v1.4.03'
}



----------------------------------------------------------------------
-- Debug
----------------------------------------------------------------------

local debugLines = {}

local function debugAdd(text)
    if #debugLines >= 10 then table.remove(debugLines, 1) end
    debugLines[#debugLines + 1] = text
end

local function debugDraw(x, y)
    for i = 1, #debugLines do
        lcd.drawText(x, y + (i - 1) * 18, debugLines[i])
    end
end


----------------------------------------------------------------------
-- MAVLink messages
----------------------------------------------------------------------

local mavMessages = {} -- not needed currently

local function loadMavlinkMessageModule(filename)
    local scrpt, err = loadScript("/SCRIPTS/TOOLS/Mavlink/mavlink_msg_"..filename..".lua")
    if scrpt == nil then error("Cannot load " .. filename .. ": " .. (err or "unknown error")) end
    local module = scrpt()
    mavMessages[module.id] = module
    return module
end


local HEARTBEAT = loadMavlinkMessageModule("HEARTBEAT")
local STATUSTEXT = loadMavlinkMessageModule("STATUSTEXT")
local ATTITUDE = loadMavlinkMessageModule("ATTITUDE")
local VFR_HUD = loadMavlinkMessageModule("VFR_HUD")
local TUNNEL = loadMavlinkMessageModule("TUNNEL")
local HIGHRES_IMU = loadMavlinkMessageModule("HIGHRES_IMU")


local mavMySysId = 2 --254
local mavMyCompId = 154 -- 190 -- MAV_COMP_ID_MISSIONPLANNER
local mavMyType = 26 --6 -- MAV_TYPE_GCS


----------------------------------------------------------------------
-- MAVLink Helper
----------------------------------------------------------------------

local function crcInit()
    return 0xFFFF
end    


local function crcAccumulate(byte, crc)
    local tmp = byte ~ (crc & 0xFF)
    tmp = (tmp ~ (tmp << 4)) & 0xFF
    crc = (crc >> 8) ~ (tmp << 8) ~ (tmp << 3) ~ (tmp >> 4)
    return crc & 0xFFFF  
end


----------------------------------------------------------------------
-- MAVLink Parser, only V2
----------------------------------------------------------------------

local mavRxState = {
    pos = 0,
    frameLength = 0,
    frame = {},
}

local mavResult = {
    len = 0,
    signed = false,
    seq = 0,
    sysid = 0,
    compid = 0,
    msgid = 0,
    payload = {},
    crc_validated = false,
}

local function mavlinkParserReset()
    mavRxState.pos = 0
    mavRxState.frameLength = 0
    mavRxState.frame = {}
end


-- nil: no end of MAVLink frame
-- false: crc error, might be just that extra_crc is not known
-- else: returns a mavResult aka msg
local function mavlinkParseChar(byte)
    if type(byte) ~= "number" then error("BAD RX byte: type=" .. tostring(type(byte))) end  
  
    if mavRxState.pos == 0 then -- PARSE_STATE_IDLE
        if byte == 0xFD then -- do only V2 frames
            mavRxState.pos = 1
            mavRxState.frame[mavRxState.pos] = byte
        end
        return nil
    end

    mavRxState.pos = mavRxState.pos + 1
    mavRxState.frame[mavRxState.pos] = byte

    if mavRxState.pos == 2 then -- PARSE_STATE_LEN
        mavResult.len = byte
        mavRxState.frameLength = byte + 12
        return nil

    elseif mavRxState.pos == 3 then -- PARSE_STATE_INCOMPAT_FLAGS
        mavResult.signed = (byte & 0x01) ~= 0
        if mavResult.signed then
            mavRxState.frameLength = mavRxState.frameLength + 13
        end
        return nil
        
    elseif mavRxState.pos == 4 then -- PARSE_STATE_COMPAT_FLAGS
        return nil
    end    

    if mavRxState.pos == 5 then  -- Seq
        mavResult.seq = byte
    elseif mavRxState.pos == 6 then -- SysId
        mavResult.sysid = byte
    elseif mavRxState.pos == 7 then -- CompId
        mavResult.compid = byte
    elseif mavRxState.pos == 8 then -- MsgId 0..7
        mavResult.msgid = byte
    elseif mavRxState.pos == 9 then -- MsgId 8..15
        mavResult.msgid = mavResult.msgid +  byte * 256
    elseif mavRxState.pos == 10 then -- MsgId 16..23
        mavResult.msgid = mavResult.msgid + byte * 65536
        
    elseif mavRxState.pos >= 11 and mavRxState.pos < 11 + mavResult.len then -- PARSE_STATE_FRAME
        local payloadPos = mavRxState.pos - 10
        mavResult.payload[payloadPos] = byte
    end

    if mavRxState.pos == mavRxState.frameLength then
        local msg_struct = mavMessages[mavResult.msgid]
        if not msg_struct then  -- extra_crc not known
            mavResult.crc_validated = false; 
            for i = mavResult.len + 1, #mavResult.payload do mavResult.payload[i] = nil end
            mavlinkParserReset(); 
            return mavResult
        end

        local crcEnd = mavRxState.frameLength - 2
        if mavResult.signed then crcEnd = crcEnd - 13 end
        local crc = crcInit()
        for i = 2, crcEnd do crc = crcAccumulate(mavRxState.frame[i], crc) end
        crc = crcAccumulate(msg_struct.crc_extra, crc)
        local receivedCrc = mavRxState.frame[crcEnd + 1] + mavRxState.frame[crcEnd + 2] * 256
        if crc ~= receivedCrc then
            mavlinkParserReset()
            return nil
        end
        mavResult.crc_validated = true; 
        
        -- remove payload bytes left over from a previous, longer MAVLink message
        for i = mavResult.len + 1, #mavResult.payload do mavResult.payload[i] = nil end

        mavlinkParserReset() -- clear parser for next frame
        return mavResult
    end

    return nil
end


----------------------------------------------------------------------
-- MAVLink Encoder, only V2
----------------------------------------------------------------------

local mavTxState = {
    nextSequence = 0
}



----------------------------------------------------------------------
-- MAVLink tx handling
----------------------------------------------------------------------

local mavTxQueue = {}

local function mavTxQueuePush(msg_frame)
    if #mavTxQueue >= 10 then table.remove(mavTxQueue, 1) end
    mavTxQueue[#mavTxQueue + 1] = msg_frame
end

local function mavTxQueuePop()
    if #mavTxQueue == 0 then return nil end
    return table.remove(mavTxQueue, 1)
end


----------------------------------------------------------------------
----------------------------------------------------------------------

local mavMsgList = {}

local function mavMsgListAdd(msg, txt)
    for i = 1, #mavMsgList do
        local a = mavMsgList[i]
        if a.sysid == msg.sysid and a.compid == msg.compid and a.msgid == msg.msgid then
            a.cnt = a.cnt + 1
            return 
        end
    end
    mavMsgList[#mavMsgList + 1] = { sysid = msg.sysid, compid = msg.compid, msgid = msg.msgid, txt = txt, cnt = 1 }
end

local function mavMsgListDraw(x,y)
    for i = 1, #mavMsgList do
        local a = mavMsgList[i]
        local text = string.format("%3d,%3d %3d %-12s %3d", a.sysid, a.compid, a.msgid, a.txt, a.cnt )
        lcd.drawText(x, y + (i - 1) * 18, text)
    end    
end


----------------------------------------------------------------------
-- MAVLink Receive and Send Functions
----------------------------------------------------------------------

local mavRxLastSequence = nil
-- mavlink rx stats
local mavRxBytes = 0
local mavRxCount = 0
local mavRxSize = 0
local mavRxSeqErrorCount = 0
-- mavlink tx stats
local mavTxCount = 0
local mavTxSize = 0


local mavlinkHandleFrame -- forward declaration


local function mavlinkParsePacket(packet)
    for i = 1, #packet do
        mavRxBytes = mavRxBytes + 1
        local msg = mavlinkParseChar(packet[i])
        if msg ~= nil then -- full frame received, crc validated, or mayb enot
            mavRxCount = mavRxCount + 1
            mavRxSize = mavRxSize + msg.len
            
            if msg.sysid == 1 and msg.compid == 1 then -- do seq check only for autopilot
                if mavRxLastSequence ~= nil then
                    local expectedSequence = mavRxLastSequence + 1
                    if expectedSequence >= 256 then expectedSequence = 0 end
                    if expectedSequence ~= msg.seq then 
                        mavRxSeqErrorCount = mavRxSeqErrorCount + 1; 
                    end
                end  
                mavRxLastSequence = msg.seq
            end    
            
debugAdd(string.format("MAV %d/%d seq=%d", msg.sysid, msg.compid, msg.seq))            
            
            if msg.crc_validated then -- crc validated
                mavlinkHandleFrame(msg) -- needs to be defined below
            end    
        end
    end
end


local function mavlinkSend(msg_struct, data)
    local msg_frame = mavlinkEncode(
        mavTxState.nextSequence, mavMySysId, mavMyCompId, msg_struct, data
        )
    if msg_frame == nil then return false end
   
    mavTxQueuePush(msg_frame)
    
    mavTxCount = mavTxCount + 1
    mavTxSize = mavTxSize + string.byte(msg_frame, 2)
    
    collectgarbage("collect")    
    
    return true
end


----------------------------------------------------------------------
-- MAVLink Handlers
----------------------------------------------------------------------
local mavTlast1Hz = 0


-- function definition of local function mavlinkHandleFrame(frame)
mavlinkHandleFrame = function(msg)
    
    if msg.msgid == HEARTBEAT.id then
        mavMsgListAdd(msg, string.format("HEARTBEAT"))
        
    elseif msg.msgid == STATUSTEXT.id then     
        mavMsgListAdd(msg, string.format("STATUSTEXT"))
        
    elseif msg.msgid == ATTITUDE.id then     
        mavMsgListAdd(msg, string.format("ATTITUDE"))
        
    elseif msg.msgid == VFR_HUD.id then     
        mavMsgListAdd(msg, string.format("VFR_HUD"))
        
    else
        --mavMsgListAdd(msg, "--")
    end    
    
end


local function mavlinkDo()
    local tnow_10ms = getTime()
    
    -- 1 Hz tick
    if tnow_10ms - mavTlast1Hz >= 100 then
        mavTlast1Hz = tnow_10ms
        
        mavlinkSend(HEARTBEAT, {
            type = mavMyType,
            autopilot = 0, -- MAV_AUTOPILOT_INVALID
            custom_mode = mavTxState.nextSequence,
        })
      
        mavlinkSend(STATUSTEXT, {
            severity = 6,
            text = "Hello from mLRS, I'm alive",
        })
        
--[[        mavlinkSend(VFR_HUD, {
            airspeed = 42,
            groundspeed = mavTxState.nextSequence,
            alt = 9,
            climb = 10,
            heading = 11,
            throttle = 12,
        }) --]]
        
        mavlinkSend(HIGHRES_IMU, {
            time_usec = mavTxState.nextSequence,
        }) 
      
    end  
end



----------------------------------------------------------------------
----------------------------------------------------------------------
local tlast_1Hz = 0


local function mavlinkProcessIt()
    -- fetch all packets
    while true do
        local packet = mavlinkPop()
        if packet == nil then
            break
        end
        mavlinkParsePacket(packet) 
    end
    
    -- send queued MAVLink messages
    local msg_frame = mavTxQueuePop()
    if msg_frame ~= nil then
        mavlinkPush(msg_frame)
    end

    mavlinkDo()
end


local function Do(event)
    lcd.clear()

    -- MAVLink
    mavlinkProcessIt()

    -- display
    local stats = mavlinkStats()
    lcd.drawText(5, 5, "MAVLink Stats")
    lcd.drawText(5, 30, "bytes:")
    lcd.drawNumber(200, 30, stats.rx_bytes_cnt)
    lcd.drawText(5, 50, "packets:")
    lcd.drawNumber(200, 50, stats.rx_packets_cnt)
    lcd.drawText(5, 70, "packets missed:")
    lcd.drawNumber(200, 70, stats.packets_missed)
    lcd.drawText(5, 90, "frame err:")
    lcd.drawNumber(200, 90, stats.frame_len_err)
    lcd.drawText(5, 110, "payload err:")
    lcd.drawNumber(200, 110, stats.payload_len_err)
    lcd.drawText(5, 130, "data err:")
    lcd.drawNumber(200, 130, stats.data_len_err)
    
    
    lcd.drawText(5, 180, string.format("bytes:  %d   (diff %d)", mavRxBytes, stats.rx_bytes_cnt-mavRxBytes))
    lcd.drawText(5, 200, string.format("data:    %d  bytes", mavRxSize))
    lcd.drawText(5, 220, string.format("count:  %d", mavRxCount))
    lcd.drawText(5, 240, string.format("errors seq:  %d", mavRxSeqErrorCount))
    
    lcd.drawText(5, 270, string.format("count:  %d", mavTxCount))
    lcd.drawText(5, 290, string.format("data:  %d bytes", mavTxSize))
    
    --mavDebugDraw(200, 110)
    mavMsgListDraw(350,5)

    debugDraw(350, 180)
    
    
    local tnow_10ms = getTime()
    if tnow_10ms - tlast_1Hz >= 100 then
        tlast_1Hz = tnow_10ms
        
--[[        lcd.drawText(5, 90, string.format("min: %d bytes", crsfRxSizeMin))
        crsfRxSizeMin = 10000 --]]
    end  
    
end


----------------------------------------------------------------------
-- Script EdgeTx Interface
----------------------------------------------------------------------

local function scriptInit()
    mavlinkResetStats()
end


local function scriptRun(event)
    if event == nil then
        error("Cannot be run as a model script!")
        return 2
    end
    if model.getModule(0).Type ~= 5 and model.getModule(1).Type ~= 5 then
        error("CRSF not enabled!")
        return 2
    end

    Do(event)

    return 0
end


return { init=scriptInit, run=scriptRun }
