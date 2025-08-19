#pv -qL 200 still_alive_text.txt | head -n 2

#sed -n 6p still_alive_text.txt | pv -qL 200

#test=$(sed -n 6p still_alive_text.txt)

#echo $test | pv -qL 200


#sed -n 6p text.txt | tee >(espeak -ven+f3 -m -p 80 -s 180 >/dev/null 2>&1) | pv -qL 20
sed -n 6p text.txt | tee >(espeak -ven+f3 -m -p 80 -s 180 >/dev/null 2>&1) | tee >(espeak -ven+f3 -a 50 -m -p 82 -s 180 >/dev/null 2>&1) |pv -qL 20


#espeak -ven+f3 -m --stdout -p 60 -s 180
