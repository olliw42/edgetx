local ATT_POS_MOCAP = {}
ATT_POS_MOCAP.id = 138
ATT_POS_MOCAP.crc_extra = 109
ATT_POS_MOCAP.fields = {
             { "time_usec", "<I8" },
             { "q", "<f", 4 },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "covariance", "<f", 21 },
             }
return ATT_POS_MOCAP
