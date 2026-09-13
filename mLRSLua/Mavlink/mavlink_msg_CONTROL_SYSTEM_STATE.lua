local CONTROL_SYSTEM_STATE = {}
CONTROL_SYSTEM_STATE.id = 146
CONTROL_SYSTEM_STATE.crc_extra = 103
CONTROL_SYSTEM_STATE.fields = {
             { "time_usec", "<I8" },
             { "x_acc", "<f" },
             { "y_acc", "<f" },
             { "z_acc", "<f" },
             { "x_vel", "<f" },
             { "y_vel", "<f" },
             { "z_vel", "<f" },
             { "x_pos", "<f" },
             { "y_pos", "<f" },
             { "z_pos", "<f" },
             { "airspeed", "<f" },
             { "vel_variance", "<f", 3 },
             { "pos_variance", "<f", 3 },
             { "q", "<f", 4 },
             { "roll_rate", "<f" },
             { "pitch_rate", "<f" },
             { "yaw_rate", "<f" },
             }
return CONTROL_SYSTEM_STATE
