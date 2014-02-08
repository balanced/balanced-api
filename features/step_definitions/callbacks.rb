Given(/^I have created a callback$/) do
  @client.post('/callbacks', {url: "http://example.com/callback"})
  @callback_id = @client.last_body['callbacks'].first['id']
end

Given(/^I have created more than one callback$/) do
  2.times { step "I have created a callback" }
end

When(/^I GET to \/callbacks\/:callback_id giving the callback_id$/) do
  @client.get("/callbacks/#{@callback_id}")
end

When(/^I DELETE to \/callbacks\/:callback_id giving the callback_id$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }
  response = HTTParty.delete("#{@client.root_url}/callbacks/#{@callback_id}", options)
  @client.add_response(response)
end

After do
  if @callback_id
    options = {
      headers: {
        "Accept" => $accept_header,
      },
      basic_auth: {
          username: $api_secret,
          password: "",
      }
    }
    response = HTTParty.delete("#{@client.root_url}/callbacks/#{@callback_id}", options)
  end
end
