----------------------------------------------------------------------
-- Main screen
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
----------------------------------------------------------------------

local tmainscreen = {}


----------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------

local COLOR_WHITE = lcd.RGB(0xFF, 0xFF, 0xFF)
local COLOR_BLACK = lcd.RGB(0x00, 0x00, 0x00)
local COLOR_GREEN = lcd.RGB(25, 150, 50)
local COLOR_RED = lcd.RGB(0xE5, 0x20, 0x1E)
local COLOR_BACKGROUND = lcd.RGB(0x08, 0x54, 0x88)


----------------------------------------------------------------------
-- Main screen background
----------------------------------------------------------------------

function tmainscreen.DrawBackground()
    -- Main background
    lcd.setColor(CUSTOM_COLOR, COLOR_BACKGROUND)
    lcd.clear(CUSTOM_COLOR)

    -- Top status bar
    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawFilledRectangle(
        0, 0, 480, 19,
        CUSTOM_COLOR)

    -- Bottom status area
    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawFilledRectangle(
        0, 200, 480, 272 - 200,
        CUSTOM_COLOR)
end


----------------------------------------------------------------------
-- Top bar
----------------------------------------------------------------------

function tmainscreen.DrawTopBar()
    local y = -1

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawText(26, y, model.getInfo().name, CUSTOM_COLOR)

    local x = 235
    local rqField = getFieldInfo("RQ")
    local lqField = getFieldInfo("LQ")
    local rq = nil
    local lq = nil
    if rqField ~= nil then
        rq = getValue(rqField.id)
    end
    if lqField ~= nil then
        lq = getValue(lqField.id)
    end
    if rq ~= nil then
        if rq < 50 then
            lcd.setColor(CUSTOM_COLOR, COLOR_RED)
        else
            lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
        end
        lcd.drawText(x, y, "RS:",  CUSTOM_COLOR)
        lcd.drawNumber(x + 42 - 15, y, rq, CUSTOM_COLOR + LEFT)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_RED)
        lcd.drawText(x, y, "RS:--", CUSTOM_COLOR + BLINK)
    end

    -- LQ
    if lq ~= nil then
        if lq < 30 then
            lcd.setColor(CUSTOM_COLOR, COLOR_RED)
        else
            lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
        end
        lcd.drawText(x + 66, y, "LQ:", CUSTOM_COLOR)
        lcd.drawNumber(x + 66 + 42 - 15, y, lq, CUSTOM_COLOR + LEFT)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_RED)
        lcd.drawText(x + 66, y, "LQ:--", CUSTOM_COLOR)
    end

    -- Tx voltage
    local txVoltageField = getFieldInfo("tx-voltage")
    local txVoltage = nil
    if txVoltageField ~= nil then
        txVoltage = getValue(txVoltageField.id)
    end
    if txVoltage ~= nil then
        lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
        lcd.drawText(394, y, string.format("Tx:%.1fv", txVoltage), CUSTOM_COLOR)
    end
end


----------------------------------------------------------------------
-- Footer
----------------------------------------------------------------------

function tmainscreen.DrawFooter(mavsdk, tautopilot)
    -- flight mode
    local flightMode = "AUTO" --tautopilot.getFlightModeStr(mavsdk)

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawText(1, 200, flightMode, CUSTOM_COLOR + DBLSIZE + LEFT)

    -- GPS fix
    local gps = mavsdk.GpsRawInt
    if gps ~= nil and gps.fix_type >= 3 and gps.satellites_visible >= 7 then
        lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
        lcd.drawText(240, 200, "POS FIX", CUSTOM_COLOR + DBLSIZE + CENTER)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_RED)
        lcd.drawText(240, 200, "No FIX", CUSTOM_COLOR + DBLSIZE + CENTER)
    end
end


----------------------------------------------------------------------
-- END
----------------------------------------------------------------------

return tmainscreen
