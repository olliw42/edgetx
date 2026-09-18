local CANFD_FRAME = {}
CANFD_FRAME.id = 387
CANFD_FRAME.crc_extra = 4
CANFD_FRAME.fields = {
             { "id", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "bus", "<B" },
             { "len", "<B" },
             { "data", "<B", 64 },
             }
return CANFD_FRAME
