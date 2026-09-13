local GLOBAL_VISION_POSITION_ESTIMATE = {}
GLOBAL_VISION_POSITION_ESTIMATE.id = 101
GLOBAL_VISION_POSITION_ESTIMATE.crc_extra = 102
GLOBAL_VISION_POSITION_ESTIMATE.fields = {
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
return GLOBAL_VISION_POSITION_ESTIMATE
