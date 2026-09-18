local EYE_TRACKING_DATA = {}
EYE_TRACKING_DATA.id = 52505
EYE_TRACKING_DATA.crc_extra = 215
EYE_TRACKING_DATA.fields = {
             { "time_usec", "<I8" },
             { "gaze_origin_x", "<f" },
             { "gaze_origin_y", "<f" },
             { "gaze_origin_z", "<f" },
             { "gaze_direction_x", "<f" },
             { "gaze_direction_y", "<f" },
             { "gaze_direction_z", "<f" },
             { "video_gaze_x", "<f" },
             { "video_gaze_y", "<f" },
             { "surface_gaze_x", "<f" },
             { "surface_gaze_y", "<f" },
             { "sensor_id", "<B" },
             { "surface_id", "<B" },
             }
return EYE_TRACKING_DATA
