local DATA64 = {}
DATA64.id = 171
DATA64.crc_extra = 181
DATA64.fields = {
             { "type", "<B" },
             { "len", "<B" },
             { "data", "<B", 64 },
             }
return DATA64
