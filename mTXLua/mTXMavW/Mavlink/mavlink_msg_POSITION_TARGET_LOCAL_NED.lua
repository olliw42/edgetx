local POSITION_TARGET_LOCAL_NED = {}
POSITION_TARGET_LOCAL_NED.id = 85
POSITION_TARGET_LOCAL_NED.crc_extra = 140
POSITION_TARGET_LOCAL_NED.fields = {
             { "time_boot_ms", "<I4" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
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
return POSITION_TARGET_LOCAL_NED
