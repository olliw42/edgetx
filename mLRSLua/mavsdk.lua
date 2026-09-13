----------------------------------------------------------------------
-- MAVLink SDK
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------
----------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------

local mavsdkPath1 = "/WIDGETS/mLRSMavW/Mavlink/"
local mavsdkPath2 = "/SCRIPTS/TOOLS/Mavlink/"


local function loadMavlinkMessageModule(filename)
    local scrpt, err = loadScript(mavsdkPath1 .. "mavlink_msg_" .. filename .. ".lua")
    if scrpt == nil then
        scrpt, err = loadScript(mavsdkPath2 .. "mavlink_msg_" .. filename .. ".lua")
    end    
    if scrpt == nil then
        error("Cannot load " .. filename .. ": " .. (err or "unknown error"))
    end
    return scrpt()
end


local mavsdk = {}


----------------------------------------------------------------------
-- MAVLink message definitions
----------------------------------------------------------------------

local HEARTBEAT = loadMavlinkMessageModule("HEARTBEAT")
local SYS_STATUS = loadMavlinkMessageModule("SYS_STATUS")
local ATTITUDE = loadMavlinkMessageModule("ATTITUDE")
local VFR_HUD = loadMavlinkMessageModule("VFR_HUD")
local STATUSTEXT = loadMavlinkMessageModule("STATUSTEXT")
local GPS_RAW_INT = loadMavlinkMessageModule("GPS_RAW_INT")
local GPS2_RAW = loadMavlinkMessageModule("GPS2_RAW")
local GLOBAL_POSITION_INT = loadMavlinkMessageModule("GLOBAL_POSITION_INT")
local BATTERY_STATUS = loadMavlinkMessageModule("BATTERY_STATUS")
local EKF_STATUS_REPORT = loadMavlinkMessageModule("EKF_STATUS_REPORT")

mavsdk.HEARTBEAT = HEARTBEAT
mavsdk.SYS_STATUS = SYS_STATUS
mavsdk.ATTITUDE = ATTITUDE
mavsdk.VFR_HUD = VFR_HUD
mavsdk.STATUSTEXT = STATUSTEXT
mavsdk.GPS_RAW_INT = GPS_RAW_INT
mavsdk.GPS2_RAW = GPS2_RAW
mavsdk.GLOBAL_POSITION_INT = GLOBAL_POSITION_INT
mavsdk.BATTERY_STATUS = BATTERY_STATUS
mavsdk.EKF_STATUS_REPORT = EKF_STATUS_REPORT

mavsdk.Heartbeat = nil
mavsdk.SysStatus = nil
mavsdk.Attitude = nil
mavsdk.VfrHud = nil
mavsdk.StatusText = nil
mavsdk.GpsRawInt = nil
mavsdk.Gps2Raw = nil
mavsdk.GlobalPositionInt = nil
mavsdk.BatteryStatus = nil
mavsdk.EkfStatusReport = nil


----------------------------------------------------------------------
-- Callbacks
----------------------------------------------------------------------

mavsdk.handleMessageCallback = nil


----------------------------------------------------------------------
-- Vehicle Classes
----------------------------------------------------------------------

mavsdk.VEHICLECLASS_UNKNOWN = 0
mavsdk.VEHICLECLASS_COPTER  = 1
mavsdk.VEHICLECLASS_PLANE   = 2
mavsdk.VEHICLECLASS_ROVER   = 3


local function getVehicleClass(mavType)
    if mavType == 2 or   -- MAV_TYPE_QUADROTOR
       mavType == 3 or   -- MAV_TYPE_COAXIAL
       mavType == 4 or   -- MAV_TYPE_HELICOPTER
       mavType == 13 or  -- MAV_TYPE_HEXAROTOR
       mavType == 14 or  -- MAV_TYPE_OCTOROTOR
       mavType == 15 or  -- MAV_TYPE_TRICOPTER
       mavType == 18 then -- MAV_TYPE_DODECAROTOR
        return mavsdk.VEHICLECLASS_COPTER

    elseif mavType == 1 or  -- MAV_TYPE_FIXED_WING
           mavType == 19 or -- MAV_TYPE_FLAPPING_WING
           mavType == 20 then -- MAV_TYPE_KITE
        return mavsdk.VEHICLECLASS_PLANE

    elseif mavType == 10 or -- MAV_TYPE_GROUND_ROVER
           mavType == 11 then -- MAV_TYPE_SURFACE_BOAT
        return mavsdk.VEHICLECLASS_ROVER
    end

    return mavsdk.VEHICLECLASS_UNKNOWN
end


