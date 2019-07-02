#!/bin/bash

# This script builds a mod and runs tests.

filename=$(scripts/build.sh)
filterfile=scripts/gzdoom-normal-output.txt

# Code check functions #########################################################

function spelling {
    echo -e "\nCode_check_1: Spelling #########################################"
    ./scripts/spelling_code.sh
}

# Test functions ###############################################################

function gzdoom_only {
    echo -e "\nTest_1: GZDoom only ############################################"

    time gzdoom -norun -nosound 2>&1 |\
        grep -vf $filterfile |\
        grep -v "^$"
}

function dry_run {
    echo -e "\nTest_2: Dry run with mod #######################################"

    time gzdoom -norun -nosound -file $filename 2>&1 |\
        grep -vf $filterfile |\
        grep -v "^$" |\
        grep -v "GZDoom.*version" |\
        grep -v "Compiled on"
}

function actual_run {
    echo -e "\nTest_3: Actual run with mod ####################################"

    rm -f pipe1
    mkfifo pipe1

    time gzdoom -nosound -file $filename +"wait 1; map map01;" 2>/dev/null > pipe1 &

    cat < pipe1 | while read l; do
        [[ "$l" == *"Test:"* ]] && echo $l;
        [[ "$l" == *"Test finished." ]] && pkill gzdoom;
    done

    rm -f pipe1
}

# Code checks ##################################################################

spelling

# Tests ########################################################################
# Comment out tests that you don't want to run.

gzdoom_only
dry_run
actual_run
