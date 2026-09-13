local GLOBAL_POSITION = {}
GLOBAL_POSITION.id = 296
GLOBAL_POSITION.crc_extra = 50
GLOBAL_POSITION.fields = {
             { "time_usec", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<f" },
             { "alt_ellipsoid", "<f" },
             { "eph", "<f" },
             { "epv", "<f" },
             { "id", "<B" },
             { "source", "<B" },
             { "flags", "<B" },
             }
return GLOBAL_POSITION
