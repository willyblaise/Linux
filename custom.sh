#!/bin/bash


se(){
	du -a ~/.scripts/* ~/.config/* | awk '{ print $2 }' | fzf | xargs -r $EDITOR;
	#du -a ~/.scripts/* ~/.config/* | awk '{ print $2 }' | fzf | xargs -r nvim;
}

up(){
	curl wttr.in
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
