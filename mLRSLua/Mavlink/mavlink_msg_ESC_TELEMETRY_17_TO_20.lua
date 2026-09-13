local ESC_TELEMETRY_17_TO_20 = {}
ESC_TELEMETRY_17_TO_20.id = 11041
ESC_TELEMETRY_17_TO_20.crc_extra = 208
ESC_TELEMETRY_17_TO_20.fields = {
             { "voltage", "<I2", 4 },
             { "current", "<I2", 4 },
             { "totalcurrent", "<I2", 4 },
             { "rpm", "<I2", 4 },
             { "count", "<I2", 4 },
             { "temperature", "<B", 4 },
             }
return ESC_TELEMETRY_17_TO_20
