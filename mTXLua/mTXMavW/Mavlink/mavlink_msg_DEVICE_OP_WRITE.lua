local DEVICE_OP_WRITE = {}
DEVICE_OP_WRITE.id = 11002
DEVICE_OP_WRITE.crc_extra = 234
DEVICE_OP_WRITE.fields = {
             { "request_id", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "bustype", "<B" },
             { "bus", "<B" },
             { "address", "<B" },
             { "busname", "<c40" },
             { "regstart", "<B" },
             { "count", "<B" },
             { "data", "<B", 128 },
             { "bank", "<B" },
             }
return DEVICE_OP_WRITE
