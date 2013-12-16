Given(/^I have created a Customer$/) do
  @client.POST('/customers', {})
  @customer_id = @client['id']
end

Given(/^I have created more than one Customer$/) do
  2.times { step "I have created a Customer" }
end

When(/^I GET to \/customers\/:customer_id giving the customer_id$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }
  response = HTTParty.get("#{@client.root_url}/customers/#{@customer_id}", options)
  @client.RAW(response)
end
