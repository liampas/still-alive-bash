#pv -qL 200 still_alive_text.txt | head -n 2

#sed -n 6p still_alive_text.txt | pv -qL 200

#test=$(sed -n 6p still_alive_text.txt)

#echo $test | pv -qL 200


sed -n 6p text.txt | tee >(espeak -ven+f3 -m -p 80 -s 180 >/dev/null 2>&1) | pv -qL 20


#espeak -ven+f3 -m --stdout -p 60 -s 180

sleep 1

random_pitch() {
    local delta=${1:-50}
    local value=$(( ($RANDOM % $delta) - $delta/2 ))
    echo "+${value}" | sed 's/+-/-/'
}

glados() {
    local pitch=70
    local speed=180
    local lang=en
    local voice=f3
    local output= 
    text=$(cat lyrics.txt)
    while true; do
        case "$1" in
            -v | --voice )
                voice="$2"
                shift 2
                ;;
            -l | --language )
                lang="$2"
                shift 2;
                ;;
            -p | --pitch )
                pitch="$2"
                shift 2;
                ;;
            -s | --speed )
                speed="$2"
                shift 2
                ;;
            -o | --output)
                output="-w $2"
                shift 2
                ;;
            -- ) 
                shift
                break
                ;;
            * ) 
                if [ -z "$1" ]; then
                    break;
                fi
                text="$1"
                shift
                ;;
        esac
    done

    local word_pitch=0
    local prosody_data=""
    for word in $text; do
        word_pitch=$(random_pitch 50)
        prosody_data="${prosody_data}<prosody pitch=\"${word_pitch}\">${word}</prosody>";
    done 

   espeak "${prosody_data}" -m -p ${pitch} -s ${speed} -v "${lang}+${voice}" ${output}
}

glados "$@"
