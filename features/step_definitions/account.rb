Given(/^I have an Account with sufficient funds$/) do
  step 'I have a merchant with 3 orders with debits'
  3.times do |i|
    @client.post("/accounts/#{@customer_sweep_account_id}/credits", {
                   amount: 10000,
                   order: "/orders/" + instance_variable_get("@order_id_#{i}")
                 })
    @client.add_hydrate "credit_id_#{i}".to_sym, @client['id']
  end
end