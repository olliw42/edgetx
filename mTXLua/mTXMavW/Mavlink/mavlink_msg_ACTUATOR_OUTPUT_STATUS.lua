local ACTUATOR_OUTPUT_STATUS = {}
ACTUATOR_OUTPUT_STATUS.id = 375
ACTUATOR_OUTPUT_STATUS.crc_extra = 251
ACTUATOR_OUTPUT_STATUS.fields = {
             { "time_usec", "<I8" },
             { "active", "<I4" },
             { "actuator", "<f", 32 },
             }
return ACTUATOR_OUTPUT_STATUS
