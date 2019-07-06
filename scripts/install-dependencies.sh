#!/bin/bash

add-apt-repository 'deb http://debian.drdteam.org/ stable multiverse'
wget -O- http://debian.drdteam.org/drdteam.gpg | sudo apt-key add -
apt-get update
apt-get install gzdoom aspell aspell-en zip freedoom xvfb
