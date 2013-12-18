Given(/^I have created a refund for a debit$/) do
  step 'I have debited a card'
  @client.post("/debits/#{@debit_id}/refunds", {})
  @refund_id = @client['refunds']['id']
  @client.add_hydrate :refund_id, @refund_id
end
