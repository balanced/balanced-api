Given(/^I have tokenized a bank account$/) do
  @client.post('/bank_accounts', {
                 name: "Hhenry Ford",
                 routing_number: "321174851",
                 account_number: "9900000001",
                 account_type: "checking",
               })
  @bank_account_id = @client['bank_accounts']['id']
  @client.add_hydrate(:bank_account_id, @bank_account_id)
  @client.add_hydrate(:bank_accounts_id, @bank_account_id)
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

Given(/^I have attempted to verify a bank account and failed$/) do
  @client.post('/bank_accounts', {
    name: "Karl Malone",
    account_number: "9900000004",
    routing_number: "021000021",
    account_type: "checking",
  })
  @bank_account_id = @client['bank_accounts']['id']
  @client.add_hydrate(:bank_account_id, @bank_account_id)
end

Given(/^I have a bank account with a verification$/) do
  step 'I have tokenized a bank account'
  @client.post("/bank_accounts/#{@bank_account_id}/verifications", {})
  @bank_account_verification_id = @client['bank_account_verifications']['id']
  @client.add_hydrate :bank_account_verification_id, @bank_account_verification_id
end

Given(/^I have a customer with a tokenized bank account$/) do
  step 'I have created a customer'
  step 'I have tokenized a bank account'
  @client.put("/bank_accounts/#{@bank_account_id}", {
                 links: {
                   customer: @customer_id
                 }
               })
end

Given(/^I have created a non-underwritten customer with a tokenized bank account$/) do
  @client.post('/customers', {})
  @customer_id = @client['id']
  @client.add_hydrate :customer_id, @customer_id

  @customer_url = @client['customers']['href']

  # tokenize a card for them
  @client.post('/cards',
    {
      number: "4111 1111 1111 1111",
        expiration_month: 12,
        expiration_year: 2016,
        cvv: "123",
        address: {
          line1: "965 Mission St",
          postal_code: "94103"
        }
    }
  )
  card_url = @client['cards']['href']
  @card_id = @client['cards']['id']
  @client.patch(card_url,
    [{
      op: "replace",
      path: "/cards/0/links/customer",
      value: @customer_id,
    }]
  )

  # associate their card so that they have a funding source
  @client.patch(@customer_url,
    [{
      op: "replace",
      path: "/customers/0/links/source",
      value: @card_id
    }]
  )

  step 'I have tokenized a bank account'
  @client.put("/bank_accounts/#{@bank_account_id}", {
                 links: {
                   customer: @customer_id
                 }
               })

  ## TODO: fix hax
  # Right now, we rely on last_body in places becuase the client is mutable
  # this is bad and we should stop it.
  @client.get(@customer_url)
end
