#!/bin/bash
echo "this is the begin of math.sh"
Var_No1=$1;
Var_No2=$2;
Var_Total=`expr $Var_No1 + $Var_No2`
if [ $Var_No1 -gt $Var_No2 ]
then
	echo "a>b"
else
	echo "a<=b"
fi
echo "${Var_Total}"  