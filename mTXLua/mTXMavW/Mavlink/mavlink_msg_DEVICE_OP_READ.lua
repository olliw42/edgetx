local DEVICE_OP_READ = {}
DEVICE_OP_READ.id = 11000
DEVICE_OP_READ.crc_extra = 134
DEVICE_OP_READ.fields = {
             { "request_id", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "bustype", "<B" },
             { "bus", "<B" },
             { "address", "<B" },
             { "busname", "<c40" },
             { "regstart", "<B" },
             { "count", "<B" },
             { "bank", "<B" },
             }
return DEVICE_OP_READ
