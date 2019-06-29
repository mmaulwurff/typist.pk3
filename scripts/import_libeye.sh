#!/bin/bash

# Usage: ./scripts/import_libeye.sh <libeye directory>
# This script imports libeye library by KeksDose
# https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157

libeye_source_dir=$1
libeye_target_dir=zscript/libeye

echo $libeye_dir

rm -rf $libeye_target_dir
cp -r  $libeye_source_dir $libeye_target_dir

cd $libeye_target_dir
rename 's/^/tt_/' *.txt
rename 's/ /_/' *.txt
rename 's/\.txt/.zs/' *.txt
mv tt_libeye.zs tt_libeye.txt
sed -i 's/Le_/tt_Le_/g' *.zs
cd -
