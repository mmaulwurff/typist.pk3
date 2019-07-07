#!/bin/bash

filterfile=$1

time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound 2>&1 |\
    grep -vf $filterfile |\
    grep -v "^$"
