local WINCH_STATUS = {}
WINCH_STATUS.id = 9005
WINCH_STATUS.crc_extra = 117
WINCH_STATUS.fields = {
             { "time_usec", "<I8" },
             { "line_length", "<f" },
             { "speed", "<f" },
             { "tension", "<f" },
             { "voltage", "<f" },
             { "current", "<f" },
             { "status", "<I4" },
             { "temperature", "<i2" },
             }
return WINCH_STATUS
