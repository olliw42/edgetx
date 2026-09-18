local FW_SOARING_DATA = {}
FW_SOARING_DATA.id = 8011
FW_SOARING_DATA.crc_extra = 20
FW_SOARING_DATA.fields = {
             { "timestamp", "<I8" },
             { "timestampModeChanged", "<I8" },
             { "xW", "<f" },
             { "xR", "<f" },
             { "xLat", "<f" },
             { "xLon", "<f" },
             { "VarW", "<f" },
             { "VarR", "<f" },
             { "VarLat", "<f" },
             { "VarLon", "<f" },
             { "LoiterRadius", "<f" },
             { "LoiterDirection", "<f" },
             { "DistToSoarPoint", "<f" },
             { "vSinkExp", "<f" },
             { "z1_LocalUpdraftSpeed", "<f" },
             { "z2_DeltaRoll", "<f" },
             { "z1_exp", "<f" },
             { "z2_exp", "<f" },
             { "ThermalGSNorth", "<f" },
             { "ThermalGSEast", "<f" },
             { "TSE_dot", "<f" },
             { "DebugVar1", "<f" },
             { "DebugVar2", "<f" },
             { "ControlMode", "<B" },
             { "valid", "<B" },
             }
return FW_SOARING_DATA
