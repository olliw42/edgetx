----------------------------------------------------------------------
-- Autopilot library
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------

----------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------

local tautopilot = {}


----------------------------------------------------------------------
-- Here We GO
----------------------------------------------------------------------

-- Colors

local COLOR_WHITE = lcd.RGB(0xFF, 0xFF, 0xFF)
local COLOR_BLACK = lcd.RGB(0x00, 0x00, 0x00)
local COLOR_GREEN = lcd.RGB(25, 150, 50)
local COLOR_RED = lcd.RGB(0xE5, 0x20, 0x1E)
local COLOR_YELLOW = lcd.RGB(0xFF, 0xD0, 0x00)
local COLOR_SKY = lcd.RGB(135, 206, 235)
local COLOR_EARTH = lcd.RGB(107, 142, 35)


----------------------------------------------------------------------
-- HUD
----------------------------------------------------------------------

-- Draw helper
local function tiltedLineWithClipping(ox, oy, angle, len, xmin, xmax, ymin, ymax)
    local a = math.rad(angle)

    local xx = math.cos(a) * len * 0.5
    local yy = math.sin(a) * len * 0.5

    local x0 = ox - xx
    local x1 = ox + xx
    local y0 = oy - yy
    local y1 = oy + yy

    lcd.drawLineWithClipping(
        x0, y0, x1, y1,
        xmin, xmax, ymin, ymax,
        DOTTED, CUSTOM_COLOR)
end

-- Compass
local hudCompassTicks = {
    "N", nil, "NE", nil, "E", nil, "SE", nil, "S", nil, "SW", nil, "W", nil, "NW", nil
}

-- HUD frame
local function drawHudFrame(mavsdk, x, y, h)
    if mavsdk.Attitude == nil then
        return
    end
    local pitch = math.deg(mavsdk.Attitude.pitch)
    local roll = math.deg(mavsdk.Attitude.roll)

    local minY = y
    local maxY = y + h
    local minX = x - 120
    local maxX = x + 120

    -- sky
    lcd.setColor(CUSTOM_COLOR, COLOR_SKY)
    lcd.drawFilledRectangle(
        minX, minY, maxX - minX, maxY - minY,
        CUSTOM_COLOR + SOLID)

    -- earth / artificial horizon
    lcd.setColor(CUSTOM_COLOR, COLOR_EARTH)
    lcd.drawHudRectangle(
        pitch, roll,
        minX, maxX, minY, maxY,
        CUSTOM_COLOR)

    -- pitch ladder geometry
    local ox
    local oy
    local cx
    local cy
    if roll == 0 or math.abs(roll) == 180 then
        ox = (minX + maxX) / 2
        oy = (minY + maxY) / 2 + pitch * 1.85
        cx = 0
        cy = 21
    else
        local r = math.rad(roll)
        ox = (minX + maxX) / 2 + math.sin(r) * pitch
        oy = (minY + maxY) / 2 + math.cos(r) * pitch * 1.85
        cx = -math.sin(r) * 21
        cy = math.cos(r) * 21
    end

    -- pitch ladder
    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    for i = 1, 8 do
        tiltedLineWithClipping(
            ox - i * cx,
            oy + i * cy,
            -roll,
            (i % 2 == 0) and 80 or 40,
            minX + 2,
            maxX - 2,
            minY + 10,
            maxY - 2)
        tiltedLineWithClipping(
            ox + i * cx,
            oy - i * cy,
            -roll,
            (i % 2 == 0) and 80 or 40,
            minX + 2,
            maxX - 2,
            minY + 10,
            maxY - 2)
    end

    -- aircraft reference
    lcd.setColor(CUSTOM_COLOR, COLOR_RED)
    lcd.drawFilledRectangle(
        (minX + maxX) / 2 - 25, (minY + maxY) / 2, 50, 2,
        CUSTOM_COLOR)
end

-- Compass ribbon
local function drawHudCompassRibbon(mavsdk, x, y)
    if mavsdk.VfrHud == nil then
        return
    end
    local heading = mavsdk.VfrHud.heading

    local minX = x - 110
    local maxX = x + 110
    local tickNo = 3
    local stepWidth = (maxX - minX - 24) / (2 * tickNo)

    local closestHeading = math.floor(heading / 22.5) * 22.5
    local closestHeadingX =  x + (closestHeading - heading) / 22.5 * stepWidth

    local tickIdx = (closestHeading / 22.5 - tickNo) % 16
    local tickX = closestHeadingX - tickNo * stepWidth

    for i = 1, 12 do
        if tickX >= minX and tickX < maxX then
            if hudCompassTicks[tickIdx + 1] == nil then
                lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
                lcd.drawLine(
                    tickX, y, tickX, y + 10,
                    SOLID, CUSTOM_COLOR)
            else
                lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
                lcd.drawText(
                    tickX, y - 3,
                    hudCompassTicks[tickIdx + 1],
                    CUSTOM_COLOR + CENTER)
            end
        end
        tickIdx = (tickIdx + 1) % 16
        tickX = tickX + stepWidth
    end

    -- heading text box
    local w = 60
    if heading < 10 then
        w = 20
    elseif heading < 100 then
        w = 40
    end
    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawFilledRectangle(
        x - w / 2, y, w, 28,
        CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x, y - 6,
        heading,
        CUSTOM_COLOR + DBLSIZE + CENTER)
