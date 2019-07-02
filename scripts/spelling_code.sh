#!/bin/bash

known_words=scripts/known-words.txt

SPELL_FILES=$(find . | grep '\.zs\|.md\|.txt\|\.acs')

LOWERCASE=$(grep -h -o -E '\w{4,}' $SPELL_FILES | sed -e 's/_/ /g' | sed -e 's/[0-9]/ /g' | perl -ne 'print lc(join(" ", split(/(?=[A-Z])/)))' | grep -o -E '\w{4,}')

#UPPERCASE=$(grep -h -o -E '[A-Z]{4,}' $SPELL_FILES | tr '[:upper:]' '[:lower:]')

WORDS=$(echo "$LOWERCASE" "$UPPERCASE" | sort -u -f | aspell --lang=en_UK --ignore-case --home-dir=. --personal=$known_words list)

while [[ $# > 0 ]]
do
    WORDS=$(comm -13 <(sort "$1") <(echo "$WORDS" | sort))
    shift
done

if [ -z "$WORDS" ]
then
    echo "No misspelled words."
else
    echo "$WORDS"
fi
