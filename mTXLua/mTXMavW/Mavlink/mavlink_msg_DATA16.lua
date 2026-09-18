local DATA16 = {}
DATA16.id = 169
DATA16.crc_extra = 234
DATA16.fields = {
             { "type", "<B" },
             { "len", "<B" },
             { "data", "<B", 16 },
             }
return DATA16
