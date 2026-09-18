local GIMBAL_DEVICE_INFORMATION = {}
GIMBAL_DEVICE_INFORMATION.id = 283
GIMBAL_DEVICE_INFORMATION.crc_extra = 74
GIMBAL_DEVICE_INFORMATION.fields = {
             { "uid", "<I8" },
             { "time_boot_ms", "<I4" },
             { "firmware_version", "<I4" },
             { "hardware_version", "<I4" },
             { "roll_min", "<f" },
             { "roll_max", "<f" },
             { "pitch_min", "<f" },
             { "pitch_max", "<f" },
             { "yaw_min", "<f" },
             { "yaw_max", "<f" },
             { "cap_flags", "<I2" },
             { "custom_cap_flags", "<I2" },
             { "vendor_name", "<c32" },
             { "model_name", "<c32" },
             { "custom_name", "<c32" },
             { "gimbal_device_id", "<B" },
             }
return GIMBAL_DEVICE_INFORMATION
