local ESC_STATUS = {}
ESC_STATUS.id = 291
ESC_STATUS.crc_extra = 10
ESC_STATUS.fields = {
             { "time_usec", "<I8" },
             { "rpm", "<i4", 4 },
             { "voltage", "<f", 4 },
             { "current", "<f", 4 },
             { "index", "<B" },
             }
return ESC_STATUS
