#!/bin/bash

# This script creates a file for the specified ZScript class.
# The file is created in zscript/typist directory.
#
# Usage:
# create_class_file.sh ClassName

className="$1"
file_name="zscript/typist/tt_$className.zs"

cat docs/source-template.zst > "$file_name"

contents="
/**
 */
class tt_$className
{

// public: /////////////////////////////////////////////////////////////////////

} // class tt_$className"

echo -e "$contents" >> "$file_name"
