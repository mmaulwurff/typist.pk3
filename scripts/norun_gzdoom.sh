#!/bin/bash

# This script prints GZDoom version and runs GZDoom without any mods, just a
# sanity check.
#
# Usage:
# ./scripts/norun_gzdoom.sh

apt-cache policy gzdoom

time gzdoom \
     -iwad maps/miniwad.wad \
     -norun    \
     -nosound  \
     2>&1     |\
    grep -v "^$"
