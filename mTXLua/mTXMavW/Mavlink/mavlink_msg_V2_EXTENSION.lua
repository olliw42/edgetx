local V2_EXTENSION = {}
V2_EXTENSION.id = 248
V2_EXTENSION.crc_extra = 8
V2_EXTENSION.fields = {
             { "message_type", "<I2" },
             { "target_network", "<B" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "payload", "<B", 249 },
             }
return V2_EXTENSION
