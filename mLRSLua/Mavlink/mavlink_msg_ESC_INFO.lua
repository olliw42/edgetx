local ESC_INFO = {}
ESC_INFO.id = 290
ESC_INFO.crc_extra = 251
ESC_INFO.fields = {
             { "time_usec", "<I8" },
             { "error_count", "<I4", 4 },
             { "counter", "<I2" },
             { "failure_flags", "<I2", 4 },
             { "temperature", "<i2", 4 },
             { "index", "<B" },
             { "count", "<B" },
             { "connection_type", "<B" },
             { "info", "<B" },
             }
return ESC_INFO
