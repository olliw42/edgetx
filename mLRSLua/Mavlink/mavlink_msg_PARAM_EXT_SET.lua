local PARAM_EXT_SET = {}
PARAM_EXT_SET.id = 323
PARAM_EXT_SET.crc_extra = 78
PARAM_EXT_SET.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "param_id", "<c16" },
             { "param_value", "<c128" },
             { "param_type", "<B" },
             }
return PARAM_EXT_SET
