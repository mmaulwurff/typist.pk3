#!/bin/bash

# Features:
# putting file name and line numer inside between '"' and '@' characters, if found on one line

find . -name "*.zs" | while read f; do
    ( rm $f && awk -v f="$f" '{gsub("\".*@","\""f":"NR": @");print;}' > $f ) < $f
done
