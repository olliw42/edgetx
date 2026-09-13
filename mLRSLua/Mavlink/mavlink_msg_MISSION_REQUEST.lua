local MISSION_REQUEST = {}
MISSION_REQUEST.id = 40
MISSION_REQUEST.crc_extra = 230
MISSION_REQUEST.fields = {
             { "seq", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_REQUEST
