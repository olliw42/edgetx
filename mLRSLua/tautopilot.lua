----------------------------------------------------------------------
-- Autopilot library
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------

----------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------

local resourcesPath1 = "/WIDGETS/mLRSMavW/"
local resourcesPath2 = "/SCRIPTS/TOOLS/"


local ui = ...

local tautopilot = {}


----------------------------------------------------------------------
-- ArduPilot Flight Modes 
----------------------------------------------------------------------

local apCopterFlightMode = {
    AltHold = 2,
    Auto = 3,
    Guided = 4,
    Loiter = 5,
    Land = 9,
    PosHold = 16,
    Follow = 23,
}    


local apRoverFlightModes = {}
apRoverFlightModes[0]   = { "Manual",       "fmman" }
apRoverFlightModes[1]   = { "Acro",         "fmacro" }
apRoverFlightModes[3]   = { "Steering",     "fmchanged" }
apRoverFlightModes[4]   = { "Hold",         "fmchanged" }
apRoverFlightModes[5]   = { "Loiter",       "fmloit" }
apRoverFlightModes[6]   = { "Follow",       "fmchanged" }
apRoverFlightModes[7]   = { "Simple",       "fmchanged" }
apRoverFlightModes[10]  = { "Auto",         "fmauto" }
apRoverFlightModes[11]  = { "RTL",          "fmrtl" }
apRoverFlightModes[12]  = { "Smart RTL",    "fmsmrtrtl" }
apRoverFlightModes[15]  = { "Guided",       "fmguid" }
apRoverFlightModes[16]  = { "Initialising", "fmchanged" }

local apPlaneFlightModes = {}
apPlaneFlightModes[0]   = { "Manual",       "fmman" }
apPlaneFlightModes[1]   = { "Circle",       "fmcirc" }
apPlaneFlightModes[2]   = { "Stabilize",    "fmstab" }
apPlaneFlightModes[3]   = { "Training",     "fmtrain" }
apPlaneFlightModes[4]   = { "Acro",         "fmacro" }
apPlaneFlightModes[5]   = { "Fly by Wire A", "fmfbwa" }
apPlaneFlightModes[6]   = { "Fly by Wire B", "fmfbwb" }
apPlaneFlightModes[7]   = { "Cruise",       "fmcruise" }
apPlaneFlightModes[8]   = { "Autotune",     "fmat" }
apPlaneFlightModes[10]  = { "Auto",         "fmauto" }
apPlaneFlightModes[11]  = { "RTL",          "fmrtl" }
apPlaneFlightModes[12]  = { "Loiter",       "fmloit" }
apPlaneFlightModes[13]  = { "Take Off",     "fmtakeoff" }
apPlaneFlightModes[14]  = { "Avoid ADSB",   "fmavoid" }
apPlaneFlightModes[15]  = { "Guided",       "fmguid" }
apPlaneFlightModes[16]  = { "Initializing", "fminit" }
apPlaneFlightModes[17]  = { "QStabilize",   "fmqstab" }
apPlaneFlightModes[18]  = { "QHover",       "fmqhover" }
apPlaneFlightModes[19]  = { "QLoiter",      "fmqloit" }
apPlaneFlightModes[20]  = { "QLand",        "fmqland" }
apPlaneFlightModes[21]  = { "QRTL",         "fmqrtl" }
apPlaneFlightModes[22]  = { "QAutotune",    "fmqat" }
apPlaneFlightModes[23]  = { "QAcro",        "fmchanged" }
apPlaneFlightModes[23]  = { "Thermal",      "fmchanged" }
apPlaneFlightModes[24]  = { "Loiter Alt QLand", "fmchanged" }

