local GOPRO_GET_RESPONSE = {}
GOPRO_GET_RESPONSE.id = 217
GOPRO_GET_RESPONSE.crc_extra = 202
GOPRO_GET_RESPONSE.fields = {
             { "cmd_id", "<B" },
             { "status", "<B" },
             { "value", "<B", 4 },
             }
return GOPRO_GET_RESPONSE
