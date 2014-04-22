Given(/^I have tokenized a card$/) do
  @client.post('/cards',
    {
      number: "4111 1111 1111 1111",
        expiration_month: 12,
        expiration_year: 2016,
        cvv: "123",
        address: {
          line1: "965 Mission St",
          postal_code: "94103"
        }
    }
  )
  @card_id = @client['cards']['id']
  @client.add_hydrate(:card_id, @card_id)
end

Then(/^I should see the original card in the list$/) do
  assert_equal @card_id, @client['cards']['id'], "card not found"
end

Given(/^I have tokenized a customer card$/) do
  @client.post('/cards',
    {
      number: "4111111111111111",
      expiration_month: "12",
      expiration_year: 2016
    }
  )
  @card_id = @client['cards']['id']
  @client.add_hydrate(:card_id, @card_id)
end

Given(/^I have debited that card$/) do
  @client.post(@client.hydrater(@client.last_body["links"]["cards.debits"]),
    {
      amount: 2000,
    },
    env
  )
  @debit_id = @client['debits']['id']
  @client.add_hydrate(:debit_id, @debit_id)
end


Given(/^I have tokenized more than one card$/) do
  2.times { step "I have tokenized a card" }
end

When(/^I GET to \/cards\/:card_id giving the card_id$/) do
  @client.get("/cards/#{@card_id}")
end

When(/^I DELETE to \/cards\/:card_id giving the card_id$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }
  response = HTTParty.delete("#{@client.root_url}/cards/#{@card_id}", options)
  @client.add_response(response)
end

When(/^I PUT to \/cards\/:card_id giving the card_id, with the JSON API body:$/) do |body|
  @client.put("/cards/#{@card_id}", body)
end

When(/^I POST to \/cards\/:card_id\/debits giving the card_id, with the JSON API body:$/) do |body|
  @client.post("/cards/#{@card_id}/debits", body)
end

Given(/^I have sufficient funds in my marketplace$/) do
  step 'I have tokenized a card'
  @client.post("/cards/#{@card_id}/debits", {
                 amount: 50000
               })
end

Given(/^I have unstored a card$/) do
  step "I have tokenized a card"
  @card_id = @client.last_body["cards"][0]["id"]
  @card_url = @client.last_body["cards"][0]["href"]
  step "I make a DELETE request to /cards/:card_id"
end

Then(/^I should not see that card in the results$/) do
 card_ids = @client.last_body["cards"].collect{|card| card["id"]}
 card_ids.each {|x|
   assert x != @card_id
 }
end


Given(/^I make a GET request to it$/) do
  step "I GET to #{@card_url}"
end

Then(/^I should see that card in the results$/) do
 card_ids = @client.last_body["cards"].collect{|card| card["id"]}
 card_ids.each {|x|
   assert x == @card_id
 }
end
