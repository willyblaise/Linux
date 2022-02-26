#!/bin/env bash


#set -euo pipefail

host=`lsb_release -a | grep -m 1 'Arch\|VoidLinux' | cut -d ":" -f 2 | xargs`
declare -a options=(
	"Choose sound file"
	"Play some good stuff"
	"Stop It"
	)


rock(){
	sounds=~/Music/EVOL

	soundFiles=$(/bin/ls -1 "$sounds" | grep ".mp3")
	declare -a soundList=$soundFiles

	#choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Future sounds:' "${@}")
	choice=$(dialog "${options[@]}")


	if [ "$choice" == "Choose sound file" ];then

		#choice=$(printf '%s\n' "${soundList[@]}" | sort | dmenu -i -l 20 -p 'Choose sound file:' "$@")
		choice=$(printf '%s\n' "${soundList[@]}" | sort | dialog 'Choose sound file:' "$@")
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

case $host in
	"Darwin")
		echo this is Apple
		;;
	"Arch")
		echo This is Arch
		rock
		;;
	"VoidLinux")
		echo This is Void
		rock
		;;
	*)
		echo well try again
		;;
esac
