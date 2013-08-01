#!/bin/bash

FAILED=""
code=0

for i in ../**/*.json
do
	 if node _fix.js $i; then
	 	echo "OK $i"
	else
		echo "FAILED $i"
		FAILED="$FAILED\t$i\n"
		code=$(( $code + 1 ))
	fi
done

if [ $code -ne 0 ]; then
	echo -e "\e[00;31mChecking of JSON has failed\e[00m"
	echo -e "$FAILED"
else
	echo "ALL passed"
fi

exit $code
