#!/bin/bash

# This script reports each instance of possible missed object instantiation.
#
# Typist objects (defined in namespace 'tt_') must be initialized via static
# function 'new' that takes all object dependencies as parameters.
#
# When invoking build-in 'new' is unavoidable (like, inside the mentioned
# static functions), use '// constructor' marker on that line.
#
# This script is executed to ensure that every object is initialized.
#
# Usage:
# ./scripts/check_init.sh

wrong=$(grep -nir "new( *\"tt_" zscript/typist | grep -v "// construct")

echo "$wrong"

exit 0
