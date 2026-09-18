local OSD_PARAM_SHOW_CONFIG = {}
OSD_PARAM_SHOW_CONFIG.id = 11035
OSD_PARAM_SHOW_CONFIG.crc_extra = 128
OSD_PARAM_SHOW_CONFIG.fields = {
             { "request_id", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "osd_screen", "<B" },
             { "osd_index", "<B" },
             }
return OSD_PARAM_SHOW_CONFIG
