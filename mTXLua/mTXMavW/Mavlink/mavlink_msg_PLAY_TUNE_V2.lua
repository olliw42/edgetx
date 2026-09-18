local PLAY_TUNE_V2 = {}
PLAY_TUNE_V2.id = 400
PLAY_TUNE_V2.crc_extra = 110
PLAY_TUNE_V2.fields = {
             { "format", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "tune", "<c248" },
             }
return PLAY_TUNE_V2
