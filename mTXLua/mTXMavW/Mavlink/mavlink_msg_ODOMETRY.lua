local ODOMETRY = {}
ODOMETRY.id = 331
ODOMETRY.crc_extra = 91
ODOMETRY.fields = {
             { "time_usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "q", "<f", 4 },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "rollspeed", "<f" },
             { "pitchspeed", "<f" },
             { "yawspeed", "<f" },
             { "pose_covariance", "<f", 21 },
             { "velocity_covariance", "<f", 21 },
             { "frame_id", "<B" },
             { "child_frame_id", "<B" },
             { "reset_counter", "<B" },
             { "estimator_type", "<B" },
             { "quality", "<b" },
             }
return ODOMETRY
