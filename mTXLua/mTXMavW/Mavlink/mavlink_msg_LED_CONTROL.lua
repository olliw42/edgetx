local LED_CONTROL = {}
LED_CONTROL.id = 186
LED_CONTROL.crc_extra = 72
LED_CONTROL.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "instance", "<B" },
             { "pattern", "<B" },
             { "custom_len", "<B" },
             { "custom_bytes", "<B", 24 },
             }
return LED_CONTROL
