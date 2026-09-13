local SCALED_PRESSURE3 = {}
SCALED_PRESSURE3.id = 143
SCALED_PRESSURE3.crc_extra = 131
SCALED_PRESSURE3.fields = {
             { "time_boot_ms", "<I4" },
             { "press_abs", "<f" },
             { "press_diff", "<f" },
             { "temperature", "<i2" },
             { "temperature_press_diff", "<i2" },
             }
return SCALED_PRESSURE3
