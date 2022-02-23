#!/bin/bash

while getopts ':ab:c:' OPTION; do

  case "$OPTION" in
    a)
      echo "Option a used"
      ;;

    b)
      argB="$OPTARG"
      echo "Option b used with: $argB"
      ;;

    c)
      argC="$OPTARG"
      echo "Option c used with: $argC"
      ;;

    ?)
      echo "Usage: $(basename $0) [-a] [-b argument] [-c argument]"
      exit 1
      ;;
  esac

done
