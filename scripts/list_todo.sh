#!/bin/bash

# This script prints all TODO comments in the project.
# Usage:
# ./scripts/list_todo.sh

FILES=$(find . | grep '\.zs$\|.md$\|.txt$\|\.acs$\|\.sh$')

echo "$FILES" | while read f; do
    # \(\) is used for grep not to find this very line.
    grep -n -H "//\(\) TODO" $f;
done

exit 0
