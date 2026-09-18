local PARAM_EXT_ACK = {}
PARAM_EXT_ACK.id = 324
PARAM_EXT_ACK.crc_extra = 132
PARAM_EXT_ACK.fields = {
             { "param_id", "<c16" },
             { "param_value", "<c128" },
             { "param_type", "<B" },
             { "param_result", "<B" },
             }
return PARAM_EXT_ACK
