local HIL_SENSOR = {}
HIL_SENSOR.id = 107
HIL_SENSOR.crc_extra = 108
HIL_SENSOR.fields = {
             { "time_usec", "<I8" },
             { "xacc", "<f" },
             { "yacc", "<f" },
             { "zacc", "<f" },
             { "xgyro", "<f" },
             { "ygyro", "<f" },
             { "zgyro", "<f" },
             { "xmag", "<f" },
             { "ymag", "<f" },
             { "zmag", "<f" },
             { "abs_pressure", "<f" },
             { "diff_pressure", "<f" },
             { "pressure_alt", "<f" },
             { "temperature", "<f" },
             { "fields_updated", "<I4" },
             { "id", "<B" },
             }
return HIL_SENSOR
