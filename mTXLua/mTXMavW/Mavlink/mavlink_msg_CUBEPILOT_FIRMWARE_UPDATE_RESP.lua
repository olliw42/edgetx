local CUBEPILOT_FIRMWARE_UPDATE_RESP = {}
CUBEPILOT_FIRMWARE_UPDATE_RESP.id = 50005
CUBEPILOT_FIRMWARE_UPDATE_RESP.crc_extra = 152
CUBEPILOT_FIRMWARE_UPDATE_RESP.fields = {
             { "offset", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return CUBEPILOT_FIRMWARE_UPDATE_RESP
