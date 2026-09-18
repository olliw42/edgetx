local PARAM_ERROR = {}
PARAM_ERROR.id = 345
PARAM_ERROR.crc_extra = 209
PARAM_ERROR.fields = {
             { "param_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "param_id", "<c16" },
             { "error", "<B" },
             }
return PARAM_ERROR
