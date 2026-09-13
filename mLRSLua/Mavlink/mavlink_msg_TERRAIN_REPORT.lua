local TERRAIN_REPORT = {}
TERRAIN_REPORT.id = 136
TERRAIN_REPORT.crc_extra = 1
TERRAIN_REPORT.fields = {
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "terrain_height", "<f" },
             { "current_height", "<f" },
             { "spacing", "<I2" },
             { "pending", "<I2" },
             { "loaded", "<I2" },
             }
return TERRAIN_REPORT
