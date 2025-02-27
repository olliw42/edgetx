option(SHUTDOWN_CONFIRMATION "Shutdown confirmation" OFF)
option(LCD_DUAL_BUFFER "Dual LCD Buffer" OFF)
option(PXX1 "PXX1 protocol support" ON)
option(PXX2 "PXX2 protocol support" OFF)
option(AFHDS3 "AFHDS3 TX Module" ON)
option(GHOST "Ghost TX Module" ON)
option(INTERNAL_MODULE_PPM "Support for PPM internal module" OFF)
option(AUTOUPDATE "Auto update internal chips from SD" OFF)
option(BIND_KEY "Enable bind button" OFF)

set(EXTERNAL_MODULE YES)

add_definitions(-DPCBFRSKY)

if(PCB STREQUAL X9E)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" ON)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" OFF)
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(STICKS "STANDARD" CACHE STRING "Sticks type (STANDARD/HORUS)")
  set(CPU_TYPE STM32F4)
  set(CPU_TYPE_FULL STM32F407xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f4_flash.ld)
  add_definitions(-DSTM32F40_41xxx)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_x9e)
  set(FLAVOUR x9e)
  add_definitions(-DPCBX9E -DPCBX9)
  add_definitions(-DEEPROM_VARIANT=0x8000)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  set(FIRMWARE_TARGET_SRC
    ${FIRMWARE_TARGET_SRC}
    top_lcd_driver.cpp
    startup_stm32f40_41xxx.s
    )
  set(AUX_SERIAL_DRIVER ../common/arm/stm32/aux_serial_driver.cpp)
  if(STICKS STREQUAL HORUS)
    add_definitions(-DHORUS_STICKS)
  endif()
  set(GUI_DIR 212x64)
  set(BITMAPS_DIR 212x64)
  set(NAVIGATION_TYPE x9d)
  set(BITMAPS_TARGET taranis_bitmaps)
  set(FONTS_TARGET taranis_fonts)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS NO)
  set(BLUETOOTH YES)
  set(ROTARY_ENCODER YES)
  add_definitions(-DMANUFACTURER_FRSKY)
elseif(PCB STREQUAL X9D+)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_x9d)
  add_definitions(-DPCBX9DP -DPCBX9)
  add_definitions(-DEEPROM_VARIANT=0)
  set(GUI_DIR 212x64)
  set(BITMAPS_DIR 212x64)
  set(NAVIGATION_TYPE x9d)
  set(BITMAPS_TARGET taranis_bitmaps)
  set(FONTS_TARGET taranis_fonts)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(PCBREV 2014 CACHE STRING "PCB Revision")
  set(AFHDS3 NO)
  add_definitions(-DPCBREV=${PCBREV})
  add_definitions(-DMANUFACTURER_FRSKY)
  if (${PCBREV} STREQUAL 2019)
    option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" OFF)
    option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" ON)
    set(FLAVOUR x9d+2019)
    set(LUA_EXPORT lua_export_x9d+2019)
    set(CPU_TYPE STM32F4)
    set(CPU_TYPE_FULL STM32F407xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f4_flash.ld)
    set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
    set(FIRMWARE_TARGET_SRC
      ${FIRMWARE_TARGET_SRC}
      startup_stm32f40_41xxx.s
      )
    add_definitions(-DRADIO_X9DP2019)
    add_definitions(-DSTM32F40_41xxx)
    add_definitions(-DSOFTWARE_VOLUME -DPWR_BUTTON_${PWR_BUTTON} -DHARDWARE_POWER_MANAGEMENT_UNIT)
    set(STATUS_LEDS YES)
    set(PXX2 ON)
    set(PXX_FREQUENCY "HIGH")
    set(BLUETOOTH YES)
    set(ROTARY_ENCODER YES)
    set(INTERNAL_MODULE_SERIAL YES)
  else()
    option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" ON)
    option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" OFF)
    set(FLAVOUR x9d+)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(AUX_SERIAL_DRIVER ../common/arm/stm32/aux_serial_driver.cpp)
    set(STATUS_LEDS NO)
  endif()
