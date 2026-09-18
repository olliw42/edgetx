local GIMBAL_MANAGER_SET_MANUAL_CONTROL = {}
GIMBAL_MANAGER_SET_MANUAL_CONTROL.id = 288
GIMBAL_MANAGER_SET_MANUAL_CONTROL.crc_extra = 20
GIMBAL_MANAGER_SET_MANUAL_CONTROL.fields = {
             { "flags", "<I4" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "pitch_rate", "<f" },
             { "yaw_rate", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_MANAGER_SET_MANUAL_CONTROL
