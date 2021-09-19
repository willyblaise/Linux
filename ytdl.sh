#!/bin/bash

cb=()
echo Please provide the number of elements: 
read length

until [ $length -lt 1 ]
do 
    echo Please provide a name:
    read name
    cb+=($name)
    let "length=length-1"
done

echo list to follow below

for i in ${cb[@]}
do
    youtube-dl $i &
done