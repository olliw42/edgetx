local LED_STRIP_STATE = {}
LED_STRIP_STATE.id = 52601
LED_STRIP_STATE.crc_extra = 102
LED_STRIP_STATE.fields = {
             { "colors", "<I4", 8 },
             { "length", "<B" },
             { "index", "<B" },
             { "id", "<B" },
             { "following_flight_mode", "<B" },
             }
return LED_STRIP_STATE
