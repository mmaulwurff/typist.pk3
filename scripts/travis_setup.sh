#!/bin/bash

# This scripts sets up GZDoom CVars.

/opt/gzdoom/gzdoom \
    -iwad /usr/share/games/doom/freedoom2.wad \
    -nosound \
    -norun \
    +fullscreen false

exit 0
