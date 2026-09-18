local TUNNEL = {}
TUNNEL.id = 385
TUNNEL.crc_extra = 147
TUNNEL.fields = {
             { "payload_type", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "payload_length", "<B" },
             { "payload", "<B", 128 },
             }
return TUNNEL
