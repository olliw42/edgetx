local HIGH_LATENCY = {}
HIGH_LATENCY.id = 234
HIGH_LATENCY.crc_extra = 150
HIGH_LATENCY.fields = {
             { "custom_mode", "<I4" },
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "roll", "<i2" },
             { "pitch", "<i2" },
             { "heading", "<I2" },
             { "heading_sp", "<i2" },
             { "altitude_amsl", "<i2" },
             { "altitude_sp", "<i2" },
             { "wp_distance", "<I2" },
             { "base_mode", "<B" },
             { "landed_state", "<B" },
             { "throttle", "<b" },
             { "airspeed", "<B" },
             { "airspeed_sp", "<B" },
             { "groundspeed", "<B" },
             { "climb_rate", "<b" },
             { "gps_nsat", "<B" },
             { "gps_fix_type", "<B" },
             { "battery_remaining", "<B" },
             { "temperature", "<b" },
             { "temperature_air", "<b" },
             { "failsafe", "<B" },
             { "wp_num", "<B" },
             }
return HIGH_LATENCY
