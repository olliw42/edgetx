local SIMSTATE = {}
SIMSTATE.id = 164
SIMSTATE.crc_extra = 154
SIMSTATE.fields = {
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "xacc", "<f" },
             { "yacc", "<f" },
             { "zacc", "<f" },
             { "xgyro", "<f" },
             { "ygyro", "<f" },
             { "zgyro", "<f" },
             { "lat", "<i4" },
             { "lng", "<i4" },
             }
return SIMSTATE
