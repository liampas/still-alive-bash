#!/bin/bash
killall mplayer
clear
cat borders.txt
mplayer -really-quiet Still_Alive_Song.mp3 >/dev/null 2>&1 &


line='1'

#line is used for when writing the old text

for line in {1..24}
do
	
  text=$(sed -n "${line}p" text.txt)
  length=$(sed -n "${line}p" text.txt | awk '{print length}')
  old_text=$(head --lines -${line} text.txt)

  for (( character=1; character<=$length; character++ ))
  do

    #calculates the number of spaces to add
    rest=$((48-$character))
    space=$(seq -s" " $rest|tr -d '[:digit:]')
    lin=$(($line-1))

    duration=$(awk -F"|" -v line=$line 'NR==line {print $1}' speed-sleep.txt)
    sleeps=$(awk -F"|" -v line=$line 'NR==line {print $2}' speed-sleep.txt)
    speed=$(awk "BEGIN {printf \"%.3f\", $duration/$length}")
    clear
    echo " -------------------------------------------------"
    #writes the old text
    echo | head --lines ${lin} text+borders.txt

    echo -n "| "
    echo -n "${text:0:character}"
	
    echo "$space|"

    #prints the rest of the border
	#remaining line to draw
	need=$((31-$line))
	for (( o=1; o<$need; o++ ))
	do

		echo "|                                                |"
	done

	echo " -------------------------------------------------"
	sleep $speed
  done
  sleep $sleeps
done

