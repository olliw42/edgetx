local FENCE_STATUS = {}
FENCE_STATUS.id = 162
FENCE_STATUS.crc_extra = 189
FENCE_STATUS.fields = {
             { "breach_time", "<I4" },
             { "breach_count", "<I2" },
             { "breach_status", "<B" },
             { "breach_type", "<B" },
             { "breach_mitigation", "<B" },
             }
return FENCE_STATUS
