#!/bin/bash
#set -x
function RE_TEST()
{
	echo "the paramter is ${1}"
	RE_EXP="[a-zA-Z]* script"
	if [[ "${1}" =~ $RE_EXP ]]
	then 
		VAR=$(echo ${1}|sed "s/${RE_EXP}/shell script/")
		echo ${VAR}
		#VAR=${${1}|sed "s/${RE_EXP}/shell script/"}
		#VAR=${1}|sed "s/${RE_EXP}/shell script/"
	fi
}
VAR_Test="this is  a bat script,We can do something in this script"
echo ${VAR_Test}
RE_TEST "${VAR_Test}"