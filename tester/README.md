## Balanced-api test runner directory

This directory contains all the code for running the scenarios against the api and validating the output.


## Files
| Name               | Used for                                              |
|--------------------|-------------------------------------------------------|
| `check_json.sh`    | Automatically checks and styles all json files        |
| `run_scenarios.sh` | Sequentially runs all scenarios against the api       |
| `travis.sh`        | Checks json and scenarios syntax                      |
| `Makefile`         | Builds scenarios.json for building the docs scenarios |
| `requirements.txt` | All the python requirements for running the scenarios |
| `fixture_data.py`  | Creates a new api_key for running the scenarios       |
| `fix_json.js`      | Checks the json syntax of a single file               |
| `runner.py`        | Sequentially runs the scenarios in a single file      |
| `combine.py`       | Combines the json output for building the docs        |


### Running a single scenario
```
   $ cd tester
   $ pip install -r requirements.txt
   $ python fixture_data.py > fixtures.json
   $ python runner.py ../scenarios/the_name_of_the_file.yml
```

### Running all scenarios
```
   $ cd tester
   $ pip install -r requirements.txt
   $ python fixture_data.py > fixtures.json
   $ ./run_scenarios.sh
```

### Running scenarios against an alternate host
```
   $ cd tester
   $ pip install -r requirements.txt
   $ ROOT_URL="https://api.balancedpayments.com" python fixture_data.py > fixtures.json
   $ ROOT_URL="https://api.balancedpayments.com" ./run_scenarios.sh
```

### Running scenarios against a different api version
```
   $ cd tester
   $ pip install -r requirements.txt
   $ API_VERSION=1.1 python fixture_data.py > fixtures.json
   $ API_VERSION=1.1 ./run_scenarios.sh
```

### Checking the syntax of files
```
   $ cd tester
   $ pip install -r requirements.txt
   $ ./travis.sh
```

### Creating scenarios.json for the docs
```
   $ cd tester
   $ pip install -r requirements.txt
   $ python fixture_data.py > fixtures.json
   $ make
```
