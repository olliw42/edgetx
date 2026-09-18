local MAG_CAL_PROGRESS = {}
MAG_CAL_PROGRESS.id = 191
MAG_CAL_PROGRESS.crc_extra = 92
MAG_CAL_PROGRESS.fields = {
             { "direction_x", "<f" },
             { "direction_y", "<f" },
             { "direction_z", "<f" },
             { "compass_id", "<B" },
             { "cal_mask", "<B" },
             { "cal_status", "<B" },
             { "attempt", "<B" },
             { "completion_pct", "<B" },
             { "completion_mask", "<B", 10 },
             }
return MAG_CAL_PROGRESS
