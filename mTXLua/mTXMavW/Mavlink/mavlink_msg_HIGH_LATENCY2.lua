local HIGH_LATENCY2 = {}
HIGH_LATENCY2.id = 235
HIGH_LATENCY2.crc_extra = 179
HIGH_LATENCY2.fields = {
             { "timestamp", "<I4" },
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "custom_mode", "<I2" },
             { "altitude", "<i2" },
             { "target_altitude", "<i2" },
             { "target_distance", "<I2" },
             { "wp_num", "<I2" },
             { "failure_flags", "<I2" },
             { "type", "<B" },
             { "autopilot", "<B" },
             { "heading", "<B" },
             { "target_heading", "<B" },
             { "throttle", "<B" },
             { "airspeed", "<B" },
             { "airspeed_sp", "<B" },
             { "groundspeed", "<B" },
             { "windspeed", "<B" },
             { "wind_heading", "<B" },
             { "eph", "<B" },
             { "epv", "<B" },
             { "temperature_air", "<b" },
             { "climb_rate", "<b" },
             { "battery", "<b" },
             { "custom0", "<b" },
             { "custom1", "<b" },
             { "custom2", "<b" },
             }
return HIGH_LATENCY2
