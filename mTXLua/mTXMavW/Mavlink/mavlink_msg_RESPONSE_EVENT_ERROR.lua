local RESPONSE_EVENT_ERROR = {}
RESPONSE_EVENT_ERROR.id = 413
RESPONSE_EVENT_ERROR.crc_extra = 77
RESPONSE_EVENT_ERROR.fields = {
             { "sequence", "<I2" },
             { "sequence_oldest_available", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "reason", "<B" },
             }
return RESPONSE_EVENT_ERROR
