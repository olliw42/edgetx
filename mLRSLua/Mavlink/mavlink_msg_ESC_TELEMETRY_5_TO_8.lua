local ESC_TELEMETRY_5_TO_8 = {}
ESC_TELEMETRY_5_TO_8.id = 11031
ESC_TELEMETRY_5_TO_8.crc_extra = 133
ESC_TELEMETRY_5_TO_8.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_5_TO_8
