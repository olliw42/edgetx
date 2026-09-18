local OPEN_DRONE_ID_AUTHENTICATION = {}
OPEN_DRONE_ID_AUTHENTICATION.id = 12902
OPEN_DRONE_ID_AUTHENTICATION.crc_extra = 140
OPEN_DRONE_ID_AUTHENTICATION.fields = {
             { "timestamp", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "authentication_type", "<B" },
             { "data_page", "<B" },
             { "last_page_index", "<B" },
             { "length", "<B" },
             { "authentication_data", "<B", 23 },
             }
return OPEN_DRONE_ID_AUTHENTICATION
