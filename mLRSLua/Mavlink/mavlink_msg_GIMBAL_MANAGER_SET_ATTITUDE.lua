local GIMBAL_MANAGER_SET_ATTITUDE = {}
GIMBAL_MANAGER_SET_ATTITUDE.id = 282
GIMBAL_MANAGER_SET_ATTITUDE.crc_extra = 123
GIMBAL_MANAGER_SET_ATTITUDE.fields = {
             { "flags", "<I4" },
             { "q", "<f", 4 },
             { "angular_velocity_x", "<f" },
             { "angular_velocity_y", "<f" },
             { "angular_velocity_z", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_MANAGER_SET_ATTITUDE
