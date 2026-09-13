local AVAILABLE_MODES = {}
AVAILABLE_MODES.id = 435
AVAILABLE_MODES.crc_extra = 134
AVAILABLE_MODES.fields = {
             { "custom_mode", "<I4" },
             { "properties", "<I4" },
             { "number_modes", "<B" },
             { "mode_index", "<B" },
             { "standard_mode", "<B" },
             { "mode_name", "<c35" },
             }
return AVAILABLE_MODES
