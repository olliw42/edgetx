local HERELINK_VIDEO_STREAM_INFORMATION = {}
HERELINK_VIDEO_STREAM_INFORMATION.id = 50002
HERELINK_VIDEO_STREAM_INFORMATION.crc_extra = 181
HERELINK_VIDEO_STREAM_INFORMATION.fields = {
             { "framerate", "<f" },
             { "bitrate", "<I4" },
             { "resolution_h", "<I2" },
             { "resolution_v", "<I2" },
             { "rotation", "<I2" },
             { "camera_id", "<B" },
             { "status", "<B" },
             { "uri", "<c230" },
             }
return HERELINK_VIDEO_STREAM_INFORMATION
