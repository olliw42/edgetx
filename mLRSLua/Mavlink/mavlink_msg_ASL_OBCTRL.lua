local ASL_OBCTRL = {}
ASL_OBCTRL.id = 8008
ASL_OBCTRL.crc_extra = 234
ASL_OBCTRL.fields = {
             { "timestamp", "<I8" },
             { "uElev", "<f" },
             { "uThrot", "<f" },
             { "uThrot2", "<f" },
             { "uAilL", "<f" },
             { "uAilR", "<f" },
             { "uRud", "<f" },
             { "obctrl_status", "<B" },
             }
return ASL_OBCTRL
