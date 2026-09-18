local REQUEST_DATA_STREAM = {}
REQUEST_DATA_STREAM.id = 66
REQUEST_DATA_STREAM.crc_extra = 148
REQUEST_DATA_STREAM.fields = {
             { "req_message_rate", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "req_stream_id", "<B" },
             { "start_stop", "<B" },
             }
return REQUEST_DATA_STREAM
