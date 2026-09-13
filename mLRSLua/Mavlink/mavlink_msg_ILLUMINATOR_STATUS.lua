local ILLUMINATOR_STATUS = {}
ILLUMINATOR_STATUS.id = 440
ILLUMINATOR_STATUS.crc_extra = 66
ILLUMINATOR_STATUS.fields = {
             { "uptime_ms", "<I4" },
             { "error_status", "<I4" },
             { "brightness", "<f" },
             { "strobe_period", "<f" },
             { "strobe_duty_cycle", "<f" },
             { "temp_c", "<f" },
             { "min_strobe_period", "<f" },
             { "max_strobe_period", "<f" },
             { "enable", "<B" },
             { "mode_bitmask", "<B" },
             { "mode", "<B" },
             }
return ILLUMINATOR_STATUS
