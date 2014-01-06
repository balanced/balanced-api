Given(/^I have created a customer$/) do
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

  ## TODO: fix hax
  # Right now, we rely on last_body in places becuase the client is mutable
  # this is bad and we should stop it.
  @client.get(@customer_url)
end

Given(/^I have created a customer without a card and bank account$/) do
  @client.post('/customers', {})
  @customer_id = @client['id']
  @client.add_hydrate :customer_id, @customer_id

  @customer_url = @client['customers']['href']
end


Given(/^I have created more than one customer$/) do
  2.times { step "I have created a customer" }
end

When(/^I GET to \/customers\/:customer_id giving the customer_id$/) do
  @client.get("/customers/#{@customer_id}")
end

When(/^I GET to \/resources\/:customer_id giving the customer_id$/) do
  @client.get("/resources/#{@customer_id}")
end

When(/^I DELETE to \/customers\/:customer_id giving the customer_id$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }
  response = HTTParty.delete("#{@client.root_url}/customers/#{@customer_id}", options)
  @client.add_response(response)
end
