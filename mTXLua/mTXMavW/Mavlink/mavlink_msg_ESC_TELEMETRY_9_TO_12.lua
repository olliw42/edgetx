local ESC_TELEMETRY_9_TO_12 = {}
ESC_TELEMETRY_9_TO_12.id = 11032
ESC_TELEMETRY_9_TO_12.crc_extra = 85
ESC_TELEMETRY_9_TO_12.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_9_TO_12
