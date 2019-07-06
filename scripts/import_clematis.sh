#!/bin/bash

# Usage: ./scripts/import_clematis.sh

source_dir=3rdparty/clematis/src/ZSCRIPT/CLEMATIS
target_dir=zscript/clematis

rm -rf $target_dir
cp -r  $source_dir $target_dir

cd $target_dir
rename 's/^/tt_/'
rename 's/ /_/' *.zsc
rename 's/\.txt/.zs/' *.zsc
sed -i 's/Cl/tt_Cl/g' *.zs
cd -
