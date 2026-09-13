local GPS_GLOBAL_ORIGIN = {}
GPS_GLOBAL_ORIGIN.id = 49
GPS_GLOBAL_ORIGIN.crc_extra = 39
GPS_GLOBAL_ORIGIN.fields = {
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "altitude", "<i4" },
             { "time_usec", "<I8" },
             }
return GPS_GLOBAL_ORIGIN
