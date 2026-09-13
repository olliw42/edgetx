local STATUSTEXT = {}
STATUSTEXT.id = 253
STATUSTEXT.crc_extra = 83
STATUSTEXT.fields = {
             { "severity", "<B" },
             { "text", "<c50" },
             { "id", "<I2" },
             { "chunk_seq", "<B" },
             }
return STATUSTEXT
