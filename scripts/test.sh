#!/bin/bash

# This script builds a mod and runs tests.

set -e

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
    ./scripts/check_long_lines.sh
}

function pk3_contents {
    echo -e "\nCode_check_3: Pk3 contents: ####################################"
    ./scripts/list_pk3_contents.sh
}

# Test functions ###############################################################

function gzdoom_only {
    echo -e "\nTest_1: GZDoom only ############################################"
    ./scripts/norun_gzdoom.sh "$filterfile"
}

function dry_run {
    echo -e "\nTest_2: Dry run with mod #######################################"
    ./scripts/dry_run_gzdoom.sh "$filterfile"
}

function actual_run {
    echo -e "\nTest_3: Actual run with mod ####################################"

    pipename=pipe
    rm -f  "$pipename"
    mkfifo "$pipename"

    time gzdoom -iwad /usr/share/games/doom/freedoom2.wad -nosound -file $filename +map map01\
         +"set tt_is_test_enabled true"\
         2>&1 > "$pipename" &

    out=$(cat < "$pipename" | while read l; do
        [[ "$l" == "["*   ]] && echo $l
        [[ "$l" == *"T:"* ]] && echo $l
        [[ "$l" == *"Test finished." ]] && pkill gzdoom
    done)

    rm -f "$pipename"

    echo -e "\n$out"

    status=$(echo "$out" | grep "ERROR\|WARN\|FATAL" | wc -l)

    exit $status
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
