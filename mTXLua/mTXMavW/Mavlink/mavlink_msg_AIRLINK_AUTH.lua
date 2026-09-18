local AIRLINK_AUTH = {}
AIRLINK_AUTH.id = 52000
AIRLINK_AUTH.crc_extra = 13
AIRLINK_AUTH.fields = {
             { "login", "<c50" },
             { "password", "<c50" },
             }
return AIRLINK_AUTH
