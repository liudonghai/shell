#!/bin/bash
#$1		${config_title_time}
#$2		language		
#$3		param
#$4		stream
#$5		server address
#$6		port
#$7     analysis_uname
#$8		analysis_upswd
#$9     ${args_count}
#$10~   product_type_name
set -x
echo "the product_comp_analysis start parameter is: $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} and so on"
analysis_task_dir=/Applications/cov-analysis-macosx-8.7.1/bin

config_title_time=$1

ANALYSIS_COMP=/build/${config_title_time}/analysis

# $analysis_task_dir/cov-build --dir ${ANALYSIS_COMP} ./analysis_task.sh $*
cov_build_result=$?
echo "cov_build_return: " ${cov_build_result}
if [ ${cov_build_result} -ne 0 ];then
    echo "cov build error"
    # http://localhost:8080/productmgt/rest/iosAnalysis?idMark=1&result=succeed&resultDir=4
    curl "http://10.180.88.71:8010//productmgt/rest/iosAnalysis" -d "idMark=$1&result=failded&resultDir="
    exit 1
else
    echo "cov build ok"
fi
PARAMETER_ANALYSIS=$(echo $3 | sed "s/,/ /g")
if [[ ${PARAMETER_ANALYSIS} =~ "defult" ]];then
	PARAMETER_ANALYSIS=" "
fi
echo "输入的参数为：${PARAMETER_ANALYSIS}"
if [[ ${2} =~ "JAVA" ]]; then
    #${analysis_task_dir}/cov-analyze-java --dir ${ANALYSIS_COMP} ${PARAMETER_ANALYSIS}
	echo "test result is java"
else
	#${analysis_task_dir}/Cov-analyze --dir ${ANALYSIS_COMP} ${PARAMETER_ANALYSIS}
	echo "test result not java"
fi

cov_analysis_result=$?
echo "cov_analysis_return: " ${cov_analysis_result}
if [ ${cov_analysis_result} -ne 0 ];then
    echo "cov analysis error"
    exit 1
else
    echo "cov analysis ok"
fi

 
#${analysis_task_dir}/cov-commit-defects -host $5 --dataport $6 --stream $4 --user $7 --password $8 --dir ${ANALYSIS_COMP}
cov_commit_result=$?
echo "the product_comp_analysis end parameter is: $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} and so on"
echo "cov_commit_return: " ${cov_commit_result}
if [ ${cov_commit_result} -ne 0 ];then
    echo "cov commit error"
    exit 1
else
    echo "cov commit ok"
fi