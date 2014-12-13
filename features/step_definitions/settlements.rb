Given(/^I have a bank account with a settlement$/) do
  step 'I have an order with a debit'
  step 'I have tokenized a bank account associated with the merchant'
  @client.post("/accounts/#{@customer_payable_account_id}/credits", {
      amount: 12345,
      order: @order_id
  })
  @credit_id = @client['credits']['id']
  @client.add_hydrate :credit_id, @credit_id
  @client.post("/accounts/#{@customer_payable_account_id}/settlements", {
              funding_instrument: :"/bank_accounts/#{@bank_account_id}"
               })
  @settlement_id = @client['settlements']['id']
  @client.add_hydrate :settlement_id, @settlement_id
end

Given(/^I have (\d) settlements$/) do |num|
  num.to_i.times { step 'I have a bank account with a settlement' }
end


Given(/^I settle the account$/) do
  @client.post("/accounts/#{@customer_payable_account_id}/settlements", {
      funding_instrument: :"/bank_accounts/#{@bank_account_id}"
  })
  @settlement_id = @client['settlements']['id']
  @client.add_hydrate :settlement_id, @settlement_id
end
