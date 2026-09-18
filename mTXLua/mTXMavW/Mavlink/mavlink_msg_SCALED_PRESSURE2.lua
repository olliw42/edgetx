local SCALED_PRESSURE2 = {}
SCALED_PRESSURE2.id = 137
SCALED_PRESSURE2.crc_extra = 195
SCALED_PRESSURE2.fields = {
             { "time_boot_ms", "<I4" },
             { "press_abs", "<f" },
             { "press_diff", "<f" },
             { "temperature", "<i2" },
             { "temperature_press_diff", "<i2" },
             }
return SCALED_PRESSURE2
