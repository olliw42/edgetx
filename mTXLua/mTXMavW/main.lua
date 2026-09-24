local widgetName = "mTX MavTelem Widget"
----------------------------------------------------------------------
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------
-- mTX Lua Widget script
----------------------------------------------------------------------
-- copy script to SCRIPTS\WIDGETS\mTXMavW folder on EdgeTx SD card


local VERSION = {
    script = '2026-09-24.00', -- add a '.01' if needed for the day
}


local options = {
    { "Debug", BOOL, 1 },
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
        ui.drawText(x, y + (i - 1) * 18, debugLines[i])
    end
end


----------------------------------------------------------------------
-- Load Libraries
----------------------------------------------------------------------

local ui

local function loadLib(libName)
    local scrpt, err = loadScript("/WIDGETS/mTXMavW/" .. libName)
    if scrpt == nil then
        scrpt, err = loadScript("/SCRIPTS/TOOLS/" .. libName)
    end  
    if scrpt == nil then
        error("Cannot load " .. libName .. ": " .. (err or "unknown error"))
    end
    return scrpt(ui)
end

ui = loadLib("tui.lua")
local mavsdk = loadLib("mavsdk.lua")
local tautopilot = loadLib("tautopilot.lua")
local tmainscreen = loadLib("tmainscreen.lua")


----------------------------------------------------------------------
-- MAVLink Receive and Send Functions
----------------------------------------------------------------------

local my = {
    SysId = 254, --2 --254
    CompId = 190, --154, -- 190 -- MAV_COMP_ID_MISSIONPLANNER
    Type = 6, --26, --6 -- MAV_TYPE_GCS
}

local tlast_1Hz = 0
local tfirst_connect_10ms = 0 -- 0 indicates has not yet ever connected
local send_banner = false



--[[ a message handler callback would be used so:
mavsdk.handleMessageCallback = function(msg)
    ...
end
--]]


local function mavlinkSend(msg_struct, data)
    return mavsdk.sendMessage(my.SysId, my.CompId, msg_struct, data)
end


local function mavlinkSendCmdLong(command, params)
    return mavsdk.sendCommandLong(my.SysId, my.CompId, command, params)
end


local function mavlinkDo()
    local tnow_10ms = getTime()
    
    -- 1 Hz tick
    if tnow_10ms - tlast_1Hz >= 100 then
        tlast_1Hz = tnow_10ms
        
        mavlinkSend(mavsdk.HEARTBEAT, {
            type = my.Type,
            autopilot = 8, -- MAV_AUTOPILOT_INVALID
            base_mode = 1 + 128, -- MAV_MODE_FLAG_CUSTOM_MODE_ENABLED | MAV_MODE_FLAG_SAFETY_ARMED
            custom_mode = 12345,
            system_status = 4, -- MAV_STATE_ACTIVE
            mavlink_version = 3,
        })
      
--[[        mavlinkSend(mavsdk.STATUSTEXT, {
            severity = 6,
            text = "Hello from mLRS, I'm alive",
        }) --]]
    end
    
    if send_banner and tnow_10ms - tfirst_connect_10ms > 300 then
        send_banner = false
        mavlinkSendCmdLong(42428, nil) -- MAV_CMD_DO_SEND_BANNER
    end    
end


----------------------------------------------------------------------
-- Warning Box
----------------------------------------------------------------------

local function drawDisconnected()
    local w = 360
    local h = 90
    local x = (480 - w) / 2
    local y = (220 - h) / 2
    
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawFilledRectangle(x - 2, y - 2, w + 4, h + 4, CUSTOM_COLOR)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
    ui.drawFilledRectangle(x, y, w, h, CUSTOM_COLOR)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x + w / 2,  y + 18, "no telemetry data", CUSTOM_COLOR + ui.DBL + CENTER)
end


----------------------------------------------------------------------
----------------------------------------------------------------------

local function doIt()
    -- MAVLink
    mavsdk.Do() -- mavsdk standard do routine, receives, and handled
    mavlinkDo() -- our handler to send

    tautopilot.statusTextDo(mavsdk)
    tautopilot.soundDo(mavsdk)
    
    if not mavsdk.Vehicle.is_connected and not mavsdk.Vehicle.is_armed then
        tfirst_connect_10ms = 0
        send_banner = false
    end  
    
    if mavsdk.Vehicle.connected_has_changed then 
        if mavsdk.Vehicle.is_connected then -- just has connected
            tautopilot.onConnect()
            -- mavsdk.sendStreamRateRequest(mySysid, myCompid, mavsdk.ATTITUDE.id, 200000)
            if tfirst_connect_10ms == 0 and mavsdk.Vehicle.sysid > 0 then -- do on first connection
                tfirst_connect_10ms = getTime()
                send_banner = true
            end
        else
            tautopilot.onDisconnect()
        end
    end
end


local function drawIt(widget, event)
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
    
    -- warning box
    if not mavsdk.Vehicle.is_connected then
        drawDisconnected()
    end


    -- debug info
    if widget.options.Debug > 0 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
        local stats = mavlinkStats()
        local x = 360
        local y = 272 - 6*14
        ui.drawText(x, y, "bytes:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 75, y, stats.rx_bytes_cnt, CUSTOM_COLOR + ui.SML)
        ui.drawText(x, y + 1*14, "packets:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 75, y + 1*14, stats.rx_packets_cnt, CUSTOM_COLOR + ui.SML)
        ui.drawText(x, y + 2*14, "packets missed:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 100, y + 2*14, stats.packets_missed, CUSTOM_COLOR + ui.SML)
        ui.drawText(x, y + 3*14, "frame err:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 100, y + 3*14, stats.frame_len_err, CUSTOM_COLOR + ui.SML)
        ui.drawText(x, y + 4*14, "payload err:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 100, y + 4*14, stats.payload_len_err, CUSTOM_COLOR + ui.SML)
        ui.drawText(x, y + 5*14, "data err:", CUSTOM_COLOR + ui.SML)
        ui.drawNumber(x + 100, y + 5*14, stats.data_len_err, CUSTOM_COLOR + ui.SML)
        --debugDraw(450, 180)
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
    doIt()
end


local function refresh(widget, event, touchState)
    background(widget)
    --doIt()
    lcd.resetBacklightTimeout()
    drawIt(widget, event)
end


return {
  name = widgetName,
  options = options,
  create = create,
  update = update,
  refresh = refresh,
  background = background
}