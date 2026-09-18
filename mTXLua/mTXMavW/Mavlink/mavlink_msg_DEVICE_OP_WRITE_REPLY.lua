local DEVICE_OP_WRITE_REPLY = {}
DEVICE_OP_WRITE_REPLY.id = 11003
DEVICE_OP_WRITE_REPLY.crc_extra = 64
DEVICE_OP_WRITE_REPLY.fields = {
             { "request_id", "<I4" },
             { "result", "<B" },
             }
return DEVICE_OP_WRITE_REPLY
