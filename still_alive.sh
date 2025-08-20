#!/bin/bash

clear

#mplayer -really-quiet Still_Alive_Song.mp3 >/dev/null 2>&1 &

#echo -------------------------------------------------

cat borders.txt
for line in {1..25}

do 
text=$(sed -n "${line}p" text.txt)
length=$(sed -n "${line}p" text.txt | awk '{print length}')

rest=$((47-$length))
space=$(seq -s" " $rest|tr -d '[:digit:]')


echo -n "| " 
echo -n "$text" | pv -qL 20 
echo "$space|"
#	echo "| $text$space|" | pv -qL 20
done
