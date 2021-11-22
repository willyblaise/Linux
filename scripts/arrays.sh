#!/bin/bash


friends=()

read -p "Please provide the number of friends: " num


until [ $num -lt 1 ]
do
	read -p "Please give a name to add: " name
	friends+=($name)
	let "num=num-1"
done


for i in ${friends[@]}
do
	echo $i
done