----------------------------------------------------------------------
-- Vehicle
----------------------------------------------------------------------

local MAV_MODE_FLAG_SAFETY_ARMED = 128

local vehicle = {
    was_connected = false,
    was_armed = false,
}    

mavsdk.Vehicle = {
    sysid = 0,
    compid = 0,
    autopilot = 0,
    type = 0,
    class = mavsdk.VEHICLECLASS_UNKNOWN,
    -- state
    is_connected = false,
    is_armed = false,
    connected_has_changed = false,
    arm_has_changed = false,
    -- not really for user
    tlast_10ms = 0,
}


local function updateVehicleFromHeartbeat(payload)
    mavsdk.Vehicle.is_armed = ((payload.base_mode & MAV_MODE_FLAG_SAFETY_ARMED) ~= 0)
    mavsdk.Vehicle.is_connected = true
    mavsdk.Vehicle.tlast_10ms = getTime()
end   


local function waitForAutopilot(msg)
    if mavsdk.Vehicle.sysid ~= 0 then return false; end -- found, no need to wait anymore
  
    if msg.msgid == HEARTBEAT.id then
        local payload = mavlinkDecode(HEARTBEAT, msg)
        if payload == nil then 
            return true -- still needs to wait
        end

        if payload.autopilot == 3 then -- MAV_AUTOPILOT_ARDUPILOTMEGA = 3
            mavsdk.Vehicle.sysid = msg.sysid
            mavsdk.Vehicle.compid = msg.compid
            mavsdk.Vehicle.autopilot = payload.autopilot
            mavsdk.Vehicle.type = payload.type
            mavsdk.Vehicle.class = getVehicleClass(payload.type)            
            updateVehicleFromHeartbeat(payload)
            mavsdk.Heartbeat = payload
            return false
        end
    end
    
    return true -- still needs to wait
end


local function updateAutopilotStatus()
    local tnow_10ms = getTime()
    
    if tnow_10ms - mavsdk.Vehicle.tlast_10ms > 300 then
        mavsdk.Vehicle.is_connected = false
    end
    
    if (mavsdk.Vehicle.is_connected and not vehicle.was_connected) or
       (not mavsdk.Vehicle.is_connected and vehicle.was_connected) then
        mavsdk.Vehicle.connected_has_changed = true
    else
        mavsdk.Vehicle.connected_has_changed = false
    end    
    vehicle.was_connected = mavsdk.Vehicle.is_connected
    
    if (mavsdk.Vehicle.is_armed and not vehicle.was_armed) or
       (not mavsdk.Vehicle.is_armed and vehicle.was_armed) then
        mavsdk.Vehicle.arm_has_changed = true
    else
        mavsdk.Vehicle.arm_has_changed = false
    end    
    vehicle.was_armed = mavsdk.Vehicle.is_armed
end  


----------------------------------------------------------------------
-- Internal state
----------------------------------------------------------------------

local rxLastSequence = nil
local rxCount = 0
local rxSize = 0
local rxSeqErrorCount = 0

local txNextSequence = 0


----------------------------------------------------------------------
-- Message sending
----------------------------------------------------------------------

function mavsdk.sendMessage(sysid, compid, msg_struct, data)
    local res = mavlinkPush(txNextSequence, sysid, compid, msg_struct, data)
    if res == nil then return false end
    
    txNextSequence = txNextSequence + 1 -- prepare for next
    if txNextSequence >= 256 then txNextSequence = 0 end
    
    return true
end


----------------------------------------------------------------------
-- Message handling
----------------------------------------------------------------------

