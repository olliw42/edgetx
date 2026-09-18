local VISION_SPEED_ESTIMATE = {}
VISION_SPEED_ESTIMATE.id = 103
VISION_SPEED_ESTIMATE.crc_extra = 208
VISION_SPEED_ESTIMATE.fields = {
             { "usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "covariance", "<f", 9 },
             { "reset_counter", "<B" },
             }
return VISION_SPEED_ESTIMATE
