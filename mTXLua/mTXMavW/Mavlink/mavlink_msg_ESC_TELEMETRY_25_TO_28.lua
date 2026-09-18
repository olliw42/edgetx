local ESC_TELEMETRY_25_TO_28 = {}
ESC_TELEMETRY_25_TO_28.id = 11043
ESC_TELEMETRY_25_TO_28.crc_extra = 193
ESC_TELEMETRY_25_TO_28.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_25_TO_28
