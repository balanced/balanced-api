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

ROOT_URL = os.environ.get('ROOT_URL', 'http://localhost:5000')  # TODO: change this to balanced api
API_VERSION = os.environ.get('API_VERSION', '1.1')
ACCEPT_HEADERS = os.environ.get('ACCEPT_HEADERS',
                                'application/vnd.balancedpayments+json; version={version}, '
                                'application/vnd.api+json')
ACCEPT_HEADERS = ACCEPT_HEADERS.replace('{version}', API_VERSION)

DRY_RUN = os.environ.get('DRY_RUN', '0') != '0'

DUMP_JSON = os.environ.get('DUMP_JSON', '0') != '0'


def find_file(fromFile, fileName):
    path = os.path.join(os.path.dirname(fromFile), fileName)
    if os.path.isfile(path):
        return path
    path = os.path.join('..', fileName)
    if os.path.isfile(path):
        return path
    sys.stderr.write('Could not find file {0}\n'.format(fileName))
    sys.exit(1)


# the $ref do not work with relative paths as specified in the jsonschema spec
def validator_fix_ref(contents, fileName):
    if isinstance(contents, dict):
        if '$ref' in contents:
            path = find_file(fileName, contents['$ref'])
            cont = open(path).read()
            return validator_fix_ref(json.loads(cont), path)
        else:
            return dict(
                (k, validator_fix_ref(v, fileName))
                for k, v in contents.iteritems()
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

    def get_field(self, name, data):

        def resolve_link(match):
            return data[match.group(1)][0][match.group(2)]

        controller, action = name.split('.')
        try:
            if action in data[controller][0]:
                return data[controller][0][action]
        except Exception as ex:
            import ipdb; ipdb.set_trace()
        if name in data['links']:
            return re.sub(
                r'\{(\w+)\.(\w+)\}',
                resolve_link,
                data['links'][name]
            )
        return None

    def resolve_deps(self, scenario, data):
        def fix_match(matchgroup):
            if DRY_RUN:
                gg = data[matchgroup.group(1)]
                return 'asdf'
            return self.get_field(
                matchgroup.group(2), data[matchgroup.group(1)]['response']
            )
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

    def equals(self, data, instance, assertIn):
        ret = 0
        if isinstance(data, dict):
            if not isinstance(instance, dict):
                return 1
            for k, v in data.iteritems():
                ret += self.equals(v, instance.get(k, None), assertIn)
            return ret
        elif isinstance(data, list):
            if not isinstance(instance, list):
                return 1
            if len(instance) < len(data):
                return 1
            a = 0
            while a < len(data):
                ret += self.equals(data[a], instance[a], assertIn)
                a += 1
            return ret
        else:
            if assertIn:
                return 0 if instance and data in instance else 1
            else:
                return 0 if data == instance else 1

    def run_scenario(self, scenario, data, path):
        sys.stderr.write('Running scenario {0}\n'.format(scenario['name']))

        scenario = self.resolve_deps(scenario, data)

        request_scenario = scenario['request']
        body = request_scenario.get('body', {})

        if 'schema' in request_scenario:
            try:
                against = validator_fix_ref(request_scenario['schema'], path)
            except Exception, e:
                sys.stderr.write(
                    'Error loading request schema for {0}'.format(
                        scenario['name'])
                )
                sys.stderr.write(str(e))
                sys.exit(1)
            validator(against).validate(body)
        else:
            if body:
                sys.stderr.write(
                    'Warning: {0} missing schema section for request\n'.format(
                        scenario['name']
                    )
                )

        if not DRY_RUN:
            print scenario['name'], ROOT_URL + request_scenario['href'], request_scenario['method']
            req = requests.Request(
                method=request_scenario['method'],
                url=ROOT_URL + request_scenario['href'],
                data=json.dumps(body),
                headers={
                    'Accept': ACCEPT_HEADERS,
                    'Content-type': 'application/json'
                },
                auth=(self.cache['secret'], ''),
            ).prepare()
            resp = self.session.send(req)

        if 'status_code' in scenario['response'] and not DRY_RUN:
            if scenario['response']['status_code'] != resp.status_code:
                sys.stderr.write('Scenario {0} failed with wrong status code {1} != {2}'
                                 .format(scenario['name'],
                                         scenario['response']['status_code'],
                                         resp.status_code))
                sys.exit(1)

        resp_json = resp.json() if not DRY_RUN else {}
        try:
            against = validator_fix_ref(scenario['response'].get('schema', {}), path)
        except:
            sys.stderr.write('could not parse response schema for {0}'.format(scenario['name']))
            sys.exit(1)

        if not DRY_RUN:
            if not against:
                sys.stderr.write('Warning: no schema to validate response against for {0}\n'
                                 .format(scenario['name']))
            validator(against).validate(resp_json)

        if 'matches' in scenario['response']:
            if 0 != self.equals(scenario['response']['matches'], resp_json, False) and not DRY_RUN:
                sys.stderr.write('Error validating equals for {0}'.format(scenario['name']))
                sys.stderr.write(json.dumps(resp_json, indent=4))
                sys.stderr.write(json.dumps(scenario['response']['matches'], indent=4))
                sys.exit(1)

        if 'assertIn' in scenario['response']:
            if 0 != self.equals(scenario['response']['assertIn'], resp_json, True) and not DRY_RUN:
                sys.stderr.write('Error validating assertIn for {0}'.format(scenario['name']))
                sys.stderr.write(json.dumps(resp_json, indent=4))
                sys.stderr.write(json.dumps(scenario['response']['assertIn'], indent=4))
                sys.exit(1)

        return {
            'response': resp_json,
            'status_code': resp.status_code if not DRY_RUN else 0,
            'request': body
        }

    def parse_file(self, name):

        scenarios = {}

        contents = open(name).read()

        data = yaml.load(open(name).read())

        for other in data.get('require', []):
            scenarios.update(**self.parse_file(
                find_file(name, other)
            ))

        for scenario in data.get('scenarios', []):
            scenarios[scenario['name']] = self.run_scenario(scenario, scenarios, name)

        return scenarios


def main():
    if len(sys.argv) == 2:
        runner = Runner()
        runner.cache = json.load(open('fixtures.json'))
        result = runner.parse_file(sys.argv[1])
        if DUMP_JSON:
            sys.stdout.write(json.dumps(result, indent=1))
    else:
        print('python {0} [file of scenario to run]'.format(sys.argv[0]))


if __name__ == '__main__':
    main()
