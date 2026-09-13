local ESC_TELEMETRY_21_TO_24 = {}
ESC_TELEMETRY_21_TO_24.id = 11042
ESC_TELEMETRY_21_TO_24.crc_extra = 201
ESC_TELEMETRY_21_TO_24.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_21_TO_24
