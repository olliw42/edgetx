local PARAM_VALUE_ARRAY = {}
PARAM_VALUE_ARRAY.id = 60041
PARAM_VALUE_ARRAY.crc_extra = 191
PARAM_VALUE_ARRAY.fields = {
             { "param_count", "<I2" },
             { "param_index_first", "<I2" },
             { "flags", "<I2" },
             { "param_array_len", "<B" },
             { "packet_buf", "<B", 248 },
             }
return PARAM_VALUE_ARRAY
