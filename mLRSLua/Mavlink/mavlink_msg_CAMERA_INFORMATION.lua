local CAMERA_INFORMATION = {}
CAMERA_INFORMATION.id = 259
CAMERA_INFORMATION.crc_extra = 92
CAMERA_INFORMATION.fields = {
             { "time_boot_ms", "<I4" },
             { "firmware_version", "<I4" },
             { "focal_length", "<f" },
             { "sensor_size_h", "<f" },
             { "sensor_size_v", "<f" },
             { "flags", "<I4" },
             { "resolution_h", "<I2" },
             { "resolution_v", "<I2" },
             { "cam_definition_version", "<I2" },
             { "vendor_name", "<B", 32 },
             { "model_name", "<B", 32 },
             { "lens_id", "<B" },
             { "cam_definition_uri", "<c140" },
             { "gimbal_device_id", "<B" },
             { "camera_device_id", "<B" },
             }
return CAMERA_INFORMATION