elseif(PCB STREQUAL X9D)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" ON)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" OFF)
  set(FLAVOUR x9d)
  set(CPU_TYPE STM32F2)
  set(CPU_TYPE_FULL STM32F205xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
  option(HAPTIC "Haptic support" OFF)
  set(LUA_EXPORT lua_export_x9d)
  add_definitions(-DPCBX9D -DPCBX9)
  add_definitions(-DEEPROM_VARIANT=0)
  set(GUI_DIR 212x64)
  set(BITMAPS_DIR 212x64)
  set(NAVIGATION_TYPE x9d)
  set(BITMAPS_TARGET taranis_bitmaps)
  set(FONTS_TARGET taranis_fonts)
  set(LCD_DRIVER lcd_driver_aspi.cpp)
  set(AUX_SERIAL_DRIVER ../common/arm/stm32/aux_serial_driver.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS NO)
  add_definitions(-DMANUFACTURER_FRSKY)
  set(AFHDS3 NO)
elseif(PCB STREQUAL X7)
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(HAPTIC YES)
  set(GUI_DIR 128x64)
  set(BITMAPS_DIR 128x64)
  set(BITMAPS_TARGET 9x_bitmaps)
  set(FONTS_TARGET 9x_fonts_1bit)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS YES)
  add_definitions(-DPCBX7 -DSOFTWARE_VOLUME)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  if(PCBREV STREQUAL T12)
    option(INTERNAL_MODULE_MULTI "Support for MULTI internal module" OFF)
    set(FLAVOUR t12)
    set(NAVIGATION_TYPE 9x)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(LUA_EXPORT lua_export_t12)
    add_definitions(-DRADIO_T12)
    add_definitions(-DRADIO_FAMILY_JUMPER_T12)
    add_definitions(-DEEPROM_VARIANT=0x4001)
    add_definitions(-DMANUFACTURER_JUMPER)
  elseif(PCBREV STREQUAL TLITE)
    option(INTERNAL_MODULE_MULTI "Support for MULTI internal module" ON)
    set(FLAVOUR tlite)
    set(NAVIGATION_TYPE 9x)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(LUA_EXPORT lua_export_tlite)
    add_definitions(-DRADIO_TLITE)
    add_definitions(-DRADIO_FAMILY_JUMPER_T12)
    add_definitions(-DEEPROM_VARIANT=0x4003)
    add_definitions(-DMANUFACTURER_JUMPER)
  elseif(PCBREV STREQUAL TX12)
    option(INTERNAL_MODULE_MULTI "Support for MULTI internal module" ON)
    set(FLAVOUR tx12)
    set(NAVIGATION_TYPE x7)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(ROTARY_ENCODER YES)
    set(LUA_EXPORT lua_export_tx12)
    set(BLUETOOTH NO)
    set(USB_CHARGER YES)
    add_definitions(-DRADIO_TX12)
    add_definitions(-DEEPROM_VARIANT=0x4002)
    add_definitions(-DMANUFACTURER_RADIOMASTER)
  elseif(PCBREV STREQUAL T8)
    option(INTERNAL_MODULE_MULTI "Support for MULTI internal module" ON)
    set(EXTERNAL_MODULE NO)
    set(AFHDS3 NO)
    set(FLAVOUR t8)
    set(NAVIGATION_TYPE x7)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(ROTARY_ENCODER NO)
    set(LUA_EXPORT lua_export_t8)
    set(BLUETOOTH NO)
    if(RADIOMASTER_RELEASE)
      set(BIND_KEY YES)
    endif()
    add_definitions(-DRADIO_T8)
    add_definitions(-DEEPROM_VARIANT=0x4004)
    add_definitions(-DMANUFACTURER_RADIOMASTER)
  elseif(PCBREV STREQUAL ACCESS)
    option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" OFF)
    option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" ON)
    set(FLAVOUR x7access)
    set(NAVIGATION_TYPE x7)
    set(CPU_TYPE STM32F4)
    set(CPU_TYPE_FULL STM32F407xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f4_flash.ld)
    set(LUA_EXPORT lua_export_x7access)
    add_definitions(-DRADIO_X7ACCESS)
    add_definitions(-DEEPROM_VARIANT=0x4000)
    add_definitions(-DPCBREV=${PCBREV})
    add_definitions(-DPCBX7ACCESS)
    set(FIRMWARE_TARGET_SRC
      ${FIRMWARE_TARGET_SRC}
      startup_stm32f40_41xxx.s
      )
    add_definitions(-DSTM32F40_41xxx)
    add_definitions(-DHARDWARE_POWER_MANAGEMENT_UNIT)
    set(PXX2 ON)
    set(PXX_FREQUENCY "HIGH")
    set(BLUETOOTH YES)
    set(ROTARY_ENCODER YES)
    set(INTERNAL_MODULE_SERIAL YES)
    add_definitions(-DMANUFACTURER_FRSKY)
  else()
    option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" ON)
    option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" OFF)
    set(FLAVOUR x7)
    set(NAVIGATION_TYPE x7)
    set(CPU_TYPE STM32F2)
    set(CPU_TYPE_FULL STM32F205xE)  # for size report
    set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
    set(LUA_EXPORT lua_export_x7)
    add_definitions(-DRADIO_X7)
    add_definitions(-DEEPROM_VARIANT=0x4000)
    set(BLUETOOTH YES)
    add_definitions(-DBLUETOOTH_PROBE)
    set(ROTARY_ENCODER YES)
    add_definitions(-DMANUFACTURER_FRSKY)
    if(DEFINED PCBREV_HARDCODED)
      # This *can* be used to prevent messing with PA14 (SWCLK), so stlink can be used
      # without interruptions.
      if(NOT ${PCBREV_HARDCODED} MATCHES "^[0-1]$")
        message(FATAL_ERROR "PCBREV_HARDCODED must be 0 or 1, not '${PCBREV_HARDCODED}'")
      endif()
      add_definitions(-DPCBREV_HARDCODED=${PCBREV_HARDCODED})
    endif()
  endif()
