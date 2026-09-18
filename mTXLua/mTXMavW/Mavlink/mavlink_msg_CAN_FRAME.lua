local CAN_FRAME = {}
CAN_FRAME.id = 386
CAN_FRAME.crc_extra = 132
CAN_FRAME.fields = {
             { "id", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "bus", "<B" },
             { "len", "<B" },
             { "data", "<B", 8 },
             }
return CAN_FRAME
