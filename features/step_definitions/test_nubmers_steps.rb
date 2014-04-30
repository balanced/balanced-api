Given(/^I've tokenized the card "(.*?)" with the CVV "(.*?)"$/) do |number, cvv|
  @client.post('/cards',
    {
      number: number,
        expiration_month: 12,
        expiration_year: 2016,
        cvv: cvv,
        address: {
          line1: "965 Mission St",
          postal_code: "94103"
        }
    }
  )
  @card_id = @client['cards']['id']
  @client.add_hydrate(:card_id, @card_id)
end

When(/^I debit the card$/) do
  @client.post(@client.hydrater("/cards/:card_id/debits"),
    {
      "debits" => [{
        "amount" => 100
      }]
    }
  )
end
