Given(/^I have debited a card$/) do
  step "I have tokenized a card"
  @client.post("/cards/#{@card_id}/debits", {
                 'amount' => 1234
               })
end
