#!/bin/bash



FILE1=/home/cristina/Downloads/bashcrc.txt
FILE2=/home/cristina/Downloads/bashcrc

variabile=("ARTIFACTORY_API_KEY" "ARTIFACTORY_USER" "IVI_ADB_SERIAL")
variabile_dinamice=("JAVA_HOME" "ANDROID_HOME")


cat "$FILE1" "$FILE2" 


    for var in "${variabile[@]}"; do
            echo "comanda: grep \"^$var=\" \"$FILE1\" | cut -d= -f2-"

	    valoare_noua=$(grep "^$var=" "$FILE1" | cut -d= -f2-)
	    if [[ -z "$valoare_noua" ]]; then
	       valoare_noua=$(grep "^export $var=" "$FILE1" | cut -d= -f2-)
	    fi
	    echo "===>  $valoare_noua"
	    
	    if [[ -n "$valoare_noua" ]]; then
            sed -i "s|^export $var=.*|export $var=$valoare_noua|g" "$FILE2"
	    fi
    done
    for var in "${variabile_dinamice[@]}"; do
	    sed -i "s|^export $var=.*|export $var=$(pwd)|g" "$FILE2"

	    done


#echo "$FILE2"

cat "$FILE2" |grep -iE "ARTIFACTORY_API_KEY|ARTIFACTORY_USER|IVI_ADB_SERIAL|JAVA_HOME|ANDROID_HOME"
