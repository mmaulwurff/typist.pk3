#!/bin/bash

echo -e "version 4.1.3\n" > zscript.zs

find zscript -name "*.zs" | while read f; do echo "#include \"$f\"" >> zscript.zs; done
