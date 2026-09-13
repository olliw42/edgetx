local RALLY_POINT = {}
RALLY_POINT.id = 175
RALLY_POINT.crc_extra = 138
RALLY_POINT.fields = {
             { "lat", "<i4" },
             { "lng", "<i4" },
             { "alt", "<i2" },
             { "break_alt", "<i2" },
             { "land_dir", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "idx", "<B" },
             { "count", "<B" },
             { "flags", "<B" },
             }
return RALLY_POINT
