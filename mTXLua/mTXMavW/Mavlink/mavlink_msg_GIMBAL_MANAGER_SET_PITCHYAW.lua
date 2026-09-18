local GIMBAL_MANAGER_SET_PITCHYAW = {}
GIMBAL_MANAGER_SET_PITCHYAW.id = 287
GIMBAL_MANAGER_SET_PITCHYAW.crc_extra = 1
GIMBAL_MANAGER_SET_PITCHYAW.fields = {
             { "flags", "<I4" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "pitch_rate", "<f" },
             { "yaw_rate", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_MANAGER_SET_PITCHYAW
