#!/bin/bash

# This script prints GZDoom version and runs GZDoom without any mods, just a
# sanity check.
#
# The output is filtered according to filter_file.
#
# Usage:
# ./scripts/norun_gzdoom.sh <filter_file>

filter_file=$1

apt-cache policy gzdoom freedoom

time gzdoom \
     -iwad /usr/share/games/doom/freedoom2.wad \
     -norun \
     -nosound \
     2>&1 |\
    grep -vf "$filter_file" |\
    grep -v "^$"
