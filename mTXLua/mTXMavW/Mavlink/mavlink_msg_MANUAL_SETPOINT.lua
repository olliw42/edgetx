local MANUAL_SETPOINT = {}
MANUAL_SETPOINT.id = 81
MANUAL_SETPOINT.crc_extra = 106
MANUAL_SETPOINT.fields = {
             { "time_boot_ms", "<I4" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "thrust", "<f" },
             { "mode_switch", "<B" },
             { "manual_override_switch", "<B" },
             }
return MANUAL_SETPOINT
