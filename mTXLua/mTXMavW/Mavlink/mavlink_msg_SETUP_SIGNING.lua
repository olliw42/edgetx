local SETUP_SIGNING = {}
SETUP_SIGNING.id = 256
SETUP_SIGNING.crc_extra = 71
SETUP_SIGNING.fields = {
             { "initial_timestamp", "<I8" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "secret_key", "<B", 32 },
             }
return SETUP_SIGNING
