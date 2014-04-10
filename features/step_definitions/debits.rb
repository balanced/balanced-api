Given(/^I have debited a card$/) do
  step "I have tokenized a card"
  @client.post("/cards/#{@card_id}/debits", {
                 'amount' => 1234
               })
  @debit_id = @client['debits']['id']
  @client.add_hydrate :debit_id, @debit_id
end

Given(/^I have a customer with a card$/) do
  step "I have created a customer"
  step "I have tokenized a card"
  @client.put("/cards/#{@card_id}", {
                'links' => {
                  'customer' => @customer_id
                }
              })

end

Given(/^I have more than one debit$/) do
  2.times { step 'I have debited a card' }
end

Given(/^I have created a debit$/) do
  step 'I have created a customer'
  step 'I make a POST request to the link "customers.debits" with the body:', '{ "amount": 1234 }'
  step 'I should get a 201 Created status code'
  step 'the response is valid according to the "debits" schema'
end
