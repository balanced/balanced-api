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


Given(/^I have a verified bank account$/) do
  step 'I have tokenized a bank account'
  @client.post("/bank_accounts/#{@bank_account_id}/verifications", {})
  @client.put(@client['bank_account_verifications']['href'], {
                amount_1: 1,
                amount_2: 1
              })
  # TODO: fix hax
  # client has mutable state, we care about the account, not the verification

  @client.get("/bank_accounts/#{@bank_account_id}")
end

Given(/^I have a bank account with a verification$/) do
  step 'I have tokenized a bank account'
  @client.post("/bank_accounts/#{@bank_account_id}/verifications", {})
  @bank_account_verification_id = @client['bank_account_verifications']['id']
  @client.add_hydrate :bank_account_verification_id, @bank_account_verification_id
end
