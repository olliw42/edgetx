local TIMESYNC = {}
TIMESYNC.id = 111
TIMESYNC.crc_extra = 34
TIMESYNC.fields = {
             { "tc1", "<i8" },
             { "ts1", "<i8" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return TIMESYNC
