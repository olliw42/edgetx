local RADIO_RC_CHANNELS = {}
RADIO_RC_CHANNELS.id = 420
RADIO_RC_CHANNELS.crc_extra = 20
RADIO_RC_CHANNELS.fields = {
             { "time_last_update_ms", "<I4" },
             { "flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "count", "<B" },
             { "channels", "<i2", 32 },
             }
return RADIO_RC_CHANNELS
