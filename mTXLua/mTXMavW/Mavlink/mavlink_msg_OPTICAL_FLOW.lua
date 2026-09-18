local OPTICAL_FLOW = {}
OPTICAL_FLOW.id = 100
OPTICAL_FLOW.crc_extra = 175
OPTICAL_FLOW.fields = {
             { "time_usec", "<I8" },
             { "flow_comp_m_x", "<f" },
             { "flow_comp_m_y", "<f" },
             { "ground_distance", "<f" },
             { "flow_x", "<i2" },
             { "flow_y", "<i2" },
             { "sensor_id", "<B" },
             { "quality", "<B" },
             { "flow_rate_x", "<f" },
             { "flow_rate_y", "<f" },
             }
return OPTICAL_FLOW
