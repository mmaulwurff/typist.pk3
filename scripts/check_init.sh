#!/bin/bash

grep -nir "new(.*tt_" zscript/typist | grep -v "init(" | grep -v "~"

exit 0
