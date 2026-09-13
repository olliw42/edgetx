local VISION_POSITION_DELTA = {}
VISION_POSITION_DELTA.id = 11011
VISION_POSITION_DELTA.crc_extra = 106
VISION_POSITION_DELTA.fields = {
             { "time_usec", "<I8" },
             { "time_delta_usec", "<I8" },
             { "angle_delta", "<f", 3 },
             { "position_delta", "<f", 3 },
             { "confidence", "<f" },
             }
return VISION_POSITION_DELTA
