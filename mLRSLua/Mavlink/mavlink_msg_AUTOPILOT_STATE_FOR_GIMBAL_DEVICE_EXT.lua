local AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_EXT = {}
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_EXT.id = 60000
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_EXT.crc_extra = 4
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_EXT.fields = {
             { "time_boot_us", "<I8" },
             { "wind_x", "<f" },
             { "wind_y", "<f" },
             { "wind_correction_angle", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_EXT
