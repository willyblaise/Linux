#!/bin/env bash


#set -euo pipefail

hostname=`lsb_release -a | grep -m 1 'VoidLinux\|Arch' | cut -d ":" -f 2 | xargs`


declare -a options=(
	"Choose sound file"
	"Play some good stuff"
	"Stop It"
	)

music () {

	sounds=~/Music/56nights
	soundFiles=$(/bin/ls -1 "$sounds" | grep ".mp3")
	choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Future sounds:' "${@}")
	declare -a soundList=$soundFiles


	if [ "$choice" == "Choose sound file" ];
	then
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

}

melodies () {

	sounds=~/Music/Future\ -\ EVOL
	soundFiles=$(/bin/ls -1 "$sounds" | grep ".mp3")
	choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Future sounds:' "${@}")
	declare -a soundList=$soundFiles


	if [ "$choice" == "Choose sound file" ];
	then
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

}

if [ "$hostname" == "VoidLinux" ];
then
	melodies
elif [ "$hostname" == "Arch" ];
then
	music
else
	printf "Looks like this is not Void or Arch"
	exit 0
fi
