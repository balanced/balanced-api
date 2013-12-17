Given(/^I have tokenized a bank account$/) do
  @client.post('/bank_accounts', {
                 name: "Hhenry Ford",
                 routing_number: "321174851",
                 account_number: "9900000001",
                 account_type: "checking",
               })
  @bank_account_id = @client['bank_accounts']['id']
  @client.add_hydrate(:bank_account_id, @bank_account_id)
end


Given(/^I have tokenized more than one bank account$/) do
  2.times { step 'I have tokenized a bank account' }
end
