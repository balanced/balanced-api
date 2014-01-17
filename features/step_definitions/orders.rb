Given(/^I have created an order$/) do
  step 'I have created a customer'
  @client.post(@client.hydrater('/customers/:customer_id/orders'), {})
  @client.add_hydrate :order_id, @client['id']
end

Given(/^I have an order with a debit$/) do
  step 'I have created a customer'
  merchant = @client.post('/customers', {})
  @client.post("/customers/#{@client['id']}/orders", {})
  @order_id = @client['id']
  @client.add_hydrate :order_id, @order_id
  @client.post("/cards/#{@card_id}/debits", {
                 amount: 12345,
                 order: @order_id
               })
  @client.add_hydrate :debit_id, @client['id']
end
