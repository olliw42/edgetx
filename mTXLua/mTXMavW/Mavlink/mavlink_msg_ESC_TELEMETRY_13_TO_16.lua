local ESC_TELEMETRY_13_TO_16 = {}
ESC_TELEMETRY_13_TO_16.id = 11040
ESC_TELEMETRY_13_TO_16.crc_extra = 132
ESC_TELEMETRY_13_TO_16.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_13_TO_16
