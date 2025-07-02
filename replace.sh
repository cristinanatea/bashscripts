#!/bin/bash

FILE="$1"
lista_litere="A U T O M A T I O N"
nr_de_linii=0
index_linie=0

FILE2="tmp_$$.txt"

read -a lista_de_inlocuit <<< "$lista_litere"


> "$FILE2"

while IFS= read -r LINE; do
    ((nr_de_linii++))

    if [[ $nr_de_linii -ge 63 && $nr_de_linii -le 72 ]]; then
        read -a campuri <<< "$LINE"

        valoare_initiala=${campuri[5]}
        valoare_noua=${lista_de_inlocuit[$index_linie]}
        campuri[5]=$valoare_noua

        echo "${campuri[@]}" >> "$FILE2"
        echo "$valoare_initiala was replaced with the letter: $valoare_noua"


        ((index_linie++))
 else
        echo "$LINE" >> "$FILE2"



    fi

done < "$FILE"

mv "$FILE2" "$FILE"
