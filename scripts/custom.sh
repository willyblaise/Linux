#!/bin/bash


se(){
	du -a ~/.scripts/* ~/.config/* | awk '{ print $2 }' | fzf | xargs -r $EDITOR;
	#du -a ~/.scripts/* ~/.config/* | awk '{ print $2 }' | fzf | xargs -r nvim;
}

wet(){
	city=$1

	if [ -z $city ];then
		unset city
	fi

	curl wttr.in/$city
}

rate(){
	coin=$1

	if [ -z $coin ];then
		unset coin
	fi

	curl rate.sx/$coin
}

sp(){
	speedtest-cli
}

wpa(){
	sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf
}

swap(){
	sudo swapon /swapfile
}
