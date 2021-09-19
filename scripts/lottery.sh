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
PARSED_ARGUMENTS=$(getopt -a -n $0 -o t --long tickets: -- "$@")
VALID_ARGUMENTS=$?

echo $VALID_ARGUMENTS Output

if [ "$VALID_ARGUMENTS" != "0" ];then
        echo The proper arguments are -t for the moment.
        exit 2
fi

while getopts t: flag
        do
                case "${flag}" in
                        t)
                                tickets=$OPTARG
                                ;;
                        *)
                                echo it looks like nothing valid was chosen.
                                ;;
                esac
        done

if [[ -z $tickets ]];
then
    echo you did not choose tickets.
    get_tickets
    gen_numbers
else
    get_numbers2
fi
