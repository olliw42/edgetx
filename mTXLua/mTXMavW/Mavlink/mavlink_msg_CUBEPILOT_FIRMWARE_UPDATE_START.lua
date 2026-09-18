local CUBEPILOT_FIRMWARE_UPDATE_START = {}
CUBEPILOT_FIRMWARE_UPDATE_START.id = 50004
CUBEPILOT_FIRMWARE_UPDATE_START.crc_extra = 240
CUBEPILOT_FIRMWARE_UPDATE_START.fields = {
             { "size", "<I4" },
             { "crc", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return CUBEPILOT_FIRMWARE_UPDATE_START
