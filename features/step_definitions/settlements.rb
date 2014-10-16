Given(/^I have a bank account with a settlement$/) do
  step 'I have an order with a debit'
  step 'I have created a customer'
  @client.post("/accounts/#{@customer_deposit_account_id}/credits", {
                 amount: 1234,
                 order: :order_id
               })
  @settlement_id = @client['settlements']['id']
  @client.add_hydrate :settlement_id, @settlement_id
end

Given(/^I have (\d) settlements$/) do
  num.to_i.times { step 'I have a bank account with a settlement' }
end
