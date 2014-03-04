Given(/^I have an external account$/) do
  @client.post('/external_accounts', {
                 token: '123123',
                 provider: 'test'
               })
  @external_account_id = @client['id']
  @client.add_hydrate :external_account_id, @external_account_id
end


Given(/^I have tokenized more than one external account$/) do
  2.times { step 'I have an external account' }
end

Given(/^I have tokenized an external account$/) do
  step 'I have an external account'
end
