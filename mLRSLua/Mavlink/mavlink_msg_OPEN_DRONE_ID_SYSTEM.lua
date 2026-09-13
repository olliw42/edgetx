local OPEN_DRONE_ID_SYSTEM = {}
OPEN_DRONE_ID_SYSTEM.id = 12904
OPEN_DRONE_ID_SYSTEM.crc_extra = 77
OPEN_DRONE_ID_SYSTEM.fields = {
             { "operator_latitude", "<i4" },
             { "operator_longitude", "<i4" },
             { "area_ceiling", "<f" },
             { "area_floor", "<f" },
             { "operator_altitude_geo", "<f" },
             { "timestamp", "<I4" },
             { "area_count", "<I2" },
             { "area_radius", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "operator_location_type", "<B" },
             { "classification_type", "<B" },
             { "category_eu", "<B" },
             { "class_eu", "<B" },
             }
return OPEN_DRONE_ID_SYSTEM
