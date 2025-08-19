#!/bin/bash
n=$'5'
text=$(sed -n "${n}p" text.txt)
length=$(sed -n "${n}p" text.txt | awk '{print length}')

rest=$((47-$length))
#printf ' %.0s' ${test..rest}

space=$(seq -s" " $rest|tr -d '[:digit:]')

echo "| $text$space|"
echo "$n"
