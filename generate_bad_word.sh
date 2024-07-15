#!/bin/bash

# Pole sprostých slov
bad_words=("fart" "penis" "butt" "chicken" "pig" "dog" "fuck" "shit" "dick" "ass" "whore" "bitch" "cunt" "cock" "lick" "suck" "sit" "slurp")

enter_msg="Enter suffix to a new stupid word:\n1: -ness\n2: -er\n3: -man\n"

get_suffix() {
	local user_input="$1"
	if [ -z "$1" ]; then
        printf "$enter_msg" >&2
		read -r user_input

		while [[ "$user_input" != "1" && "$user_input" != "2" && "$user_input" != "3" ]]; do
			printf "Nope, only 1, 2, or 3 are allowed.\nAgain: $enter_msg" >&2
			read -r user_input
		done
	fi
	
	local res
	case "$user_input" in
		1)
			echo "ness"
			;;
		2)
			echo "er"
			;;
		3)
			echo "man"
			;;
		*)
			echo "$user_input"
			;;
	esac
}

# Generuje náhodné sprosté slovo kombinováním 2 až 4 slov
generate_bad_word() {
	local suffix=$(get_suffix "$1")
    local words=("${bad_words[@]}")  # Kopie pole sprostých slov
    local num_words=$((RANDOM % 3 + 1))  # Počet slov (2 až 3)
    local new_word=""

    for (( i=0; i<$num_words; i++ )); do
        local random_index=$((RANDOM % ${#words[@]}))
        new_word+="${words[$random_index]}"
        words=("${words[@]:0:$random_index}" "${words[@]:$((random_index + 1))}")
    done

    echo $new_word$suffix
}

generate_bad_word_talk() {
	local a=$(generate_bad_word)
	echo "$a"
	spd-say -t female2 -r -100 "$a"
}

generate_bad_word
#generate_bad_word_talk
