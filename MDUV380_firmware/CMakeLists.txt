cmake_minimum_required(VERSION 3.20)

# Platform selection: DM1701, MDUV380
set(PLATFORM "DM1701" CACHE STRING "Target platform (DM1701, MDUV380)")
set_property(CACHE PLATFORM PROPERTY STRINGS DM1701 MDUV380)

# Validate platform
if(NOT PLATFORM MATCHES "^(DM1701|MDUV380)$")
    message(FATAL_ERROR "Invalid PLATFORM: ${PLATFORM}. Use DM1701 or MDUV380")
endif()

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
    application/source/dmr_codec/codec_bin.S
    SeggerRTT/RTT/SEGGER_RTT_ASM_ARMv7M.S
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
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--noinhibit-exec")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lc -lm")

######################################
# Target
######################################

add_executable(${TARGET}.elf ${C_SOURCES} ${ASM_SOURCES})

target_include_directories(${TARGET}.elf PRIVATE ${INCLUDES})
target_compile_definitions(${TARGET}.elf PRIVATE ${DEFINES})

# Output binary name
set(OUTPUT_BIN Open${PLATFORM}.bin)
set(RAW_BIN ${TARGET}.bin)

# Codec cleaner tool
find_program(CODEC_CLEANER NAMES codec_cleaner)

if(NOT CODEC_CLEANER)
    # Not in PATH, build it
    set(CODEC_CLEANER_SRC ${CMAKE_SOURCE_DIR}/../tools/codec_cleaner/codec_cleaner.c)
    set(CODEC_CLEANER ${CMAKE_SOURCE_DIR}/../tools/codec_cleaner/codec_cleaner${CMAKE_EXECUTABLE_SUFFIX})

    find_program(HOST_CC NAMES gcc cc clang)
    if(NOT HOST_CC)
        message(FATAL_ERROR "Host C compiler not found (needed to build codec_cleaner)")
    endif()

    if(NOT EXISTS ${CODEC_CLEANER})
        message(STATUS "Building codec_cleaner with host compiler: ${HOST_CC}")
        execute_process(
            COMMAND ${HOST_CC} -Wall -O2 -s ${CODEC_CLEANER_SRC} -o ${CODEC_CLEANER}
            RESULT_VARIABLE CODEC_BUILD_RESULT
        )
        if(NOT CODEC_BUILD_RESULT EQUAL 0)
            message(FATAL_ERROR "Failed to build codec_cleaner")
        endif()
    endif()
endif()

message(STATUS "Using codec_cleaner: ${CODEC_CLEANER}")

# Generate .bin file and clean codec regions
add_custom_command(TARGET ${TARGET}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary -S ${TARGET}.elf ${RAW_BIN}
    COMMAND ${CODEC_CLEANER} -i ${RAW_BIN} -o ${OUTPUT_BIN}
    COMMAND ${CMAKE_SIZE} ${TARGET}.elf
    COMMENT "Building ${OUTPUT_BIN}"
)

# Add binary files to clean target
set_property(TARGET ${TARGET}.elf APPEND PROPERTY ADDITIONAL_CLEAN_FILES
    "${CMAKE_BINARY_DIR}/${RAW_BIN}"
    "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}"
    "${CMAKE_BINARY_DIR}/${TARGET}.map"
)

# Flash target
set(DONOR_DEFAULT "${CMAKE_SOURCE_DIR}/../blobs/MD9600-CSV-2571V5-V26.45.bin")
set(DONOR "${DONOR_DEFAULT}" CACHE FILEPATH "Donor firmware")
if(PLATFORM STREQUAL "DM1701")
    set(MODEL "DM-1701")
else()
    set(MODEL "MD-UV380")
endif()

# Flash firmware to device (independent, no rebuild)
add_custom_target(flash
    COMMAND python3 "${CMAKE_SOURCE_DIR}/../tools/loader.py" -s "${DONOR}" -f "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}" -m "${MODEL}"
    USES_TERMINAL
    COMMENT "Flashing ${OUTPUT_BIN} to ${MODEL}"
)

# Build and flash in one command
add_custom_target(build-and-flash
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR}
    COMMAND python3 "${CMAKE_SOURCE_DIR}/../tools/loader.py" -s "${DONOR}" -f "${CMAKE_BINARY_DIR}/${OUTPUT_BIN}" -m "${MODEL}"
    USES_TERMINAL
    COMMENT "Building and flashing ${OUTPUT_BIN} to ${MODEL}"
)

# Distclean - remove entire build directory
add_custom_target(distclean
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}
    COMMENT "Removing entire build directory"
)

