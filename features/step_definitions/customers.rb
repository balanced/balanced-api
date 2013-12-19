Given(/^I have created a customer$/) do
  @client.post('/customers', {})
  @customer_id = @client['id']
  @client.add_hydrate :customer_id, @customer_id
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
