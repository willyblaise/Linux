#!/bin/env bash


#set -euo pipefail

#sounds=~/Music/56nights
sounds=~/Music/Future\ -\ EVOL

soundFiles=$(/bin/ls -1 "$sounds" | grep ".mp3")

declare -a options=(
	"Choose sound file"
	"Play some good stuff"
	"Stop It"
	)

declare -a soundList=$soundFiles


choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Future sounds:' "${@}")


if [ "$choice" == "Choose sound file" ];then

	choice=$(printf '%s\n' "${soundList[@]}" | sort | dmenu -i -l 20 -p 'Choose sound file:' "$@")
	mpv --loop "$sounds/$choice" || exit

elif [ "$choice" == "Play some good stuff" ];then
	getRand=$(printf '%s\n' "${soundList[@]}" | shuf -n 1)
	mpv --loop "$sounds/$getRand" || exit

elif [ "$choice" == "Stop It" ];then
	killall mpv

else
	echo "program terminated." && exit 0

fi
