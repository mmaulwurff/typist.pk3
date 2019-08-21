#!/bin/bash

# This script runs Clematis tests in GZDoom.
#
# Features:
# - all tests are executed on clean map start;
# - finds all classes that are named like tt_*Test, and runs them as Clematis
#   tests with "netevent test:tt_*Test" CCMD;
# - finds all classes that are named like tt_*TestPostCheck, and runs them as
#   Clematis tests right 1 second after the corresponding tt_*Test without map
#   restart.
#
# Usage:
# ./scripts/run_tests.sh <mod.pk3>

function make_tests_ccmd {
    test_classes=$(find zscript/typist -name "*.zs" -print0 \
                       | xargs -0 grep -hom 1 "tt_.*Test "  \
                       | sort)

    for test_class in $test_classes
    do
        echo "wait 1; map tt_test; wait 2; netevent test:$test_class; wait 1;"

        if grep -nrq "$test_class"PostCheck
        then
           echo "wait 35; netevent test:""$test_class""PostCheck; wait 1;"
        fi
    done

    echo "echo ---------; echo Found $(echo "$test_classes" | wc -l) tests. Testing finished.; quit"
}

file_name=$1
tests_ccmd="$(make_tests_ccmd)"
echo "$tests_ccmd"
out=$(time gzdoom                                 \
        -iwad /usr/share/games/doom/freedoom2.wad \
        -file "$file_name"                        \
        -nosound                                  \
        +"$tests_ccmd"
    )

echo -e "$out"
