#!/bin/bash

# This script creates a file for the specified ZScript class.
# The file is created in zscript/typist directory.
#
# Usage:
# create_class_file.sh ClassName

className="$1"
# camelCase to under_score
file_name="zscript/typist/$(echo "tt_$className.zs" \
    | sed -r 's/([a-z0-9])([A-Z])/\1_\L\2/g' \
    | tr '[:upper:]' '[:lower:]')"

cat docs/source-template.zst > "$file_name"

contents="
/**
 *
 */
class tt_$className
{

// public: /////////////////////////////////////////////////////////////////////

// private: ////////////////////////////////////////////////////////////////////

} // class tt_$className"

echo -e "$contents" >> "$file_name"
