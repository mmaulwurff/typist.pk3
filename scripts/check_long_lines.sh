#!/bin/bash

max_width=100

(( check_width=max_width+1 ))

files=$(find zscript/typist -name "*.zs"; find scripts -name "*.sh")

out=$(echo "$files" | while read -r f; do
          grep -nH ".\\{$check_width\\}" "$f" || true
      done)

n_lines=$(echo "$out" | grep -cv "^$")

if [ "$n_lines" -gt 0 ]
then
    echo "$out"
else
    echo "No lines longer than $max_width."
fi
