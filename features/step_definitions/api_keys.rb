Given(/^I have created an API key$/) do
  options = {
    headers: {
      "Accept" => $accept_header,
    },
  }
  response = HTTParty.post("#{$root_url}/api_keys", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
  @api_secret = @response_body["api_keys"][0]["secret"] # ugh
  @api_key = @response_body["api_keys"][0]["id"]
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
  response = HTTParty.get("#{$root_url}/api_keys/#{@api_key}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
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
  response = HTTParty.delete("#{$root_url}/api_keys/#{@api_key}", options)
  @response_code = response.code
  @response_body = response.body
end

Given(/^I have created more than one API keys$/) do
  2.times { step "I have created an API key" }
end
