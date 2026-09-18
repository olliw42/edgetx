local VIDEO_STREAM_INFORMATION = {}
VIDEO_STREAM_INFORMATION.id = 269
VIDEO_STREAM_INFORMATION.crc_extra = 109
VIDEO_STREAM_INFORMATION.fields = {
             { "framerate", "<f" },
             { "bitrate", "<I4" },
             { "flags", "<I2" },
             { "resolution_h", "<I2" },
             { "resolution_v", "<I2" },
             { "rotation", "<I2" },
             { "hfov", "<I2" },
             { "stream_id", "<B" },
             { "count", "<B" },
             { "type", "<B" },
             { "name", "<c32" },
             { "uri", "<c160" },
             { "encoding", "<B" },
             { "camera_device_id", "<B" },
             }
return VIDEO_STREAM_INFORMATION
