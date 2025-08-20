#!/bin/bash

clear

#mplayer -really-quiet Still_Alive_Song.mp3 >/dev/null 2>&1 &

#echo -------------------------------------------------

#cat borders.txt


text=$(sed -n "6p" text.txt)
length=$(sed -n "6p" text.txt | awk '{print length}')


for (( i=1; i<=$length; i++ ))
do

rest=$((47-$i))
space=$(seq -s" " $rest|tr -d '[:digit:]')

	echo -------------------------------------------------

	echo -n "| "
	echo -n "${text:0:i}"
	
	echo "$space|"


	for (( o=1; o<5; o++ ))
	do 
		echo "|                                               |"
	done



	sleep 0.1
	clear
done


