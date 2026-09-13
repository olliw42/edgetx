local COLLISION = {}
COLLISION.id = 247
COLLISION.crc_extra = 81
COLLISION.fields = {
             { "id", "<I4" },
             { "time_to_minimum_delta", "<f" },
             { "altitude_minimum_delta", "<f" },
             { "horizontal_minimum_delta", "<f" },
             { "src", "<B" },
             { "action", "<B" },
             { "threat_level", "<B" },
             }
return COLLISION
