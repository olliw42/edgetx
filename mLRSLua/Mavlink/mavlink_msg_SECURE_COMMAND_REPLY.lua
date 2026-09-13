local SECURE_COMMAND_REPLY = {}
SECURE_COMMAND_REPLY.id = 11005
SECURE_COMMAND_REPLY.crc_extra = 93
SECURE_COMMAND_REPLY.fields = {
             { "sequence", "<I4" },
             { "operation", "<I4" },
             { "result", "<B" },
             { "data_length", "<B" },
             { "data", "<B", 220 },
             }
return SECURE_COMMAND_REPLY
