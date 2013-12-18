Given(/^I have a bank account with a reversal$/) do
  step 'I have a bank account with a credit'
  @client.post("/credits/#{@credit_id}/reversals", {})
  @reversal_id = @client['reversals']['id']
  @client.add_hydrate :reversal_id, @reversal_id
end
