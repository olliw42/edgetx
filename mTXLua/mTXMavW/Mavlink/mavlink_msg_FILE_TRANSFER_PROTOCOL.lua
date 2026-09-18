local FILE_TRANSFER_PROTOCOL = {}
FILE_TRANSFER_PROTOCOL.id = 110
FILE_TRANSFER_PROTOCOL.crc_extra = 84
FILE_TRANSFER_PROTOCOL.fields = {
             { "target_network", "<B" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "payload", "<B", 251 },
             }
return FILE_TRANSFER_PROTOCOL
