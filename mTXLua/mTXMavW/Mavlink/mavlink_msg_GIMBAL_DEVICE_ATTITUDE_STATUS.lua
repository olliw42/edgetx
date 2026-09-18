local GIMBAL_DEVICE_ATTITUDE_STATUS = {}
GIMBAL_DEVICE_ATTITUDE_STATUS.id = 285
GIMBAL_DEVICE_ATTITUDE_STATUS.crc_extra = 137
GIMBAL_DEVICE_ATTITUDE_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "q", "<f", 4 },
             { "angular_velocity_x", "<f" },
             { "angular_velocity_y", "<f" },
             { "angular_velocity_z", "<f" },
             { "failure_flags", "<I4" },
             { "flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "delta_yaw", "<f" },
             { "delta_yaw_velocity", "<f" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_DEVICE_ATTITUDE_STATUS
