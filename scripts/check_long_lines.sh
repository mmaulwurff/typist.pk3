#!/bin/bash

max_width=100

let check_width=$max_width+1

out=$(find zscript/typist -name "*.zs" | while read f; do
          grep -nH ".\{$check_width\}" $f || true
      done)

n_lines=$(echo "$out" | grep -v "^$" | wc -l)

if [ $n_lines -gt 0 ]
then
    echo "$out"
else
    echo "No lines longer than $max_width."
fi
