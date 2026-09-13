local OPTICAL_FLOW_RAD = {}
OPTICAL_FLOW_RAD.id = 106
OPTICAL_FLOW_RAD.crc_extra = 138
OPTICAL_FLOW_RAD.fields = {
             { "time_usec", "<I8" },
             { "integration_time_us", "<I4" },
             { "integrated_x", "<f" },
             { "integrated_y", "<f" },
             { "integrated_xgyro", "<f" },
             { "integrated_ygyro", "<f" },
             { "integrated_zgyro", "<f" },
             { "time_delta_distance_us", "<I4" },
             { "distance", "<f" },
             { "temperature", "<i2" },
             { "sensor_id", "<B" },
             { "quality", "<B" },
             }
return OPTICAL_FLOW_RAD
