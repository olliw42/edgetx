local VISION_POSITION_ESTIMATE = {}
VISION_POSITION_ESTIMATE.id = 102
VISION_POSITION_ESTIMATE.crc_extra = 158
VISION_POSITION_ESTIMATE.fields = {
             { "usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "covariance", "<f", 21 },
             { "reset_counter", "<B" },
             }
return VISION_POSITION_ESTIMATE
