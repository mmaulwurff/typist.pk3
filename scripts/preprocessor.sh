#!/bin/bash

# This script is a preprocessor for ZScript code.
#
# Usage: ./scripts/preprocessor.sh
#
# Features:
# - putting file name and line number inside between '"' and '@' characters, if found on one line.

find . -name "*.zs" | sed 's|./||' | while read -r f; do
    modified=$(awk -v f="$f" '{gsub("\".*T:","\""f":"NR": T:");print;}' - < "$f")
    echo "$modified" > "$f"
done
