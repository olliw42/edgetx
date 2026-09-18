local TERRAIN_DATA = {}
TERRAIN_DATA.id = 134
TERRAIN_DATA.crc_extra = 229
TERRAIN_DATA.fields = {
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "grid_spacing", "<I2" },
             { "data", "<i2", 16 },
             { "gridbit", "<B" },
             }
return TERRAIN_DATA
