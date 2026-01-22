#!/bin/bash
set -e

file=OpenDM1701.bin

python3 ../tools/loader.py -s ../blobs/MD9600-CSV\(2571V5\)-V26.45.bin -f $file -m DM-1701
