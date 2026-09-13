local SET_ATTITUDE_TARGET = {}
SET_ATTITUDE_TARGET.id = 82
SET_ATTITUDE_TARGET.crc_extra = 49
SET_ATTITUDE_TARGET.fields = {
             { "time_boot_ms", "<I4" },
             { "q", "<f", 4 },
             { "body_roll_rate", "<f" },
             { "body_pitch_rate", "<f" },
             { "body_yaw_rate", "<f" },
             { "thrust", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "type_mask", "<B" },
             { "thrust_body", "<f", 3 },
             }
return SET_ATTITUDE_TARGET
