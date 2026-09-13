local ESC_TELEMETRY_29_TO_32 = {}
ESC_TELEMETRY_29_TO_32.id = 11044
ESC_TELEMETRY_29_TO_32.crc_extra = 189
ESC_TELEMETRY_29_TO_32.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_29_TO_32
