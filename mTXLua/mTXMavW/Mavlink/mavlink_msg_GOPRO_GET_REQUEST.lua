local GOPRO_GET_REQUEST = {}
GOPRO_GET_REQUEST.id = 216
GOPRO_GET_REQUEST.crc_extra = 50
GOPRO_GET_REQUEST.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "cmd_id", "<B" },
             }
return GOPRO_GET_REQUEST
