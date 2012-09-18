#!/bin/bash
usage="usage: $0 <Module Name>; use --help for more info";
if [ $# != 1 ]
then
	echo $usage 
elif [ $# == 1 ]
then
		lower="$(echo ${1} | tr 'A-Z' 'a-z')"
		mkdir -p "$1/config" "$1/src/$1/Controller" "$1/src/$1/Form" "$1/src/$1/Model" "$1/view/$lower/$lower"
		tree $1;
fi
exit 0;
