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

	[[ ! -d ~/Downloads/zip ]] && mkdir ~/Downloads/zip || echo Directory already Exists
	[[ -d $HOME/Downloads/zip ]] && mv $HOME/Downloads/*.zip $HOME/Downloads/zip
}

moveJPG(){

	[[ ! -d ~/Downloads/jpg ]] && mkdir ~/Downloads/jpg || echo Directory already Exists
	[[ -d $HOME/Downloads/jpg ]] && mv $HOME/Downloads/*.jpg $HOME/Downloads/jpg
	echo JPGs moved to destination
}
#read -p "What type of file move would you like? " operation

while getopts ':aijp:z:' OPTION;
do
	case $OPTION in
		i)
			moveIso
			;;

		j)
			moveJPG
			;;

		p)
			pdf=$OPTARG
			movePdf
			echo $pdf moved
			;;

		z)
			zip=$OPTARG
			moveZip
			echo $zip moved
			;;

		a)
			moveIso
			movePdf
			moveZip
			;;
#		*)
#			echo Nothing to do here.
#			;;
		?)
      			echo "Usage: $(basename $0) [a] [-i] [j] [-p argument] [-z argument]"
      			exit 1
      			;;
	esac
done
