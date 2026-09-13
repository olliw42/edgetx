local TRAJECTORY_REPRESENTATION_BEZIER = {}
TRAJECTORY_REPRESENTATION_BEZIER.id = 333
TRAJECTORY_REPRESENTATION_BEZIER.crc_extra = 231
TRAJECTORY_REPRESENTATION_BEZIER.fields = {
             { "time_usec", "<I8" },
             { "pos_x", "<f", 5 },
             { "pos_y", "<f", 5 },
             { "pos_z", "<f", 5 },
             { "delta", "<f", 5 },
             { "pos_yaw", "<f", 5 },
             { "valid_points", "<B" },
             }
return TRAJECTORY_REPRESENTATION_BEZIER