elseif(PCB STREQUAL X9LITE)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" OFF)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" ON)
  set(PXX_FREQUENCY "HIGH")
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(CPU_TYPE STM32F2)
  set(CPU_TYPE_FULL STM32F205xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_x9lite)
  set(FLAVOUR x9lite)
  add_definitions(-DBOARD_NAME="x9lite")
  add_definitions(-DPCBX9LITE -DPCBX9 -DSOFTWARE_VOLUME -DHARDWARE_POWER_MANAGEMENT_UNIT)
  add_definitions(-DEEPROM_VARIANT=0x0800)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  set(PXX2 ON)
  set(GUI_DIR 128x64)
  set(BITMAPS_DIR 128x64)
  set(NAVIGATION_TYPE x7)
  set(BITMAPS_TARGET 9x_bitmaps)
  set(FONTS_TARGET 9x_fonts_1bit)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS YES)
  set(ROTARY_ENCODER YES)
  set(INTERNAL_MODULE_SERIAL YES)
  add_definitions(-DMANUFACTURER_FRSKY)
elseif(PCB STREQUAL X9LITES)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" OFF)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" ON)
  set(PXX_FREQUENCY "HIGH")
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(CPU_TYPE STM32F2)
  set(CPU_TYPE_FULL STM32F205xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_x9lites)
  set(FLAVOUR x9lites)
  add_definitions(-DBOARD_NAME="x9lites")
  add_definitions(-DPCBX9LITES -DPCBX9LITE -DPCBX9 -DSOFTWARE_VOLUME -DHARDWARE_POWER_MANAGEMENT_UNIT)
  add_definitions(-DEEPROM_VARIANT=0x0801)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  set(PXX2 ON)
  set(GUI_DIR 128x64)
  set(BITMAPS_DIR 128x64)
  set(NAVIGATION_TYPE x7)
  set(BITMAPS_TARGET 9x_bitmaps)
  set(FONTS_TARGET 9x_fonts_1bit)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS YES)
  set(BLUETOOTH YES)
  set(ROTARY_ENCODER YES)
  set(INTERNAL_MODULE_SERIAL YES)
  add_definitions(-DMANUFACTURER_FRSKY)
