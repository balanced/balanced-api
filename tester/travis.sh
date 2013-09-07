#!/bin/bash

code=0

export ROOT_URL="https://api-pmtest.balancedpayments.com"

./check_json.sh
code=$?

echo '{}' > fixtures.json

DRY_RUN=1 ./run_scenarios.sh

code=$(( $code + $? ))


if [ $code -eq 0 ]
then
    echo -e "\033[00;32m=================================================\n== ALL SCENARIOS HAVE PASSED THE INITIAL CHECK ==\n== WILL PROCEED TO TEST PUBLIC API             ==\n=================================================\033[00m"

    echo "Creating new test marketplace"
    ./fixture_data.py > fixtures.json
    cat fixtures.json
    echo -e "\n\nRunning scenarios against the api"
    ./run_scenarios.sh
    code=$?

fi

exit $code
