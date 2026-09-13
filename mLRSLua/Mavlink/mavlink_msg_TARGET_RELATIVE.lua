local TARGET_RELATIVE = {}
TARGET_RELATIVE.id = 511
TARGET_RELATIVE.crc_extra = 28
TARGET_RELATIVE.fields = {
             { "timestamp", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "pos_std", "<f", 3 },
             { "yaw_std", "<f" },
             { "q_target", "<f", 4 },
             { "q_sensor", "<f", 4 },
             { "id", "<B" },
             { "frame", "<B" },
             { "type", "<B" },
             }
return TARGET_RELATIVE
