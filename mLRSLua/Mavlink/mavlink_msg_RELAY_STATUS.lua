local RELAY_STATUS = {}
RELAY_STATUS.id = 376
RELAY_STATUS.crc_extra = 199
RELAY_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "on", "<I2" },
             { "present", "<I2" },
             }
return RELAY_STATUS
