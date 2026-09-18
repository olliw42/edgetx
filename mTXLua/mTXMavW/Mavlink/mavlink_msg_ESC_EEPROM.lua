local ESC_EEPROM = {}
ESC_EEPROM.id = 292
ESC_EEPROM.crc_extra = 227
ESC_EEPROM.fields = {
             { "write_mask", "<I4", 6 },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "firmware", "<B" },
             { "msg_index", "<B" },
             { "msg_count", "<B" },
             { "esc_index", "<B" },
             { "length", "<B" },
             { "data", "<B", 192 },
             }
return ESC_EEPROM
