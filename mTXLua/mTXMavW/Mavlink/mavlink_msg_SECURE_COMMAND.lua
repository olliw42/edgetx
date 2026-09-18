local SECURE_COMMAND = {}
SECURE_COMMAND.id = 11004
SECURE_COMMAND.crc_extra = 11
SECURE_COMMAND.fields = {
             { "sequence", "<I4" },
             { "operation", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "data_length", "<B" },
             { "sig_length", "<B" },
             { "data", "<B", 220 },
             }
return SECURE_COMMAND
