local HIL_OPTICAL_FLOW = {}
HIL_OPTICAL_FLOW.id = 114
HIL_OPTICAL_FLOW.crc_extra = 237
HIL_OPTICAL_FLOW.fields = {
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
return HIL_OPTICAL_FLOW
