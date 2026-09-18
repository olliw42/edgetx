local DATA32 = {}
DATA32.id = 170
DATA32.crc_extra = 73
DATA32.fields = {
             { "type", "<B" },
             { "len", "<B" },
             { "data", "<B", 32 },
             }
return DATA32
