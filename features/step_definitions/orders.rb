Given(/^I have created an order$/) do
  step 'I have created a customer'
  @client.post(@client.hydrater('/customers/:customer_id/orders'), {})
  @client.add_hydrate :order_id, @client['id']
end
