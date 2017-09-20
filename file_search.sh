#!/bin/bash
#set -x
function file_search()
{
	#echo "the paramter of file_search is :${1}"
	for Var_Path in `ls ${1}`
	do 
		Var_FileGet="${1}/${Var_Path}"
		if test -f $Var_FileGet
		then
			echo "${Var_FileGet}"
		else
			file_search $Var_FileGet
		fi
	done 
}

echo "This is the begin of the srcript"
echo "the paramter is $1"

file_search ${1}