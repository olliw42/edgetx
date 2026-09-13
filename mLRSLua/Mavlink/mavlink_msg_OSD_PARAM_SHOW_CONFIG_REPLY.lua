local OSD_PARAM_SHOW_CONFIG_REPLY = {}
OSD_PARAM_SHOW_CONFIG_REPLY.id = 11036
OSD_PARAM_SHOW_CONFIG_REPLY.crc_extra = 177
OSD_PARAM_SHOW_CONFIG_REPLY.fields = {
             { "request_id", "<I4" },
             { "min_value", "<f" },
             { "max_value", "<f" },
             { "increment", "<f" },
             { "result", "<B" },
             { "param_id", "<c16" },
             { "config_type", "<B" },
             }
return OSD_PARAM_SHOW_CONFIG_REPLY
