#!/bin/bash

filter_file=$1
file_name=$2

time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound -file "$file_name" 2>&1 |\
    grep -vf "$filter_file" |\
    grep -v "^$" |\
    grep -v "GZDoom.*version" |\
    grep -v "Compiled on"
