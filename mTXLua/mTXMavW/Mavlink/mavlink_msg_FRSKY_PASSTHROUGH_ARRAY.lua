local FRSKY_PASSTHROUGH_ARRAY = {}
FRSKY_PASSTHROUGH_ARRAY.id = 60040
FRSKY_PASSTHROUGH_ARRAY.crc_extra = 156
FRSKY_PASSTHROUGH_ARRAY.fields = {
             { "time_boot_ms", "<I4" },
             { "count", "<B" },
             { "packet_buf", "<B", 240 },
             }
return FRSKY_PASSTHROUGH_ARRAY
