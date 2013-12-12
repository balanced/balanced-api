Given(/^I have created an API key$/) do                                                                                                                            
  options = {
    headers: {
      "Accept" => "application/vnd.api+json;revision=1.1",
    },
  }
  response = HTTParty.post("https://api.balancedpayments.com/api_keys", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
  @api_secret = @response_body["api_keys"][0]["secret"] # ugh
  @api_key = @response_body["api_keys"][0]["href"].gsub("/api_keys/", "") # lol
end                                                                                                                                                                
                                                                                                                                                                   
When(/^I GET to \/api_keys\/:api_key giving the key$/) do                                                                                                          
  options = {
    headers: {
      "Accept" => "application/vnd.api+json;revision=1.1",
    },
    basic_auth: {
        username: @api_secret,
        password: "",
    }
  }
  response = HTTParty.get("https://api.balancedpayments.com/api_keys/#{@api_key}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end 
