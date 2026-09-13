local HIL_GPS = {}
HIL_GPS.id = 113
HIL_GPS.crc_extra = 124
HIL_GPS.fields = {
             { "time_usec", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "eph", "<I2" },
             { "epv", "<I2" },
             { "vel", "<I2" },
             { "vn", "<i2" },
             { "ve", "<i2" },
             { "vd", "<i2" },
             { "cog", "<I2" },
             { "fix_type", "<B" },
             { "satellites_visible", "<B" },
             { "id", "<B" },
             { "yaw", "<I2" },
             }
return HIL_GPS
