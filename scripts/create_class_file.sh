#!/bin/bash

# This script creates a file for the specified ZScript class.
# usage:
# create_class_file.sh ClassName

className="$1"
fileName="zscript/typist/tt_$className.zs"

cat docs/source-template.zst > "$fileName"

contents="\n"\
"/**\n"\
" */\n"\
"class tt_$className\n"\
"{\n"\
"\n"\
"// public: /////////////////////////////////////////////////////////////////////\n"\
"\n"\
"} // class tt_$className"

echo -e "$contents" >> "$fileName"
