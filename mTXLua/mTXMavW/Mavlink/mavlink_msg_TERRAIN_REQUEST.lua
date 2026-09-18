local TERRAIN_REQUEST = {}
TERRAIN_REQUEST.id = 133
TERRAIN_REQUEST.crc_extra = 6
TERRAIN_REQUEST.fields = {
             { "mask", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "grid_spacing", "<I2" },
             }
return TERRAIN_REQUEST
