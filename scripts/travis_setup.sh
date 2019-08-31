#!/bin/bash

# This scripts sets up GZDoom CVars.

/opt/gzdoom/gzdoom         \
    -iwad maps/miniwad.wad \
    -nosound               \
    -norun                 \
    +fullscreen false

exit 0
