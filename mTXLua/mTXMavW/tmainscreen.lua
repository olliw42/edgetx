----------------------------------------------------------------------
-- mTX Main screen
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
----------------------------------------------------------------------

local ui = ...

local tmainscreen = {}


----------------------------------------------------------------------
-- Main screen background
----------------------------------------------------------------------

function tmainscreen.DrawBackground()
    -- Main background
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BACKGROUND)
    lcd.clear(CUSTOM_COLOR)

    -- Top status bar
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(
        0, 0, LCD_W, 19,
        CUSTOM_COLOR)

    -- Bottom status area
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(
        0, 200, LCD_W, LCD_H - 200,
        CUSTOM_COLOR)
end


----------------------------------------------------------------------
-- Top Bar
----------------------------------------------------------------------

local function getVehicleClassStr(mavsdk)
    local vc = mavsdk.Vehicle.class
    if vc == mavsdk.VEHICLECLASS_COPTER then
        return "Copter"
    elseif vc == mavsdk.VEHICLECLASS_PLANE then
        return "Plane"
    elseif vc == mavsdk.VEHICLECLASS_ROVER then
        return "Rover"
    end
    return "?"
end


function tmainscreen.DrawTopBar(mavsdk)
    local y = -1

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(45, y, getVehicleClassStr(mavsdk)..":"..model.getInfo().name, CUSTOM_COLOR + ui.DFLT)

    local rsField = getFieldInfo("1RSS")
    local tqlyField = getFieldInfo("TQly")
    local rqlyField = getFieldInfo("RQly")

    local rs = nil
    local tqly = nil
    local rqly = nil
    
    if rsField ~= nil then rs = getValue(rsField.id) end
    if tqlyField ~= nil then tqly = getValue(tqlyField.id) end
    if rqlyField ~= nil then rqly = getValue(rqlyField.id) end
    
    local x = 225 -- 235
    if rs ~= nil then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
        ui.drawText(x, y, "RS:",  CUSTOM_COLOR + ui.DFLT)
        ui.drawNumber(x + 30, y, rs, CUSTOM_COLOR + ui.DFLT + LEFT)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
        ui.drawText(x, y, "RS:--", CUSTOM_COLOR + ui.DFLT + BLINK)
    end

    x = x + 76
    if tqly ~= nil and rqly ~= nil then
        if tqly < 30 or rqly < 30 then
            lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
        else
            lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
        end
        ui.drawText(x, y, "LQ:", CUSTOM_COLOR + ui.DFLT)
        ui.drawNumber(x + 30, y, tqly, CUSTOM_COLOR + ui.DFLT + LEFT)
        ui.drawNumber(x + 62, y, rqly, CUSTOM_COLOR + ui.DFLT + LEFT)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
        ui.drawText(x, y, "LQ:-- --", CUSTOM_COLOR + ui.DFLT)
    end

    -- Tx voltage
    local txVoltageField = getFieldInfo("tx-voltage")
    local txVoltage = nil
    if txVoltageField ~= nil then
        txVoltage = getValue(txVoltageField.id)
    end
    if txVoltage ~= nil then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
        ui.drawText(394+30, y, string.format("Tx:%.1fv", txVoltage), CUSTOM_COLOR + ui.DFLT)
    end
end


----------------------------------------------------------------------
-- Footer
----------------------------------------------------------------------

function tmainscreen.DrawFooter(mavsdk, tautopilot)
    -- flight mode
    local flightMode = tautopilot.getFlightModeStr(mavsdk)

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(1, 200, flightMode, CUSTOM_COLOR + ui.DBL + LEFT)

    -- POS fix
    if mavsdk.positionOk() then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
        ui.drawText(240, 200, "POS FIX", CUSTOM_COLOR + ui.DBL + CENTER)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
        ui.drawText(240, 200, "No FIX", CUSTOM_COLOR + ui.DBL + CENTER)
    end
end


----------------------------------------------------------------------
-- StatusText
----------------------------------------------------------------------

function tmainscreen.drawStatusText(tautopilot, x, y)
    local statusTextIdx = tautopilot.getStatusText(0)
    local count = math.min(statusTextIdx, 3)
    
    if LCD_H == 320 then -- Jumper T15
        y = y + 13
        count = math.min(statusTextIdx, 5)
    end  

    for i = 1, count do
        local idx = (statusTextIdx - count + i - 1) % 12 + 1
        local _, st = tautopilot.getStatusText(idx)

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
        
        ui.drawText(x, y + (i - 1) * 13, text, CUSTOM_COLOR + ui.SML)
    end
end


----------------------------------------------------------------------
-- Connect/Disconnect Handler
----------------------------------------------------------------------

function tmainscreen.onConnect()
end

function tmainscreen.onDisconnect()
end


----------------------------------------------------------------------
-- END
----------------------------------------------------------------------

return tmainscreen