end

-- Ground speed
local function drawHudGroundSpeed(mavsdk, x, y)
    if mavsdk.VfrHud == nil then
        return
    end
    local groundSpeed = mavsdk.VfrHud.groundspeed

    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawText(
        x,  y - 17 + 2,
        "SPD",
        CUSTOM_COLOR + SMLSIZE)

    lcd.drawFilledRectangle(
        x, y, 70, 28,
        CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
    if math.abs(groundSpeed) >= 10 then
        lcd.drawNumber(
            x + 2, y - 5,
            groundSpeed,
            CUSTOM_COLOR + DBLSIZE + LEFT)
    else
        lcd.drawNumber(
            x + 2, y - 5,
            groundSpeed * 10,
            CUSTOM_COLOR + DBLSIZE + LEFT + PREC1)
    end
end

-- Altitude
local function drawHudAltitude(mavsdk, x, y)
    if mavsdk.VfrHud == nil then
        return
    end
    local altitude = mavsdk.VfrHud.alt

    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawText(
        x, y - 17 + 2,
        "ALT",
        CUSTOM_COLOR + SMLSIZE + RIGHT)

    lcd.drawFilledRectangle(
        x - 70, y, 70, 28,
        CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
    if math.abs(altitude) > 99 then
        lcd.drawNumber(
            x - 2, y,
            altitude,
            CUSTOM_COLOR + MIDSIZE + RIGHT)
    elseif math.abs(altitude) >= 10 then
        lcd.drawNumber(
            x - 2, y - 5,
            altitude,
            CUSTOM_COLOR + DBLSIZE + RIGHT)
    else
        lcd.drawNumber(
            x - 2, y - 5,
            altitude * 10,
            CUSTOM_COLOR + DBLSIZE + RIGHT + PREC1)
    end
end

-- Vertical speed
local function drawHudVerticalSpeed(mavsdk, x, y)
    if mavsdk.VfrHud == nil then
        return
    end
    local verticalSpeed = mavsdk.VfrHud.climb
    lcd.setColor(CUSTOM_COLOR, COLOR_BLACK)
    lcd.drawFilledRectangle(
        x - 30, y, 60, 20,
        CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x, y - 4,
        verticalSpeed * 10,
        CUSTOM_COLOR + MIDSIZE + CENTER + PREC1)
end


-- Main drawer for HUD

function tautopilot.DrawHUD(mavsdk, x, y, h)
    drawHudFrame(mavsdk, x, y, h)
    drawHudCompassRibbon(mavsdk, x, y)
    drawHudGroundSpeed(mavsdk, x - 120, y + 58)
    drawHudAltitude(mavsdk, x + 120, y + 58)
    drawHudVerticalSpeed(mavsdk, x, y + h - 20)
end


----------------------------------------------------------------------
-- GPS
----------------------------------------------------------------------

local function latLonToDms(value, isLon)
    local sign = ""
    if value < 0 then
        sign = "-"
        value = -value
    end

    local deg = math.floor(value)
    local minFloat = (value - deg) * 60
    local min = math.floor(minFloat)
    local sec = (minFloat - min) * 60

    local suffix = ""
    if isLon then
        suffix = (sign == "-" and "W" or "E")
    else
        suffix = (sign == "-" and "S" or "N")
    end

    return string.format("%d°%02d'%04.1f\"%s", deg, min, sec, suffix)
end


-- GPS Status
-- gpsId 1: GPS1, 2: GPS2
function tautopilot.DrawGpsStatus(mavsdk, gpsId, x, y, dy)
    local txtsize1 = MIDSIZE
    local txtsize2 = DBLSIZE
    local gps
    if gpsId == 1 then
        gps = mavsdk.GpsRawInt
    elseif gpsId == 2 then
        gps = mavsdk.Gps2Raw
    else
        return
    end
    if gps == nil then
        return
    end

    local gpsfix = gps.fix_type
    local gpssat = gps.satellites_visible
    local hdop = gps.eph * 0.01

    -- GPS fix
    if gpsfix >= 3 then -- GPS_FIX_TYPE_3D_FIX
        lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_RED)
    end

    local fixstr = "No FIX"
    if gpsfix >= 3 then
        fixstr = "3D FIX"
    end

    lcd.drawText(
        x, y + 8,
        fixstr,
        CUSTOM_COLOR + txtsize1 + LEFT)

    -- Satellites
    if gpssat > 99 then
        gpssat = 0
    end
    if gpssat > 5 and gpsfix >= 3 then
        lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_RED)
    end
    lcd.drawNumber(
        x + 3, y + 30 + dy,
        gpssat,
        CUSTOM_COLOR + txtsize2)

    -- HDOP
    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    if hdop >= 10 then
        if hdop > 99 then
            hdop = 99
        end
        lcd.drawNumber(
            x + 53, y + 30 + dy,
            hdop,
            CUSTOM_COLOR + txtsize2)
    else
        lcd.drawNumber(
            x + 53, y + 30 + dy,
            hdop * 10,
            CUSTOM_COLOR + txtsize2 + PREC1)
    end
