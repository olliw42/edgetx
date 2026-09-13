local OSD_PARAM_CONFIG = {}
OSD_PARAM_CONFIG.id = 11033
OSD_PARAM_CONFIG.crc_extra = 195
OSD_PARAM_CONFIG.fields = {
             { "request_id", "<I4" },
             { "min_value", "<f" },
             { "max_value", "<f" },
             { "increment", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "osd_screen", "<B" },
             { "osd_index", "<B" },
             { "param_id", "<c16" },
             { "config_type", "<B" },
             }
return OSD_PARAM_CONFIG
