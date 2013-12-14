Given(/^I have created an API key$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
  }
  response = HTTParty.post("#{$root_url}/api_keys", options)
  @client.RAW(response)
  @api_secret = @client['secret']
  @api_key = @client['id']
end

When(/^I GET to \/api_keys\/:api_key giving the key$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: @api_secret,
        password: "",
    }
  }
  response = HTTParty.get("#{@client.root_url}/api_keys/#{@api_key}", options)
  @client.RAW(response)
end

When(/^I DELETE to \/api_keys\/:api_key giving the key$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
    basic_auth: {
        username: @api_secret,
        password: "",
    }
  }
  response = HTTParty.delete("#{@client.root_url}/api_keys/#{@api_key}", options)
  @client.RAW(response)
end

Given(/^I have created more than one API keys$/) do
  2.times { step "I have created an API key" }
end
