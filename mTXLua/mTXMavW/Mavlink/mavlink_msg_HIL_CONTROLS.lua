local HIL_CONTROLS = {}
HIL_CONTROLS.id = 91
HIL_CONTROLS.crc_extra = 63
HIL_CONTROLS.fields = {
             { "time_usec", "<I8" },
             { "roll_ailerons", "<f" },
             { "pitch_elevator", "<f" },
             { "yaw_rudder", "<f" },
             { "throttle", "<f" },
             { "aux1", "<f" },
             { "aux2", "<f" },
             { "aux3", "<f" },
             { "aux4", "<f" },
             { "mode", "<B" },
             { "nav_mode", "<B" },
             }
return HIL_CONTROLS
