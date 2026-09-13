local HIL_STATE = {}
HIL_STATE.id = 90
HIL_STATE.crc_extra = 183
HIL_STATE.fields = {
             { "time_usec", "<I8" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "rollspeed", "<f" },
             { "pitchspeed", "<f" },
             { "yawspeed", "<f" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "vx", "<i2" },
             { "vy", "<i2" },
             { "vz", "<i2" },
             { "xacc", "<i2" },
             { "yacc", "<i2" },
             { "zacc", "<i2" },
             }
return HIL_STATE
