require 'httparty'
require 'json-schema'

When(/^I POST to (\/.*) without my secret key with the JSON API body:$/) do |url, body|
  options = {
      headers: {
        "Accept" => "application/vnd.api+json;revision=1.1",
      },
      body: JSON.parse(body)
    }
  response = HTTParty.post("https://api.balancedpayments.com#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

Then(/^I should get a (.+) status code$/) do |code|
  assert_equal code.to_i, @response_code
end

Then(/^the response has this schema:$/) do |schema|
  assert JSON::Validator.validate(JSON.parse(schema), @response_body)
end
