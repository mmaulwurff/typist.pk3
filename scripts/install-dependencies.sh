#!/bin/bash

# This script installs packages that Typist.pk3 build process depends on.
# This script is intended to be run on CI server.

add-apt-repository 'deb http://debian.drdteam.org/ stable multiverse'
wget -O- http://debian.drdteam.org/drdteam.gpg | apt-key add -
apt-get update
apt-get install gzdoom aspell aspell-en zip freedoom xvfb pylint3 shellcheck
