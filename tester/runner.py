#!/usr/bin/env python2

# This file is designed to run one scenario at a time
# scenarios can include in other scenario using a require block at the top
# the scenarios are run in the order that they are specified

import os
import sys

import yaml
import requests

cache = {}

def runScenario(scneario, data):




def parseFile(name):

    scenarios = {}

    contents = open(name).read()

    data = yaml.load(open(name).read())

    for other in data.get('require', []):
        scenarios.update(**parseFile(other))

    for scenario in data.get('scenarios', []):
        scenarios[scenario['name'] = runScenario(scenario, scenarios)

    return scenarios


if __name__ == '__main__':
