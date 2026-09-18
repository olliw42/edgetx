local ATTITUDE = {}
ATTITUDE.id = 30
ATTITUDE.crc_extra = 39
ATTITUDE.fields = {
             { "time_boot_ms", "<I4" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "rollspeed", "<f" },
             { "pitchspeed", "<f" },
             { "yawspeed", "<f" },
             }
return ATTITUDE
