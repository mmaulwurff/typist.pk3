#!/bin/bash

# This script imports Lazy Points code by copying its code to a corresponding
# directory.
#
# Usage: ./scripts/import_lazy_point.sh

source_dir=3rdparty/lazy-points/zscript
target_dir=zscript/lazy-points

rm -rf $target_dir
cp -r  $source_dir $target_dir

parameters_file="$target_dir/zc_Parameters.zs"

sed -i 's/FONT = .*/FONT = "NewSmallFont";/'          "$parameters_file"
sed -i 's/BONUS_COUNTDOWN = .*/BONUS_COUNTDOWN = 4;/' "$parameters_file"
sed -i 's/Y_OFFSET = .*/Y_OFFSET = 100;/'             "$parameters_file"
