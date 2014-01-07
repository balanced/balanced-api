require 'erb'

When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  $logger.debug("Making request to #{url}")
  $logger.debug("hydrated: #{@client.hydrater(url)}")
  @client.verb(verb, @client.hydrater(url), env)
  @order_id = @client['orders']['id'] rescue nil
  @client.add_hydrate(:order_id, @order_id) if @order_id
end

When(/^I (\w+) to (\/\S*?) with the body:$/) do |verb, url, body|
  @client.verb(verb, @client.hydrater(url), env, body)
end

When(/^I make a (\w+) request to (\/\S*?)$/) do |verb, url|
  step "I #{verb} to #{url}"
end

When(/^I make a (\w+) request to (\/\S*?) with the body:$/) do |verb, url, body|
  step "I #{verb} to #{url} with the body:", body
end

def env
  {
    "bank_accounts_id" => @bank_account_id,
    "credits_id" => @credit_id,
    "cards_id" => @card_id,
    "debits_id" => @debit_id,
    "customers_id" => @customer_id,
    "orders_id" => @order_id,
  }
end


When(/^I make a (\w+) request to the href "(.*?)"$/) do |verb, keys|
  link = @client[keys] || @client.inject(keys)
  @client.send(verb.downcase, link, {}, env)
end

When(/^I make a (\w+) request to the link "(.*?)" with the body:$/) do |verb, keys, body|
  body = ERB.new(body).result(binding)
  body = @client.send(verb.downcase, @client.hydrater(@client.last_body["links"][keys]), JSON.parse(body), env)
  @credit_id = @client['credits']['id'] rescue nil
  @cards_id = @client['cards']['id'] rescue nil
  @debit_url = @client['debits']['href'] rescue nil
  body
end

When(/^I make a (\w+) request to the link "(.*?)"$/) do |verb, keys|
  body = @client.send(verb.downcase, @client.hydrater(@client.last_body["links"][keys]), {}, env)
  @credit_id = @client['credits']['id'] rescue nil
  body
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
  @client.add_response(response)
end

When(/^I POST to (\/\S*) without my secret key$/) do |url|
  # used for creating api keys for new marketplaces
  options = {
    headers: {
      "Accept" => $accept_header,
    },
  }

  response = HTTParty.post("#{$root_url}#{url}", options)
  @client.add_response(response)
end

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  @client.get(@client.inject keys)
end

When(/^I POST to (\/\S*) with the JSON API body:$/) do |url, body|
  body = @client.post(@client.hydrater(url), body)
  @credit_id = @client['credits']['id'] rescue nil
  body
end

When(/^I PUT to (\/\S*) with the JSON API body:$/) do |url, body|
  @client.put(@client.hydrater(url), @client.hydrater(body))
end

require 'json-schema'
Then(/^the response has this schema:$/) do |schema|
  @client.validate(schema)
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  @client.validate(filename)
end

Then(/^I should get a (.+) status code$/) do |code|
  message = @client.last_body["errors"][0]["description"] rescue ""
  assert_equal code.to_i, @client.last_code, message
end

Then(/^there should be no response body$/) do
  assert_nil @client.last_body
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
  checker JSON.parse(@client.hydrater against), @client["#{resource}s"], ''
  assert_equal @client.last_body["#{resource}s"].size, 1
end

Then(/^the fields on these (.*) match:$/) do |resource, against|
  against = JSON.parse(@client.hydrater against)
  @client.last_body[resource].each do |body|
    checker against, body, ''
  end
end

Then(/^there should be more than two (.*) paged$/) do |name|
  assert @client.last_body[name].size >= 2, "There were not more than two #{name}"
end


# TODO: move?

Before do |scenario|
  @client = Balanced::TinyClient.new($api_secret, $accept_header, $root_url)
  @client.running = scenario
end
