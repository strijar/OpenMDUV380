#!/usr/bin/env bash
# Prepares build: compiles codec_cleaner and creates codec placeholder
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODEC_CLEANER_DIR="$SCRIPT_DIR/codec_cleaner"
CODEC_CLEANER="$CODEC_CLEANER_DIR/codec_cleaner"
LINKERDATA="$SCRIPT_DIR/../MDUV380_firmware/application/source/linkerdata"

# Compile codec_cleaner if needed
if [ ! -x "$CODEC_CLEANER" ]; then
    echo "Compiling codec_cleaner..."
    gcc -Wall -O2 -s -o "$CODEC_CLEANER" "$CODEC_CLEANER_DIR/codec_cleaner.c"
    echo "Built: $CODEC_CLEANER"
fi

# Create placeholder if needed
if [ -f "$LINKERDATA/codec_bin_section_1.bin" ]; then
    echo "Codec placeholder exists: $(wc -c < "$LINKERDATA/codec_bin_section_1.bin") bytes"
    exit 0
fi

echo "Creating codec placeholder..."
cd "$LINKERDATA" && "$CODEC_CLEANER" -C
