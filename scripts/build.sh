#!/bin/bash

name=typist
version=$(git describe --abbrev=0 --tags)
filename=$name-$version.pk3
files=$(find . -name "*.zs" -o -name "*.md" -o -name "*.txt")

scripts/make_changelog.sh
scripts/make_zscript_head.sh

rm -f *.pk3
zip --quiet --compression-method store $filename $files

echo $filename
