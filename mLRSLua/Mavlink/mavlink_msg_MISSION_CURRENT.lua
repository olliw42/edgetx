local MISSION_CURRENT = {}
MISSION_CURRENT.id = 42
MISSION_CURRENT.crc_extra = 28
MISSION_CURRENT.fields = {
             { "seq", "<I2" },
             { "total", "<I2" },
             { "mission_state", "<B" },
             { "mission_mode", "<B" },
             { "mission_id", "<I4" },
             { "fence_id", "<I4" },
             { "rally_points_id", "<I4" },
             }
return MISSION_CURRENT
