local FENCE_POINT = {}
FENCE_POINT.id = 160
FENCE_POINT.crc_extra = 78
FENCE_POINT.fields = {
             { "lat", "<f" },
             { "lng", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "idx", "<B" },
             { "count", "<B" },
             }
return FENCE_POINT
