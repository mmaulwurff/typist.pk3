#!/bin/bash

filterfile=$1
filename=$2

time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound -file $filename 2>&1 |\
    grep -vf $filterfile |\
    grep -v "^$" |\
    grep -v "GZDoom.*version" |\
    grep -v "Compiled on"
