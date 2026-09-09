cmake_minimum_required(VERSION 3.20)

# Platform selection: DM1701, MDUV380
set(PLATFORM "DM1701" CACHE STRING "Target platform (DM1701, MDUV380)")
set_property(CACHE PLATFORM PROPERTY STRINGS DM1701 MDUV380)

# Validate platform
if(NOT PLATFORM MATCHES "^(DM1701|MDUV380)$")
    message(FATAL_ERROR "Invalid PLATFORM: ${PLATFORM}. Use DM1701 or MDUV380")
endif()

set(VARIANT_PLUS OFF CACHE BOOL "Variant platform (DM380+)")

# Project name based on platform
project(Open${PLATFORM} C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Target executable
set(TARGET MDUV380_firmware)

message(STATUS "Building for platform: ${PLATFORM}")

######################################
# Sources
######################################

# C sources
file(GLOB CORE_SRC "Core/Src/*.c")
file(GLOB HAL_SRC "Drivers/STM32F4xx_HAL_Driver/Src/*.c")
file(GLOB FREERTOS_SRC "Middlewares/Third_Party/FreeRTOS/Source/*.c")
file(GLOB FREERTOS_CMSIS_SRC "Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/*.c")
file(GLOB FREERTOS_PORT_SRC "Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/*.c")
file(GLOB FREERTOS_HEAP_SRC "Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c")
file(GLOB USB_CORE_SRC "Middlewares/ST/STM32_USB_Device_Library/Core/Src/*.c")
file(GLOB USB_CDC_SRC "Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/*.c")
file(GLOB USB_APP_SRC "USB_DEVICE/App/*.c")
file(GLOB USB_TARGET_SRC "USB_DEVICE/Target/*.c")
file(GLOB RTT_SRC "SeggerRTT/RTT/*.c")
file(GLOB RTT_SYSCALLS_SRC "SeggerRTT/Syscalls/SEGGER_RTT_Syscalls_GCC.c")
file(GLOB APP_SRC "application/source/*.c")
file(GLOB APP_CODEC_SRC "application/source/dmr_codec/*.c")
# Public API/FEC and initial states only; signal processing is assembly.
set(APP_VOCODER_SRC
    application/source/vocoder/vocoder.c
    application/source/vocoder/portable_initial_state.c
)
file(GLOB APP_FUNC_SRC "application/source/functions/*.c")
file(GLOB APP_HW_SRC "application/source/hardware/*.c")
file(GLOB APP_IF_SRC "application/source/interfaces/*.c")
file(GLOB APP_IO_SRC "application/source/io/*.c")
file(GLOB APP_USB_SRC "application/source/usb/*.c")
file(GLOB APP_UI_SRC "application/source/user_interface/*.c")
file(GLOB APP_IMG_SRC "application/images/*.c")
file(GLOB_RECURSE LVGL_SRC "Middlewares/Third_Party/lvgl/src/*.c")
file(GLOB LVGL_FONTS_SRC "Middlewares/Third_Party/fonts/*.c")

set(C_SOURCES
    ${CORE_SRC}
    ${HAL_SRC}
    ${FREERTOS_SRC}
    ${FREERTOS_CMSIS_SRC}
    ${FREERTOS_PORT_SRC}
    ${FREERTOS_HEAP_SRC}
    ${USB_CORE_SRC}
    ${USB_CDC_SRC}
    ${USB_APP_SRC}
    ${USB_TARGET_SRC}
    ${RTT_SRC}
    ${RTT_SYSCALLS_SRC}
    ${APP_SRC}
    ${APP_CODEC_SRC}
    ${APP_VOCODER_SRC}
    ${APP_FUNC_SRC}
    ${APP_HW_SRC}
    ${APP_IF_SRC}
    ${APP_IO_SRC}
    ${APP_USB_SRC}
    ${APP_UI_SRC}
    ${APP_IMG_SRC}
    ${LVGL_SRC}
    ${LVGL_FONTS_SRC}
)

# ASM sources
set(ASM_SOURCES
    Core/Startup/startup_stm32f405vgtx.s
    SeggerRTT/RTT/SEGGER_RTT_ASM_ARMv7M.S
    application/source/vocoder/vocoder_thumb.S
)

######################################
# Include paths
######################################

set(INCLUDES
    Core/Inc
    Drivers/STM32F4xx_HAL_Driver/Inc
    Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    Drivers/CMSIS/Device/ST/STM32F4xx/Include
    Drivers/CMSIS/Include
    Middlewares/Third_Party/FreeRTOS/Source/include
    Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2
    Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
    Middlewares/ST/STM32_USB_Device_Library/Core/Inc
    Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc
    Middlewares/Third_Party/lvgl
    USB_DEVICE/App
    USB_DEVICE/Target
    SeggerRTT/Config
    SeggerRTT/RTT
    application/include
    application/source
    .
)

######################################
# Defines
######################################

set(DEFINES
    USE_HAL_DRIVER
    STM32F405xx
    PLATFORM_${PLATFORM}
    NDEBUG
)


######################################
# Compiler flags
######################################

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -fdata-sections -ffunction-sections")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-format -Wno-format-truncation -Wno-stringop-overflow")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-implicit-function-declaration")

