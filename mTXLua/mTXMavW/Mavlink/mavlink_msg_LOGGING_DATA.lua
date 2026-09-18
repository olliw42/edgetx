local LOGGING_DATA = {}
LOGGING_DATA.id = 266
LOGGING_DATA.crc_extra = 193
LOGGING_DATA.fields = {
             { "sequence", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "length", "<B" },
             { "first_message_offset", "<B" },
             { "data", "<B", 249 },
             }
return LOGGING_DATA
