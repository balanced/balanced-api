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

config = {}
if os.path.isfile('../config.yml'):
    config = yaml.load(open('../config.yml').read())

ROOT_URL = os.environ.get('ROOT_URL', config.get('root_url', 'http://localhost:5000'))
API_VERSION = os.environ.get('API_VERSION', config.get('api_version', '1.1'))
ACCEPT_HEADERS = os.environ.get(
    'ACCEPT_HEADERS',
    config.get('accept_headers', ('application/vnd.balancedpayments+json; version={version}, '
                                  'application/vnd.api+json'))
)
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


def validate(resp_json):
    class Validator(object):

        def against(self, schema):
            validator(schema).validate(resp_json)
    return Validator()


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
            sys.stderr.write(ex)
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

    def equals(self, data, instance, assertRegex):
        ret = 0
        if isinstance(data, dict):
            if not isinstance(instance, dict):
                return 1
            for k, v in data.iteritems():
                eq = self.equals(v, instance.get(k, None), assertRegex)
                ret += eq
                if eq:
                    sys.stderr.write('err: {}[{}] != {}'.format(k, v, instance.get(k)))
            return ret
        elif isinstance(data, list):
            if not isinstance(instance, list):
                return 1
            if len(instance) < len(data):
                return 1
            for i in xrange(len(data)):
                ret += self.equals(data[i], instance[i], assertRegex)
            return ret
        else:
            if assertRegex:
                try:
                    if re.match(data, instance):
                        return 0
                except TypeError:
                    pass
                return 1
            else:
                return 0 if data == instance else 1

    def run_scenario(self, scenario, data, path):
        sys.stderr.write('Running scenario {0}\n'.format(scenario['name']))

        scenario = self.resolve_deps(scenario, data)

        request_scenario = scenario['request']
        response = scenario['response']
        name = scenario['name']
        body = request_scenario.get('body', {})
        options = scenario.get('options', [])

        if 'schema' in request_scenario:
            try:
                schema = validator_fix_ref(request_scenario['schema'], path)
            except Exception, e:
                sys.stderr.write(
                    'Error loading request schema for {0}'.format(name)
                )
                sys.stderr.write(str(e))
                sys.exit(1)
            validate(body).against(schema)
        else:
            if body:
                sys.stderr.write(
                    'Warning: {0} missing schema section for request\n'.format(
                        name
                    )
                )
        if not (isinstance(request_scenario['href'], str)
            or isinstance(request_scenario['href'], unicode)):
            sys.stderr.write(
                'href for scenario must be string'
            )
            sys.exit(1)

        if not DRY_RUN:
            sys.stderr.write('{0}: {2} {1}\n'.format(
                name,
                ROOT_URL + request_scenario['href'],
                request_scenario['method']
            ))
            kwargs = {}
            if 'no-secret-key' not in options:
                kwargs['auth'] = (self.cache['secret'], '')
            if 'no-follow-redirects' in options:
                kwargs['allow_redirects'] = False
            resp = requests.request(
                method=request_scenario['method'],
                url=ROOT_URL + request_scenario['href'],
                data=json.dumps(body),
                headers={
                    'Accept': ACCEPT_HEADERS,
                    'Content-type': 'application/json'
                },
                **kwargs
            )

        if 'status_code' in response and not DRY_RUN:
            if response['status_code'] != resp.status_code:
                sys.stderr.write(
                    'Scenario {0} failed with wrong status code {1} != {2}'
                    .format(name, response['status_code'], resp.status_code)
                )
                sys.exit(1)

        resp_json = {}
        if not DRY_RUN and resp.status_code != 204:
            resp_json = resp.json()

        try:
            schema = validator_fix_ref(response.get('schema', {}), path)
        except:
            sys.stderr.write(
                'could not parse response schema for {0}'.format(name)
            )
            sys.exit(1)

        if not DRY_RUN:
            if not schema:
                sys.stderr.write(
                    'Warning: no schema to validate response against for {0}\n'
                    .format(name)
                )
            validate(resp_json).against(schema)

        if 'matches' in response:
            if 0 != self.equals(response['matches'], resp_json, False) and not DRY_RUN:
                sys.stderr.write(
                    'Error validating equals for {0}'.format(name)
                )
                sys.stderr.write(json.dumps(resp_json, indent=4))
                sys.stderr.write(json.dumps(response['matches'], indent=4))
                sys.exit(1)

        if 'assertRegex' in response:
            if 0 != self.equals(response['assertRegex'], resp_json, True) and not DRY_RUN:
                sys.stderr.write(
                    'Error validating assertRegex for {0}'.format(name)
                )
                sys.stderr.write(json.dumps(resp_json, indent=4))
                sys.stderr.write(json.dumps(response['assertRegex'], indent=4))
                sys.exit(1)

        return {
            'response': resp_json,
            'status_code': resp.status_code if not DRY_RUN else 0,
            'request': body
        }

    def parse_file(self, name):
        scenarios = {}

        data = yaml.load(open(name).read())

        for other in data.get('require', []):
            scenarios.update(**self.parse_file(
                find_file(name, other)
            ))

        for scenario in data.get('scenarios', []):
            scenarios[scenario['name']] = self.run_scenario(
                scenario, scenarios, name
            )

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
