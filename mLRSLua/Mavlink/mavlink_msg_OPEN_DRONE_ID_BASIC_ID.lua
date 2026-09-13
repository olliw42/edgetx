local OPEN_DRONE_ID_BASIC_ID = {}
OPEN_DRONE_ID_BASIC_ID.id = 12900
OPEN_DRONE_ID_BASIC_ID.crc_extra = 114
OPEN_DRONE_ID_BASIC_ID.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "id_type", "<B" },
             { "ua_type", "<B" },
             { "uas_id", "<B", 20 },
             }
return OPEN_DRONE_ID_BASIC_ID
