local SET_HOME_POSITION = {}
SET_HOME_POSITION.id = 243
SET_HOME_POSITION.crc_extra = 85
SET_HOME_POSITION.fields = {
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "altitude", "<i4" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "q", "<f", 4 },
             { "approach_x", "<f" },
             { "approach_y", "<f" },
             { "approach_z", "<f" },
             { "target_system", "<B" },
             { "time_usec", "<I8" },
             }
return SET_HOME_POSITION
