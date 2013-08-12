#!/bin/bash

code=0

export ROOT_URL="https://api.balancedpayments.com"

./check_json.sh
code=$?

echo '{}' > fixtures.json

DRY_RUN=1 ./run_scenarios.sh

code=$(( $code + $? ))

exit $code
