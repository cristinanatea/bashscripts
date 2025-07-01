#!/bin/bash

FILE=/home/cristina/Downloads/bashcrc
string_to_search="lib"
count=0

while IFS= read -r LINE; 
do
echo "$LINE"

if [[ "$LINE" == *"$string_to_search"* ]];
        then
                ((count++))
fi

done < "$FILE"

echo "The number of occurences of the string is $count"

