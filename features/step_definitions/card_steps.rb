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

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  # hax to access a Ruby hash like dot notation
  # Array shennanigans is because we only support the first element
  url = keys.split('.').inject(@response_body) {|o, k| Array(o[k])[0] }
  options = {
    headers: {
      "Accept" => "application/vnd.api+json;revision=1.1",
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }

  response = HTTParty.get("https://api.balancedpayments.com#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  assert JSON::Validator.validate(File.join("fixtures", "#{filename}.json"), @response_body), "The response failed the '#{filename}' schema. Here's the body: #{@response_body}"
end
