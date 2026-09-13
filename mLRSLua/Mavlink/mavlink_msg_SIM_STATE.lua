local SIM_STATE = {}
SIM_STATE.id = 108
SIM_STATE.crc_extra = 32
SIM_STATE.fields = {
             { "q1", "<f" },
             { "q2", "<f" },
             { "q3", "<f" },
             { "q4", "<f" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "xacc", "<f" },
             { "yacc", "<f" },
             { "zacc", "<f" },
             { "xgyro", "<f" },
             { "ygyro", "<f" },
             { "zgyro", "<f" },
             { "lat", "<f" },
             { "lon", "<f" },
             { "alt", "<f" },
             { "std_dev_horz", "<f" },
             { "std_dev_vert", "<f" },
             { "vn", "<f" },
             { "ve", "<f" },
             { "vd", "<f" },
             { "lat_int", "<i4" },
             { "lon_int", "<i4" },
             }
return SIM_STATE
