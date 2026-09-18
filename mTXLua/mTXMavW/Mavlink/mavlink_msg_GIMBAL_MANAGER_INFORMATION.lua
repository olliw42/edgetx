local GIMBAL_MANAGER_INFORMATION = {}
GIMBAL_MANAGER_INFORMATION.id = 280
GIMBAL_MANAGER_INFORMATION.crc_extra = 70
GIMBAL_MANAGER_INFORMATION.fields = {
             { "time_boot_ms", "<I4" },
             { "cap_flags", "<I4" },
             { "roll_min", "<f" },
             { "roll_max", "<f" },
             { "pitch_min", "<f" },
             { "pitch_max", "<f" },
             { "yaw_min", "<f" },
             { "yaw_max", "<f" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_MANAGER_INFORMATION
