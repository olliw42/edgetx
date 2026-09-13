local COMMAND_CANCEL = {}
COMMAND_CANCEL.id = 80
COMMAND_CANCEL.crc_extra = 14
COMMAND_CANCEL.fields = {
             { "command", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return COMMAND_CANCEL
