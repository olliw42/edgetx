local CELLULAR_STATUS = {}
CELLULAR_STATUS.id = 334
CELLULAR_STATUS.crc_extra = 72
CELLULAR_STATUS.fields = {
             { "mcc", "<I2" },
             { "mnc", "<I2" },
             { "lac", "<I2" },
             { "status", "<B" },
             { "failure_reason", "<B" },
             { "type", "<B" },
             { "quality", "<B" },
             }
return CELLULAR_STATUS
