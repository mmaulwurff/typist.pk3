#!/bin/bash

# This script builds a mod and runs tests.

set -e

file_name=$(scripts/build.sh)
filter_file=scripts/gzdoom-normal-output.dat

export PATH="/usr/games/:$PATH"

# Code check functions #########################################################

function spelling {
    echo -e "\\nCode_check_1: Spelling #########################################"
    ./scripts/spelling_code.sh
}

function line_width {
    echo -e "\\nCode_check_2: Line width #######################################"
    ./scripts/check_long_lines.sh
}

function pk3_contents {
    echo -e "\\nCode_check_3: Pk3 contents: ####################################"
    ./scripts/list_pk3_contents.sh
}

function todo {
    echo -e "\\nCode_check_4: To do: ###########################################"
    ./scripts/list_todo.sh
}

function python_version {
    echo -e "\\nCode_check_5: Python: ##########################################"
    python3 --version
}

function python_lint {
    echo -e "\\nCode_check_6: Python lint: #####################################"
    pylint3 ./scripts/*.py
}

function shell_lint {
    echo -e "\\nCode_check_7: Shell lint: ######################################"
    shellcheck --color=never --format=gcc ./scripts/*.sh
}

function check_init {
    echo -e "\\nCode_check_8: Check object initialization: #####################"
    ./scripts/check_init.sh
}

# Test functions ###############################################################

function gzdoom_only {
    echo -e "\\nTest_1: GZDoom only ############################################"
    ./scripts/norun_gzdoom.sh
}

function dry_run {
    echo -e "\\nTest_2: Dry run with mod #######################################"
    ./scripts/dry_run_gzdoom.sh "$filter_file" "$file_name"
}

function tests {
    echo -e "\\nTest_3: Tests ##################################################"
    ./scripts/run_tests.sh "$file_name" "$filter_file"
}

function uncontrolled_run {
    echo -e "\\nUncontrolled GZDoom run ########################################"

    gzdoom -file "$file_name" "$@"
}

# Code checks ##################################################################

spelling
line_width
pk3_contents
todo
python_version
python_lint
shell_lint
check_init

# Tests ########################################################################
# Comment out tests that you don't want to run.

gzdoom_only
dry_run
tests

# Not a test ###################################################################
# Must be commented off for CI.

#uncontrolled_run "$@"
