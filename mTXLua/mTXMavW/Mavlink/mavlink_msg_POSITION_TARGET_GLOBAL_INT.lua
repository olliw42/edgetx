local POSITION_TARGET_GLOBAL_INT = {}
POSITION_TARGET_GLOBAL_INT.id = 87
POSITION_TARGET_GLOBAL_INT.crc_extra = 150
POSITION_TARGET_GLOBAL_INT.fields = {
             { "time_boot_ms", "<I4" },
             { "lat_int", "<i4" },
             { "lon_int", "<i4" },
             { "alt", "<f" },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "afx", "<f" },
             { "afy", "<f" },
             { "afz", "<f" },
             { "yaw", "<f" },
             { "yaw_rate", "<f" },
             { "type_mask", "<I2" },
             { "coordinate_frame", "<B" },
             }
return POSITION_TARGET_GLOBAL_INT
