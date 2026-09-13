local CAN_FILTER_MODIFY = {}
CAN_FILTER_MODIFY.id = 388
CAN_FILTER_MODIFY.crc_extra = 8
CAN_FILTER_MODIFY.fields = {
             { "ids", "<I2", 16 },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "bus", "<B" },
             { "operation", "<B" },
             { "num_ids", "<B" },
             }
return CAN_FILTER_MODIFY
