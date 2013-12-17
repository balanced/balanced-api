Given(/^I have tokenized a card$/) do
  @client.POST('/cards', 
    {
      number: "4111111111111111",
      expiration_month: "12",
      expiration_year: 2016
    }
  )
  @card_id = @client['cards']['id']
end

Given(/^I have created more than one card$/) do
  2.times { step "I have created a card" }
end

When(/^I GET to \/cards\/:card_id giving the card_id$/) do
  @client.GET("/cards/#{@card_id}")
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
  @client.RAW(response)
end
