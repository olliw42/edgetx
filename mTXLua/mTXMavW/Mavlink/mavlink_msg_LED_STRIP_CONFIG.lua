local LED_STRIP_CONFIG = {}
LED_STRIP_CONFIG.id = 52600
LED_STRIP_CONFIG.crc_extra = 181
LED_STRIP_CONFIG.fields = {
             { "colors", "<I4", 8 },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "mode", "<B" },
             { "index", "<B" },
             { "length", "<B" },
             { "id", "<B" },
             }
return LED_STRIP_CONFIG
