local REQUEST_EVENT = {}
REQUEST_EVENT.id = 412
REQUEST_EVENT.crc_extra = 33
REQUEST_EVENT.fields = {
             { "first_sequence", "<I2" },
             { "last_sequence", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return REQUEST_EVENT
