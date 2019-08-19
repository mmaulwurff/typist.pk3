#!/bin/bash

# This scripts sets up GZDoom CVars.

/opt/gzdoom/gzdoom \
    -iwad /usr/share/games/doom/freedoom2.wad \
    -nosound \
    -norun \
    +vid_rendermode 0 \
    +vid_renderer 0 \
    +fullscreen false

exit 0
