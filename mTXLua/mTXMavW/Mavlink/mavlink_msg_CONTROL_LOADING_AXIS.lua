local CONTROL_LOADING_AXIS = {}
CONTROL_LOADING_AXIS.id = 52501
CONTROL_LOADING_AXIS.crc_extra = 240
CONTROL_LOADING_AXIS.fields = {
             { "time_boot_ms", "<I4" },
             { "position", "<f" },
             { "velocity", "<f" },
             { "force", "<f" },
             { "axis", "<B" },
             }
return CONTROL_LOADING_AXIS
