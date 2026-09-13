local LOGGING_ACK = {}
LOGGING_ACK.id = 268
LOGGING_ACK.crc_extra = 14
LOGGING_ACK.fields = {
             { "sequence", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return LOGGING_ACK