local apCopterFlightModes = {}
apCopterFlightModes[0]  = { "Stabilize",    "fmstab" }
apCopterFlightModes[1]  = { "Acro",         "fmacro" }
apCopterFlightModes[2]  = { "AltHold",      "fmalthld" }
apCopterFlightModes[3]  = { "Auto",         "fmauto" }
apCopterFlightModes[4]  = { "Guided",       "fmguid" }
apCopterFlightModes[5]  = { "Loiter",       "fmloit" }
apCopterFlightModes[6]  = { "RTL",          "fmrtl" }
apCopterFlightModes[7]  = { "Circle",       "fmcirc" }
apCopterFlightModes[9]  = { "Land",         "fmland" }
apCopterFlightModes[11] = { "Drift",        "fmdrift" }
apCopterFlightModes[13] = { "Sport",        "fmsport" }
apCopterFlightModes[14] = { "Flip",         "fmflip" }
apCopterFlightModes[15] = { "AutoTune",     "fmat" }
apCopterFlightModes[16] = { "PosHold",      "fmposhld" }
apCopterFlightModes[17] = { "Brake",        "fmbrake" }
apCopterFlightModes[18] = { "Throw",        "fmthrow" }
apCopterFlightModes[19] = { "Avoid ADSB",   "fmavoid" }
apCopterFlightModes[20] = { "Guided noGPS", "fmgnogps" }
apCopterFlightModes[21] = { "Smart RTL",    "fmsmrtrtl" }
apCopterFlightModes[22] = { "FlowHold",     "fmchanged" }
apCopterFlightModes[23] = { "Follow",       "fmchanged" }
apCopterFlightModes[24] = { "ZigZag",       "fmchanged" }
apCopterFlightModes[25] = { "SystemId",     "fmchanged" }
apCopterFlightModes[26] = { "Autorotate",   "fmchanged" }
apCopterFlightModes[27] = { "Auto RTL",     "fmchanged" }
apCopterFlightModes[28] = { "Turtle",       "fmchanged" }


function tautopilot.getFlightModeStr(mavsdk)
    if mavsdk.Heartbeat == nil then return "unknown" end 
    local fm = mavsdk.Heartbeat.custom_mode
    local vc = mavsdk.Vehicle.class
    
    local fmstr = nil
    if vc == mavsdk.VEHICLECLASS_COPTER then
        fmstr = apCopterFlightModes[fm][1]
    elseif vc == mavsdk.VEHICLECLASS_PLANE then    
        fmstr = apPlaneFlightModes[fm][1]
    elseif vc == mavsdk.VEHICLECLASS_ROVER then    
        fmstr = apRoverFlightModes[fm][1]
    end    
    if fmstr == nil then fmstr = "unknown" end
    
    return fmstr
end    


local function getFlightModeSound(mavsdk)
    if mavsdk.Heartbeat == nil then return nil end
    local fm = mavsdk.Heartbeat.custom_mode
    local vc = mavsdk.Vehicle.class

    local flightModes = nil
    if vc == mavsdk.VEHICLECLASS_COPTER then
        flightModes = apCopterFlightModes
    elseif vc == mavsdk.VEHICLECLASS_PLANE then
        flightModes = apPlaneFlightModes
    elseif vc == mavsdk.VEHICLECLASS_ROVER then
        flightModes = apRoverFlightModes
    end

    if flightModes == nil or flightModes[fm] == nil then
        return nil
    end

    return flightModes[fm][2]
end


local soundsPath = nil
local lastFlightMode = nil
local lastPositionFix = nil


local function playSound(sound)
    if soundsPath == nil then
        if fstat(resourcesPath1 .. "sounds/fmacro.wav") then
            soundsPath = resourcesPath1 .. "sounds/"
        elseif fstat(resourcesPath2 .. "sounds/fmacro.wav") then
            soundsPath = resourcesPath2 .. "sounds/"
        end
    end
    if soundsPath ~= nil then
        playFile(soundsPath .. sound .. ".wav")
    end
end


function tautopilot.soundDo(mavsdk)
    -- handle connected state
    if mavsdk.Vehicle.connected_has_changed then 
        if mavsdk.Vehicle.is_connected then
            playSound("telok")
        else
            playSound("tellost")
        end
    end
    
    if not mavsdk.Vehicle.is_connected then -- don't do any other if not connected
        return
    end    
    
    -- handle arm state
    if mavsdk.Vehicle.arm_has_changed then 
        if mavsdk.Vehicle.is_armed then
            playSound("armed")
        else
            playSound("disarmed")
        end
    end

    -- handle flight mode
    if mavsdk.Heartbeat ~= nil then
        local fm = mavsdk.Heartbeat.custom_mode
        if fm ~= lastFlightMode then -- change detected
            lastFlightMode = fm
    
            local sound = getFlightModeSound(mavsdk)
            if sound ~= nil then
                playSound(sound)
            end
        end    
    end
    
    -- handle pos fix
    if mavsdk.positionOk() then    
        if not lastPositionFix then
            playSound("posfix")
        end    
        lastPositionFix = true
    else
        lastPositionFix = false
    end
end


----------------------------------------------------------------------
-- Status Text
----------------------------------------------------------------------

local statusText = {}
local statusTextIdx = 0

