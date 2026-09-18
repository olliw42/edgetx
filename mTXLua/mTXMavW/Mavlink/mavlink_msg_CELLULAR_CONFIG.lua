local CELLULAR_CONFIG = {}
CELLULAR_CONFIG.id = 336
CELLULAR_CONFIG.crc_extra = 245
CELLULAR_CONFIG.fields = {
             { "enable_lte", "<B" },
             { "enable_pin", "<B" },
             { "pin", "<c16" },
             { "new_pin", "<c16" },
             { "apn", "<c32" },
             { "puk", "<c16" },
             { "roaming", "<B" },
             { "response", "<B" },
             }
return CELLULAR_CONFIG
