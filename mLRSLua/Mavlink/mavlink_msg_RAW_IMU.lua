local RAW_IMU = {}
RAW_IMU.id = 27
RAW_IMU.crc_extra = 144
RAW_IMU.fields = {
             { "time_usec", "<I8" },
             { "xacc", "<i2" },
             { "yacc", "<i2" },
             { "zacc", "<i2" },
             { "xgyro", "<i2" },
             { "ygyro", "<i2" },
             { "zgyro", "<i2" },
             { "xmag", "<i2" },
             { "ymag", "<i2" },
             { "zmag", "<i2" },
             { "id", "<B" },
             { "temperature", "<i2" },
             }
return RAW_IMU
