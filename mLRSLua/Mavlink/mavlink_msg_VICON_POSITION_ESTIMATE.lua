local VICON_POSITION_ESTIMATE = {}
VICON_POSITION_ESTIMATE.id = 104
VICON_POSITION_ESTIMATE.crc_extra = 56
VICON_POSITION_ESTIMATE.fields = {
             { "usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "covariance", "<f", 21 },
             }
return VICON_POSITION_ESTIMATE
