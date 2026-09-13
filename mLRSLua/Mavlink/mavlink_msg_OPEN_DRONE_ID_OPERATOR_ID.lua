local OPEN_DRONE_ID_OPERATOR_ID = {}
OPEN_DRONE_ID_OPERATOR_ID.id = 12905
OPEN_DRONE_ID_OPERATOR_ID.crc_extra = 49
OPEN_DRONE_ID_OPERATOR_ID.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "operator_id_type", "<B" },
             { "operator_id", "<c20" },
             }
return OPEN_DRONE_ID_OPERATOR_ID
