local ATTITUDE_QUATERNION_COV = {}
ATTITUDE_QUATERNION_COV.id = 61
ATTITUDE_QUATERNION_COV.crc_extra = 167
ATTITUDE_QUATERNION_COV.fields = {
             { "time_usec", "<I8" },
             { "q", "<f", 4 },
             { "rollspeed", "<f" },
             { "pitchspeed", "<f" },
             { "yawspeed", "<f" },
             { "covariance", "<f", 9 },
             }
return ATTITUDE_QUATERNION_COV
