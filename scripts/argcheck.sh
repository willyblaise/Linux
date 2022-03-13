#!/bin/bash

if  (($# < 3));then
	echo it requires at least 3 arguments
	exit
fi

if (($# > 3));then
	echo it requires not more than 3 arguments
	exit
else
	echo well hell here we go
fi


echo the args are: $@
echo $* are the args
echo $# is the actual amount
