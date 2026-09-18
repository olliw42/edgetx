local GPS_RAW_INT = {}
GPS_RAW_INT.id = 24
GPS_RAW_INT.crc_extra = 24
GPS_RAW_INT.fields = {
             { "time_usec", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "eph", "<I2" },
             { "epv", "<I2" },
             { "vel", "<I2" },
             { "cog", "<I2" },
             { "fix_type", "<B" },
             { "satellites_visible", "<B" },
             { "alt_ellipsoid", "<i4" },
             { "h_acc", "<I4" },
             { "v_acc", "<I4" },
             { "vel_acc", "<I4" },
             { "hdg_acc", "<I4" },
             { "yaw", "<I2" },
             }
return GPS_RAW_INT
