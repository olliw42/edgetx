local AVSS_DRONE_POSITION = {}
AVSS_DRONE_POSITION.id = 60051
AVSS_DRONE_POSITION.crc_extra = 245
AVSS_DRONE_POSITION.fields = {
             { "time_boot_ms", "<I4" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "ground_alt", "<f" },
             { "barometer_alt", "<f" },
             }
return AVSS_DRONE_POSITION
