#!/bin/bash


moveIso(){

	[[ ! -d ~/Downloads/iso ]] && mkdir ~/Downloads/iso || echo Directory already Exists
	[[ -d $HOME/Downloads/iso ]] && mv $HOME/Downloads/*.iso $HOME/Downloads/iso
}



movePdf(){

	[[ ! -d ~/Downloads/pdf ]] && mkdir ~/Downloads/pdf || echo Directory already Exists
	[[ -d $HOME/Downloads/pdf ]] && mv $HOME/Downloads/*.pdf $HOME/Downloads/pdf
}

moveZip(){

	[[ -d ~/Downloads/zip ]] && mkdir ~/Downloads/zip || echo Directory already Exists
	[[ -d $HOME/Downloads/pdf ]] && mv $HOME/Downloads/*.zip $HOME/Downloads/zip
}

read -p "What type of file move would you like? " operation

case $operation in
	"iso")
		moveIso
		;;
	"pdf")
		movePdf
		;;
	"zip")
		moveZip
		;;
	"all")
		moveIso
		movePdf
		moveZip
		;;
	*)
		echo Nothing to here.
esac
