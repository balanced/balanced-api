Given(/^I have an Account with sufficient funds$/) do
  step 'I have an order with a debit'
  @client.post("/accounts/#{@customer_deposit_account_id}/credits", {
                 amount: 10000,
                 order: @order_id
               })
  @client.add_hydrate :credit_id, @client['id']
end