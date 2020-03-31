#!/bin/bash

# This script writes a title with version to language lump.
#
# Usage:
# ./scripts/make_title.sh

version=$(git describe --abbrev=0 --tags)
sed -i "s/TT_TITLE.*/TT_TITLE = \"Typist.pk3 v$version\";/" language.txt
