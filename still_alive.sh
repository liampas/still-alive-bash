#pv -qL 200 still_alive_text.txt | head -n 2

#sed -n 6p still_alive_text.txt | pv -qL 200

#test=$(sed -n 6p still_alive_text.txt)

#echo $test | pv -qL 200


sed -n 6p still_alive_text.txt | tee >(espeak -ven+f3 -m -p 60 -s 180 >/dev/null 2>&1) | pv -qL 20
#sed -n 6p still_alive_text.txt | tee >(espeak-ng -p 99 >/dev/null 2>&1) | tee >(espeak-ng -p 90 -a 50 >/dev/null 2>&1) |pv -qL 20


#espeak -ven+f3 -m --stdout -p 60 -s 180
