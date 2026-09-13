local CHANGE_OPERATOR_CONTROL_ACK = {}
CHANGE_OPERATOR_CONTROL_ACK.id = 6
CHANGE_OPERATOR_CONTROL_ACK.crc_extra = 104
CHANGE_OPERATOR_CONTROL_ACK.fields = {
             { "gcs_system_id", "<B" },
             { "control_request", "<B" },
             { "ack", "<B" },
             }
return CHANGE_OPERATOR_CONTROL_ACK
