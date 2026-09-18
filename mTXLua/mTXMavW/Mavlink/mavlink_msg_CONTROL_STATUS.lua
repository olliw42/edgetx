local CONTROL_STATUS = {}
CONTROL_STATUS.id = 512
CONTROL_STATUS.crc_extra = 184
CONTROL_STATUS.fields = {
             { "sysid_in_control", "<B" },
             { "flags", "<B" },
             }
return CONTROL_STATUS
