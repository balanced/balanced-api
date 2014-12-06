Given(/^I have an Account with sufficient funds$/) do
  step 'I have a merchant with 3 orders with debits'
  3.times do |i|
    order_href = "/orders/" + instance_variable_get("@order_id_#{i + 1}")
    @client.post("/accounts/#{@customer_payable_account_id}/credits", {
                   amount: 10000,
                   order: order_href
                 })
    @client.add_hydrate "credit_id_#{i}".to_sym, @client['id']
  end
end

