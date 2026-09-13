local LOCAL_POSITION_NED_COV = {}
LOCAL_POSITION_NED_COV.id = 64
LOCAL_POSITION_NED_COV.crc_extra = 191
LOCAL_POSITION_NED_COV.fields = {
             { "time_usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "ax", "<f" },
             { "ay", "<f" },
             { "az", "<f" },
             { "covariance", "<f", 45 },
             { "estimator_type", "<B" },
             }
return LOCAL_POSITION_NED_COV
