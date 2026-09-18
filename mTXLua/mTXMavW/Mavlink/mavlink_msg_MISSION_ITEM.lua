local MISSION_ITEM = {}
MISSION_ITEM.id = 39
MISSION_ITEM.crc_extra = 254
MISSION_ITEM.fields = {
             { "param1", "<f" },
             { "param2", "<f" },
             { "param3", "<f" },
             { "param4", "<f" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "seq", "<I2" },
             { "command", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "frame", "<B" },
             { "current", "<B" },
             { "autocontinue", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_ITEM
