local GOPRO_SET_REQUEST = {}
GOPRO_SET_REQUEST.id = 218
GOPRO_SET_REQUEST.crc_extra = 17
GOPRO_SET_REQUEST.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "cmd_id", "<B" },
             { "value", "<B", 4 },
             }
return GOPRO_SET_REQUEST
