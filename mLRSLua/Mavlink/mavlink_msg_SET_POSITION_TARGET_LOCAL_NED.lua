local SET_POSITION_TARGET_LOCAL_NED = {}
SET_POSITION_TARGET_LOCAL_NED.id = 84
SET_POSITION_TARGET_LOCAL_NED.crc_extra = 143
SET_POSITION_TARGET_LOCAL_NED.fields = {
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
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "coordinate_frame", "<B" },
             }
return SET_POSITION_TARGET_LOCAL_NED
