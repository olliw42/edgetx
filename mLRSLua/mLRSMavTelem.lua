--local toolName = "TNS|mLRS MavTelem|TNE"
----------------------------------------------------------------------
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------
-- Lua TOOLS script
----------------------------------------------------------------------
-- copy script to SCRIPTS\TOOLS folder on EdgeTx SD card
-- copy mavsdk script to SCRIPTS\TOOLS\mavlink folder


local VERSION = {
    script = '2026-09-13.02', -- add a '.01' if needed for the day
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
-- Load Libraries
----------------------------------------------------------------------

local mavsdk

local function mavsdkInit()
    local scrpt, err = loadScript("/SCRIPTS/TOOLS/Mavlink/mavsdk.lua")
    if scrpt == nil then
        error("Cannot load mavsdk.lua: " .. (err or "unknown error"))
    end
    mavsdk = scrpt()
end

mavsdkInit()


local tautopilot

local function tautopilotInit()
    local scrpt, err = loadScript("/SCRIPTS/TOOLS/Mavlink/tautopilot.lua")
    if scrpt == nil then
        error("Cannot load tautopilot.lua: " .. (err or "unknown error"))
    end
    tautopilot = scrpt()
end

tautopilotInit()


local tmainscreen

local function tmainscreenInit()
    local scrpt, err = loadScript("/SCRIPTS/TOOLS/Mavlink/tmainscreen.lua")
    if scrpt == nil then
        error("Cannot load tmainscreen.lua: " .. (err or "unknown error"))
    end
    tmainscreen = scrpt()
end

tmainscreenInit()


----------------------------------------------------------------------
-- MAVLink Receive and Send Functions
----------------------------------------------------------------------

local my = {
    SysId = 254, --2 --254
    CompId = 190, --154, -- 190 -- MAV_COMP_ID_MISSIONPLANNER
    Type = 6, --26, --6 -- MAV_TYPE_GCS
}

local tlast_1Hz = 0


--[[ a message handler callback would be used so:
mavsdk.handleMessageCallback = function(msg)
    ...
end
--]]


local function mavlinkSend(msg_struct, data)
    return mavsdk.sendMessage(my.SysId, my.CompId, msg_struct, data)
end


local function mavlinkDo()
    local tnow_10ms = getTime()
    
    -- 1 Hz tick
    if tnow_10ms - tlast_1Hz >= 100 then
        tlast_1Hz = tnow_10ms
        
        mavlinkSend(mavsdk.HEARTBEAT, {
            type = my.Type,
            autopilot = 0, -- MAV_AUTOPILOT_INVALID
            custom_mode = 12345,
        })
      
--[[        mavlinkSend(mavsdk.STATUSTEXT, {
            severity = 6,
            text = "Hello from mLRS, I'm alive",
        }) --]]
    end  
end


----------------------------------------------------------------------
----------------------------------------------------------------------

local function Do(event)
    lcd.clear()

    -- MAVLink
    mavsdk.Do() -- mavsdk standard do routine, receives, and handled
    mavlinkDo() -- our handler to send

    tautopilot.statusTextDo(mavsdk)

    -- Main Screen
    tmainscreen.DrawBackground()
    tmainscreen.DrawTopBar(mavsdk)
    tmainscreen.DrawFooter(mavsdk, tautopilot)

    -- HUD
    tautopilot.DrawHUD(mavsdk, 240, 22, 146)
    tautopilot.drawHomeIcon(mavsdk, 240, 11, 135)

    -- draw GPS status
    if mavsdk.Gps2Raw == nil then
        tautopilot.DrawGpsStatus(mavsdk, 1, 2, 34, 4)
    else
        tautopilot.DrawGpsStatus(mavsdk, 1, 2, 13, 0)
        tautopilot.DrawGpsStatus(mavsdk, 2, 2, 73, 0)
    end

    -- draw speeds
    if mavsdk.Gps2Raw == nil then
        tautopilot.DrawSpeeds(mavsdk, 2, 115)
    else
        tautopilot.DrawSpeeds(mavsdk, 2, 147)
    end

    -- draw GPS coordinates
    if mavsdk.Gps2Raw == nil then
        tautopilot.DrawGpsCoords(mavsdk, 1, 2, 165)
    end

    -- draw battery status
    tautopilot.DrawBatteryVoltage(mavsdk, 480, 30)
    tautopilot.DrawBatteryCurrent(mavsdk, 480, 65)
    tautopilot.DrawBatteryRemaining(mavsdk, 480, 100)
    tautopilot.DrawBatteryCharge(mavsdk, 480, 135)

    -- draw arming status
    tautopilot.DrawArmingStatus(mavsdk, 240, 174)

    -- status bar / status text follow here
    tmainscreen.drawStatusText(tautopilot, 5, 230)


--[[    -- display
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
    lcd.drawNumber(200, 130, stats.data_len_err) --]]

    debugDraw(450, 180)
    
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
