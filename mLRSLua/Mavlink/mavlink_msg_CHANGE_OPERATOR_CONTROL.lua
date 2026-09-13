local CHANGE_OPERATOR_CONTROL = {}
CHANGE_OPERATOR_CONTROL.id = 5
CHANGE_OPERATOR_CONTROL.crc_extra = 217
CHANGE_OPERATOR_CONTROL.fields = {
             { "target_system", "<B" },
             { "control_request", "<B" },
             { "version", "<B" },
             { "passkey", "<c25" },
             }
return CHANGE_OPERATOR_CONTROL
