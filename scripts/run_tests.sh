#!/bin/bash

# This script runs Clematis tests in GZDoom.
#
# Usage:
# ./scripts/run_tests.sh <mod.pk3>

function make_tests_ccmd {
    test_classes=$(find zscript/typist -name "*.zs" -print0 \
                       | xargs -0 grep -hom 1 "tt_.*Test" \
                       | sort)

    for test_class in $test_classes
    do
        echo "map *; wait 1; netevent test:$test_class; wait 1;"
    done

    echo "echo ---------; echo Found $(echo "$test_classes" | wc -l) tests. Testing finished.; quit"
}

file_name=$1
tests_ccmd="$(make_tests_ccmd)"
out=$(time gzdoom \
        -iwad /usr/share/games/doom/freedoom2.wad \
        -file "$file_name" \
        -nosound \
        +map tt_test \
        +"$tests_ccmd"
    )

echo -e "\\n$out"
