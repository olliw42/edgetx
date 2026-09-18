local DEBUG_FLOAT_ARRAY = {}
DEBUG_FLOAT_ARRAY.id = 350
DEBUG_FLOAT_ARRAY.crc_extra = 232
DEBUG_FLOAT_ARRAY.fields = {
             { "time_usec", "<I8" },
             { "array_id", "<I2" },
             { "name", "<c10" },
             { "data", "<f", 58 },
             }
return DEBUG_FLOAT_ARRAY
