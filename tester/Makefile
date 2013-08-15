SCENARIOS= $(shell find ../scenarios/ -name "*.yml")
PYTHON= python

JSON_SCENARIOS= $(SCENARIOS:.yml=.json)

all: scenarios.json

clean:
	rm -rf $(JSON_SCENARIOS)

# want the
scenarios.json: $(JSON_SCENARIOS)
	$(PYTHON) combine.py $(JSON_SCENARIOS) > $@


%.json: %.yml
	DUMP_JSON=1 $(PYTHON) runner.py $< > $@
