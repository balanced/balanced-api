#!/usr/bin/env python2

# This file is designed to run one scenario at a time
# scenarios can include in other scenario using a require block at the top
# the scenarios are run in the order that they are specified

import os
import sys
import re
import json

import yaml
import requests
import jsonschema

ROOT_URL = os.environ.get('ROOT_URL', 'http://localhost:5000') # TODO: change this to balanced api
ACCEPT_HEADERS = os.environ.get('ACCEPT_HEADERS',
                                'application/vnd.balancedpayments+json; version=1.1, '
                                'application/vnd.api+json')
VALIDATE_SCHEMA = os.environ.get('VALIDATE_SCHEMA', '1')

# the $ref do not work with relative paths as specified in the jsonschema spec
def validator_fix_ref(contents, fileName):
    if isinstance(contents, dict):
        if '$ref' in contents:
            path = os.path.join(os.path.dirname(fileName), contents['$ref'])
            cont = open(path).read()
            return validator_fix_ref(json.loads(cont), path)
        else:
            return dict(
                (k, validator_fix_ref(v, fileName))
                for k,v in contents.iteritems()
            )
    elif isinstance(contents, list):
        return [validator_fix_ref(v, fileName) for v in contents]
    else:
        return contents

def validator_required(validator, required, instance, schema):
    # the properties function in draft3 takes care of required
    # this validator has an issue with the form of required that we are using
    return

validator = jsonschema.validators.extend(jsonschema.Draft4Validator,
                                         {
                                             "properties": jsonschema._validators.properties_draft3,
                                             "required": validator_required,
                                         })


class Runner(object):

    cache = {}

    session = requests.Session()

    def get_Field(self, name, data):
        def resolve_link(match):
            return data[match.group(1)][0][match.group(2)]
        b = name.split('.')
        if b[1] in data[b[0]][0]:
            return data[b[0]][0][b[1]]
        if name in data['links']:
            return re.sub(r'\{(\w+)\.(\w+)\}', resolve_link, data['links'][name])
        return None

    def resolve_deps(self, scenario, data):
        def fix_match(matchgroup):
            return self.get_Field(matchgroup.group(2), data[matchgroup.group(1)] )
        if isinstance(scenario, str):
            return re.sub(r'\{(\w+),(\w+\.\w+)\}', fix_match, scenario)
        elif isinstance(scenario, list):
            return [self.resolve_deps(v, data) for v in scenario]
        elif isinstance(scenario, dict):
            return dict(
                (k, self.resolve_deps(v, data))
                for k, v in scenario.iteritems()
            )
        else:
            return scenario


    def equals(self, data, instance):
        ret = 0
        if isinstance(data, dict):
            if not isinstance(instance, dict):
                return 1
            for k, v in data.iteritems():
                ret += self.equals(v, instance.get(k, None))
            return ret
        elif isinstance(data, list):
            if not isinstance(instance, list):
                return 1
            if len(instance) < len(data):
                return 1
            a = 0
            while a < len(data):
                ret += self.equals(data[a], instance[a])
                a += 1
            return ret
        else:
            if data != instance:
                return 1
            else:
                return 0


    def run_scenario(self, scenario, data, path):

        sys.stderr.write('Running scenario {0}\n'.format(scenario['name']))

        scenario = self.resolve_deps(scenario, data)

        body = scenario['request'].get('body', {})

        if 'schema' in scenario['request']:
            try:
                against = validator_fix_ref(json.loads(scenario['request']['schema']), path)
            except Exception, e:
                print('Error loading request schema for {0}'
                      .format(scenario['name']))
                print(str(e))
                sys.exit(1)
            validator(against).validate(body)
        else:
            sys.stderr.write('Warning: {0} missing schema section for request\n'
                             .format(scenario['name']))

        req = requests.Request(scenario['request']['method'],
                               ROOT_URL + scenario['request']['href'],
                               data=json.dumps(body),
                               headers={
                                   'Accept': ACCEPT_HEADERS,
                                   'Content-type': 'application/json',
                               },
                               auth=(self.cache['secret'], ''),
                           ).prepare()
        resp = self.session.send(req)

        if 'status_code' in scenario['response']:
            if scenario['response']['status_code'] != resp.status_code:
                sys.stderr.write('Scenario {0} failed with wrong status code {1} != {2}'
                                 .format(scenario['name'],
                                         scenario['response']['status_code'],
                                         resp.status_code))
                sys.exit(1)

        resp_json = resp.json()
        try:
            against = validator_fix_ref(json.loads(scenario['response'].get('schema', '{}')), path)
        except:
            print('could not parse response schema for {0}'.format(scenario['name']))
            sys.exit(1)

        if VALIDATE_SCHEMA == '1':
            if not against:
                sys.stderr.write('Warning: no schema to validate response against for {0}\n'
                                 .format(scenario['name']))
            validator(against).validate(resp_json)

        if 'equals' in scenario['response']:
            if 0 != self.equals(json.loads(scenario['response']['equals']), resp_json):
                print('Error validating equals for {0}'.format(scenario['name']))
                print(json.dumps(resp_json, indent=4))
                print(scenario['response']['equals'])
                sys.exit(1)

        return resp_json


    def parse_file(self, name):

        scenarios = {}

        contents = open(name).read()

        data = yaml.load(open(name).read())

        for other in data.get('require', []):
            scenarios.update(**self.parse_file(os.path.join(os.path.dirname(name), other)))

        for scenario in data.get('scenarios', []):
            scenarios[scenario['name']] = self.run_scenario(scenario, scenarios, name)

        return scenarios


def main():
    if len(sys.argv) == 2:
        runner = Runner()
        runner.cache = json.load(open('fixtures.json'))
        runner.parse_file(sys.argv[1])
    else:
        print('python {0} [file of scenario to run]'.format(sys.argv[0]))


if __name__ == '__main__':
    main()
