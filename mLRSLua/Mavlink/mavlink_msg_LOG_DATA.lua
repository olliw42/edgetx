local LOG_DATA = {}
LOG_DATA.id = 120
LOG_DATA.crc_extra = 134
LOG_DATA.fields = {
             { "ofs", "<I4" },
             { "id", "<I2" },
             { "count", "<B" },
             { "data", "<B", 90 },
             }
return LOG_DATA