elseif(PCB STREQUAL XLITE)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" ON)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" OFF)
  set(PXX_FREQUENCY "HIGH" CACHE STRING "PXX frequency (LOW / HIGH)") # always use HIGH except on some prototype boards
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(CPU_TYPE STM32F2)
  set(CPU_TYPE_FULL STM32F205xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_xlite)
  set(FLAVOUR xlite)
  add_definitions(-DPCBXLITE -DSOFTWARE_VOLUME -DSTICKS_PWM)
  add_definitions(-DEEPROM_VARIANT=0x2000)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  set(PXX2 ON)
  set(GUI_DIR 128x64)
  set(BITMAPS_DIR 128x64)
  set(NAVIGATION_TYPE xlite)
  set(BITMAPS_TARGET 9x_bitmaps)
  set(FONTS_TARGET 9x_fonts_1bit)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS YES)
  set(BLUETOOTH YES)
  set(INTERNAL_MODULE_SERIAL YES)
  add_definitions(-DMANUFACTURER_FRSKY)
elseif(PCB STREQUAL XLITES)
  option(INTERNAL_MODULE_PXX1 "Support for PXX1 internal module" OFF)
  option(INTERNAL_MODULE_PXX2 "Support for PXX2 internal module" ON)
  set(PXX_FREQUENCY "HIGH")
  set(PWR_BUTTON "PRESS" CACHE STRING "Pwr button type (PRESS/SWITCH)")
  set(CPU_TYPE STM32F2)
  set(CPU_TYPE_FULL STM32F205xE)  # for size report
  set(LINKER_SCRIPT targets/taranis/stm32f2_flash.ld)
  set(HAPTIC YES)
  set(LUA_EXPORT lua_export_xlites)
  set(FLAVOUR xlites)
  add_definitions(-DPCBXLITES -DPCBXLITE -DSOFTWARE_VOLUME -DSTICKS_PWM -DHARDWARE_POWER_MANAGEMENT_UNIT)
  add_definitions(-DEEPROM_VARIANT=0x1000)
  add_definitions(-DPWR_BUTTON_${PWR_BUTTON})
  set(GUI_DIR 128x64)
  set(BITMAPS_DIR 128x64)
  set(NAVIGATION_TYPE xlite)
  set(BITMAPS_TARGET 9x_bitmaps)
  set(FONTS_TARGET 9x_fonts_1bit)
  set(LCD_DRIVER lcd_driver_spi.cpp)
  set(GVAR_SCREEN model_gvars.cpp)
  set(STATUS_LEDS YES)
  set(PXX2 ON)
  set(BLUETOOTH YES)
  set(GYRO YES)
  set(INTERNAL_MODULE_SERIAL YES)
  add_definitions(-DMANUFACTURER_FRSKY)
endif()

if(NOT PCB STREQUAL PCBXLITE)
  add_definitions(-DHARDWARE_TRAINER_JACK)
endif()

if(GYRO)
  add_definitions(-DGYRO)
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/lsm6ds_driver.cpp
    )
  set(SRC
    ${SRC}
    gyro.cpp
    )
endif()

if(INTERNAL_MODULE_SERIAL)
  add_definitions(-DINTERNAL_MODULE_SERIAL)
  if(PXX_FREQUENCY STREQUAL HIGH)
    add_definitions(-DPXX_FREQUENCY_HIGH)
  endif()
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/intmodule_serial_driver.cpp
    )
elseif(INTERNAL_MODULE_PXX1 OR INTERNAL_MODULE_PXX2)
  set(TARGET_SRC
    ${TARGET_SRC}
    intmodule_pulses_driver.cpp
    )
endif()

if(ROTARY_ENCODER)
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/rotary_encoder_driver.cpp
    )
endif()

if(BIND_KEY)
  set(TARGET_SRC
        ${TARGET_SRC}
        bind_button_driver.cpp
        )
  add_definitions(-DBIND_KEY)
endif()

if(USB_CHARGER)
  set(TARGET_SRC ${TARGET_SRC} usb_charger_driver.cpp)
  add_definitions(-DUSB_CHARGER)
endif()

