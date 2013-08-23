#!/bin/bash

RED=\033[0;31m
ERED=\033[0m

FAILED=""
code=0

FILES=`find ../scenarios -name "*.yml" | sort`

for i in $FILES
do
    if python runner.py $i; then
	echo -e "\033[00;32mOK $i\033[00m"
    else
	echo -e "\033[00;31mFAILED $i\033[00m"
	FAILED="$FAILED\t$i\n"
	code=$(( $code + 1 ))
    fi
done

if [ $code -ne 0 ]; then
    echo -e "\033[00;31mRunning of scenarios has failed\033[00m"
    echo -e "$FAILED"
else
    echo "ALL passed"
fi

exit $code
