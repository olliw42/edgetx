local DEVICE_OP_READ_REPLY = {}
DEVICE_OP_READ_REPLY.id = 11001
DEVICE_OP_READ_REPLY.crc_extra = 15
DEVICE_OP_READ_REPLY.fields = {
             { "request_id", "<I4" },
             { "result", "<B" },
             { "regstart", "<B" },
             { "count", "<B" },
             { "data", "<B", 128 },
             { "bank", "<B" },
             }
return DEVICE_OP_READ_REPLY