end


-- GPS Coordinates
-- sourceId 1: GPS1
-- sourceId 2: GPS2
-- sourceId 3: GLOBAL_POSITION_INT
function tautopilot.DrawGpsCoords(mavsdk, sourceId, x, y)
    local source
    local lat
    local lon
    if sourceId == 1 then
        source = mavsdk.GpsRawInt
    elseif sourceId == 2 then
        source = mavsdk.Gps2Raw
    elseif sourceId == 3 then
        source = mavsdk.GlobalPositionInt
    else
        return
    end
    if source == nil then
        return
    end

    lat = source.lat * 1e-7
    lon = source.lon * 1e-7

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawText(
        x, y,
        latLonToDms(lat, false),
        CUSTOM_COLOR)
    lcd.drawText(
        x, y + 16,
        latLonToDms(lon, true),
        CUSTOM_COLOR)
end


----------------------------------------------------------------------
-- BATTERY
----------------------------------------------------------------------

-- Battery Voltage
function tautopilot.DrawBatteryVoltage(mavsdk, x, y)
    if mavsdk.BatteryStatus == nil then
        return
    end
    local voltage = mavsdk.BatteryStatus.voltage

    -- MAVLink: millivolts, UINT16_MAX means unknown
    voltage = voltage * 0.001

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x - 18, y,
        voltage * 100,
        CUSTOM_COLOR + DBLSIZE + RIGHT + PREC2)
    lcd.drawText(
        x - 2, y + 14,
        "V",
        CUSTOM_COLOR + RIGHT)
end


-- Battery Current
function tautopilot.DrawBatteryCurrent(mavsdk, x, y)
    if mavsdk.BatteryStatus == nil then
        return
    end
    local current = mavsdk.BatteryStatus.current_battery

    -- MAVLink: 10 mA units, -1 means unknown
    if current < 0 then
        return
    end
    current = current * 0.01

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x - 18, y,
        current * 10,
        CUSTOM_COLOR + DBLSIZE + RIGHT + PREC1)

    lcd.drawText(
        x - 2, y + 14,
        "A",
        CUSTOM_COLOR + RIGHT)
end


-- Battery Remaining
function tautopilot.DrawBatteryRemaining(mavsdk, x, y)
    if mavsdk.BatteryStatus == nil then
        return
    end
    local remaining = mavsdk.BatteryStatus.battery_remaining

    -- MAVLink: -1 means unknown
    if remaining < 0 then
        return
    end

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x - 18, y,
        remaining,
        CUSTOM_COLOR + DBLSIZE + RIGHT)
    lcd.drawText(
        x - 2, y + 14,
        "%",
        CUSTOM_COLOR + RIGHT)
end


-- Battery Charge
function tautopilot.DrawBatteryCharge(mavsdk, x, y)
    if mavsdk.BatteryStatus == nil then
        return
    end
    local charge = mavsdk.BatteryStatus.current_consumed

    -- MAVLink: consumed charge in mAh, -1 means unknown
    if charge < 0 then
        return
    end

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawNumber(
        x - 40, y + 7,
        charge,
        CUSTOM_COLOR + MIDSIZE + RIGHT)
    lcd.drawText(
        x - 1, y + 14,
        "mAh",
        CUSTOM_COLOR + RIGHT)
end


----------------------------------------------------------------------
-- MORE
----------------------------------------------------------------------

-- Speeds
function tautopilot.DrawSpeeds(mavsdk, x, y)
    if mavsdk.VfrHud == nil then
        return
    end
    local groundSpeed = mavsdk.VfrHud.groundspeed
    local airSpeed = mavsdk.VfrHud.airspeed

    lcd.setColor(CUSTOM_COLOR, COLOR_WHITE)
    lcd.drawText(
        x, y,
        string.format("GS %.1f m/s", groundSpeed),
        CUSTOM_COLOR)
    lcd.drawText(
        x, y + 24,
        string.format("AS %.1f m/s", airSpeed),
        CUSTOM_COLOR)
end


-- Arming Status
function tautopilot.DrawArmingStatus(mavsdk, x, y)
    if mavsdk.Vehicle.is_armed then
        lcd.setColor(CUSTOM_COLOR, COLOR_GREEN)
        lcd.drawText(
            x, y,
            "ARMED",
            CUSTOM_COLOR + MIDSIZE + CENTER)
    else
        lcd.setColor(CUSTOM_COLOR, COLOR_YELLOW)
        lcd.drawText(
            x, y,
            "DISARMED",
            CUSTOM_COLOR + MIDSIZE + CENTER)
    end
end



----------------------------------------------------------------------
-- END: Return tautopilot
----------------------------------------------------------------------

return tautopilot