local statusTextSeverity = {
    [0] = { "EMR", COLOR_RED },
    [1] = { "ALR", COLOR_RED },
    [2] = { "CRT", COLOR_RED },
    [3] = { "ERR", COLOR_RED },
    [4] = { "WRN", COLOR_YELLOW },
    [5] = { "NOT", COLOR_YELLOW },
    [6] = { "INF", COLOR_WHITE },
    [7] = { "DBG", COLOR_LIGHTGREY },
}


function tautopilot.getStatusText(i)
    return statusTextIdx, statusText[i]
end


function tautopilot.statusTextDo(mavsdk)
    local st = mavsdk.StatusText
    if st == nil or not st.updated then
        return
    end
    st.updated = false

    local txt = st.text
    local sev = st.severity

    if txt == nil then return end

    if statusTextIdx > 0 and statusText[statusTextIdx].text == txt then
        statusText[statusTextIdx].count = statusText[statusTextIdx].count + 1
    else
        statusTextIdx = (statusTextIdx % 12) + 1
        statusText[statusTextIdx] = {
            text = txt,
            severity = sev,
            count = 1
        }
    end
end


----------------------------------------------------------------------
-- DRAW FUNCTIONS
----------------------------------------------------------------------

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

    ui.drawLineWithClipping(
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
    local pitch = 0
    local roll = 0
    if mavsdk.Attitude ~= nil then
        pitch = math.deg(mavsdk.Attitude.pitch)
        roll = math.deg(mavsdk.Attitude.roll)
    end

    local minY = y
    local maxY = y + h
    local minX = x - 120
    local maxX = x + 120

    -- sky
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_SKY)
    ui.drawFilledRectangle(
        minX, minY, maxX - minX, maxY - minY,
        CUSTOM_COLOR + SOLID)

    -- earth / artificial horizon
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_EARTH)
    ui.drawHudRectangle(
        pitch, roll,
        minX, maxX, minY, maxY,
        CUSTOM_COLOR)

    -- pitch ladder geometry
    local ox, oy, cx, cy
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
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
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
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
    ui.drawFilledRectangle(
        (minX + maxX) / 2 - 25, (minY + maxY) / 2, 50, 2,
        CUSTOM_COLOR)
end

-- Compass ribbon
local function drawHudCompassRibbon(mavsdk, x, y)
    local heading = 0
    if mavsdk.VfrHud ~= nil then
        heading = mavsdk.VfrHud.heading    
    end

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
                lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
                ui.drawLine(tickX, y, tickX, y + 10, SOLID, CUSTOM_COLOR)
            else
                lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
                ui.drawText(tickX, y - 3, hudCompassTicks[tickIdx + 1], CUSTOM_COLOR + ui.DFLT + CENTER)
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
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(x - w / 2, y, w, 28, CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x, y - 6, heading, CUSTOM_COLOR + ui.DBL + CENTER)
end

-- Ground speed
local function drawHudGroundSpeed(mavsdk, x, y)
    local groundSpeed = 0
    if mavsdk.VfrHud ~= nil then
        groundSpeed = mavsdk.VfrHud.groundspeed
    end

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawText(x,  y - 17 + 2, "SPD", CUSTOM_COLOR + ui.SML)

    ui.drawFilledRectangle(x, y, 70, 28, CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
    if math.abs(groundSpeed) >= 10 then
        ui.drawNumber(x + 2, y - 5, groundSpeed, CUSTOM_COLOR + ui.DBL + LEFT)
    else
        ui.drawNumber(x + 2, y - 5, groundSpeed * 10, CUSTOM_COLOR + ui.DBL + LEFT + PREC1)
    end
end

-- Altitude
local function drawHudAltitude(mavsdk, x, y)
    local altitude = 0
    if mavsdk.VfrHud ~= nil then
        altitude = mavsdk.VfrHud.alt
    end

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawText(x, y - 17 + 2, "ALT", CUSTOM_COLOR + ui.SML + RIGHT)

    ui.drawFilledRectangle(x - 70, y, 70, 28, CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
    if math.abs(altitude) > 99 then
        ui.drawNumber(x - 2, y, altitude, CUSTOM_COLOR + ui.MID + RIGHT)
    elseif math.abs(altitude) >= 10 then
        ui.drawNumber(x - 2, y - 5, altitude, CUSTOM_COLOR + ui.DBL + RIGHT)
    else
        ui.drawNumber(x - 2, y - 5, altitude * 10, CUSTOM_COLOR + ui.DBL + RIGHT + PREC1)
    end
end

-- Vertical speed
local function drawHudVerticalSpeed(mavsdk, x, y)
    local verticalSpeed = 0
    if mavsdk.VfrHud ~= nil then
        verticalSpeed = mavsdk.VfrHud.climb
    end
    
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_BLACK)
    ui.drawFilledRectangle(x - 30, y, 60, 20, CUSTOM_COLOR + SOLID)
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x, y - 4, verticalSpeed * 10, CUSTOM_COLOR + ui.MID + CENTER + PREC1)
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
-- HUD HOME Indicator
----------------------------------------------------------------------

