local widgetName = "mLRSMavW"
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


local options = {
  -- No user-configurable options yet.
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
-- MAVLink tx handling
----------------------------------------------------------------------

local mavTxState = {
    nextSequence = 0
}


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
local mavRxMsgIdUnknownCount = 0
local mavRxCrcErrorCount = 0

-- mavlink tx stats
local mavTxCount = 0
local mavTxSize = 0

local mavTlast1Hz = 0


local function mavlinkHandleMsg(msg)
    mavRxBytes = mavRxBytes + 12 + msg.len
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
    
    if msg.res < 0 then 
        if msg.res == -1 then mavRxMsgIdUnknownCount = mavRxMsgIdUnknownCount + 1 end
        if msg.res == -2 then mavRxCrcErrorCount = mavRxCrcErrorCount + 1 end
        return 
    end
    
debugAdd(string.format("MAV %d/%d  %d  seq=%d", msg.sysid, msg.compid, msg.msgid, msg.seq))            
            
    if msg.msgid == HEARTBEAT.id then
        local payload = mavlinkDecode(HEARTBEAT, msg)
        mavMsgListAdd(msg, "HEARTBEAT")
    elseif msg.msgid == STATUSTEXT.id then     
        local payload = mavlinkDecode(STATUSTEXT, msg)
        mavMsgListAdd(msg, "STATUSTEXT")
    elseif msg.msgid == ATTITUDE.id then     
        local payload = mavlinkDecode(ATTITUDE, msg)
        mavMsgListAdd(msg, "ATTITUDE")
    elseif msg.msgid == VFR_HUD.id then     
        local payload = mavlinkDecode(VFR_HUD, msg)
        mavMsgListAdd(msg, "VFR_HUD")
--    else
--        mavMsgListAdd(msg, "--")
    end    
end


local function mavlinkSend(msg_struct, data)
    local msg_frame = mavlinkEncode(
        mavTxState.nextSequence, mavMySysId, mavMyCompId, msg_struct, data)
    if msg_frame == nil then return false end
    mavTxState.nextSequence = mavTxState.nextSequence + 1 -- prepare for next
    if mavTxState.nextSequence >= 256 then mavTxState.nextSequence = 0 end
   
    mavTxQueuePush(msg_frame)
    
    mavTxCount = mavTxCount + 1
    mavTxSize = mavTxSize + string.byte(msg_frame, 2)
    
    collectgarbage("collect")    
    
    return true
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
    -- read all MAVLink messages
    for i = 1, 1 do --while true do -. when in widget mode, EgdeTx can't handle mnore than that !! :(:(
        local msg = mavlinkPop()
        if msg == nil then
            break
        end
        mavlinkHandleMsg(msg)
    end

    -- send queued MAVLink messages
    local msg_frame = mavTxQueuePop()
    if msg_frame ~= nil then
        mavlinkPush(msg_frame)
    end

    mavlinkDo()
end


local function drawIt(event)

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
    lcd.drawText(5, 150, "pops:")
    lcd.drawNumber(200, 150, stats.rx_pop_cnt)
    lcd.drawText(300, 150, string.format("(diff %d)", stats.rx_bytes_cnt - stats.rx_pop_cnt))
    
    lcd.drawText(5, 200, string.format("bytes:  %d   (diff %d)", mavRxBytes, stats.rx_bytes_cnt-mavRxBytes))
    lcd.drawText(5, 220, string.format("data:    %d  bytes", mavRxSize))
    lcd.drawText(5, 240, string.format("count:  %d", mavRxCount))
    lcd.drawText(5, 260, string.format("errors seq:  %d", mavRxSeqErrorCount))
    lcd.drawText(5, 280, string.format("errors ukn:  %d", mavRxMsgIdUnknownCount))
    lcd.drawText(5, 300, string.format("errors crc:  %d", mavRxCrcErrorCount))
    
    lcd.drawText(5, 340, string.format("count:  %d", mavTxCount))
    lcd.drawText(5, 360, string.format("data:  %d bytes", mavTxSize))
    
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

local function create(zone, options)
  if model.getModule(0).Type ~= 5 and model.getModule(1).Type ~= 5 then
    error("CRSF not enabled!")
  end
  
  local widget = { zone = zone, options = options }

  tlast_1Hz = getTime()
  mavlinkResetStats()

  return widget
end


local function update(widget, options)
  widget.options = options
end


local function background(widget)
--    mavlinkProcessIt()
end


local function refresh(widget, event, touchState)
--    background(widget)
    mavlinkProcessIt()    
    drawIt(event)
end


return {
  name = widgetName,
  options = options,
  create = create,
  update = update,
  refresh = refresh,
  background = background
}