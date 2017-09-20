!#/bin/bash
#set -x
echo "this is a shell script"
echo "the paramter is $1 $2"
var_param_1=$?
if [ ${var_param_1} -eq 0 ]
then
	echo "success"
else
	echo "fail"
	exit 1
fi
#g:for whole line;if there is not g,the express can only
#execute once and replace once.
PARAMETER_ANALYSIS=$(echo $2 | sed "s/,/ /g")
if [[ $PARAMETER_ANALYSIS =~ "default" ]]
then
	echo "ok"
	echo ${PARAMETER_ANALYSIS}
else
	echo "fail"
	echo ${PARAMETER_ANALYSIS}
fi
