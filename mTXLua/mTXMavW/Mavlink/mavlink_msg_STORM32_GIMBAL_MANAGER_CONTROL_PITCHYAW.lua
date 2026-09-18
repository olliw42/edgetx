local STORM32_GIMBAL_MANAGER_CONTROL_PITCHYAW = {}
STORM32_GIMBAL_MANAGER_CONTROL_PITCHYAW.id = 60013
STORM32_GIMBAL_MANAGER_CONTROL_PITCHYAW.crc_extra = 129
STORM32_GIMBAL_MANAGER_CONTROL_PITCHYAW.fields = {
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "pitch_rate", "<f" },
             { "yaw_rate", "<f" },
             { "device_flags", "<I2" },
             { "manager_flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "gimbal_id", "<B" },
             { "client", "<B" },
             }
return STORM32_GIMBAL_MANAGER_CONTROL_PITCHYAW
