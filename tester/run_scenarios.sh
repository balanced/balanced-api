#!/bin/bash

FAILED=""
code=0

FILES=`find ../scenarios -name "*.yml" | sort`

for i in $FILES
do
    if python runner.py $i; then
	echo "OK $i"
    else
	echo "FAILED $i"
	FAILED="$FAILED\t$i\n"
	code=$(( $code + 1 ))
    fi
done

if [ $code -ne 0 ]; then
    echo -e "\e[00;31mRunning of scenarios has failed\e[00m"
    echo -e "$FAILED"
else
    echo "ALL passed"
fi

exit $code
