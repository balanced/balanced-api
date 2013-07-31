
import os
import json
import requests

ROOT_URL = os.environ.get('ROOT_URL', 'http://localhost:5000') # TODO: change this to balanced api
ACCEPT_HEADERS = os.environ.get('ACCEPT_HEADERS', 'application/vnd.balancedpayments+json; version=1.1, application/vnd.api+json')

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
