local SCALED_IMU = {}
SCALED_IMU.id = 26
SCALED_IMU.crc_extra = 170
SCALED_IMU.fields = {
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
return SCALED_IMU
