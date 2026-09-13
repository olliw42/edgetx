local EXTENDED_SYS_STATE = {}
EXTENDED_SYS_STATE.id = 245
EXTENDED_SYS_STATE.crc_extra = 130
EXTENDED_SYS_STATE.fields = {
             { "vtol_state", "<B" },
             { "landed_state", "<B" },
             }
return EXTENDED_SYS_STATE
