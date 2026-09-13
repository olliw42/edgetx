local DEEPSTALL = {}
DEEPSTALL.id = 195
DEEPSTALL.crc_extra = 120
DEEPSTALL.fields = {
             { "landing_lat", "<i4" },
             { "landing_lon", "<i4" },
             { "path_lat", "<i4" },
             { "path_lon", "<i4" },
             { "arc_entry_lat", "<i4" },
             { "arc_entry_lon", "<i4" },
             { "altitude", "<f" },
             { "expected_travel_distance", "<f" },
             { "cross_track_error", "<f" },
             { "stage", "<B" },
             }
return DEEPSTALL
