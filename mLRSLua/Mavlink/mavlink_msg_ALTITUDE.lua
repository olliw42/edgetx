local ALTITUDE = {}
ALTITUDE.id = 141
ALTITUDE.crc_extra = 47
ALTITUDE.fields = {
             { "time_usec", "<I8" },
             { "altitude_monotonic", "<f" },
             { "altitude_amsl", "<f" },
             { "altitude_local", "<f" },
             { "altitude_relative", "<f" },
             { "altitude_terrain", "<f" },
             { "bottom_clearance", "<f" },
             }
return ALTITUDE
