#!/bin/bash

clear

#mplayer -really-quiet Still_Alive_Song.mp3 >/dev/null 2>&1 &

#echo -------------------------------------------------

#cat borders.txt


word=$(sed -n "6p" text.txt)
n=$(sed -n "6p" text.txt | awk '{print length}')



for (( i=1; i<=$n; i++ ))
do 
	echo -------------------------------------------------

	echo -n "| "
	echo ${word:0:i}

	sleep 0.1
	clear
done


