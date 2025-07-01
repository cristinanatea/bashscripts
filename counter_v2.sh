#!/bin/bash

FILE1=$1
FILE2=$2
string_to_search=$3
count=0
FILE3=$3

cat "$FILE1" "$FILE2" > "$FILE3"

while IFS= read -r LINE; do
    if [[ "$LINE" == *"$string_to_search"* ]]; then
        echo "$LINE"
        ((count++))
    fi
done < "$FILE3"

rm "$FILE3"

echo "The number of occurrences of the string is $count"




