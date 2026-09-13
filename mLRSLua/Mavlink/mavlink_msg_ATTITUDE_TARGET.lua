local ATTITUDE_TARGET = {}
ATTITUDE_TARGET.id = 83
ATTITUDE_TARGET.crc_extra = 22
ATTITUDE_TARGET.fields = {
             { "time_boot_ms", "<I4" },
             { "q", "<f", 4 },
             { "body_roll_rate", "<f" },
             { "body_pitch_rate", "<f" },
             { "body_yaw_rate", "<f" },
             { "thrust", "<f" },
             { "type_mask", "<B" },
             }
return ATTITUDE_TARGET
