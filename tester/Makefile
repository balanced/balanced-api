SCENARIOS= $(shell find ../scenarios/ -name "*.yml")
PYTHON= python

JSON_SCENARIOS= $(SCENARIOS:.yml=.json)

ROOT_URL=https://api-pmtest.balancedpayments.com

all: scenarios.json

clean:
	rm -f fixtures.json
	rm -rf $(JSON_SCENARIOS) scenarios.json

fixtures.json:
	@ROOT_URL=$(ROOT_URL) $(PYTHON) fixture_data.py > fixtures.json

scenarios.json: $(JSON_SCENARIOS)
	@ROOT_URL=$(ROOT_URL) $(PYTHON) combine.py $(JSON_SCENARIOS) > $@


%.json: %.yml fixtures.json
	@ROOT_URL=$(ROOT_URL) DUMP_JSON=1 $(PYTHON) runner.py $< > $@ 2> /dev/null
