local GPS_RTK = {}
GPS_RTK.id = 127
GPS_RTK.crc_extra = 25
GPS_RTK.fields = {
             { "time_last_baseline_ms", "<I4" },
             { "tow", "<I4" },
             { "baseline_a_mm", "<i4" },
             { "baseline_b_mm", "<i4" },
             { "baseline_c_mm", "<i4" },
             { "accuracy", "<I4" },
             { "iar_num_hypotheses", "<i4" },
             { "wn", "<I2" },
             { "rtk_receiver_id", "<B" },
             { "rtk_health", "<B" },
             { "rtk_rate", "<B" },
             { "nsats", "<B" },
             { "baseline_coords_type", "<B" },
             }
return GPS_RTK
