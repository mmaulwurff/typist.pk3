#!/bin/bash

# This script installs packages that Typist.pk3 build process depends on.
# This script is intended to be run on CI server.
#
# CI server is configured as Ubuntu Xenial, so packages may be different
# for your distributive.

add-apt-repository 'deb http://debian.drdteam.org/ stable multiverse'
wget -O- http://debian.drdteam.org/drdteam.gpg | apt-key add -
apt-get update
apt-get install gzdoom aspell aspell-en zip freedoom xvfb pylint3 shellcheck preload

# Disable GZDoom hardware survey:
mkdir --parents ~/.config/gzdoom
echo -e "[GlobalSettings]\\nsys_statsenabled=1" > ~/.config/gzdoom/gzdoom.ini
chown travis ~/.config/gzdoom/gzdoom.ini
