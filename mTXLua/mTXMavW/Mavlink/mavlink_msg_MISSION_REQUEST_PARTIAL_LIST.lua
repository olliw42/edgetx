local MISSION_REQUEST_PARTIAL_LIST = {}
MISSION_REQUEST_PARTIAL_LIST.id = 37
MISSION_REQUEST_PARTIAL_LIST.crc_extra = 212
MISSION_REQUEST_PARTIAL_LIST.fields = {
             { "start_index", "<i2" },
             { "end_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_REQUEST_PARTIAL_LIST
