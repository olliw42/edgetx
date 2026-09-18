local PARAM_EXT_REQUEST_READ = {}
PARAM_EXT_REQUEST_READ.id = 320
PARAM_EXT_REQUEST_READ.crc_extra = 243
PARAM_EXT_REQUEST_READ.fields = {
             { "param_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "param_id", "<c16" },
             }
return PARAM_EXT_REQUEST_READ
