local RAW_PRESSURE = {}
RAW_PRESSURE.id = 28
RAW_PRESSURE.crc_extra = 67
RAW_PRESSURE.fields = {
             { "time_usec", "<I8" },
             { "press_abs", "<i2" },
             { "press_diff1", "<i2" },
             { "press_diff2", "<i2" },
             { "temperature", "<i2" },
             }
return RAW_PRESSURE
