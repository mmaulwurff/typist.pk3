#!/bin/bash

# Usage: ./scripts/import_clematis.sh

source_dir=3rdparty/clematis/src/ZSCRIPT/CLEMATIS
target_dir=zscript/clematis

rm -rf $target_dir
cp -r  $source_dir $target_dir

cd $target_dir
find . -name "*.zsc" | rename 's/\.zsc/_tt.zs/'
find . -name "*.zs" | xargs sed -i 's/Clematis/tt_Clematis/g'
find . -name "*.zs" | xargs sed -i 's/Cl_/tt_Cl_/g'
cd - > /dev/null