# Optimization
set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_C_FLAGS_DEBUG "-Og -g3")

# ASM flags
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -Wall -fdata-sections -ffunction-sections")
enable_language(ASM)

######################################
# Linker
######################################

set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/STM32F405VGTX_FLASH.ld)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T${LINKER_SCRIPT}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Map=${TARGET}.map,--cref")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")

######################################
# Target
######################################

# Git revision stamped into the firmware (firmware-info screen, hotspot HARDWARE
# string). Precedence: -DGITVERSION=... (CI injecting a known SHA) > GITVERSION
# environment variable > git in the source tree > UNKNOWN. The build image ships
# git, so container and CI builds self-stamp without any override.
if(NOT GITVERSION)
    if(DEFINED ENV{GITVERSION} AND NOT "$ENV{GITVERSION}" STREQUAL "")
        set(GITVERSION "$ENV{GITVERSION}")
    else()
        execute_process(
            COMMAND git rev-parse --short HEAD
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE GITVERSION
            OUTPUT_STRIP_TRAILING_WHITESPACE
            ERROR_QUIET
        )
    endif()
endif()
if(NOT GITVERSION)
    set(GITVERSION UNKNOWN)
endif()
message(STATUS "Firmware git revision: ${GITVERSION}")
set_source_files_properties(
    application/source/functions/hotspot.c
    application/source/usb/usb_com.c
    application/source/user_interface/menuFirmwareInfoScreen.c
    PROPERTIES COMPILE_DEFINITIONS "GITVERSION=${GITVERSION}")

add_executable(${TARGET}.elf ${C_SOURCES} ${ASM_SOURCES})

# Keep the C packing/FEC adapter fast on the real-time audio path.
# The DSP core is assembled directly; C optimization does not alter it.
set_source_files_properties(${APP_VOCODER_SRC}
    PROPERTIES COMPILE_OPTIONS "-O3;-fno-strict-aliasing;-fwrapv")

target_include_directories(${TARGET}.elf PRIVATE ${INCLUDES})
target_compile_definitions(${TARGET}.elf PRIVATE ${DEFINES})

if(VARIANT_PLUS)
    target_compile_definitions(${TARGET}.elf PRIVATE "VARIANT_PLUS")
    set(OUTPUT_BIN OpenMDUV390+.bin)
else()
    set(OUTPUT_BIN Open${PLATFORM}.bin)
endif()

# Generate a standalone image; the vocoder is built entirely from source.
add_custom_command(TARGET ${TARGET}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary -S ${TARGET}.elf ${OUTPUT_BIN}
    COMMAND ${CMAKE_SIZE} ${TARGET}.elf
    COMMENT "Building ${OUTPUT_BIN}"
)

# Add binary files to clean target
set_property(TARGET ${TARGET}.elf APPEND PROPERTY ADDITIONAL_CLEAN_FILES
    "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}"
    "${CMAKE_BINARY_DIR}/${TARGET}.map"
)

# Flash target
if(PLATFORM STREQUAL "DM1701")
    set(MODEL "DM-1701")
else()
    set(MODEL "MD-UV380")
endif()

# Flash firmware to device (independent, no rebuild)
add_custom_target(flash
    COMMAND python3 "${CMAKE_SOURCE_DIR}/../tools/loader.py" -f "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}" -m "${MODEL}"
    USES_TERMINAL
    COMMENT "Flashing ${OUTPUT_BIN} to ${MODEL}"
)

# Build and flash in one command
add_custom_target(build-and-flash
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR}
    COMMAND python3 "${CMAKE_SOURCE_DIR}/../tools/loader.py" -f "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}" -m "${MODEL}"
    USES_TERMINAL
    COMMENT "Building and flashing ${OUTPUT_BIN} to ${MODEL}"
)

# Distclean - remove entire build directory
add_custom_target(distclean
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}
    COMMENT "Removing entire build directory"
)
