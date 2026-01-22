#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=== Building OpenDM1701 ==="

docker build --target export --output type=local,dest=. .

ls -lh OpenDM1701.bin
echo "Done: OpenDM1701.bin"
