When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  @client.verb(verb, url)
end

When(/^I POST to (\/.*) without my secret key with the JSON API body:$/) do |url, body|
  # use for tokenizing cards and bank accounts
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    body: JSON.parse(body)
  }

  response = HTTParty.post("#{$root_url}#{url}", options)
  @client.RAW(response)
end

When(/^I POST to (\/.*) without my secret key$/) do |url|
  # used for creating api keys for new marketplaces
  options = {
    headers: {
      "Accept" => $accept_header,
    },
  }

  response = HTTParty.post("#{$root_url}#{url}", options)
  @client.RAW(response)
end

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  @client.GET(@client.inject keys)
end

When(/^I POST to (\/.*) with the JSON API body:$/) do |url, body|
  @client.POST(url, body)
end

require 'json-schema'
Then(/^the response has this schema:$/) do |schema|
  @client.validate(schema)
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  @client.validate(filename)
end

Then(/^I should get a (.+) status code$/) do |code|
  assert_equal code.to_i, @client.code
end

Then(/^there should be no response body$/) do
  assert_nil @client.body
end

def checker(from, of, nesting)
  assert_not_nil of, nesting

  from.each_pair do |key, val|
    if val.is_a? String or val.is_a? Integer
      assert_equal val, of[key], "#{nesting}>#{key}"
    else
      checker val, of[key], "#{nesting}>#{key}"
    end
  end
end

Then(/^the fields on this (.*) match:$/) do |resource, against|
  checker JSON.parse(against), @client["#{resource}s"], ''
end

Then(/^there should be more than two (.*) paged$/) do |name|
  assert @client.body[name].size >= 2, "There were not more than two #{name}"
end

# TODO: move?

Before do |scenario|
  @client = Balanced::MinAPI::Client.new($api_secret, $accept_header, $root_url)
  @client.running = scenario
end