if(BLUETOOTH)
  add_definitions(-DBLUETOOTH)
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/bluetooth_driver.cpp
    )
  set(SRC
    ${SRC}
    bluetooth.cpp
    )
  if(NOT PCB STREQUAL X9E)
    # Bluetooth on X9E is compatible with almost nothing
    add_definitions(-DHARDWARE_TRAINER_BLUETOOTH)
  endif()
endif()

if(AUTOUPDATE)
  add_definitions(-DAUTOUPDATE)
endif()

set(HSE_VALUE 12000000)
set(SDCARD YES)
set(STORAGE EEPROM)
set(STORAGE_FORMAT RLC)
set(TARGET_DIR taranis)
set(PPM_LIMITS_SYMETRICAL YES)

if(SPLASH STREQUAL OFF)
  message(FATAL_ERROR "Option SPLASH=OFF not supported on Taranis")
endif()

add_definitions(-DPCBTARANIS)
add_definitions(-DAUDIO -DVOICE -DRTCLOCK)
add_definitions(-DSBUS_TRAINER)

set(SRC
  ${SRC}
  io/frsky_firmware_update.cpp
  io/multi_firmware_update.cpp
  )

set(GUI_SRC
  ${GUI_SRC}
  model_input_edit.cpp
  model_mix_edit.cpp
  model_display.cpp
  radio_diagkeys.cpp
  radio_diaganas.cpp
  view_channels.cpp
  view_telemetry.cpp
  view_about.cpp
  bmp.cpp
  )

if(STATUS_LEDS)
  set(LED_DRIVER led_driver.cpp)
endif()

set(SRC
  ${SRC}
  sbus.cpp
  )

set(TARGET_SRC
  ${TARGET_SRC}
  ${LED_DRIVER}
  backlight_driver.cpp
  trainer_driver.cpp
  ../common/arm/stm32/timers_driver.cpp
  ../common/arm/stm32/audio_dac_driver.cpp
  )

set(FIRMWARE_TARGET_SRC
  ${FIRMWARE_TARGET_SRC}
  ../common/arm/stm32/adc_driver.cpp
  ../common/arm/stm32/heartbeat_driver.cpp
  ../common/arm/stm32/mixer_scheduler_driver.cpp
  )

if(PCB STREQUAL XLITE OR PCB STREQUAL XLITES)
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/sticks_pwm_driver.cpp
    )
endif()

set(FIRMWARE_TARGET_SRC
  ${FIRMWARE_TARGET_SRC}
  ${LCD_DRIVER}
  board.cpp
  i2c_driver.cpp
  ../common/arm/stm32/pwr_driver.cpp
  ../common/arm/stm32/heartbeat_driver.cpp
  ../common/arm/loadboot.cpp
  )

if(LCD_DUAL_BUFFER)
  add_definitions(-DLCD_DUAL_BUFFER)
endif()

if(INTERNAL_MODULE_PXX1)
  add_definitions(-DHARDWARE_INTERNAL_MODULE)
  add_definitions(-DINTERNAL_MODULE_PXX1)
endif()

if(INTERNAL_MODULE_PXX2)
  set(PXX2 ON)
  add_definitions(-DHARDWARE_INTERNAL_MODULE)
  add_definitions(-DINTERNAL_MODULE_PXX2)
endif()

if(INTERNAL_MODULE_MULTI)
  add_definitions(-DHARDWARE_INTERNAL_MODULE)
  add_definitions(-DINTERNAL_MODULE_MULTI)
  set(TARGET_SRC
    ${TARGET_SRC}
    ../common/arm/stm32/intmodule_serial_driver.cpp
    )
endif()

if(INTERNAL_MODULE_PPM)
  add_definitions(-DHARDWARE_INTERNAL_MODULE)
  add_definitions(-DINTERNAL_MODULE_PPM)
endif()

if(EXTERNAL_MODULE)
  set(TARGET_SRC
    ${TARGET_SRC}
    extmodule_driver.cpp
    )
  add_definitions(-DHARDWARE_EXTERNAL_MODULE)
endif()

set(RADIO_DEPENDENCIES ${RADIO_DEPENDENCIES} ${BITMAPS_TARGET})
