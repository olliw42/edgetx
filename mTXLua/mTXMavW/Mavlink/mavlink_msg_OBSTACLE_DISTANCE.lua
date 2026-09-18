local OBSTACLE_DISTANCE = {}
OBSTACLE_DISTANCE.id = 330
OBSTACLE_DISTANCE.crc_extra = 23
OBSTACLE_DISTANCE.fields = {
             { "time_usec", "<I8" },
             { "distances", "<I2", 72 },
             { "min_distance", "<I2" },
             { "max_distance", "<I2" },
             { "sensor_type", "<B" },
             { "increment", "<B" },
             { "increment_f", "<f" },
             { "angle_offset", "<f" },
             { "frame", "<B" },
             }
return OBSTACLE_DISTANCE
