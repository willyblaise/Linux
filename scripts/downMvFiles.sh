#!/bin/bash


moveIso(){

	[[ -d Downloads/ ]] && mkdir Downloads/iso || echo Directory already Exists
	[[ -d $HOME/Downloads/iso ]] && mv $HOME/Downloads/*.iso $HOME/Downloads/iso
}



movePdf(){

	[[ -d Downloads/ ]] && mkdir Downloads/pdf || echo Directory already Exists
	[[ -d $HOME/Downloads/pdf ]] && mv $HOME/Downloads/*.pdf $HOME/Downloads/pdf
}

moveZip(){

	[[ -d Downloads/ ]] && mkdir Downloads/zip || echo Directory already Exists
	[[ -d $HOME/Downloads/pdf ]] && mv $HOME/Downloads/*.zip $HOME/Downloads/zip
}

movIso
movePdf
moveZip
