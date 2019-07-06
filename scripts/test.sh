#!/bin/bash

# This script builds a mod and runs tests.

filename=$(scripts/build.sh)
filterfile=scripts/gzdoom-normal-output.dat

export PATH="/usr/games/:$PATH"

# Code check functions #########################################################

function spelling {
    echo -e "\nCode_check_1: Spelling #########################################"
    ./scripts/spelling_code.sh
}

function line_width {
    echo -e "\nCode_check_2: Line width #######################################"
    maxwidth=100

    let checkwidth=$maxwidth+1

    out=$(find zscript/typist -name "*.zs" | while read f; do
        grep -nH ".\{$checkwidth\}" $f || true
    done)

    nlines=$(echo "$out" | grep -v "^$" | wc -l)

    if [ $nlines -gt 0 ]
    then
        echo "$out"
    else
        echo "No lines longer than $maxwidth."
    fi
}

function pk3_contents {
    echo -e "\nCode_check_3: Pk3 contents: ####################################"
    ./scripts/list_pk3_contents.sh
}

# Test functions ###############################################################

function gzdoom_only {
    echo -e "\nTest_1: GZDoom only ############################################"

    time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound 2>&1 |\
        grep -vf $filterfile |\
        grep -v "^$"
}

function dry_run {
    echo -e "\nTest_2: Dry run with mod #######################################"

    time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -norun -nosound -file $filename 2>&1 |\
        grep -vf $filterfile |\
        grep -v "^$" |\
        grep -v "GZDoom.*version" |\
        grep -v "Compiled on"
}

function actual_run {
    echo -e "\nTest_3: Actual run with mod ####################################"

    rm -f pipe1
    mkfifo pipe1

    time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -nosound -file $filename +map map01\
         2>&1 > pipe1 &

    cat < pipe1 | while read l; do
        [[ "$l" == *"T:"* ]] && echo $l;
        [[ "$l" == *"Test finished." ]] && pkill gzdoom;
    done

    rm -f pipe1
}

# Code checks ##################################################################

spelling
line_width
pk3_contents

# Tests ########################################################################
# Comment out tests that you don't want to run.

gzdoom_only
dry_run
actual_run
