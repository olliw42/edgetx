local LOWEHEISER_GOV_EFI = {}
LOWEHEISER_GOV_EFI.id = 10151
LOWEHEISER_GOV_EFI.crc_extra = 195
LOWEHEISER_GOV_EFI.fields = {
             { "volt_batt", "<f" },
             { "curr_batt", "<f" },
             { "curr_gen", "<f" },
             { "curr_rot", "<f" },
             { "fuel_level", "<f" },
             { "throttle", "<f" },
             { "runtime", "<I4" },
             { "until_maintenance", "<i4" },
             { "rectifier_temp", "<f" },
             { "generator_temp", "<f" },
             { "efi_batt", "<f" },
             { "efi_rpm", "<f" },
             { "efi_pw", "<f" },
             { "efi_fuel_flow", "<f" },
             { "efi_fuel_consumed", "<f" },
             { "efi_baro", "<f" },
             { "efi_mat", "<f" },
             { "efi_clt", "<f" },
             { "efi_tps", "<f" },
             { "efi_exhaust_gas_temperature", "<f" },
             { "generator_status", "<I2" },
             { "efi_status", "<I2" },
             { "efi_index", "<B" },
             }
return LOWEHEISER_GOV_EFI
