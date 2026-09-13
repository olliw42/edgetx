local GPS_INJECT_DATA = {}
GPS_INJECT_DATA.id = 123
GPS_INJECT_DATA.crc_extra = 250
GPS_INJECT_DATA.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "len", "<B" },
             { "data", "<B", 110 },
             }
return GPS_INJECT_DATA
