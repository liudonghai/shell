#!/bin/bash
#$1	the path
#set -x
function get_dir(){
	for dir in `ls $1`
	do
		dir_or_file=$1"/"$dir
		if test -d ${dir_or_file}  
			then 
				echo ${dir_or_file}
				get_dir ${dir_or_file}
			else
				if [[ ${dir} =~ sh$ ]] 
				then 
					echo ${dir_or_file}
					if [[ ${1} =~ test$ ]]
					then 
						`mv ${dir_or_file} /home/liudonghai/work/sh`
					fi
				fi
		fi
	done
}
get_dir $1
