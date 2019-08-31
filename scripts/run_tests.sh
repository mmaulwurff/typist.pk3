#!/bin/bash

# This script runs Clematis tests in GZDoom.
#
# Features:
# - all tests are executed on clean map start;
# - finds all classes that are named like tt_*Test, and runs them as Clematis
#   tests with "netevent test:tt_*Test" CCMD;
# - finds all classes that are named like tt_*TestPostCheck, and runs them as
#   Clematis tests right 1 second after the corresponding tt_*Test without map
#   restart;
# - tests that are listed in test-blacklist file will be ignored.
#
# Usage:
# ./scripts/run_tests.sh <mod.pk3> <filter-file>
#
# filter-file contains lines that will be filtered out from the output.

file_name=$1
filter_file=$2
test_classes=$(find zscript/typist -name "*.zs" -print0 \
                    | xargs -0 grep -hom 1 "tt_.*Test "  \
                    | sort)

if [ -f "test-blacklist" ]
then
    test_classes=$(echo "$test_classes" | grep -vf "test-blacklist")
fi

for test_class in $test_classes
do
    tests_ccmd="wait 1;            \
        map map01;                  \
        wait 2;                      \
        echo Starting $test_class...; \
        netevent test:$test_class;     \
        wait 35;"

    if grep -nrq "$test_class"PostCheck
    then
        tests_ccmd="$tests_ccmd""wait 35;          \
            netevent test:$test_class""PostCheck""; \
            wait 35;"
    fi

    tests_ccmd="$tests_ccmd""quit"

    out=$(gzdoom \
        -iwad maps/miniwad.wad        \
        -file "$file_name"            \
        -nosound                      \
        +"$tests_ccmd"                \
            | grep -vf "$filter_file" \
            | grep -v "^$")

    full_out="$full_out""$out"

    echo "$out"
done

echo ========================================
echo "Found $(echo "$test_classes" | wc -l) tests. Testing finished."

status=$(echo "$full_out" | grep -c "ERROR\\|WARN\\|FATAL" || true)
[[ "$status" == 0 ]]
