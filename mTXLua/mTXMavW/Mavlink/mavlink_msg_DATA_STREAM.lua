local DATA_STREAM = {}
DATA_STREAM.id = 67
DATA_STREAM.crc_extra = 21
DATA_STREAM.fields = {
             { "message_rate", "<I2" },
             { "stream_id", "<B" },
             { "on_off", "<B" },
             }
return DATA_STREAM
