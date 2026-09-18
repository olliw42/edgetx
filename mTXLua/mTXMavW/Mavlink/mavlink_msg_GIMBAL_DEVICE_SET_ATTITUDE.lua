local GIMBAL_DEVICE_SET_ATTITUDE = {}
GIMBAL_DEVICE_SET_ATTITUDE.id = 284
GIMBAL_DEVICE_SET_ATTITUDE.crc_extra = 99
GIMBAL_DEVICE_SET_ATTITUDE.fields = {
             { "q", "<f", 4 },
             { "angular_velocity_x", "<f" },
             { "angular_velocity_y", "<f" },
             { "angular_velocity_z", "<f" },
             { "flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return GIMBAL_DEVICE_SET_ATTITUDE
