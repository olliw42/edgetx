local OPEN_DRONE_ID_SELF_ID = {}
OPEN_DRONE_ID_SELF_ID.id = 12903
OPEN_DRONE_ID_SELF_ID.crc_extra = 249
OPEN_DRONE_ID_SELF_ID.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "description_type", "<B" },
             { "description", "<c23" },
             }
return OPEN_DRONE_ID_SELF_ID
