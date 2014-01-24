Given (/^I have tokenized a stolen card$/) do
  @client.post('/cards',
    {
        number: "6500000000000002",
        expiration_month: 12
        expiration_year: 3000,
        cvv: "123"
    }
  )
  stolen_card_id = @client['cards']['id']
  @client.add_hydrate(:stolen_card_id, @stolen_card_id)
end

Given(/^I have a customer with a stolen card$/) do
  step "I have created a customer"
  step "I have tokenized a stolen card"
  @client.put("/cards/#{@card_id}", {
      'links' => {
          'customer' => @customer_id
      }
  })
end

Given(/^I have debited a stolen card$/) do
  step "I have a customer with a stolen card"
  @client.post("/cards/#{@stolen_card_id}/debits", {
      'amount' => 1234
  })
  @dipsuted_debit_id = @client['debits']['id']
  @client.add_hydrate(:disputed_debit_id, @disputed_debit_id)
end

Given(/^I have a dispute$/) do
  step 'I have debited a stolen card'
  @client.get("/debits/#{@disputed_debit_id}")
  @client.add_hydrate(:dispute_id, @client['debits']['dispute']['id'])
end
