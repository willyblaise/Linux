#!/bin/bash


tickets="$1"

get_tickets(){
	printf "How many tickets are you going to get? ";
	read tickets;
}

function gen_numbers { printf "\nThese are your winning lottery numbers: \n";

    for ((z=1 ; z<=tickets ; z++)); do
         for ((i=0; i<6; i++ )); do
            x=`echo $[ 1 + $[ RANDOM % 49 ]]`;
            printf "\t $x";
         done;
         printf "\n"
    done;
    printf "\n";
}

get_numbers2() {

        printf "\nThese are your winning lottery numbers: \n";
	for(( i=1; i<=tickets; i++));
	do shuf -i 1-49 -n6; done | xargs -n6

}

############################
if [[ -z $tickets ]]  ; then

    echo $tickets
    get_tickets
    gen_numbers
else
    get_numbers2
fi
