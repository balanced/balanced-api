Given(/^I have tokenized a card$/) do
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

Given(/^I have tokenized more than one card$/) do
  2.times { step "I have tokenized a card" }
end

When(/^I GET to \/cards\/:card_id giving the card_id$/) do
  @client.get("/cards/#{@card_id}")
end
