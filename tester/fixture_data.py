#!/usr/bin/env python
import os
import json
import requests

import yaml


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

cache = {}

def make_api_key():

    result = requests.post(ROOT_URL + '/api_keys', headers={'Accept': ACCEPT_HEADERS}, data={})

    cache['secret'] = result.json()['api_keys'][0]['secret']

def make_marketplace():

    result = requests.post(ROOT_URL + '/marketplaces', auth=(cache['secret'], ''),
                           headers={'Accept': ACCEPT_HEADERS}, data={})

    cache['marketplace'] = result.json()['marketplaces'][0]['href']

def main():

    make_api_key()
    make_marketplace()

    print(json.dumps(cache, indent=2))


if __name__ == '__main__':
    main()
