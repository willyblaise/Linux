#!/bin/sh

if [ -z "$1" ]
then
	echo "No message for commit, please add and Run again."
	exit 1
elif [ -z "$2" ]
then
	echo "No repository address supplied, please add and Run again."
	exit 1

else
	echo "success"
fi


message=$1
address=$2


initialize(){

git init
git add .
git commit -m "$message"

}


connect_push(){

git remote add origin "$address"
git push --set-upstream origin master

}

initalize
connect_push
echo "UPLOADED"
