Given(/^I have a customer who will dispute any charge$/) do
  step "I have created a customer"
  @client.post('/cards',
    {
      number: "6500000000000002",
      expiration_month: 12,
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
      'amount' => 99999
  })
  @disputed_debit_id = @client['debits']['id']
  @client.add_hydrate(:disputed_debit_id, @disputed_debit_id)
end

Given(/^I have a dispute$/) do
  step 'I have debited a card that will initiate a dispute'
  @dispute_id = nil
  while @dispute_id.nil?
    @client.get("/debits/#{@disputed_debit_id}")
    @dispute_id = @client['debits']['links']['dispute']
    sleep 1
  end
  @client.add_hydrate(:dispute_id, @dispute_id)
end
