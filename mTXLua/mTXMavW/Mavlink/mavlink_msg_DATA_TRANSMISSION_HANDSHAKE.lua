local DATA_TRANSMISSION_HANDSHAKE = {}
DATA_TRANSMISSION_HANDSHAKE.id = 130
DATA_TRANSMISSION_HANDSHAKE.crc_extra = 29
DATA_TRANSMISSION_HANDSHAKE.fields = {
             { "size", "<I4" },
             { "width", "<I2" },
             { "height", "<I2" },
             { "packets", "<I2" },
             { "type", "<B" },
             { "payload", "<B" },
             { "jpg_quality", "<B" },
             }
return DATA_TRANSMISSION_HANDSHAKE
