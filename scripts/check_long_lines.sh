#!/bin/bash

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
