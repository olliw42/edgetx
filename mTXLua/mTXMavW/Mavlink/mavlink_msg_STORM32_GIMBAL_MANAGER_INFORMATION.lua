local STORM32_GIMBAL_MANAGER_INFORMATION = {}
STORM32_GIMBAL_MANAGER_INFORMATION.id = 60010
STORM32_GIMBAL_MANAGER_INFORMATION.crc_extra = 208
STORM32_GIMBAL_MANAGER_INFORMATION.fields = {
             { "device_cap_flags", "<I4" },
             { "manager_cap_flags", "<I4" },
             { "roll_min", "<f" },
             { "roll_max", "<f" },
             { "pitch_min", "<f" },
             { "pitch_max", "<f" },
             { "yaw_min", "<f" },
             { "yaw_max", "<f" },
             { "gimbal_id", "<B" },
             }
return STORM32_GIMBAL_MANAGER_INFORMATION
