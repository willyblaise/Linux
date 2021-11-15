#!/bin/bash

cb=()
read -p "Please provide the number of elements: " length

until [ $length -lt 1 ]
do
    read -p "Please provide a link: " name
    cb+=($name)
    let "length=length-1"
done

echo List to follow below.

for i in ${cb[@]}
do
    youtube-dl $i &
done
