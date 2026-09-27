local widgetName = "mTX MavTelem Widget Status Page"
----------------------------------------------------------------------
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------
-- mTX Lua Widget script, Status Pane
----------------------------------------------------------------------
-- copy script to SCRIPTS\WIDGETS\mTXMavW folder on EdgeTx SD card


local VERSION = {
    script = '2026-09-27.00', -- add a '.01' if needed for the day
}


local options = {
}


----------------------------------------------------------------------
-- Access Libraries
----------------------------------------------------------------------

local backend = mTXMavWBackend
local ui = backend.ui
local mavsdk = backend.mavsdk
local tautopilot = backend.tautopilot
local tmainscreen = backend.tmainscreen


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
-- StatusText
----------------------------------------------------------------------

local function drawStatusText(x, y)
    local statusTextIdx, _, statusTextCount = mavsdk.getStatusText(0)
    local count = statusTextCount

    local Dy = 18
    if LCD_H == 320 then Dy = 20 end -- Jumper T15

    for i = 1, count do
        local idx = (statusTextIdx - count + i - 1) % 12 + 1
        local _, st = mavsdk.getStatusText(idx)
        
        local idx_str = st.idx .. ":"
        local dx = lcd.sizeText(idx_str) + 6
        local dy = (i - 1) * Dy        
        
        ui.drawText(x, y + dy, idx_str, ui.COLOR_WHITE)

        local color = ui.COLOR_WHITE
        if st.severity <= 3 then
            color = ui.COLOR_RED
        elseif st.severity <= 5 then
            color = ui.COLOR_YELLOW
        end

        lcd.setColor(CUSTOM_COLOR, color)

        local text = st.text
        if st.count > 1 then
            text = string.format("%s (%dx)", text, st.count)
        end
        
        ui.drawText(x + dx, y + dy, text, CUSTOM_COLOR)
    end
end


----------------------------------------------------------------------
-- Sensors
----------------------------------------------------------------------

local function drawSensorStatus(x, y, dx, dy, name, flag, flag2)
    local sys = mavsdk.SysStatus
   
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x, y, name, CUSTOM_COLOR)
    
    if sys == nil or sys.onboard_control_sensors_present & flag == 0 then
        ui.drawText(x+dx, y+dy, "---", CUSTOM_COLOR)
    elseif sys.onboard_control_sensors_enabled & flag == 0 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_YELLOW)
        ui.drawText(x+dx, y+dy, "dis.", CUSTOM_COLOR)
    elseif sys.onboard_control_sensors_health & flag > 0 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTGREEN)
        ui.drawText(x+dx, y+dy, "ok", CUSTOM_COLOR)
    else    
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTRED)
        ui.drawText(x+dx, y+dy, "err", CUSTOM_COLOR)    
    end
    
    if sys == nil or flag == 0 or sys.onboard_control_sensors_present & flag2 == 0 then -- no second instance
        return 
    end
    
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    if sys.onboard_control_sensors_enabled & flag2 == 0 then
        ui.drawText(x+dx + 30, y+dy, "dis.", CUSTOM_COLOR)
    elseif sys.onboard_control_sensors_health & flag2 > 0 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTGREEN)
        ui.drawText(x+dx + 30, y+dy, "ok", CUSTOM_COLOR)
    else    
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTRED)
        ui.drawText(x+dx + 30, y+dy, "err", CUSTOM_COLOR)    
    end
end  


----------------------------------------------------------------------
----------------------------------------------------------------------

local function drawIt(widget, event)
    -- Main background
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BACKGROUND)
    lcd.clear(CUSTOM_COLOR)
    
    -- Top status bar
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(0, 0, ui.LCD_W, 19, CUSTOM_COLOR)
    tmainscreen.DrawTopBar(mavsdk)
    
    -- Status text area
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(0, 45, ui.LCD_W - 80, 320, CUSTOM_COLOR) -- make it heigh enough
    drawStatusText(0, 48)
    
    -- System status
    local x, y
    local sys = mavsdk.SysStatus
    
    -- Prearm
    local MAV_SYS_STATUS_PREARM_CHECK = 268435456 -- 0x10000000
    x = 75
    y = 23
    local dx = 115
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x, y, "Prearm checks:", CUSTOM_COLOR)
    if sys == nil or sys.onboard_control_sensors_present & MAV_SYS_STATUS_PREARM_CHECK == 0 then
        ui.drawText(x+dx, y, "---", CUSTOM_COLOR)
    elseif sys.onboard_control_sensors_enabled & MAV_SYS_STATUS_PREARM_CHECK == 0 then
        ui.drawText(x+dx, y, "disabled", CUSTOM_COLOR)
    elseif sys.onboard_control_sensors_health & MAV_SYS_STATUS_PREARM_CHECK > 0 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTGREEN)
        ui.drawText(x+dx, y-4, "OK", CUSTOM_COLOR + ui.MID)
    else    
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_BRIGHTRED)
        ui.drawText(x+dx, y-4, "FAIL", CUSTOM_COLOR + ui.MID)    
    end
    
    -- Sensors
    local MAV_SYS_STATUS_SENSOR_3D_GYRO	= 1 -- 0x01 3D gyro
    local MAV_SYS_STATUS_SENSOR_3D_ACCEL = 2 --	0x02 3D accelerometer
    local MAV_SYS_STATUS_SENSOR_3D_MAG = 4 --	0x04 3D magnetometer
    local	MAV_SYS_STATUS_SENSOR_GPS = 32 --	0x20 GPS
    local MAV_SYS_STATUS_SENSOR_3D_GYRO2 = 131072 -- 0x20000 2nd 3D gyro
    local MAV_SYS_STATUS_SENSOR_3D_ACCEL2 = 262144 -- 0x40000 2nd 3D accelerometer
    local MAV_SYS_STATUS_SENSOR_3D_MAG2 = 524288 --	0x80000 2nd 3D magnetometer    
    local	MAV_SYS_STATUS_AHRS = 2097152 -- 0x200000 AHRS subsystem health
    
    x = ui.LCD_W - 70
    y = 23
    drawSensorStatus(x, y+0*41, 0, 18, "gyro", MAV_SYS_STATUS_SENSOR_3D_GYRO, MAV_SYS_STATUS_SENSOR_3D_GYRO2)
    drawSensorStatus(x, y+1*41, 0, 18, "accel", MAV_SYS_STATUS_SENSOR_3D_ACCEL, MAV_SYS_STATUS_SENSOR_3D_ACCEL2)
    drawSensorStatus(x, y+2*41, 0, 18, "mag", MAV_SYS_STATUS_SENSOR_3D_MAG, MAV_SYS_STATUS_SENSOR_3D_MAG2)
    drawSensorStatus(x, y+3*41, 0, 18, "gps", MAV_SYS_STATUS_SENSOR_GPS, 0)
    drawSensorStatus(x, y+4*41, 0, 18, "AHRS", MAV_SYS_STATUS_AHRS, 0)
    
    -- CPU load
    x = ui.LCD_W - 70
    y = 23 + 5*41
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x, y, "cpu load", CUSTOM_COLOR)
    if sys == nil then
        ui.drawText(x, y+18, "---", CUSTOM_COLOR)
    else
        ui.drawText(x, y+18, (sys.load / 10) .."%", CUSTOM_COLOR)
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

    return widget
end


local function update(widget, options)
    widget.options = options
end


local function background(widget)
end


local function refresh(widget, event, touchState)
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