local homeBitmap = nil
local homePos = nil


local function updateHomePosition(mavsdk)
    if mavsdk.Vehicle.arm_has_changed and mavsdk.Vehicle.is_armed then
        local gps = mavsdk.GpsRawInt
        if gps ~= nil and gps.fix_type >= 3 then
            homePos = {
                lat = gps.lat,
                lon = gps.lon
            }
        end
    end
end


local function calcHomeAngle(mavsdk)
    if not mavsdk.Vehicle.is_armed or homePos == nil then
        return 0
    end

    local gps = mavsdk.GpsRawInt
    if gps == nil then
        return 0
    end

    local lat1 = gps.lat
    local lon1 = gps.lon
    local lat0 = homePos.lat
    local lon0 = homePos.lon

    local xScale = math.cos(math.rad((lat1 + lat0) * 1e-7) * 0.5)

    local x = math.rad(0.6371) * (lon1 - lon0) * xScale
    local y = math.rad(0.6371) * (lat1 - lat0)

    local homeAngle = math.deg(math.atan2(x, y))

    if homeAngle < 0 then
        homeAngle = homeAngle + 360
    end
    
    return homeAngle
end


local function drawHomeBitmap(x, y)
    if homeBitmap == nil then
        homeBitmap = Bitmap.open(resourcesPath1 .. "img/home.png")
    end
    if homeBitmap == nil then
        homeBitmap = Bitmap.open(resourcesPath2 .. "img/home.png")
    end
    ui.drawBitmap(homeBitmap, x, y)
end


function tautopilot.drawHomeIcon(mavsdk, x, y, h)
    updateHomePosition(mavsdk)
    local homeAngle = calcHomeAngle(mavsdk)
  
    local yaw = 0
    if mavsdk.Attitude ~= nil then
        yaw = math.deg(mavsdk.Attitude.yaw)
    end

    local angleToHome = homeAngle - 180.0
    local iconAng = angleToHome - yaw

    if iconAng <= -180.0 then
        iconAng = iconAng + 360.0
    end
    if iconAng > 180.0 then
        iconAng = iconAng - 360.0
    end

    local iconDx = 0
    local iconY = y + 10
    if iconAng >= -90.0 and iconAng <= 90.0 then
        iconDx = iconAng / 90 * 130
    elseif iconAng < -90.0 then
        iconDx = -(180 + iconAng) / 90 * 130
        iconY = y + h + 3
    elseif iconAng > 90.0 then
        iconDx = (180 - iconAng) / 90 * 130
        iconY = y + h + 3
    end

    if iconDx > 120 then
        iconDx = 120
    end
    if iconDx < -120 then
        iconDx = -120
    end

    drawHomeBitmap(x - 10 + iconDx, iconY)
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
    local txtsize1 = ui.MID
    local txtsize2 = ui.DBL
    local gps = nil
    if gpsId == 1 then
        gps = mavsdk.GpsRawInt
    elseif gpsId == 2 then
        gps = mavsdk.Gps2Raw
    end
    if gps == nil then
        gps = { fix_type = 0, satellites_visible = 100, eph = 100000.0 }
    end

    local gpsfix = gps.fix_type
    local gpssat = gps.satellites_visible
    local hdop = gps.eph * 0.01

    -- GPS fix
    if gpsfix >= 3 then -- GPS_FIX_TYPE_3D_FIX
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
    end
    local fixstr = "No FIX"
    if gpsfix >= 3 then
        fixstr = "3D FIX"
    end
    ui.drawText(x, y + 8, fixstr, CUSTOM_COLOR + txtsize1 + LEFT)

    -- Satellites
    if gpssat > 99 then
        gpssat = 0
    end
    if gpssat > 5 and gpsfix >= 3 then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_RED)
    end
    ui.drawNumber(x + 3, y + 30 + dy, gpssat, CUSTOM_COLOR + txtsize2)

    -- HDOP
    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    if hdop >= 10 then
        if hdop > 99 then
            hdop = 99
        end
        ui.drawNumber(x + 53, y + 30 + dy, hdop, CUSTOM_COLOR + txtsize2)
    else
        ui.drawNumber(x + 53, y + 30 + dy, hdop * 10, CUSTOM_COLOR + txtsize2 + PREC1)
    end
end


