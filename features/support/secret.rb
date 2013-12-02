require 'httparty'
require 'json'

options = {
  headers: {
    "Accept" => "application/vnd.api+json;revision=1.1",
  },
}
response = HTTParty.post("https://api.balancedpayments.com/api_keys", options)
$api_secret = JSON.parse(response.body)["api_keys"][0]["secret"]
