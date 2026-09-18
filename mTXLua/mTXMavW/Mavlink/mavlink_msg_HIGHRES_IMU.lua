local HIGHRES_IMU = {}
HIGHRES_IMU.id = 105
HIGHRES_IMU.crc_extra = 93
HIGHRES_IMU.fields = {
             { "time_usec", "<I8" },
             { "xacc", "<f" },
             { "yacc", "<f" },
             { "zacc", "<f" },
             { "xgyro", "<f" },
             { "ygyro", "<f" },
             { "zgyro", "<f" },
             { "xmag", "<f" },
             { "ymag", "<f" },
             { "zmag", "<f" },
             { "abs_pressure", "<f" },
             { "diff_pressure", "<f" },
             { "pressure_alt", "<f" },
             { "temperature", "<f" },
             { "fields_updated", "<I2" },
             { "id", "<B" },
             }
return HIGHRES_IMU
