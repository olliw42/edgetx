local MISSION_COUNT = {}
MISSION_COUNT.id = 44
MISSION_COUNT.crc_extra = 221
MISSION_COUNT.fields = {
             { "count", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mission_type", "<B" },
             { "opaque_id", "<I4" },
             }
return MISSION_COUNT
