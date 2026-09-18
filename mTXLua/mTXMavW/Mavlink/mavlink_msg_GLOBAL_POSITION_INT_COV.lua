local GLOBAL_POSITION_INT_COV = {}
GLOBAL_POSITION_INT_COV.id = 63
GLOBAL_POSITION_INT_COV.crc_extra = 119
GLOBAL_POSITION_INT_COV.fields = {
             { "time_usec", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "relative_alt", "<i4" },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "covariance", "<f", 36 },
             { "estimator_type", "<B" },
             }
return GLOBAL_POSITION_INT_COV
