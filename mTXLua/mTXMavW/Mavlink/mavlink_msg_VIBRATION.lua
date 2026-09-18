local VIBRATION = {}
VIBRATION.id = 241
VIBRATION.crc_extra = 90
VIBRATION.fields = {
             { "time_usec", "<I8" },
             { "vibration_x", "<f" },
             { "vibration_y", "<f" },
             { "vibration_z", "<f" },
             { "clipping_0", "<I4" },
             { "clipping_1", "<I4" },
             { "clipping_2", "<I4" },
             }
return VIBRATION
