local OPEN_DRONE_ID_MESSAGE_PACK = {}
OPEN_DRONE_ID_MESSAGE_PACK.id = 12915
OPEN_DRONE_ID_MESSAGE_PACK.crc_extra = 94
OPEN_DRONE_ID_MESSAGE_PACK.fields = {
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "single_message_size", "<B" },
             { "msg_pack_size", "<B" },
             { "messages", "<B", 225 },
             }
return OPEN_DRONE_ID_MESSAGE_PACK
