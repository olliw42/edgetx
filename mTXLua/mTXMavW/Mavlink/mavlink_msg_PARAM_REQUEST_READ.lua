local PARAM_REQUEST_READ = {}
PARAM_REQUEST_READ.id = 20
PARAM_REQUEST_READ.crc_extra = 214
PARAM_REQUEST_READ.fields = {
             { "param_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "param_id", "<c16" },
             }
return PARAM_REQUEST_READ
