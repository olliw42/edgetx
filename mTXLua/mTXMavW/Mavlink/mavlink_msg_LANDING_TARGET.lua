local LANDING_TARGET = {}
LANDING_TARGET.id = 149
LANDING_TARGET.crc_extra = 200
LANDING_TARGET.fields = {
             { "time_usec", "<I8" },
             { "angle_x", "<f" },
             { "angle_y", "<f" },
             { "distance", "<f" },
             { "size_x", "<f" },
             { "size_y", "<f" },
             { "target_num", "<B" },
             { "frame", "<B" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "q", "<f", 4 },
             { "type", "<B" },
             { "position_valid", "<B" },
             }
return LANDING_TARGET
