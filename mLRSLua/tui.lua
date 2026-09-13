----------------------------------------------------------------------
-- UI library
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
----------------------------------------------------------------------
-- Display abstraction for mLRS telemetry UI
-- The UI is designed in a 480 x 272 coordinate system.


local ui = {}


----------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------

ui.COLOR_WHITE = lcd.RGB(0xFF, 0xFF, 0xFF)
ui.COLOR_BLACK = lcd.RGB(0x00, 0x00, 0x00)
ui.COLOR_LIGHTGREY = lcd.RGB(0xB0, 0xB0, 0xB0)
ui.COLOR_GREEN = lcd.RGB(25, 150, 50)
ui.COLOR_RED = lcd.RGB(0xE5, 0x20, 0x1E)
ui.COLOR_YELLOW = lcd.RGB(0xFF, 0xD0, 0x00)
ui.COLOR_BACKGROUND = lcd.RGB(0x08, 0x54, 0x88)
ui.COLOR_SKY = lcd.RGB(135, 206, 235)
ui.COLOR_EARTH = lcd.RGB(107, 142, 35)


----------------------------------------------------------------------
-- Drawer
----------------------------------------------------------------------

local scaleX = 1
local scaleY = 1
local txtDY  = 0

ui.DFLT   = 0
ui.SML    = SMLSIZE
ui.MID    = MIDSIZE
ui.DBL    = DBLSIZE
ui.XXL    = DBLSIZE


if LCD_W >= 800 and LCD_H >= 480 then
    scaleX = LCD_W / 480
    scaleY = 1.74 --LCD_H / 272
    txtDY  = 5
    ui.XXL    = XXLSIZE
end


local function sr(r)
    return r * 0.5*(scaleX + scaleY)
end


function ui.drawNumber(x, y, number, flags)
    lcd.drawNumber(x * scaleX, y * scaleY + txtDY, number, flags)
end

function ui.drawText(x, y, text, flags)
    lcd.drawText(x * scaleX, y * scaleY + txtDY, text, flags)
end

function ui.drawTextLines(x, y, text, flags)
    lcd.drawTextLines(x * scaleX, y * scaleY + txtDY, text, flags)
end

function ui.drawRectangle(x, y, w, h, flags)
    lcd.drawRectangle(x * scaleX, y * scaleY, w * scaleX, h * scaleY, flags)
end

function ui.drawFilledRectangle(x, y, w, h, flags)
    lcd.drawFilledRectangle(x * scaleX, y * scaleY, w * scaleX, h * scaleY, flags)
end

function ui.drawLine(x1, y1, x2, y2, flags)
    lcd.drawLine(x1 * scaleX, y1 * scaleY, x2 * scaleX, y2 * scaleY, flags)
end

function ui.drawCircle(x, y, radius, flags)
    -- use same scale for both dimensions so circles remain circles
    lcd.drawCircle(x * scaleX, y * scaleY, radius * 0.5*(scaleX + scaleY), flags)
end

function ui.drawFilledCircle(x, y, radius, flags)
    lcd.drawFilledCircle(x * scaleX, y * scaleY, radius * 0.5*(scaleX + scaleY), flags)
end

function ui.drawPoint(x, y, flags)
    lcd.drawPoint(x * scaleX, y * scaleY, flags)
end

function ui.drawBitmap(bitmap, x, y, flags)
    lcd.drawBitmap(bitmap, x * scaleX, y * scaleY, flags)
end

function ui.drawHudRectangle(pitch, roll, xmin, xmax, ymin, ymax, flags)
    lcd.drawHudRectangle(pitch, roll, xmin * scaleX, xmax * scaleX, ymin * scaleY, ymax * scaleY, flags)
end

function ui.drawLineWithClipping(x1, y1, x2, y2, xmin, xmax, ymin, ymax, pattern, flags)
    lcd.drawLineWithClipping(
        x1 * scaleX, y1 * scaleY, x2 * scaleX, y2 * scaleY,
        xmin * scaleX, xmax * scaleX, ymin * scaleY, ymax * scaleY,
        pattern, flags)
end


----------------------------------------------------------------------
-- END
----------------------------------------------------------------------

return ui
