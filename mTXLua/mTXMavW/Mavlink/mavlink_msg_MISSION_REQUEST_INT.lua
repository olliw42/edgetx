local MISSION_REQUEST_INT = {}
MISSION_REQUEST_INT.id = 51
MISSION_REQUEST_INT.crc_extra = 196
MISSION_REQUEST_INT.fields = {
             { "seq", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_REQUEST_INT