-- GPS Coordinates
-- sourceId 1: GPS1
-- sourceId 2: GPS2
-- sourceId 3: GLOBAL_POSITION_INT
function tautopilot.DrawGpsCoords(mavsdk, sourceId, x, y)
    local source = nil
    local lat, lon
    if sourceId == 1 then
        source = mavsdk.GpsRawInt
    elseif sourceId == 2 then
        source = mavsdk.Gps2Raw
    elseif sourceId == 3 then
        source = mavsdk.GlobalPositionInt
    end
    if source == nil then
        source = { lat = 0.0, lon = 0.0 }
    end

    lat = source.lat * 1e-7
    lon = source.lon * 1e-7

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x, y, latLonToDms(lat, false), CUSTOM_COLOR + ui.DFLT)
    ui.drawText(x, y + 16, latLonToDms(lon, true), CUSTOM_COLOR + ui.DFLT)
end


----------------------------------------------------------------------
-- BATTERY
----------------------------------------------------------------------

-- Battery Voltage
function tautopilot.DrawBatteryVoltage(mavsdk, x, y)
    local voltage = 0
    if mavsdk.BatteryStatus ~= nil then
        voltage = mavsdk.BatteryStatus.voltage
    end

    -- MAVLink: millivolts, UINT16_MAX means unknown
    voltage = voltage * 0.001

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x - 18, y, voltage * 100, CUSTOM_COLOR + ui.DBL + RIGHT + PREC2)
    ui.drawText(x - 2, y + 14, "V", CUSTOM_COLOR + ui.DFLT + RIGHT)
end


-- Battery Current
function tautopilot.DrawBatteryCurrent(mavsdk, x, y)
    local current = 0
    if mavsdk.BatteryStatus ~= nil then
        current = mavsdk.BatteryStatus.current_battery
    end

    -- MAVLink: 10 mA units, -1 means unknown
    if current < 0 then
        return
    end
    current = current * 0.01

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x - 18, y, current * 10, CUSTOM_COLOR + ui.DBL + RIGHT + PREC1)
    ui.drawText(x - 2, y + 14, "A", CUSTOM_COLOR + ui.DFLT + RIGHT)
end


-- Battery Remaining
function tautopilot.DrawBatteryRemaining(mavsdk, x, y)
    local remaining = 0
    if mavsdk.BatteryStatus ~= nil then
        remaining = mavsdk.BatteryStatus.battery_remaining
    end

    -- MAVLink: -1 means unknown
    if remaining < 0 then
        return
    end

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x - 18, y, remaining, CUSTOM_COLOR + ui.DBL + RIGHT)
    ui.drawText(x - 2, y + 14, "%", CUSTOM_COLOR + ui.DFLT + RIGHT)
end


-- Battery Charge
function tautopilot.DrawBatteryCharge(mavsdk, x, y)
    local charge = 0
    if mavsdk.BatteryStatus ~= nil then
        charge = mavsdk.BatteryStatus.current_consumed
    end

    -- MAVLink: consumed charge in mAh, -1 means unknown
    if charge < 0 then
        return
    end

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawNumber(x - 40, y + 7, charge, CUSTOM_COLOR + ui.MID + RIGHT)
    ui.drawText(x - 1, y + 14, "mAh", CUSTOM_COLOR + ui.DFLT + RIGHT)
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

    lcd.setColor(CUSTOM_COLOR, ui.COLOR_WHITE)
    ui.drawText(x, y, string.format("GS %.1f m/s", groundSpeed), CUSTOM_COLOR + ui.DFLT)
    ui.drawText(x, y + 24, string.format("AS %.1f m/s", airSpeed), CUSTOM_COLOR + ui.DFLT)
end


-- Arming Status
function tautopilot.DrawArmingStatus(mavsdk, x, y)
    if mavsdk.Vehicle.is_armed then
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_GREEN)
        ui.drawText(x, y, "ARMED", CUSTOM_COLOR + ui.MID + CENTER)
    else
        lcd.setColor(CUSTOM_COLOR, ui.COLOR_YELLOW)
        ui.drawText(x, y, "DISARMED", CUSTOM_COLOR + ui.MID + CENTER)
    end
end


----------------------------------------------------------------------
-- Connect/Disconnect Handler
----------------------------------------------------------------------

function tautopilot.onConnect()
end

function tautopilot.onDisconnect()
    lastFlightMode = nil
    lastPositionFix = nil
    statusText = {}
    statusTextIdx = 0
end


----------------------------------------------------------------------
-- END: Return tautopilot
----------------------------------------------------------------------

return tautopilot

