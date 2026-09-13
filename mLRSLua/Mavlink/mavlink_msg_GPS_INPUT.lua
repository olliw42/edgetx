local GPS_INPUT = {}
GPS_INPUT.id = 232
GPS_INPUT.crc_extra = 151
GPS_INPUT.fields = {
             { "time_usec", "<I8" },
             { "time_week_ms", "<I4" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<f" },
             { "hdop", "<f" },
             { "vdop", "<f" },
             { "vn", "<f" },
             { "ve", "<f" },
             { "vd", "<f" },
             { "speed_accuracy", "<f" },
             { "horiz_accuracy", "<f" },
             { "vert_accuracy", "<f" },
             { "ignore_flags", "<I2" },
             { "time_week", "<I2" },
             { "gps_id", "<B" },
             { "fix_type", "<B" },
             { "satellites_visible", "<B" },
             { "yaw", "<I2" },
             }
return GPS_INPUT
