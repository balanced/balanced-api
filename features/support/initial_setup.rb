require 'httparty'
require 'json'

# TODO: move this into the lib
$root_url = 'https://api.balancedpayments.com'
$accept_header = 'application/vnd.api+json;revision=1.1'

# First, we need to create an API key. This is as easy as making a POST request.

options = {
  headers: {
    "Accept" => $accept_header,
  },
}
response = HTTParty.post("#{$root_url}/api_keys", options)
$api_secret = JSON.parse(response.body)["api_keys"][0]["secret"]

# Now that we have our key, we need to make a marketplace. Lots of our scenarios
# will fail unless we've made at least one.

options = {
  headers: {
    "Accept" => $accept_header,
  },
  basic_auth: {
    username: $api_secret,
    password: ""
  },
}

HTTParty.post("#{$root_url}/marketplaces", options)

$: << File.dirname(__FILE__)+'/../../lib'

require 'min_json_api'

$client = Balanced::MinAPI::Client.new($api_secret, $accept_header, $root_url)
