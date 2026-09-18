local LOG_REQUEST_DATA = {}
LOG_REQUEST_DATA.id = 119
LOG_REQUEST_DATA.crc_extra = 116
LOG_REQUEST_DATA.fields = {
             { "ofs", "<I4" },
             { "count", "<I4" },
             { "id", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return LOG_REQUEST_DATA
