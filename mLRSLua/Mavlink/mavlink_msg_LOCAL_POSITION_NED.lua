local LOCAL_POSITION_NED = {}
LOCAL_POSITION_NED.id = 32
LOCAL_POSITION_NED.crc_extra = 185
LOCAL_POSITION_NED.fields = {
             { "time_boot_ms", "<I4" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             }
return LOCAL_POSITION_NED
