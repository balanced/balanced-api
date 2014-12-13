Given(/^I have an Account with sufficient funds$/) do
  step 'I have a merchant with 3 orders with debits'
  3.times do |i|
    order_href = "/orders/" + instance_variable_get("@order_id_#{i + 1}")
    response = @client.post("/accounts/#{@customer_payable_account_id}/credits", {
                   amount: 10000,
                   order: order_href
                 })
    @client.add_hydrate "credit_id_#{i}".to_sym, response['credits'][0]['id']
  end
end


Given(/^I have an Account with a credit$/) do
  step 'I have created a customer'
  @merchant_id = @customer_id
  @client.add_hydrate :merchant_id, @merchant_id
  step 'I have tokenized a bank account associated with the merchant'
  @client.post("/customers/#{@merchant_id}/orders", {})
  order_id = @client['id']
  @client.add_hydrate :order_id, order_id
  @client.post("/cards/#{@card_id}/debits", {
      amount: 10000,
      order: order_id
  })
  @client.add_hydrate :debit_id, @client['id']
  @order_id = order_id

  order_href = "/orders/" + instance_variable_get("@order_id")
  response = @client.post("/accounts/#{@customer_payable_account_id}/credits", {
      amount: 10000,
      order: order_href
    })
  @client.add_hydrate "credit_id".to_sym, response['credits'][0]['id']
end