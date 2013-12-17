Given(/^I have debited a card$/) do
  step "I have tokenized a card"
  @client.post("/cards/#{@card_id}/debits", {
                 'amount' => 1234
               })
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
