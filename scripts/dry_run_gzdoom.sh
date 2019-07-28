#!/bin/bash

# This script launches GZDoom without running it.
# Is used to check if no compilation errors in the mod.
# The GZDoom output is filtered according to filter file:
# Any output line that is equal to the line in filter file is ignored.
#
# Usage:
# ./scripts/dry_run_gzdoom.sh <filter_file> <mod_file>

filter_file=$1
file_name=$2

time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound -file "$file_name" 2>&1 |\
    grep -vf "$filter_file" |\
    grep -v "^$" |\
    grep -v "GZDoom.*version" |\
    grep -v "Compiled on" |\
    sed "s|$file_name:||" | sed "s|, line |:|" |\
    sed "s|Script error, \"||" | sed "s|\"line |:|"
