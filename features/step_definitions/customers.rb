Given(/^I have created a Customer$/) do
  @client.POST('/customers', {})
end


Given(/^I have created more than one Customer$/) do
  2.times { step "I have created a Customer" }
end
