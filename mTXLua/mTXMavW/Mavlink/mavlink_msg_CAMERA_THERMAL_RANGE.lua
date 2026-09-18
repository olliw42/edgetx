local CAMERA_THERMAL_RANGE = {}
CAMERA_THERMAL_RANGE.id = 277
CAMERA_THERMAL_RANGE.crc_extra = 62
CAMERA_THERMAL_RANGE.fields = {
             { "time_boot_ms", "<I4" },
             { "max", "<f" },
             { "max_point_x", "<f" },
             { "max_point_y", "<f" },
             { "min", "<f" },
             { "min_point_x", "<f" },
             { "min_point_y", "<f" },
             { "stream_id", "<B" },
             { "camera_device_id", "<B" },
             }
return CAMERA_THERMAL_RANGE
