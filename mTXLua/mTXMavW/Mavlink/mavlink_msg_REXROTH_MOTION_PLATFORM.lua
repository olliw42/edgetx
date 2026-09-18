local REXROTH_MOTION_PLATFORM = {}
REXROTH_MOTION_PLATFORM.id = 52503
REXROTH_MOTION_PLATFORM.crc_extra = 96
REXROTH_MOTION_PLATFORM.fields = {
             { "time_boot_ms", "<I4" },
             { "frame_count", "<I4" },
             { "motion_status", "<I4" },
             { "actuator1", "<f" },
             { "actuator2", "<f" },
             { "actuator3", "<f" },
             { "actuator4", "<f" },
             { "actuator5", "<f" },
             { "actuator6", "<f" },
             { "platform_setpoint_x", "<f" },
             { "platform_setpoint_y", "<f" },
             { "platform_setpoint_z", "<f" },
             { "platform_setpoint_roll", "<f" },
             { "platform_setpoint_pitch", "<f" },
             { "platform_setpoint_yaw", "<f" },
             { "effect_setpoint_x", "<f" },
             { "effect_setpoint_y", "<f" },
             { "effect_setpoint_z", "<f" },
             { "effect_setpoint_roll", "<f" },
             { "effect_setpoint_pitch", "<f" },
             { "effect_setpoint_yaw", "<f" },
             { "error_code", "<B" },
             }
return REXROTH_MOTION_PLATFORM
