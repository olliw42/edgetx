local STORM32_GIMBAL_MANAGER_CONTROL = {}
STORM32_GIMBAL_MANAGER_CONTROL.id = 60012
STORM32_GIMBAL_MANAGER_CONTROL.crc_extra = 99
STORM32_GIMBAL_MANAGER_CONTROL.fields = {
             { "q", "<f", 4 },
             { "angular_velocity_x", "<f" },
             { "angular_velocity_y", "<f" },
             { "angular_velocity_z", "<f" },
             { "device_flags", "<I2" },
             { "manager_flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "gimbal_id", "<B" },
             { "client", "<B" },
             }
return STORM32_GIMBAL_MANAGER_CONTROL
