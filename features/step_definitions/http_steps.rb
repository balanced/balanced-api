When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: @api_secret,
        password: "",
    }
  }
  response = HTTParty.send(verb.downcase, "#{$root_url}#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

When(/^I POST to (\/.*) without my secret key with the JSON API body:$/) do |url, body|
  options = {
      headers: {
        "Accept" => $accept_header,
      },
      body: JSON.parse(body)
    }
  response = HTTParty.post("#{$root_url}#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

When(/^I POST to (\/.*) without my secret key$/) do |url|
  options = {
      headers: {
        "Accept" => $accept_header,
      },
    }
  response = HTTParty.post("#{$root_url}#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  # hax to access a Ruby hash like dot notation
  # Array shennanigans is because we only support the first element
  url = keys.split('.').inject(@response_body) {|o, k| Array(o[k])[0] }
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }

  response = HTTParty.get("#{$root_url}#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end

require 'json-schema'
Then(/^the response has this schema:$/) do |schema|
  begin
    JSON::Validator.validate!(JSON.parse(schema), @response_body)
  rescue JSON::Schema::ValidationError => e
    flunk(e.message)
  end
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  file_name = File.join('fixtures', "#{filename}.json")
  begin
    JSON::Validator.validate!(file_name, @response_body)
  rescue JSON::Schema::ValidationError => e
    flunk(e.message)
  end
end

Then(/^I should get a (.+) status code$/) do |code|
  assert_equal code.to_i, @response_code
end

Then(/^there should be no response body$/) do
  assert_nil @response_body
end
