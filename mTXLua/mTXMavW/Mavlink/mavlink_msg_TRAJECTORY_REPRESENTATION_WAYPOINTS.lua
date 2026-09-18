local TRAJECTORY_REPRESENTATION_WAYPOINTS = {}
TRAJECTORY_REPRESENTATION_WAYPOINTS.id = 332
TRAJECTORY_REPRESENTATION_WAYPOINTS.crc_extra = 236
TRAJECTORY_REPRESENTATION_WAYPOINTS.fields = {
             { "time_usec", "<I8" },
             { "pos_x", "<f", 5 },
             { "pos_y", "<f", 5 },
             { "pos_z", "<f", 5 },
             { "vel_x", "<f", 5 },
             { "vel_y", "<f", 5 },
             { "vel_z", "<f", 5 },
             { "acc_x", "<f", 5 },
             { "acc_y", "<f", 5 },
             { "acc_z", "<f", 5 },
             { "pos_yaw", "<f", 5 },
             { "vel_yaw", "<f", 5 },
             { "command", "<I2", 5 },
             { "valid_points", "<B" },
             }
return TRAJECTORY_REPRESENTATION_WAYPOINTS
