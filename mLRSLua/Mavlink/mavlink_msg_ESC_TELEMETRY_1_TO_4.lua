local ESC_TELEMETRY_1_TO_4 = {}
ESC_TELEMETRY_1_TO_4.id = 11030
ESC_TELEMETRY_1_TO_4.crc_extra = 144
ESC_TELEMETRY_1_TO_4.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_1_TO_4
