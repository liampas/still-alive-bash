#!/bin/bash
killall mplayer
clear
cat borders.txt
mplayer -really-quiet Still_Alive_Song.mp3 >/dev/null 2>&1 &


line='1'

#line is used for when writing the old text

for line in {1..2}
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
	sleep 0.06
  done
done










sleep 4.50
















for line in {3..24}
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
	sleep 0.06
  done
done
