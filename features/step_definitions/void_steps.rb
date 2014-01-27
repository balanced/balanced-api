Given(/^I have created a hold$/) do
  step "I have tokenized a card"
  hold_url = @client.last_body["links"]["cards.card_holds"]
  hold_url = hold_url.gsub("{cards.id}", @client.last_body["cards"][0]["id"])
  step "I POST to #{hold_url} with the body:", '{ "amount": 100 }'
end

When(/^I make a DELETE request to it$/) do
  href = @client.last_body["card_holds"][0]["href"]
  @void_id = @client.last_body["card_holds"][0]["id"]
  step "I DELETE to #{href}"
end

Then(/^the card_hold has a "(.*?)" attribute$/) do |attribute|
  assert @client.last_body["card_holds"][attribute]
end

Given(/^I have voided a hold$/) do
  step "I have created a hold"
  step "I make a DELETE request to it"
end

Then(/^I should not see that hold in the results$/) do
  hold_ids = @client.last_body["card_holds"].collect{|hold| hold["id"]}
  assert_nil hold_ids.select{|id| id == @void_id }
end
