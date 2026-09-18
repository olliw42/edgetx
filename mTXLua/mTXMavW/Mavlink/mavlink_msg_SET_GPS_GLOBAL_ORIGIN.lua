local SET_GPS_GLOBAL_ORIGIN = {}
SET_GPS_GLOBAL_ORIGIN.id = 48
SET_GPS_GLOBAL_ORIGIN.crc_extra = 41
SET_GPS_GLOBAL_ORIGIN.fields = {
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "altitude", "<i4" },
             { "target_system", "<B" },
             { "time_usec", "<I8" },
             }
return SET_GPS_GLOBAL_ORIGIN
