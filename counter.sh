#!/bin/bash



FILE=/home/cristina/Downloads/bashcrc
string_to_search="StrictHostKeyChecking"
count=0

IFS=$'\n'
for LINE in $(cat "$FILE")
do
echo "$LINE"

if [[ "$LINE" == *"$string_to_search"* ]];
        then
                ((count = count + 1))
fi

done

echo "The number of occurences of the string is $count"

