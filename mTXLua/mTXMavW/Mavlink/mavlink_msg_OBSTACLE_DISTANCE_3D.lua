local OBSTACLE_DISTANCE_3D = {}
OBSTACLE_DISTANCE_3D.id = 11037
OBSTACLE_DISTANCE_3D.crc_extra = 130
OBSTACLE_DISTANCE_3D.fields = {
             { "time_boot_ms", "<I4" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "min_distance", "<f" },
             { "max_distance", "<f" },
             { "obstacle_id", "<I2" },
             { "sensor_type", "<B" },
             { "frame", "<B" },
             }
return OBSTACLE_DISTANCE_3D
