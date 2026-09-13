local SCALED_IMU3 = {}
SCALED_IMU3.id = 129
SCALED_IMU3.crc_extra = 46
SCALED_IMU3.fields = {
             { "time_boot_ms", "<I4" },
             { "xacc", "<i2" },
             { "yacc", "<i2" },
             { "zacc", "<i2" },
             { "xgyro", "<i2" },
             { "ygyro", "<i2" },
             { "zgyro", "<i2" },
             { "xmag", "<i2" },
             { "ymag", "<i2" },
             { "zmag", "<i2" },
             { "temperature", "<i2" },
             }
return SCALED_IMU3
