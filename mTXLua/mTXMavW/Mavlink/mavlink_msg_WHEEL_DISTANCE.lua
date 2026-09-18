local WHEEL_DISTANCE = {}
WHEEL_DISTANCE.id = 9000
WHEEL_DISTANCE.crc_extra = 113
WHEEL_DISTANCE.fields = {
             { "time_usec", "<I8" },
             { "distance", "<d", 16 },
             { "count", "<B" },
             }
return WHEEL_DISTANCE
