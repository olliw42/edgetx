local EKF_EXT = {}
EKF_EXT.id = 8007
EKF_EXT.crc_extra = 64
EKF_EXT.fields = {
             { "timestamp", "<I8" },
             { "Windspeed", "<f" },
             { "WindDir", "<f" },
             { "WindZ", "<f" },
             { "Airspeed", "<f" },
             { "beta", "<f" },
             { "alpha", "<f" },
             }
return EKF_EXT
