#!/bin/bash

# thanks to the author of the following for some nice intro to getopts
# http://wiki.bash-hackers.org/howto/getopts_tutorial

usage="usage: $0 <Module Name>; use --help for more info";
if [ $# != 1 ]
then
	echo $usage 
fi

while getopts ":m:" opt; do
  case $opt in
    m)
      echo "-m creating module $OPTARG..." >&2
	lower="$(echo ${OPTARG} | tr 'A-Z' 'a-z')"
	mkdir -p "$OPTARG/config" "$OPTARG/src/$OPTARG/Controller" "$OPTARG/src/$OPTARG/Form" "$OPTARG/src/$OPTARG/Model" "$OPTARG/view/$lower/$lower"
	tree $OPTARG;
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


exit 0;
