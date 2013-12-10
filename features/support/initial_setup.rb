require 'httparty'
require 'json'

# First, we need to create an API key. This is as easy as making a POST request.

options = {
  headers: {
    "Accept" => "application/vnd.api+json;revision=1.1",
  },
}
response = HTTParty.post("https://api.balancedpayments.com/api_keys", options)
$api_secret = JSON.parse(response.body)["api_keys"][0]["secret"]

# Now that we have our key, we need to make a marketplace. Lots of our scenarios
# will fail unless we've made at least one.

options = {
  headers: {
    "Accept" => "application/vnd.api+json;revision=1.1",
  },
  basic_auth: {
    username: $api_secret,
    password: ""
  },
}

HTTParty.post("https://api.balancedpayments.com/marketplaces", options)
