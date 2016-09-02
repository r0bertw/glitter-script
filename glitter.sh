#!/bin/bash
[[ -z "$CHARS" ]] && CHARS="   .:;*'\"oO@0"
trap 'clear' WINCH
trap 'tput cnorm; tput cup $(tput lines)' EXIT
tput civis
clear
while true; do
	dim=($(tput lines; tput cols))
	[[ ${#dim} -ne 2 ]] && continue
	tput cup $(( $RANDOM % ${dim[0]} )) $(( $RANDOM % ${dim[1]} ))
	printf "${CHARS:$(( $RANDOM % ${#CHARS} )):1}"
	sleep 0.01
done
