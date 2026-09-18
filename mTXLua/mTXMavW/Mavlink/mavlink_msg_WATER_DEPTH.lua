local WATER_DEPTH = {}
WATER_DEPTH.id = 11038
WATER_DEPTH.crc_extra = 47
WATER_DEPTH.fields = {
             { "time_boot_ms", "<I4" },
             { "lat", "<i4" },
             { "lng", "<i4" },
             { "alt", "<f" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "distance", "<f" },
             { "temperature", "<f" },
             { "id", "<B" },
             { "healthy", "<B" },
             }
return WATER_DEPTH
