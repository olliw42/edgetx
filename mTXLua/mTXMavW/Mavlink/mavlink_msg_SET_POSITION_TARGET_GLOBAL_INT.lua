local SET_POSITION_TARGET_GLOBAL_INT = {}
SET_POSITION_TARGET_GLOBAL_INT.id = 86
SET_POSITION_TARGET_GLOBAL_INT.crc_extra = 5
SET_POSITION_TARGET_GLOBAL_INT.fields = {
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
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "coordinate_frame", "<B" },
             }
return SET_POSITION_TARGET_GLOBAL_INT
