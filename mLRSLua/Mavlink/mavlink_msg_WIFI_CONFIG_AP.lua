local WIFI_CONFIG_AP = {}
WIFI_CONFIG_AP.id = 299
WIFI_CONFIG_AP.crc_extra = 19
WIFI_CONFIG_AP.fields = {
             { "ssid", "<c32" },
             { "password", "<c64" },
             { "mode", "<b" },
             { "response", "<b" },
             }
return WIFI_CONFIG_AP
