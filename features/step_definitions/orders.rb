Given(/^I have created an order$/) do
  step 'I have created a customer'
  @merchant_id = @customer_id
  @client.add_hydrate :merchant_id, @merchant_id
  @client.post(@client.hydrater('/customers/:customer_id/orders'), {})
  @client.add_hydrate :order_id, @client['id']
end

Given(/^I have an order with a debit$/) do
  step 'I have created a customer'
  merchant = @client.post('/customers', {})
  @client.add_hydrate :merchant_id, @client['id']
  @client.post("/customers/#{@client['id']}/orders", {})
  @order_id = @client['id']
  @client.add_hydrate :order_id, @order_id
  @client.post("/cards/#{@card_id}/debits", {
                 amount: 12345,
                 order: @order_id
               })
  @client.add_hydrate :debit_id, @client['id']
end


When(/^I have tokenized a bank account and associated with the merchant$/) do
  step 'I have tokenized a bank account'
  @client.put("/bank_accounts/#{@bank_account_id}", {
                links: {
                  customer: @merchant_id
                }
              })
end
