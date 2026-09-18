local AHRS3 = {}
AHRS3.id = 182
AHRS3.crc_extra = 229
AHRS3.fields = {
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "altitude", "<f" },
             { "lat", "<i4" },
             { "lng", "<i4" },
             { "v1", "<f" },
             { "v2", "<f" },
             { "v3", "<f" },
             { "v4", "<f" },
             }
return AHRS3
