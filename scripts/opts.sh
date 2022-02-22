
#!/bin/bash



#PARSED_ARGUMENTS=$(getopt -a -n $0 -o n:a:c:w --long name:, age:, color:,weight -- "$@")
#PARSED_ARGUMENTS=$(getopt -a -n $0 -o n:a:c:w -- "$@")
PARSED_ARGUMENTS=$(getopt -o n:a:c:w --long name:, age:, color:,weight -- "$@")
VALID_ARGUMENTS=$?

echo $VALID_ARGUMENTS output
echo inp array is: $@
echo inp array length is: $#


if [ "$VALID_ARGUMENTS" != "0" ];then
	echo The proper arguments are -a -n -c for the moment. 
	exit 2
fi

while getopts n:a:c:w: flag
	do
		case "${flag}" in 
			n) 
				name=$OPTARG
				;;
			a) 
				age=$OPTARG
				;;
			c) 
				color=$OPTARG
				;;
			w) 
				weight=$OPTARG
				;;
			*) 
				echo it looks like nothing valid was chosen.
				[[ ! ${flag} =~ n|a|c|w ]] && exit 2
				;;
		esac
	done

validations(){
	if [[ -z $weight ]];then
		weight="nothing input"
	fi
	if [[ -z $name ]];then
		name="nothing input"
	fi
	if [ -z $color ];then
		color="nothing input"
	fi
	if [ -z $age ];then
		age="nothing input"
	fi
}

pinfo(){
	echo "Your name is:   $name"
	echo "Your age is:    $age"
	echo "Your color is:  $color"
	echo "Your weight is: $weight"
}

validations
pinfo
