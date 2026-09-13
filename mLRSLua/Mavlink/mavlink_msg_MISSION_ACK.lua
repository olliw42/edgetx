local MISSION_ACK = {}
MISSION_ACK.id = 47
MISSION_ACK.crc_extra = 153
MISSION_ACK.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "type", "<B" },
             { "mission_type", "<B" },
             { "opaque_id", "<I4" },
             }
return MISSION_ACK