local function handleMessage(msg)
    if waitForAutopilot(msg) then return end

    -- only accept messages from the autopilot
    if msg.sysid ~= mavsdk.Vehicle.sysid or  msg.compid ~= mavsdk.Vehicle.compid then
        return
    end

    -- some status
    rxCount = rxCount + 1
    rxSize = rxSize + msg.len
    if rxLastSequence ~= nil then
        local expected = rxLastSequence + 1
        if expected >= 256 then expected = 0 end
        if expected ~= msg.seq then rxSeqErrorCount = rxSeqErrorCount + 1 end
    end
    rxLastSequence = msg.seq

    -- decode messages we're interested in
    if msg.msgid == HEARTBEAT.id then
        local payload = mavlinkDecode(HEARTBEAT, msg)
        if payload ~= nil then
            updateVehicleFromHeartbeat(payload)
            mavsdk.Heartbeat = payload
        end

    elseif msg.msgid == SYS_STATUS.id then
        local payload = mavlinkDecode(SYS_STATUS, msg)
        if payload ~= nil then
            mavsdk.SysStatus = payload
        end

    elseif msg.msgid == ATTITUDE.id then  -- AP STREAM EXTRA1
        local payload = mavlinkDecode(ATTITUDE, msg)
        if payload ~= nil then
            mavsdk.Attitude = payload
        end

    elseif msg.msgid == VFR_HUD.id then  -- AP STREAM EXTRA2
        local payload = mavlinkDecode(VFR_HUD, msg)
        if payload ~= nil then
            mavsdk.VfrHud = payload
        end

    elseif msg.msgid == STATUSTEXT.id then
        local payload = mavlinkDecode(STATUSTEXT, msg)
        if payload ~= nil then
            mavsdk.StatusText = payload
            mavsdk.StatusText.updated = true
        end
        
    elseif msg.msgid == GPS_RAW_INT.id then  -- AP STREAM EXTENDED_STATUS
        local payload = mavlinkDecode(GPS_RAW_INT, msg)
        if payload ~= nil then
            mavsdk.GpsRawInt = payload
        end
        
    elseif msg.msgid == GPS2_RAW.id then  -- AP STREAM EXTENDED_STATUS
        local payload = mavlinkDecode(GPS2_RAW, msg)
        if payload ~= nil then
            mavsdk.Gps2Raw = payload
        end
        
    elseif msg.msgid == GLOBAL_POSITION_INT.id then  -- AP STREAM STREAM_POSITION
        local payload = mavlinkDecode(GLOBAL_POSITION_INT, msg)
        if payload ~= nil then
            mavsdk.GlobalPositionInt = payload
        end
        
    elseif msg.msgid == BATTERY_STATUS.id then  -- AP STREAM EXTRA3
        local payload = mavlinkDecode(BATTERY_STATUS, msg)
        if payload ~= nil then
            mavsdk.BatteryStatus = payload
            local voltage = 0
            local cellcount = 0
            local validcellcount = true
            for i = 1, 10 do
                local v = payload.voltages[i]
                if v ~= 65535 then
                    voltage = voltage + v
                    cellcount = cellcount + 1
                    if v == 65534 then
                        validcellcount = false
                    end
                end
            end
            for i = 1, 4 do
                local v = payload.voltages_ext[i]
                if v ~= 0 then
                    voltage = voltage + v
                    cellcount = cellcount + 1
                end
            end
            if not validcellcount then cellcount = -1 end
            mavsdk.BatteryStatus.voltage = voltage
            mavsdk.BatteryStatus.cellcount = cellcount
        end
        
    elseif msg.msgid == EKF_STATUS_REPORT.id then  -- AP STREAM EXTRA3
        local payload = mavlinkDecode(EKF_STATUS_REPORT, msg)
        if payload ~= nil then
            mavsdk.EkfStatusReport = payload
        end
        
    else
        -- callback
        if mavsdk.handleMessageCallback then
            mavsdk.handleMessageCallback(msg)
        end

    end -- end of decode messages
end


----------------------------------------------------------------------
-- Public functions
----------------------------------------------------------------------

function mavsdk.Do()
    -- process all currently available MAVLink messages
    while true do
        local msg = mavlinkPop()
        if msg == nil then
            break
        end
        handleMessage(msg)
    end
    
    -- autopilot status handling
    updateAutopilotStatus()    
    
end


function mavsdk.GetStats()
    return {
        rxCount = rxCount,
        rxSize = rxSize,
        rxSeqErrorCount = rxSeqErrorCount,
    }
end


----------------------------------------------------------------------
-- Convenience Functions
----------------------------------------------------------------------

function mavsdk.positionOk()
    local gps = mavsdk.GpsRawInt
    if gps == nil or gps.fix_type < 3 or gps.satellites_visible < 7 then
        return false
    end

    if mavsdk.Vehicle.class == mavsdk.VEHICLECLASS_COPTER then -- do only for copter
        local ekf = mavsdk.EkfStatusReport
        if ekf ~= nil then -- TODO: what to do if we don't get it? never posfix or ignore?
            -- EKF_VELOCITY_HORIZ = 2
            -- EKF_POS_HORIZ_ABS = 16
            if (ekf.flags & 2) == 0 then return false end
            if (ekf.flags & 16) == 0 then return false end
        end    
    end
    
    return true
end


----------------------------------------------------------------------
-- Connect/Disconnect Handler
----------------------------------------------------------------------

function mavsdk.onConnect()
end

function mavsdk.onDisconnect()
end


----------------------------------------------------------------------
-- END: Return mavsdk
----------------------------------------------------------------------

return mavsdk
