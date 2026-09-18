local LIMITS_STATUS = {}
LIMITS_STATUS.id = 167
LIMITS_STATUS.crc_extra = 144
LIMITS_STATUS.fields = {
             { "last_trigger", "<I4" },
             { "last_action", "<I4" },
             { "last_recovery", "<I4" },
             { "last_clear", "<I4" },
             { "breach_count", "<I2" },
             { "limits_state", "<B" },
             { "mods_enabled", "<B" },
             { "mods_required", "<B" },
             { "mods_triggered", "<B" },
             }
return LIMITS_STATUS
