local HOME_POSITION = {}
HOME_POSITION.id = 242
HOME_POSITION.crc_extra = 104
HOME_POSITION.fields = {
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
             { "time_usec", "<I8" },
             }
return HOME_POSITION
