local EVENT = {}
EVENT.id = 410
EVENT.crc_extra = 160
EVENT.fields = {
             { "id", "<I4" },
             { "event_time_boot_ms", "<I4" },
             { "sequence", "<I2" },
             { "destination_component", "<B" },
             { "destination_system", "<B" },
             { "log_levels", "<B" },
             { "arguments", "<B", 40 },
             }
return EVENT
