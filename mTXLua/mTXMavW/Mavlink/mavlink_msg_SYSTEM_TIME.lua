local SYSTEM_TIME = {}
SYSTEM_TIME.id = 2
SYSTEM_TIME.crc_extra = 137
SYSTEM_TIME.fields = {
             { "time_unix_usec", "<I8" },
             { "time_boot_ms", "<I4" },
             }
return SYSTEM_TIME
