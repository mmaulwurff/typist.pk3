#!/bin/bash

test_classes=$(find zscript/typist -name "*.zs" -print0  \
                   | xargs -0 grep -hom 1 "tt_.*Test " \
                   | sort)

test_classes="$test_classes""
"$(find zscript/typist -name "*.zs" -print0  \
                   | xargs -0 grep -hom 1 "tt_.*TestPostCheck " \
                   | sort)

for test_class in $test_classes
do
    out="$out""
class ""$test_class"'Helper : tt_TestHelper
{
  override void run() { Console.Printf("%d", level.time); tt_Clematis.Create("'"$test_class""\"); }
}
"
done

echo -e "$out" > ./zscript/typist/tests/tt_test_helpers.zs
