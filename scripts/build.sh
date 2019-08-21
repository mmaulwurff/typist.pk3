#!/bin/bash

set -e

name=typist
version=$(git describe --abbrev=0 --tags)
file_name=$name-$version.pk3
files=$(find . -name "*.zs" -o -name "*.md" -o -name "*.txt" -o -name "*.wad" | grep -v "3rdparty")

scripts/make_changelog.sh

scripts/import_clematis.sh
scripts/make_mocks.py
scripts/generate_test_helpers.sh
scripts/make_zscript_head.sh
scripts/make_mapinfo.sh
scripts/preprocessor.sh

rm -f ./*.pk3
echo "$files" | zip --quiet --compression-method store "$file_name" -@

echo "$file_name"
