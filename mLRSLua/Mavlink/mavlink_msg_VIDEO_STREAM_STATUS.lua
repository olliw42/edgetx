local VIDEO_STREAM_STATUS = {}
VIDEO_STREAM_STATUS.id = 270
VIDEO_STREAM_STATUS.crc_extra = 59
VIDEO_STREAM_STATUS.fields = {
             { "framerate", "<f" },
             { "bitrate", "<I4" },
             { "flags", "<I2" },
             { "resolution_h", "<I2" },
             { "resolution_v", "<I2" },
             { "rotation", "<I2" },
             { "hfov", "<I2" },
             { "stream_id", "<B" },
             { "camera_device_id", "<B" },
             }
return VIDEO_STREAM_STATUS
