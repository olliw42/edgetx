----------------------------------------------------------------------
-- MAVLink SDK
-- Copyright (c) OlliW @ www.olliw.eu
-- GPL3
-- https://www.gnu.org/licenses/gpl-3.0.de.html
----------------------------------------------------------------------
----------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------

local mavsdkPath1 = "/WIDGEST/mLRSMavW/Mavlink/"
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

mavsdk.HEARTBEAT = HEARTBEAT
mavsdk.SYS_STATUS = SYS_STATUS
mavsdk.ATTITUDE = ATTITUDE
mavsdk.VFR_HUD = VFR_HUD
mavsdk.STATUSTEXT = STATUSTEXT
mavsdk.GPS_RAW_INT = GPS_RAW_INT
mavsdk.GPS2_RAW = GPS2_RAW
mavsdk.GLOBAL_POSITION_INT = GLOBAL_POSITION_INT
mavsdk.BATTERY_STATUS = BATTERY_STATUS

mavsdk.Heartbeat = nil
mavsdk.SysStatus = nil
mavsdk.Attitude = nil
mavsdk.VfrHud = nil
mavsdk.StatusText = nil
mavsdk.GpsRawInt = nil
mavsdk.Gps2Raw = nil
mavsdk.GlobalPositionInt = nil
mavsdk.BatteryStatus = nil


----------------------------------------------------------------------
-- Callbacks
----------------------------------------------------------------------

mavsdk.handleMessageCallback = nil


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

    elseif msg.msgid == ATTITUDE.id then
        local payload = mavlinkDecode(ATTITUDE, msg)
        if payload ~= nil then
            mavsdk.Attitude = payload
        end

    elseif msg.msgid == VFR_HUD.id then
        local payload = mavlinkDecode(VFR_HUD, msg)
        if payload ~= nil then
            mavsdk.VfrHud = payload
        end

    elseif msg.msgid == STATUSTEXT.id then
        local payload = mavlinkDecode(STATUSTEXT, msg)
        if payload ~= nil then
            mavsdk.StatusText = payload
            mavsdk.StatusText.Updated = true
        end
        
    elseif msg.msgid == GPS_RAW_INT.id then
        local payload = mavlinkDecode(GPS_RAW_INT, msg)
        if payload ~= nil then
            mavsdk.GpsRawInt = payload
        end
        
    elseif msg.msgid == GPS2_RAW.id then
        local payload = mavlinkDecode(GPS2_RAW, msg)
        if payload ~= nil then
            mavsdk.Gps2Raw = payload
        end
        
    elseif msg.msgid == GLOBAL_POSITION_INT.id then
        local payload = mavlinkDecode(GLOBAL_POSITION_INT, msg)
        if payload ~= nil then
            mavsdk.GlobalPositionInt = payload
        end
        
    elseif msg.msgid == BATTERY_STATUS.id then
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
-- END: Return mavsdk
----------------------------------------------------------------------

return mavsdk
