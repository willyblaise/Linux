#!/bin/bash

a=$1

if [ $a -gt 1 ];
then
	while [ $a -gt 1 ]
	do
		echo $a
		let "a=a-1"
	done
elif [ $a -lt 10 ];
then
	while [ $a -lt 10 ]
	do
		echo $a
		let "a=a+1"
	done
else
	echo nothing to do here
fi
