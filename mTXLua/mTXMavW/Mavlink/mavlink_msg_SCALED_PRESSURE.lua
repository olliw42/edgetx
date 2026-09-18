local SCALED_PRESSURE = {}
SCALED_PRESSURE.id = 29
SCALED_PRESSURE.crc_extra = 115
SCALED_PRESSURE.fields = {
             { "time_boot_ms", "<I4" },
             { "press_abs", "<f" },
             { "press_diff", "<f" },
             { "temperature", "<i2" },
             { "temperature_press_diff", "<i2" },
             }
return SCALED_PRESSURE
