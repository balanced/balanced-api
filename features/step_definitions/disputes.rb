Given(/^I have a customer who will dispute any charge$/) do
  step "I have created a customer"
  @client.post('/cards',
    {
      number: "6500000000000002",
      expiration_month: 12
      expiration_year: 3000,
      cvv: "123",
      customer: @customer_id
    }
  )
  @dispute_card_id = @client['cards']['id']
  @client.add_hydrate(:dispute_card_id, @dispute_card_id)
end

Given(/^I have debited a card that will initiate a dispute$/) do
  step "I have a customer who will dispute any charge"
  @client.post("/cards/#{@dispute_card_id}/debits", {
      'amount' => 1234
  })
  @dipsuted_debit_id = @client['debits']['id']
  @client.add_hydrate(:disputed_debit_id, @disputed_debit_id)
end

Given(/^I have a dispute$/) do
  step 'I have debited a card that will initiate a dispute'
  @client.get("/debits/#{@disputed_debit_id}")
  @client.add_hydrate(:dispute_id, @client['debits']['links']['dispute'])
end
