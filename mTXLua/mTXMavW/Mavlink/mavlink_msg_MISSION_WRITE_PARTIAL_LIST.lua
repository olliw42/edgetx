local MISSION_WRITE_PARTIAL_LIST = {}
MISSION_WRITE_PARTIAL_LIST.id = 38
MISSION_WRITE_PARTIAL_LIST.crc_extra = 9
MISSION_WRITE_PARTIAL_LIST.fields = {
             { "start_index", "<i2" },
             { "end_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_WRITE_PARTIAL_LIST
