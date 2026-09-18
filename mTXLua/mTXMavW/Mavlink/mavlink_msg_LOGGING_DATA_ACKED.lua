local LOGGING_DATA_ACKED = {}
LOGGING_DATA_ACKED.id = 267
LOGGING_DATA_ACKED.crc_extra = 35
LOGGING_DATA_ACKED.fields = {
             { "sequence", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "length", "<B" },
             { "first_message_offset", "<B" },
             { "data", "<B", 249 },
             }
return LOGGING_DATA_ACKED
